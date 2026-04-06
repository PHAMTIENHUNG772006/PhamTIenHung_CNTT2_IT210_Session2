package com.re.session2.SuatXac;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/employees")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @GetMapping
    public String listEmployees(HttpSession session, Model model) {


        if (session.getAttribute("loggedUser") == null) {
            return "redirect:/login";
        }

        model.addAttribute("employees", employeeService.getAll());
        model.addAttribute("totalTechSalary", employeeService.calculateTechTotalSalary());

        return "employee-list";
    }

    @GetMapping("/{code}")
    public String detail(@PathVariable("code") String code,
                         HttpSession session,
                         Model model) {

        if (session.getAttribute("loggedUser") == null) {
            return "redirect:/login";
        }

        Employee emp = employeeService.findByCode(code);

        if (emp == null) {
            throw new RuntimeException("Nhân viên [" + code + "] không tồn tại trong hệ thống");
        }

        model.addAttribute("employee", emp);
        return "employee-detail";
    }
}