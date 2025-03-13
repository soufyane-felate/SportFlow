package com.dao;

import com.model.Admin;
import com.model.Role;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginAdminDao {

    public Admin authenticationAdmin(String name, String password) throws SQLException {
        Admin admin = null;

        try (Connection conn = DBConnection.getConnection()) {
            System.out.println("Database connection successful!");

            String query = "SELECT AdminID, Name, Password, Role FROM Admins WHERE Name = ?";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, name);

            ResultSet res = statement.executeQuery();
            if (res.next()) {
                String storedPassword = res.getString("Password");

                System.out.println("Retrieved Password: " + storedPassword);
                System.out.println("Provided Password: " + password);

                if (password.equals(storedPassword)) {
                    admin = new Admin();
                    admin.setAdminID(res.getInt("AdminID"));
                    admin.setName(res.getString("Name"));
                    admin.setRole(Role.valueOf(res.getString("Role")));
                }
            } else {
                System.out.println("No admin found with the provided name.");
            }
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
            throw e;
        }
        return admin;
    }
}