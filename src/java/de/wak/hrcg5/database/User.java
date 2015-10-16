/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Jan
 */
public abstract class User {

    /**
     * Checks if the given user data can be found in the table USER.
     * @param email User-email.
     * @param pass User-password.
     * @return True, if email and password correct.
     */
    public static boolean checkUser(String email, String pass) {
        boolean userFound = false;

        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select * from user where email=? and passwort=?");
                ps.setString(1, email);
                ps.setString(2, pass);
                ResultSet rs;
                rs = ps.executeQuery();
                userFound = rs.next();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return userFound;
    }
}
