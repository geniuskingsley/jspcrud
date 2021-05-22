/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;

import java.sql.*;

/**
 *
 * @author Genius
 */
public class Dao {

    Connection con;
    String URL = "jdbc:sqlserver://localhost:1433;databaseName=MAINGENIUSDBS;user=SEM2;password=sem2";

    /**
     * TO CREATE CONNECTION...
     */
    public Dao() throws ClassNotFoundException, SQLException {

        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        con = DriverManager.getConnection(URL);

    }

    /**
     * INSERTION INTO THE DATABASE...
     */
    public void insertInto(String Names, String Course, String Ages) throws SQLException {
        if (con != null) {

            String insertInto = "INSERT INTO StudentDetails (Names, Courses, Ages) VALUES (?, ?, ?);";
            PreparedStatement ps = con.prepareStatement(insertInto);
            ps.setString(1, Names);
            ps.setString(2, Course);
            ps.setString(3, Ages);

            ps.executeUpdate();

        } else {
            System.out.println("Sorry, can't insert into database table".toUpperCase());
        }
    }

    public void updateDetails(String Names, String Course, String Ages, Integer ids) throws SQLException {
        if (con != null) {
            String updateRecord = "UPDATE StudentDetails  SET Names = ?, Courses = ?, Ages = ? WHERE Id = ?";
            PreparedStatement ps2 = con.prepareStatement(updateRecord);
            ps2.setString(1, Names);
            ps2.setString(2, Course);
            ps2.setString(3, Ages);
            ps2.setInt(4, ids);
            
            ps2.executeUpdate();
            
        } else {
            System.out.println("Sorry, can't insert into database table".toUpperCase());
        }

    }
    
    public void deleteDetails(int ids) throws SQLException
    {
        String deleteRecord = "";
        PreparedStatement ps3 = con.prepareStatement(deleteRecord);
        ps3.setInt(1, ids);
        
        ps3.executeUpdate();
    }

}
