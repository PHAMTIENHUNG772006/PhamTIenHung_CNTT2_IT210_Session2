package com.re.session2.SuatXac;

import java.util.Date;

public class Employee {
    private String code;
    private String fullName;
    private String department;
    private double salary;
    private Date joinDate;
    private String status;

    public Employee() {}

    public Employee(String code, String fullName, String department,
                    double salary, Date joinDate, String status) {
        this.code = code;
        this.fullName = fullName;
        this.department = department;
        this.salary = salary;
        this.joinDate = joinDate;
        this.status = status;
    }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public double getSalary() { return salary; }
    public void setSalary(double salary) { this.salary = salary; }

    public Date getJoinDate() { return joinDate; }
    public void setJoinDate(Date joinDate) { this.joinDate = joinDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}