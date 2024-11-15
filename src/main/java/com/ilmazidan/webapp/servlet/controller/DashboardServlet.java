package com.ilmazidan.webapp.servlet.controller;

import com.ilmazidan.webapp.servlet.db.StudentDB;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class DashboardServlet extends HttpServlet {

    public StudentDB studentDB = new StudentDB();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String username = (session != null) ? (String) session.getAttribute("username") : null;

        if (username == null) {
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp?error=Please%20%20Login%20First");
        } else {
            request.setAttribute("username", username);
            request.setAttribute("students", studentDB.getStudents());

            RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/dashboard.jsp");
            dispatcher.forward(request, response);
        }
    }

}