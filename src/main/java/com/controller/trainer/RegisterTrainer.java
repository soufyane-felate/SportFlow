package com.controller.trainer;

import com.dao.DBConnection;
import com.dao.TrainersDao;
import com.model.Trainers;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.sportflow.HelloServlet;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/registerTrainer")
public class RegisterTrainer extends HelloServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getRequestDispatcher("");
    }

    @Override
    public void init() throws ServletException {
        try {
            DBConnection.getConnection();
        }catch(SQLException e) {
            throw new ServletException("DB connection error", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            createTrainer(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private void createTrainer(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
        String name=req.getParameter("name");
        String speciality=req.getParameter("speciality");
        String password = req.getParameter("password");

        if (name == null || name.isEmpty() || speciality == null
                ||password == null ) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required parameters");
            return;
        }
        //create trainer
        Trainers trainer=new Trainers();
        trainer.setName(name);
        trainer.setSpeciality(speciality);
        trainer.setPassword(password);

        TrainersDao trainersDao=new TrainersDao();
        trainersDao.createTrainer(trainer);

        resp.getWriter().write("trainer registered successfully");


    }
}
