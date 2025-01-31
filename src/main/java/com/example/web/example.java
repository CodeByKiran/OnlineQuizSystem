package com.example.web;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import util.DBConnection;
public class example{
	
	public void showData()
	{
		try(Connection conn = DBConnection.getConnection()){
			 Statement statement = conn.createStatement();

	            ResultSet resultSet = statement.executeQuery("select * from my_table");
	            System.out.println("Names : \n");
	            while (resultSet.next()) {
	              
	                String name = resultSet.getString("name");
	                
	                System.out.printf(" %s%n",name);
	            }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}