package com.controller.Member;

import com.dao.DBConnection;
import com.dao.MembersDao;
import com.model.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/registerMember")
public class RegisterMemberServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        try {
            DBConnection.getConnection();
        } catch (SQLException e) {
            throw new ServletException("DB connection error", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            createMember(req, resp);
        } catch (SQLException e) {
            throw new ServletException("Error creating member", e);
        }
    }

    private void createMember(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
        String name = req.getParameter("name");
        String sport = req.getParameter("sport");
        String dateOfBirthStr = req.getParameter("dateOfBirth");
        String password = req.getParameter("password");

        // Validate inputs
        if (name == null || name.isEmpty() || sport == null || sport.isEmpty() ||
                password == null || password.isEmpty() || dateOfBirthStr == null || dateOfBirthStr.isEmpty()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required parameters");
            return;
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date dateOfBirth = null;
        try {
            dateOfBirth = sdf.parse(dateOfBirthStr);
        } catch (ParseException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid date format");
            return;
        }

        // Create Member object
        Member member = new Member();
        member.setName(name);
        member.setSport(sport);
        member.setDateOfBirth(dateOfBirth);
        member.setPassword(password);

        // Save to DB
        MembersDao membersDao = new MembersDao();
        membersDao.createMember(member);

        resp.getWriter().write("Member registered successfully");
    }
}