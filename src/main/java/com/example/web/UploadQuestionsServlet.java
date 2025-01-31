package com.example.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import util.DBConnection;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@MultipartConfig
public class UploadQuestionsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("file");

        if (filePart != null && filePart.getSize() > 0) {
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(filePart.getInputStream()))) {
                String line;

 
                try (Connection conn = DBConnection.getConnection()) {
                    String sql = "INSERT INTO questions (quiz_id, quiz_name,question_id, question, option_A, option_B, option_C, option_D, correct_option) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?)";
                    try (PreparedStatement stmt = conn.prepareStatement(sql)) {

                        while ((line = reader.readLine()) != null) {
                            String[] questionData = line.split(",");

                            if (questionData.length == 9) {
                                stmt.setString(1, questionData[0]); 
                                stmt.setString(2, questionData[1]); 
                                stmt.setString(3, questionData[2]); 
                                stmt.setString(4, questionData[3]); 
                                stmt.setString(5, questionData[4]); 
                                stmt.setString(6, questionData[5]); 
                                stmt.setString(7, questionData[6]); 
                                stmt.setString(8, questionData[7]); 
                                stmt.setString(9, questionData[8]); 
                                
                                stmt.addBatch();
                            }
                        }


                        int[] result = stmt.executeBatch();
                        response.getWriter().write("<html><span style='color: green;'>Questions uploaded successfully! Number of rows inserted: </span></html>" + result.length);

                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().write("html><span style='color: red;'>An error occurred while uploading the questions: </span></html>" + e.getMessage());
            }
        } else {
            response.getWriter().write("html><span style='color: red;'>No file uploaded or file is empty!</span></html>");
        }
    }
}
