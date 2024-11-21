/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.sql.*;

/**
 *
 * @author manik
 */
public class ConnectionProvider {

    public static Connection con;

    //getting the connection
    public static Connection getConnection() {

        //creating the connection
        try {
            //connection of database only created when con variable is null.
            if (con == null) {
                //load driver class
                Class.forName("com.mysql.jdbc.Driver");

                //create a connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "Lucky@server2002");
            }
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return con;
    }

}
