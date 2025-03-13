package com.dao;

import com.model.Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MembersDao {

    public void createMember(Member member) throws SQLException {
        String query = "INSERT INTO Member (Name, DateOfBirth, Password, Sport) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, member.getName());
            pstmt.setDate(2, new java.sql.Date(member.getDateOfBirth().getTime()));
            pstmt.setString(3, member.getPassword());
            pstmt.setString(4, member.getSport());

            pstmt.executeUpdate();
        }
    }
    public Member authenticationMember(String name , String password) throws SQLException {
        Member member = null;
    try (Connection conn = DBConnection.getConnection();){
        String query = "SELECT * FROM Member WHERE Name = ? AND Password = ?";
        PreparedStatement statement = conn.prepareStatement(query);
        statement.setString(1, name);
        ResultSet res = statement.executeQuery();
        if (res.next()) {
            String storedPassword = res.getString("Password");
            System.out.println("Retrieved Password: " + storedPassword);
            System.out.println("Provided Password: " + password);
            if (password.equals(storedPassword)) {
                member = new Member();
                member.setName(res.getString("name"));
                member.setPassword(res.getString("password"));

            }else {
                System.out.println("No member found with the provided name.");
            }

        }

    }
        return member;
    }
}
