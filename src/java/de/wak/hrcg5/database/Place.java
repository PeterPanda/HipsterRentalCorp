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
 * @author janFk
 */
public abstract class Place {

    public static boolean addPlace(String place, String postalcode) {
        if (postalcodeExists(postalcode)) {
            return true;
        } else {
            Connection con = Connector.getConnection();
            if (con != null) {
                try {
                    /* Retrieve products */
                    PreparedStatement ps = con.prepareStatement("insert into ORTE values (?,?)");
                    ps.setString(1, postalcode);
                    ps.setString(2, place);
                    ps.executeUpdate();
                } catch (Exception e) {
                    return false;
                }
            }
        }
        return true;
    }

    private static boolean postalcodeExists(String postalcode) {
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                /* Retrieve products */
                PreparedStatement ps = con.prepareStatement("select * from ORTE where PLZ=?");
                ps.setString(1, postalcode);
                ResultSet rs = ps.executeQuery();
                return rs.next();
            } catch (Exception e) {
                return false;
            }
        }

        return true;
    }
}
