package com.controller.Admin;


import com.dao.MembersDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/delete-member")
public class DeleteMemberServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get member ID from request
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            try {
                int memberId = Integer.parseInt(idParam);

                // Delete member
                MembersDao membersDao = new MembersDao();
                boolean deleted = membersDao.deleteMember(memberId);

                if (deleted) {
                    response.sendRedirect("list-members.jsp?success=Member deleted successfully");
                } else {
                    response.sendRedirect("list-members.jsp?error=Failed to delete member");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("list-members.jsp?error=Invalid member ID");
            } catch (SQLException e) {
                response.sendRedirect("list-members.jsp?error=Database error: " + e.getMessage());
            }
        } else {
            response.sendRedirect("list-members.jsp?error=No member ID provided");
        }
    }
}