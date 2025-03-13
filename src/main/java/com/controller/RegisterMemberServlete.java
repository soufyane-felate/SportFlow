package com.controller;

import com.dao.DBConnection;
import com.model.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class RegisterMemberServlete extends HttpServlet {
    @Override
    public void init() throws ServletException {
        try {
            Connection con= DBConnection.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action=req.getParameter("action");
        if(action==null){

        }
        switch (action)
        {
            case "create":
                createUser(req,resp);
                break;

        }
    }

    public void createUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Member member=new Member();
        member.getName(req.getParameter("name"));
        member.getDateOfBirth(req.getParameter("date of birth"));
        member.setSport(req.getParameter("sport"));




    }

}
