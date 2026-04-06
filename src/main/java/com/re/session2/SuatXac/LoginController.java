package com.re.session2.SuatXac.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String showLoginForm() {
        return "loginsx";
    }

    @PostMapping("/login")
    public String processLogin(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            HttpSession session,
            Model model) {

        if ("hr_manager".equals(username) && "hr123".equals(password)) {
            session.setAttribute("loggedUser", username);
            session.setAttribute("role", "hr_manager");
            return "redirect:/employees";

        } else if ("hr_staff".equals(username) && "staff456".equals(password)) {
            session.setAttribute("loggedUser", username);
            session.setAttribute("role", "hr_staff");
            return "redirect:/employees";

        } else {
            model.addAttribute("errorMessage", "Sai tài khoản hoặc mật khẩu!");
            return "loginsx";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}