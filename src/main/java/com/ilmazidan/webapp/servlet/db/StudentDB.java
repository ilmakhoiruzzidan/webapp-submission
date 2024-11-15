package com.ilmazidan.webapp.servlet.db;

import com.ilmazidan.webapp.servlet.model.Student;

import java.util.List;

public class StudentDB {
    public static List<Student> getStudents() {
        return List.of(
                (new Student("S1", "First Student", "Dep 1", 35.0)),
                (new Student("S2", "Second Students", "Dep 1", 70.0)),
                (new Student("S3", "Third Student", "Dep 1", 60.0)),
                (new Student("S4", "Fourth Student", "Dep 1", 90.0)),
                (new Student("S5", "Fifth Student", "Dep 2", 30.0)),
                (new Student("S6", "Sixth Student", "Dep 3", 32.0)),
                (new Student("S7", "Seventh Student", "Dep 3", 70.0)),
                (new Student("S8", "Eighth Student", "Dep 3", 20.0))
        );
    }
}
