package com.dao;

import com.model.Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

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


    public Member authenticationMember(String name, String password) throws SQLException {
        Member member = null;
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT * FROM Member WHERE Name = ? AND Password = ?";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, password);
            ResultSet res = statement.executeQuery();
            if (res.next()) {
                member = new Member();
                member.setId(res.getInt("MemberID"));
                member.setName(res.getString("Name"));
                member.setPassword(res.getString("Password"));
                member.setDateOfBirth(res.getDate("DateOfBirth"));
                member.setSport(res.getString("Sport"));
            }
        }
        return member;
    }


    public int getTotalMembers() throws SQLException {
        int count = 0;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT COUNT(*) FROM Member");
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        }
        return count;
    }


    public int getNewMembersThisMonth() throws SQLException {
        int count = 0;
        LocalDate now = LocalDate.now();
        String query = "SELECT COUNT(*) FROM Member WHERE MONTH(DateOfBirth) = ? AND YEAR(DateOfBirth) = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, now.getMonthValue());
            pstmt.setInt(2, now.getYear());
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        }
        return count;
    }


    public List<Member> getAllMembers() throws SQLException {
        List<Member> members = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM Member");
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Member member = new Member();
                member.setId(rs.getInt("MemberID"));
                member.setName(rs.getString("Name"));
                member.setDateOfBirth(rs.getDate("DateOfBirth"));
                member.setSport(rs.getString("Sport"));
                members.add(member);
            }
        }
        return members;
    }


    public boolean deleteMember(int memberId) throws SQLException {
        String query = "DELETE FROM Member WHERE MemberID = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, memberId);
            int rowsAffected = pstmt.executeUpdate();

            return rowsAffected > 0;
        }
    }


    public Member getMemberById(int memberId) throws SQLException {
        String query = "SELECT * FROM Member WHERE MemberID = ?";
        Member member = null;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, memberId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    member = new Member();
                    member.setId(rs.getInt("MemberID"));
                    member.setName(rs.getString("Name"));
                    member.setDateOfBirth(rs.getDate("DateOfBirth"));
                    member.setSport(rs.getString("Sport"));
                    member.setPassword(rs.getString("Password"));
                }
            }
        }

        return member;
    }

    public boolean updateMember(Member member, boolean updatePassword) throws SQLException {
        String query;

        if (updatePassword) {
            query = "UPDATE Member SET Name = ?, DateOfBirth = ?, Sport = ?, Password = ? WHERE MemberID = ?";
        } else {
            query = "UPDATE Member SET Name = ?, DateOfBirth = ?, Sport = ? WHERE MemberID = ?";
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, member.getName());
            pstmt.setDate(2, new java.sql.Date(member.getDateOfBirth().getTime()));
            pstmt.setString(3, member.getSport());

            if (updatePassword) {
                pstmt.setString(4, member.getPassword());
                pstmt.setInt(5, member.getId());
            } else {
                pstmt.setInt(4, member.getId());
            }

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        }
    }


}