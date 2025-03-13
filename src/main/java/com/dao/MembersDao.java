package com.dao;

import com.model.Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MembersDao {
    private Connection conn;
   PreparedStatement pstmt;
  public void creatMembers(Member member) throws SQLException {
      String query="INSERT INTO Members(Name,DateOfBirth,Sport) VALUES (?,?,?)";
      conn=DBConnection.getConnection();
      pstmt=conn.prepareStatement(query);

      pstmt.executeUpdate();
  }
}
