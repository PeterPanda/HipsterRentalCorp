/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.database;

import de.wak.hrcg5.structure.Kunde;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Jan
 */
public abstract class User {

    private static final String KUNDENNR = "KNR0000000";
    
    public static String getKUNDENNR(){
        return KUNDENNR;
    }
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
    
    public static Kunde getCustomer(String email){
        Kunde k = null;
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select * from KUNDE where email=?");
                ps.setString(1, email);
                ResultSet rs;
                rs = ps.executeQuery();
                while(rs.next()){
                    k = new Kunde(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10));
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return k;
        
    }
}
