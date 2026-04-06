package com.re.session2.Kha.lession2.model;

public class Student {
    private String fullName;
    private double score;


    public Student() {
    }


    public Student(String fullName, double score) {
        this.fullName = fullName;
        this.score = score;
    }


    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }
}
