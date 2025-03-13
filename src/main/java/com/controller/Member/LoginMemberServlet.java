package com.controller.Member;

import com.dao.MembersDao;
import com.model.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/MemberLogin")
public class LoginMemberServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        MembersDao membersDao = new MembersDao();
        try {
            Member member = membersDao.authenticationMember(name,password);
            if (member != null) {
                request.getSession().setAttribute("member", member);
                request.getRequestDispatcher("MemberLogin.jsp").forward(request, response);
            }else  {
                request.setAttribute("error", "Invalid username or password.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);

        }
    }

}
