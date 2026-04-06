package com.re.session2.Kha.lession1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WelcomeController {

    @GetMapping("/welcome")
    public String showWelcome(Model model) {
        model.addAttribute("staffName", "Nguyễn Văn An");
        model.addAttribute("department", "Phòng Kỹ thuật");
        return "welcome";
    }
}

