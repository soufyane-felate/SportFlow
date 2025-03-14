package com.dao;

import com.model.Member;
import com.model.Trainers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TrainersDao {
    public List<Trainers> getAllTrainers() {
        List<Trainers> trainersList = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM Trainers");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Trainers trainer = new Trainers();
                trainer.setId(rs.getInt("id"));
                trainer.setName(rs.getString("name"));
                trainer.setSpeciality(rs.getString("speciality"));
                trainersList.add(trainer);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(trainersList);
        return trainersList;
    }


    public void createTrainer(Trainers trainer) throws SQLException {
        String query="INSERT INTO Trainers(Name,Password,Speciality) VALUES(?,?,?)";
        try(Connection conn =DBConnection.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(query))
        {
            pstmt.setString(1, trainer.getName());
            pstmt.setString(2, trainer.getPassword());
            pstmt.setString(3, trainer.getSpeciality());
            pstmt.executeUpdate();

        }
    }

}
