package com.re.session2.Gioi.lession1.controller;

import com.re.session2.Gioi.lession1.model.Order;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class OrderController {

    @Autowired
    ServletContext application;

    @GetMapping("/orders")
    public String listOrders(HttpSession session, Model model) {

        if (session.getAttribute("loggedUser") == null) {
            return "redirect:/login";
        }

        synchronized (application) {
            Integer count = (Integer) application.getAttribute("totalViewCount");
            if (count == null) count = 0;
            count++;
            application.setAttribute("totalViewCount", count);
        }

        List<Order> list = new ArrayList<>();
        list.add(new Order("DH001", "Laptop Dell", 15000000, new Date()));
        list.add(new Order("DH002", "iPhone 15", 22000000, new Date()));
        list.add(new Order("DH003", "Bàn phím cơ", 1200000, new Date()));
        list.add(new Order("DH004", "Bàn phím cuì", 120200, new Date()));
        model.addAttribute("orderList", list);

        return "orders";
    }
}