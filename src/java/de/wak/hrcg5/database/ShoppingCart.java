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

    public static String addProduct(String userEmail, String productNumber) {
        Kunde k = User.getCustomer(userEmail);
        if (k == null) {
            k = User.getDummyUser();
        }
        // Nur neue Nummer holen, wenn noch kein Warenkorb vorhanden --- Produkte müssen immer an die selbe nummer, zu dem selben Kunden gehören
        if (User.hasShoppingCart(k.getKundenNR())) {
            String warenkorbProduktNR = NumberHelper.getWARENKORBPRODUKTNR(k.getKundenNR());

            if (productAlreadyInsideShoppingCart(warenkorbProduktNR, productNumber)) {
                return "You have already added this prduct to your shopping cart.";
            } else {
                Connection con = Connector.getConnection();
                if (con != null) {
                    try {
                        PreparedStatement ps = con.prepareStatement("insert into WARENKORBPRODUKT values (?, ?)");
                        ps.setString(1, warenkorbProduktNR);
                        ps.setString(2, productNumber);
                        ps.executeUpdate();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        } else {
            newShoppingCart(k.getKundenNR(), productNumber);
        }
        return "Product added to your shopping cart.";
    }

    private static void newShoppingCart(String customerNumber, String productNumber) {
        String nextWARENKORBPRODUKTNR = NumberHelper.getNextWARENKORBPRODUKTNR();

        Connection con = Connector.getConnection();
        if (con != null) {
            try {

                PreparedStatement ps = con.prepareStatement("insert into WARENKORBPRODUKT values (?, ?)");
                ps.setString(1, nextWARENKORBPRODUKTNR);
                ps.setString(2, productNumber);
                ps.executeUpdate();

                ps = con.prepareStatement("insert into WARENKORB values (?, ?, ?)");
                ps.setString(1, customerNumber);
                ps.setString(2, nextWARENKORBPRODUKTNR);
                ps.setString(3, null);
                ps.executeUpdate();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private static boolean productAlreadyInsideShoppingCart(String shoppingCartProductNR, String productNumber) {
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                /* Retrieve products */
                PreparedStatement ps = con.prepareStatement("select * from WARENKORBPRODUKT wp where wp.WARENKORBPRODUKTNR=? and wp.PRODUKTNR=?");
                ps.setString(1, shoppingCartProductNR);
                ps.setString(2, productNumber);
                ResultSet rs;
                rs = ps.executeQuery();
                return rs.next();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public static Warenkorb getShoppingCart(String userEmail) {
        Kunde k = User.getCustomer(userEmail);
        if (k == null) {
            k = User.getDummyUser();
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

    public static void clearDummyShoppingCart() {
        Kunde c = User.getDummyUser();
        if (c != null) {
            clearShoppingCart(c.getKundenNR());
        }
    }

    public static void clearShoppingCart(String customerNumber) {
        String warenkorbProduktNR = NumberHelper.getWARENKORBPRODUKTNR(customerNumber);
        String warenkorbPaketNR = NumberHelper.getWARENKORBPAKETNR(customerNumber);
        
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("delete from WARENKORBPRODUKT where WARENKORBPRODUKTNR=?");
                ps.setString(1, warenkorbProduktNR);
                ps.executeUpdate();
                
                ps = con.prepareStatement("delete from WARENKORBPAKET where WARENKORBPAKETNR=?");
                ps.setString(1, warenkorbPaketNR);
                ps.executeUpdate();
                
                ps = con.prepareStatement("delete from WARENKORB where KUNDENNR=?");
                ps.setString(1, customerNumber);
                ps.executeUpdate();
                
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

}
