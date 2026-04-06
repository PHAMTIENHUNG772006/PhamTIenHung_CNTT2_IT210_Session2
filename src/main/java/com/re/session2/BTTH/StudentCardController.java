package com.re.session2.BTTH;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StudentCardController {

    @GetMapping("/student-card")
    public String getStudentCard(@RequestParam(value = "msv", required = false) String msv,
                                 Model model) {

        if (msv == null || msv.isEmpty()) {
            model.addAttribute("errorMessage", "Vui lòng nhập mã sinh viên!");
            return "student-card";
        }

        switch (msv) {
            case "SV001":
                model.addAttribute("msv", "SV001");
                model.addAttribute("studentName", "Nguyễn Văn An");
                model.addAttribute("faculty", "Công nghệ thông tin");
                model.addAttribute("year", 3);
                model.addAttribute("gpa", 8.5);
                break;

            case "SV002":
                model.addAttribute("msv", "SV002");
                model.addAttribute("studentName", "Trần Thị Bình");
                model.addAttribute("faculty", "Kinh tế");
                model.addAttribute("year", 2);
                model.addAttribute("gpa", 7.2);
                break;

            case "SV003":
                model.addAttribute("msv", "SV003");
                model.addAttribute("studentName", "Lê Minh Cường");
                model.addAttribute("faculty", "Công nghệ thông tin");
                model.addAttribute("year", 4);
                model.addAttribute("gpa", 3.8);
                break;

            default:
                model.addAttribute("errorMessage", "Không tìm thấy sinh viên với mã: " + msv);
        }

        return "student-card";
    }
}