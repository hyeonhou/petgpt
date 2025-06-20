package com.mc.controller;

import com.mc.app.dto.Admin;
import com.mc.app.service.AdminService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class LoginController {

    private final AdminService adminService;

    @PostMapping("/loginimpl")
    public String loginImpl(@RequestParam("id") String id,
                            @RequestParam("pwd") String pwd,
                            HttpSession session,
                            Model model) throws Exception {

        Admin admin = adminService.login(id, pwd);

        if (admin != null) {
            session.setAttribute("admin", admin);
            return "redirect:/main";
        } else {
            model.addAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
            return "redirect:/views/login.jsp";
        }
    }

    @GetMapping("/logoutimpl")
    public String logoutImpl(HttpSession session) {
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/main";
    }
}

