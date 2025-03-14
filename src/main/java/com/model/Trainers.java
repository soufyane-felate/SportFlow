package com.model;

public class Trainers {
    int id;
    String name,speciality,password;


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }



    public Trainers(int id, String name, String speciality,String password) {
        this.id = id;
        this.name = name;
        this.speciality = speciality;
        this.password = password;
    }

    public Trainers(String name, String speciality,String password) {
        this.name = name;
        this.speciality = speciality;
        this.password = password;
    }

    public Trainers() {
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

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }
}
