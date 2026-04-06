package com.re.session2.SuatXac;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class EmployeeService {
    private List<Employee> employees = new ArrayList<>();

    public EmployeeService() {

        employees.add(new Employee("NV001", "Nguyễn Thị Lan", "Kế toán", 15000000,
                new Date(120, 2, 1), "Đang làm"));

        employees.add(new Employee("NV002", "Trần Văn Hùng", "Kỹ thuật", 25000000,
                new Date(119, 6, 15), "Đang làm"));

        employees.add(new Employee("NV003", "Lê Minh Đức", "Kinh doanh", 18500000,
                new Date(121, 10, 20), "Nghỉ phép"));

        employees.add(new Employee("NV004", "Phạm Thu Hương", "Kỹ thuật", 22000000,
                new Date(122, 0, 5), "Đang làm"));

        employees.add(new Employee("NV005", "Hoàng Văn Nam", "Kế toán", 12000000,
                new Date(123, 5, 10), "Thử việc"));
    }

    public List<Employee> getAll() {
        return employees;
    }

    public Employee findByCode(String code) {
        return employees.stream()
                .filter(e -> e.getCode().equalsIgnoreCase(code))
                .findFirst()
                .orElse(null);
    }


    public double calculateTechTotalSalary() {
        return employees.stream()
                .filter(e -> "Kỹ thuật".equalsIgnoreCase(e.getDepartment()))
                .mapToDouble(Employee::getSalary)
                .sum();
    }
}