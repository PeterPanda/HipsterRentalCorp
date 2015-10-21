/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.database;

import de.wak.hrcg5.structure.Kategorie;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Jan
 */
public abstract class Categories {

    /**
     * Retrieves all data from table KATEGORIE.
     *
     * @return Returns a list of categories.
     */
    public static List<Kategorie> getCategories() {
        List<Kategorie> cat;
        ResultSet rs;
        cat = new ArrayList<>();

        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select * from KATEGORIE");
                rs = ps.executeQuery();
                while (rs.next()) {
                    cat.add(new Kategorie(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return cat;
    }

    public static Kategorie getCategory(String categoryNumber) {
        Kategorie cat = null;
        ResultSet rs;

        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select * from KATEGORIE k where k.KATEGORIENR=?");
                ps.setString(1, categoryNumber);
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (cat == null) {
                        cat = new Kategorie(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                    } else {
                        cat.getUnterkategorie().add(rs.getString(4));
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return cat;
    }
}
