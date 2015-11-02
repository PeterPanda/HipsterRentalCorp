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
public abstract class NumberHelper {

    private static final String WARENKORBPRODUKTNR = "WPNR000000";
    private static final String WARENKORBPAKETNR = "WPAKNR0000";
    private static final String KUNDENNR = "KNR0000000";
    private static final String MITARBEITERNR = "MNR0000000";
    private static final String PRODUKTNR = "PNR0000000";

    private static final String BESTELLNR = "BNR0000000";

    public static String getNextKUNDENNR() {
        String lastNumber = getLastNumber("select MAX(KUNDENNR) from KUNDE");
        
        if (lastNumber == null || lastNumber.equals("")) {
            return incementLastNumber(KUNDENNR);
        }
        return incementLastNumber(lastNumber);
    }

    public static String getNextWARENKORBPRODUKTNR() {
        String lastNumber = getLastNumber("select MAX(WARENKORBPRODUKTNR) from WARENKORBPRODUKT");
        
        if (lastNumber == null || lastNumber.equals("")) {
            return incementLastNumber(WARENKORBPRODUKTNR);
        }
        return incementLastNumber(lastNumber);
    }

    public static String getNextWARENKORBPAKETNR() {
        String lastNumber = getLastNumber("select MAX(WARENKORBPAKETNR) from WARENKORBPAKET");
        
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

    public static String getWARENKORBPRODUKTNR(String kundenNR) {
        String warenkorbProduktNR = null;
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select distinct(wp.WARENKORBPRODUKTNR) from WARENKORBPRODUKT wp, WARENKORB w, KUNDE k where k.KUNDENNR =? and k.KUNDENNR=w.KUNDENNR and w.WARENKORBPRODUKTNR = wp.WARENKORBPRODUKTNR");
                ps.setString(1, kundenNR);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    warenkorbProduktNR = rs.getString(1);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return warenkorbProduktNR;
    }

    static String getWARENKORBPAKETNR(String kundenNR) {
        String warenkorbPakektNR = null;
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select distinct(wp.WARENKORBPRODUKTNR) from WARENKORBPRODUKT wp, WARENKORB w, KUNDE k where k.KUNDENNR =? and k.KUNDENNR=w.KUNDENNR and w.WARENKORBPRODUKTNR = wp.WARENKORBPRODUKTNR");
                ps.setString(1, kundenNR);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    warenkorbPakektNR = rs.getString(1);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return warenkorbPakektNR;
    }

    static String getNextMITARBEITERNR() {
        String lastNumber = getLastNumber("select MAX(MITARBEITERNR) from MITARBEITER");
        if (lastNumber == null || lastNumber.equals("")) {
            return incementLastNumber(MITARBEITERNR);
        }
        return incementLastNumber(lastNumber);
    }

    static String getNextPRODUKTNR() {
        String lastNumber = getLastNumber("select MAX(PRODUKTNR) from PRODUKT");
        
        if (lastNumber == null || lastNumber.equals("")) {
            return incementLastNumber(PRODUKTNR);
        }
        return incementLastNumber(lastNumber);
    }

    public static String getNextBESTELLNR() {
        String lastNumber = getLastNumber("select MAX(BESTELLNR) from BESTELLUNG");
        
        if (lastNumber == null || lastNumber.equals("")) {
            return incementLastNumber(BESTELLNR);
        }
        return incementLastNumber(lastNumber);
    }

    private static String getLastNumber(String sql) {
        String lastNumber = "";
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs;
                rs = ps.executeQuery();
                while (rs.next()) {
                    lastNumber = rs.getString(1);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return lastNumber;
    }
}
