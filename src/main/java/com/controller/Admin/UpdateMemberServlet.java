package com.controller.Admin;


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
import java.util.Date;

@WebServlet("/update-member")
public class UpdateMemberServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String idParam = request.getParameter("memberId");
        String name = request.getParameter("name");
        String dateOfBirthParam = request.getParameter("dateOfBirth");
        String sport = request.getParameter("sport");
        String password = request.getParameter("password");

        try {
            int memberId = Integer.parseInt(idParam);

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date dateOfBirth = dateFormat.parse(dateOfBirthParam);

            MembersDao membersDao = new MembersDao();
            Member member = membersDao.getMemberById(memberId);

            if (member == null) {
                response.sendRedirect("list-members.jsp?error=Member not found");
                return;
            }

            member.setName(name);
            member.setDateOfBirth(dateOfBirth);
            member.setSport(sport);

            boolean updatePassword = false;
            if (password != null && !password.trim().isEmpty()) {
                member.setPassword(password);
                updatePassword = true;
            }

            boolean updated = membersDao.updateMember(member, updatePassword);

            if (updated) {
                response.sendRedirect("list-members.jsp?success=Member updated successfully");
            } else {
                response.sendRedirect("edit-member.jsp?id=" + memberId + "&error=Failed to update member");
            }

        } catch (NumberFormatException e) {
            response.sendRedirect("list-members.jsp?error=Invalid member ID");
        } catch (ParseException e) {
            response.sendRedirect("edit-member.jsp?id=" + idParam + "&error=Invalid date format");
        } catch (SQLException e) {
            response.sendRedirect("edit-member.jsp?id=" + idParam + "&error=Database error: " + e.getMessage());
        }
    }
}
