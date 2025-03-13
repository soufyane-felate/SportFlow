package com.model;

import java.util.Date;

public class Member {
    int id;
    String name,sport;
    Date DateOfBirth;

    public Member() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName(String name) {
        return this.name;
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

    public Date getDateOfBirth(String dateOfBirth) {
        return DateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        DateOfBirth = dateOfBirth;
    }

    public Member(int id, String name, String sport, Date dateOfBirth) {
        this.id = id;
        this.name = name;
        this.sport = sport;
        DateOfBirth = dateOfBirth;
    }



    public Member(String name, String sport, Date dateOfBirth) {
        this.name = name;
        this.sport = sport;
        DateOfBirth = dateOfBirth;
    }
}
