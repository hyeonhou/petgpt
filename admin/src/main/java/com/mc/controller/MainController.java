package com.mc.controller;

import com.mc.app.dto.Admin;
import com.mc.app.dto.Customer;
import com.mc.app.dto.Item;
import com.mc.app.dto.AdminNotice;
import com.mc.app.service.CustomerService;
import com.mc.app.service.ItemService;
import com.mc.app.service.TotalOrderService;
import com.mc.app.service.AdminNoticeService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MainController {

    final CustomerService custService;
    final ItemService itemService;
    final TotalOrderService totalOrderService;
    final AdminNoticeService adminNoticeService;

    @Value("${app.url.websocket-server-url}")
    String websocketServerUrl;

    @GetMapping("/")
    public String root(HttpSession session) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/views/login.jsp";
        }
        return "redirect:/main";
    }

    @RequestMapping("/main")
    public String main(Model model, HttpSession session) {
        if (session.getAttribute("admin") == null) return "redirect:/views/login.jsp";

        try {
            int custCount = custService.getCount();
            int todayJoinCount = custService.getTodayJoinCount();
            model.addAttribute("custCount", custCount);
            model.addAttribute("todayJoinCount", todayJoinCount);
        } catch (Exception e) {
            log.error("[MainController] Error loading customer data: {}", e.getMessage());
            model.addAttribute("custCount", 0);
            model.addAttribute("todayJoinCount", 0);
        }

        try {
            int itemCount = itemService.get().size();
            model.addAttribute("itemCount", itemCount);
        } catch (Exception e) {
            log.error("[MainController] Error loading item count: {}", e.getMessage());
            model.addAttribute("itemCount", 0);
        }

        try {
            int orderCount = totalOrderService.getOrderCount();
            model.addAttribute("orderCount", orderCount);
        } catch (Exception e) {
            log.error("[MainController] Error loading order count: {}", e.getMessage());
            model.addAttribute("orderCount", 0);
        }

        try {
            int todayRevenue = totalOrderService.getTodayRevenue();
            model.addAttribute("todayRevenue", todayRevenue);
        } catch (Exception e) {
            log.error("[MainController] Error loading today revenue: {}", e.getMessage());
            model.addAttribute("todayRevenue", 0);
        }

        try {
            Map<String, Integer> orderStatusMap = totalOrderService.getOrderStatusCountMap();
            model.addAttribute("orderStatusMap", orderStatusMap);
        } catch (Exception e) {
            log.error("[MainController] Error loading order status count: {}", e.getMessage());
            model.addAttribute("orderStatusMap", new HashMap<>());
        }

        // ✅ 관리자 알림 생성
        List<String> alerts = new ArrayList<>();

        try {
            List<Item> lowStockItems = itemService.getItemsWithLowStock(5);
            for (Item i : lowStockItems) {
                alerts.add("📦 [상품] '" + i.getItemName() + "'의 재고가 " + i.getStock() + "개 이하입니다.");
            }
        } catch (Exception e) {
            log.warn("[MainController] 알림 생성 중 오류 (재고): {}", e.getMessage());
        }

        try {
            int unansweredQna = totalOrderService.getUnansweredQnaCount();
            if (unansweredQna > 0) {
                alerts.add("❓ [문의] 미답변 Q&A가 " + unansweredQna + "건 있습니다.");
            }
        } catch (Exception e) {
            log.warn("[MainController] 알림 생성 중 오류 (Q&A): {}", e.getMessage());
        }

        try {
            int flaggedReviews = totalOrderService.getFlaggedReviewCount();
            if (flaggedReviews > 0) {
                alerts.add("🚨 [리뷰] 신고된 리뷰가 " + flaggedReviews + "건 있습니다.");
            }
        } catch (Exception e) {
            log.warn("[MainController] 알림 생성 중 오류 (리뷰): {}", e.getMessage());
        }

        model.addAttribute("adminAlerts", alerts);

        // ✅ 관리자 공지사항 추가
        try {
            List<AdminNotice> notices = adminNoticeService.getRecentNotices();
            model.addAttribute("adminNotices", notices);
        } catch (Exception e) {
            log.warn("[MainController] 공지사항 로드 실패: {}", e.getMessage());
            model.addAttribute("adminNotices", new ArrayList<>());
        }

        model.addAttribute("serverurl", websocketServerUrl);
        model.addAttribute("center", "center");
        return "index";
    }

    @RequestMapping("/today")
    public String todayJoinList(Model model) {
        try {
            List<Customer> list = custService.getTodayJoinedCustomers();
            model.addAttribute("todayJoinedList", list);
            model.addAttribute("center", "cust/todayList");
        } catch (Exception e) {
            model.addAttribute("todayJoinedList", null);
            model.addAttribute("center", "cust/todayList");
        }
        return "index";
    }

    @RequestMapping("/ws")
    public String ws(Model model, HttpSession session) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/views/login.jsp";
        }
        model.addAttribute("serverurl", websocketServerUrl);
        model.addAttribute("center", "ws");
        return "index";
    }
}
