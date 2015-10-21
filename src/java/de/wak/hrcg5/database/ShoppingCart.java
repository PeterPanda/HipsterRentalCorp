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

    private static final String WARENKORBPRODUKTNR = "WPNR000000";
    private static final String WARENKORBPAKETNR = "WPAKNR0000";

    public static String getNextWARENKORBPRODUKTNR() {
        String lastNumber = "";
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select MAX(WARENKORBPRODUKTNR) from WARENKORBPRODUKT");
                ResultSet rs;
                rs = ps.executeQuery();
                while (rs.next()) {
                    lastNumber = rs.getString(1);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (lastNumber == null || lastNumber.equals("")) {
            return incementLastNumber(WARENKORBPRODUKTNR);
        }
        return incementLastNumber(lastNumber);
    }

    public static String getNextWARENKORBPAKETNR() {
        String lastNumber = "";
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select MAX(WARENKORBPAKETNR) from WARENKORBPAKET");
                ResultSet rs;
                rs = ps.executeQuery();
                while (rs.next()) {
                    lastNumber = rs.getString(1);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (lastNumber == null || lastNumber.equals("")) {
            return incementLastNumber(WARENKORBPAKETNR);
        }
        return incementLastNumber(lastNumber);
    }

    private static String incementLastNumber(String lastNumber) {
        String letterpart = "";
        String digitpart = "";
        for (int i = 0; i < lastNumber.length(); i++) {
            if (Character.isLetter(lastNumber.charAt(i))) {
                letterpart += lastNumber.charAt(i);
            } else if (Character.isDigit(lastNumber.charAt(i))) {
                digitpart += lastNumber.charAt(i);
            }

        }
        Integer digit = Integer.parseInt(digitpart);
        digit++;
        return letterpart + (String.format("%0" + digitpart.length() + "d", digit));
    }

    public static void addProduct(String userEmail, String productNumber) {
        Kunde k = User.getCustomer(userEmail);
        String KUNDENNR = (k == null) ? User.getKUNDENNR() : k.getKundenNR();
        String nextWARENKORBPRODUKTNR = getNextWARENKORBPRODUKTNR();

        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("insert into WARENKORBPRODUKT values (?, ?)");
                ps.setString(1, nextWARENKORBPRODUKTNR);
                ps.setString(2, productNumber);
                ps.executeQuery();
                
                ps = con.prepareStatement("insert into WARENKORB values (?, ?, ?)");
                ps.setString(1, KUNDENNR);
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
        String KUNDENNR = (k == null) ? User.getKUNDENNR() : k.getKundenNR();
        Warenkorb shoppingCart = new Warenkorb();

        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                /* Retrieve products */
                PreparedStatement ps = con.prepareStatement("select wp.PRODUKTNR from WARENKORB w, WARENKORBPRODUKT wp where w.KUNDENNR=? and w.WARENKORBPRODUKTNR = wp.WARENKORBPRODUKTNR");
                ps.setString(1, KUNDENNR);
                ResultSet rs;
                rs = ps.executeQuery();
                while (rs.next()) {
                    shoppingCart.getProdukte().add(Products.getProduct(rs.getString(1)));
                }
                /* Retrieve packages */
                ps = con.prepareStatement("select wpak.PAKETNR from WARENKORB w, WARENKORBPAKET wpak where w.KUNDENNR=? and w.WARENKORBPAKETNR = wpak.WARENKORBPAKETNR");
                ps.setString(1, KUNDENNR);
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
