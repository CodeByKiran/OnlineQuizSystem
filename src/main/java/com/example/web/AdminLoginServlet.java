package com.example.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import util.DBConnection;

public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
          DBConnection d = new DBConnection();
        try {
          
            Connection con = d.getConnection();
            PreparedStatement pst = con.prepareStatement("SELECT * FROM admin WHERE username=? AND password=?");
            pst.setString(1, username);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("admin_login.jsp").forward(request, response);
            }


            con.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
