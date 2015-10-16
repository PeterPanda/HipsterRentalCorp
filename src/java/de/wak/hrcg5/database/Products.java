/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.database;

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
     * number.
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
                PreparedStatement ps = con.prepareStatement("select * from Produkt p, Kategorie k where p.KATEGORIENR = k.KATEGORIENR AND k.KATEGORIENR=?");
                ps.setString(1, categoryNumber);
                rs = ps.executeQuery();

                while (rs.next()) {
                    productsByCategory.add(
                            new Produkt(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return productsByCategory;
    }

    public static Produkt getProduct(String productNumber) {
        Produkt product = null;
        ResultSet rs;
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select * from Produkt p where p.PRODUKTNR=?");
                ps.setString(1, productNumber);
                rs = ps.executeQuery();

                while (rs.next()) 
                    product = new Produkt(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));    

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return product;
    }

}
