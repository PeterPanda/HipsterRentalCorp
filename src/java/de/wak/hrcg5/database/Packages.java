/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.database;


import de.wak.hrcg5.structure.Paket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author janFk
 */
public abstract class Packages {
    
    public static Paket getPackage(String packageNumber) {
        Paket p = null;
        ResultSet rs;
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select * from PAKET p where p.PAKETNR=?");
                ps.setString(1, packageNumber);
                rs = ps.executeQuery();

                while (rs.next()) {
                    p = new Paket(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return p;
    }
}
