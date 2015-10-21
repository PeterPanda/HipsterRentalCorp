/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.database;

import de.wak.hrcg5.structure.Kunde;
import de.wak.hrcg5.structure.Warenkorb;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author janFk
 */
public abstract class ShoppingCart {

    public static void addProduct(String userEmail, String productNumber) {
        Kunde k = User.getCustomer(userEmail);
        if (k == null) {
            k = User.createDummyUser();
        }
        String nextWARENKORBPRODUKTNR = NumberHelper.getNextWARENKORBPRODUKTNR();

        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("insert into WARENKORBPRODUKT values (?, ?)");
                ps.setString(1, nextWARENKORBPRODUKTNR);
                ps.setString(2, productNumber);
                ps.executeQuery();

                ps = con.prepareStatement("insert into WARENKORB values (?, ?, ?)");
                ps.setString(1, k.getKundenNR());
                ps.setString(2, nextWARENKORBPRODUKTNR);
                ps.setString(3, null);
                ps.executeQuery();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static Warenkorb getShoppingCart(String userEmail) {
        Kunde k = User.getCustomer(userEmail);
        if (k == null) {
            k = User.createDummyUser();
        }
        Warenkorb shoppingCart = new Warenkorb();

        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                /* Retrieve products */
                PreparedStatement ps = con.prepareStatement("select wp.PRODUKTNR from WARENKORB w, WARENKORBPRODUKT wp where w.KUNDENNR=? and w.WARENKORBPRODUKTNR = wp.WARENKORBPRODUKTNR");
                ps.setString(1, k.getKundenNR());
                ResultSet rs;
                rs = ps.executeQuery();
                while (rs.next()) {
                    shoppingCart.getProdukte().add(Products.getProduct(rs.getString(1)));
                }
                /* Retrieve packages */
                ps = con.prepareStatement("select wpak.PAKETNR from WARENKORB w, WARENKORBPAKET wpak where w.KUNDENNR=? and w.WARENKORBPAKETNR = wpak.WARENKORBPAKETNR");
                ps.setString(1, k.getKundenNR());
                rs = ps.executeQuery();
                while (rs.next()) {
                    shoppingCart.getPakete().add(Packages.getPackage(rs.getString(1)));
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return shoppingCart;
    }

}
