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

    static Kunde createDummyUser() {
        Kunde c = null;
        c = new Kunde(NumberHelper.getNextKUNDENNR(), "dummy", "dummy", "dummy", "dummy", "dummy", "dummy", "dummy", "dummy", "dummy");
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("insert into KUNDE values (?, ? , ?, ? ,? ,? ,? ,? ,? ,?)");
                ps.setString(1, c.getKundenNR());
                ps.setString(2, c.getVorname());
                ps.setString(3, c.getNachname());
                ps.setString(4, c.getEmail());
                ps.setString(5, c.getOrganisationsname());
                ps.setString(6, c.getStrasse());
                ps.setString(7, c.getHausnummer());
                ps.setString(8, c.getPlz());
                ps.setString(9, c.getTelefonNR());
                ps.setString(10, c.getHandynummer());
                
                
                ps.executeQuery();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return c;
    }
}
