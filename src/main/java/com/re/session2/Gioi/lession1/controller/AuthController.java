package com.re.session2.Gioi.lession1.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AuthController {

    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String handleLogin(@RequestParam("username") String username,
                              @RequestParam("password") String password,
                              HttpSession session,
                              RedirectAttributes ra) {


        if (("admin".equals(username) && "admin123".equals(password)) ||
                ("staff".equals(username) && "staff123".equals(password))) {


            session.setAttribute("loggedUser", username);
            session.setAttribute("role", username.equals("admin") ? "Quản lý" : "Nhân viên");

            return "redirect:/orders";
        } else {
            ra.addFlashAttribute("error", "Tài khoản hoặc mật khẩu không đúng!");
            return "redirect:/login";
        }
    }
}