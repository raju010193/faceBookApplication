/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.FaceBook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Kiran
 */
public class DataBaseConnetion {
     static Connection con;

    public static Connection getconnection() throws ClassNotFoundException {


        try {
            Class.forName("com.mysql.jdbc.Driver");

            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fb", "root", "root");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }
}
