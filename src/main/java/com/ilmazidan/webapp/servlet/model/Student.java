package com.ilmazidan.webapp.servlet.model;

public class Student {
    private String studentId;
    private String studentName;
    private String department;
    private Double mark;

    public Student(String studentId, String studentName, String department, Double mark) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.department = department;
        this.mark = mark;
    }

    public Student() {
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public Double getMark() {
        return mark;
    }

    public void setMark(Double mark) {
        this.mark = mark;
    }
}
