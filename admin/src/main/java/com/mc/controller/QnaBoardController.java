package com.mc.controller;

import com.mc.app.dto.*;
import com.mc.app.service.AdminCommentsService;
import com.mc.app.service.GptService;
import com.mc.app.service.ItemService;
import com.mc.app.service.QnaBoardService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/qnaboard")
public class QnaBoardController {

    private final QnaBoardService qnaService;
    private final ItemService itemService;
    private final AdminCommentsService adminCommentsService;
    private final GptService gptService;
    private final String dir = "qnaboard/";

    @RequestMapping("/get")
    public String get(Model model,
                      @RequestParam(defaultValue = "1") int page,
                      @RequestParam(required = false) String field,
                      @RequestParam(required = false) String keyword) throws Exception {

        int limit = 10;
        int offset = (page - 1) * limit;

        try {
            List<QnaBoard> list;
            int totalCount;

            if (field != null && keyword != null && !field.isEmpty() && !keyword.isEmpty()) {
                list = qnaService.searchPage(field, keyword, offset, limit);
                totalCount = qnaService.searchCount(field, keyword);
            } else {
                list = qnaService.getPage(offset, limit);
                totalCount = qnaService.getTotalCount();
            }

            int totalPages = (int) Math.ceil((double) totalCount / limit);

            model.addAttribute("boards", list);
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("field", field);
            model.addAttribute("keyword", keyword);
            model.addAttribute("center", dir + "get");

            log.info("QnA list loaded: page={}, field={}, keyword={}", page, field, keyword);
        } catch (Exception e) {
            log.error("Error loading QnA list", e);
        }

        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") Integer id) {
        try {
            QnaBoard board = qnaService.get(id);
            if (board == null) {
                log.warn("QnA not found: {}", id);
                return "redirect:/qnaboard/get";
            }

            AdminComments adminComments = adminCommentsService.get(id);

            Item item = null;
            if (board.getItemKey() > 0) {
                try {
                    item = itemService.get(board.getItemKey());
                } catch (Exception e) {
                    log.warn("Item not found for itemKey: {}", board.getItemKey());
                }
            }

            model.addAttribute("board", board);
            model.addAttribute("item", item);
            model.addAttribute("adminComments", adminComments);
            model.addAttribute("center", dir + "detail");

            log.info("QnA detail loaded: {}", id);
        } catch (Exception e) {
            log.error("Error loading QnA detail", e);
        }

        return "index";
    }

    @GetMapping("/gpt-reply")
    @ResponseBody
    public Map<String, String> getGptReply(@RequestParam("id") Integer id) {
        Map<String, String> result = new HashMap<>();
        try {
            QnaBoard board = qnaService.get(id);
            String reply = gptService.generateReply(board.getBoardContent());
            result.put("status", "success");
            result.put("reply", reply);
        } catch (Exception e) {
            log.warn("GPT 호출 실패: {}", e.getMessage());
            result.put("status", "fail");
            result.put("reply", "AI 응답 생성 중 오류가 발생했습니다.");
        }
        return result;
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Integer id) {
        try {
            qnaService.del(id);
            log.info("QnA deleted: {}", id);
        } catch (Exception e) {
            log.error("Error deleting QnA", e);
        }
        return "redirect:/qnaboard/get";
    }

    @PostMapping("/update")
    public String update(QnaBoard board) {
        try {
            qnaService.mod(board);
            log.info("QnA updated: {}", board.getBoardKey());
        } catch (Exception e) {
            log.error("Error updating QnA", e);
        }
        return "redirect:/qnaboard/detail?id=" + board.getBoardKey();
    }
}
