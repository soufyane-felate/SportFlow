package com.model;

public class Admin {
    int adminID;
    String name;
    String password;
    Role role;

    public Admin() {
    }

    public Admin(int adminID, String name, String password, Role role) {
        this.adminID = adminID;
        this.name = name;
        this.password = password;
        this.role = role;
    }

    public Admin(String name, String password, Role role) {
        this.name = name;
        this.password = password;
        this.role = role;
    }

    public int getAdminID() {
        return adminID;
    }

    public void setAdminID(int adminID) {
        this.adminID = adminID;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
