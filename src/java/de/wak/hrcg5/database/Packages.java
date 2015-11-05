/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.database;

import de.wak.hrcg5.structure.Kategorie;
import de.wak.hrcg5.structure.Paket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
                    p = new Paket(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), Images.getPackageImage(rs.getString(7)));
                }

                if (p != null) {
                    ps = con.prepareStatement("select * from PAKETPOS where PAKETNR=?");
                    ps.setString(1, packageNumber);
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        p.getProdukte().add(Products.getProduct(rs.getString(2)));
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return p;
    }

    public static List<Paket> getPackagesByCategory(String categoryNumber) {
        List<Paket> productsByCategory;
        ResultSet rs;
        productsByCategory = new ArrayList<>();

        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select p.PAKETNR from PAKET p, Kategorie k where p.KATEGORIENR = k.KATEGORIENR AND k.KATEGORIENR=?");
                ps.setString(1, categoryNumber);
                rs = ps.executeQuery();

                while (rs.next()) {
                    productsByCategory.add(getPackage(rs.getString(1)));
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        /* Adding the products from the subcategories */
        List<Paket> sub = new ArrayList<>();
        for (String catnumb : Categories.getCategory(categoryNumber).getUnterkategorie()) {
            if (!catnumb.equals("")) {
                Kategorie cat = Categories.getCategory(catnumb);

                sub.addAll(getPackagesByCategory(cat.getKategorieNR()));
            }
        }
        productsByCategory.addAll(productsByCategory.size(), sub);

        return productsByCategory;
    }

    public static boolean addPackage(String description, String specification, String details, String rent, String category, String[] products, String imageNumber) {
        String packageNumber = NumberHelper.getNextPAKETNR();
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                /* Retrieve products */
                PreparedStatement ps = con.prepareStatement("insert into PAKET values(?,?,?,?,?,?,?)");
                ps.setString(1, packageNumber);
                ps.setString(2, category);
                ps.setString(3, description);
                ps.setString(4, specification);
                ps.setString(5, details);
                ps.setString(6, rent);
                ps.setString(7, imageNumber);
                ps.executeUpdate();

                for (int i = 0; i < products.length; i++) {
                    ps = con.prepareStatement("insert into PAKETPOS values(?,?)");
                    ps.setString(1, packageNumber);
                    ps.setString(2, products[i]);
                    ps.executeUpdate();
                }
            } catch (Exception e) {
                return false;
            }
        }

        return true;
    }

}
