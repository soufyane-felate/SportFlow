package com.controller.Admin;

import com.dao.LoginAdminDao;
import com.model.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String password = request.getParameter("password");

        if (name == null || name.trim().isEmpty() ||
                password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Invalid username or password.");
            request.getRequestDispatcher("loginAdmin.jsp").forward(request, response);
            return;
        }

        LoginAdminDao loginAdminDao = new LoginAdminDao();
        try {
            Admin admin = loginAdminDao.authenticationAdmin(name, password);
            if (admin != null) {
                request.getSession().setAttribute("admin", admin);
                response.sendRedirect("dashboard.jsp");
            } else {
                request.setAttribute("error", "Invalid credentials. Try again.");
                request.getRequestDispatcher("loginAdmin.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Servlet Database error: " + e.getMessage());
            request.setAttribute("error", "Database error! Please try again later.");
            request.getRequestDispatcher("loginAdmin.jsp").forward(request, response);
        }
    }
}