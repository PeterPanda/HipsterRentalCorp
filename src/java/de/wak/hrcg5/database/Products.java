/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.database;

import de.wak.hrcg5.structure.Kategorie;
import de.wak.hrcg5.structure.Produkt;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author janFk
 */
public abstract class Products {

    /**
     * Returns all products from table PRODUKT assigned to the given category
     * number. Gets also the products of the subcategory.
     *
     * @param categoryNumber Identifier of a category.
     * @return Returns a list of products.
     */
    public static List<Produkt> getProductsByCategory(String categoryNumber) {

        List<Produkt> productsByCategory;
        ResultSet rs;
        productsByCategory = new ArrayList<>();

        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select p.PRODUKTNR from Produkt p, Kategorie k where p.KATEGORIENR = k.KATEGORIENR AND k.KATEGORIENR=?");
                ps.setString(1, categoryNumber);
                rs = ps.executeQuery();

                while (rs.next()) {
                    productsByCategory.add(getProduct(rs.getString(1)));
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        /* Adding the products from the subcategories */
        List<Produkt> sub = new ArrayList<>();
        for (String catnumb : Categories.getCategory(categoryNumber).getUnterkategorie()) {
            if (!catnumb.equals("")) {
                Kategorie cat = Categories.getCategory(catnumb);

                sub.addAll(getProductsByCategory(cat.getKategorieNR()));
            }
        }
        productsByCategory.addAll(productsByCategory.size(), sub);

        return productsByCategory;
    }

    /**
     * Gets a product by productnumber.
     *
     * @param productNumber
     * @return Product.
     */
    public static Produkt getProduct(String productNumber) {
        Produkt product = null;
        ResultSet rs;
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select * from Produkt p where p.PRODUKTNR=?");
                ps.setString(1, productNumber);
                rs = ps.executeQuery();

                while (rs.next()) {
                    product = new Produkt(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return product;
    }

    public static boolean addProduct(String bezeichnung, String herstellername, String beschreibung, String details, String mietzins, String kategorie, String alternative) {
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                /* Retrieve products */
                PreparedStatement ps = con.prepareStatement("insert into PRODUKT values(?,?,?,?,?,?,?,?,?)");
                ps.setString(1, NumberHelper.getNextPRODUKTNR());
                ps.setString(2, bezeichnung);
                ps.setString(3, herstellername);
                ps.setString(4, beschreibung);
                ps.setString(5, details);
                ps.setString(6, mietzins);
                ps.setString(7, kategorie);
                ps.setString(8, alternative.equals("") ? null : alternative);
                ps.setString(9, "j");
                ps.executeUpdate();
            } catch (Exception e) {
                return false;
            }
        }

        return true;
    }

}
