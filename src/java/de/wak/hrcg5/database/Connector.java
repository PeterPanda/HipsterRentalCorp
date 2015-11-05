/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author janFk
 */
public abstract class Connector {

    /**
     * Builds up the connection to the 'hipsterrentalcorp' database.
     * @return Returns the java.sql.Connection.
     */
    public static Connection getConnection() {
        Connection con = null;
        try {
            /* loading drivers for mysql */
            Class.forName("com.mysql.jdbc.Driver");

            /* creating connection with the database  */
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hipsterrentalcorp", "root", "");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        
        return con;
    }
}
