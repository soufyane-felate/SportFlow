package com.model;

import java.util.Date;

public class Member {
    private int id;
    private String name;
    private String sport;
    private String password;
    private Date dateOfBirth;

    public Member() {
    }

    public Member(int id, String name, String sport, Date dateOfBirth, String password) {
        this.id = id;
        this.name = name;
        this.sport = sport;
        this.dateOfBirth = dateOfBirth;
        this.password = password;
    }

    public Member(String name, String sport, Date dateOfBirth, String password) {
        this.name = name;
        this.sport = sport;
        this.dateOfBirth = dateOfBirth;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSport() {
        return sport;
    }

    public void setSport(String sport) {
        this.sport = sport;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
}
