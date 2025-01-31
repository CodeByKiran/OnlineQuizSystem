package com.example.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBConnection;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roll_number = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection con = DBConnection.getConnection()) {  
            if (con == null) {
                throw new SQLException("Failed to establish connection.");
            }
         // Check if user already exists
            String checkSql = "SELECT COUNT(*) FROM users WHERE roll_number = ?";
            try (PreparedStatement checkPst = con.prepareStatement(checkSql)) {
                checkPst.setString(1, roll_number);
                ResultSet rs = checkPst.executeQuery();
                if (rs.next() && rs.getInt(1) > 0) {
                    response.getWriter().println("User already exists.");
                    return;
                }
            }

            String sql = "INSERT INTO users (roll_number, password) VALUES (?, ?)";
            try (PreparedStatement pst = con.prepareStatement(sql)) {  
                pst.setString(1, roll_number);
                pst.setString(2, password);

                int result = pst.executeUpdate();

                if (result > 0) {
                    response.sendRedirect("Home.jsp");
                } else {
                    response.getWriter().println("Error registering user. Please try again.");
                }
            }
        } catch (SQLException e) {
            log("Database error occurred: " + e.getMessage(), e);  
            response.getWriter().println("Database error occurred. Please try again later.");
        } catch (Exception e) {
            log("An unexpected error occurred: " + e.getMessage(), e);  
        }
    }
}
