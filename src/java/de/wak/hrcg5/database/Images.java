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
 * @author janFk
 */
public abstract class Images {

    public static List<String> getProductImages(String productNumber) {
        List<String> images = new ArrayList<>();
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select f.* from FOTOPOS fp, FOTO f where fp.PRODUKTNR=? and fp.FOTONR = f.FOTONR");
                ps.setString(1, productNumber);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    images.add(rs.getString(2));
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return images;
    }

    public static String getCategoryImage(String categoryNumber) {
        String image = null;
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select f.FOTO from FOTOS f, KATEGORIE k where k.KATEGORIENR=? AND k.FOTONR = f.FOTONR");
                ps.setString(1, categoryNumber);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    image= rs.getString(1);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return image;
    }
    public static String getPackageImage(String packageNumber) {
        String image = null;
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select f.FOTO from FOTOS f, PAKET p where p.PAKETNR=? AND p.FOTONR = f.FOTONR");
                ps.setString(1, packageNumber);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    image= rs.getString(1);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return image;
    }

}
