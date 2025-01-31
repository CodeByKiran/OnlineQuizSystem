package com.example.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.mysql.cj.jdbc.result.ResultSetFactory;

import util.DBConnection;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roll_number = request.getParameter("username");
        String password = request.getParameter("password");
          DBConnection d = new DBConnection();
        try {
          
            Connection con = d.getConnection();
            PreparedStatement pst = con.prepareStatement("SELECT * FROM users WHERE roll_number=? AND password=?");
            pst.setString(1, roll_number);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                request.getRequestDispatcher("quiz.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }


            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
