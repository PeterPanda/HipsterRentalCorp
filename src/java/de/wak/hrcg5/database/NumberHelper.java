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
    
        public static String getNextKUNDENNR() {
        String lastNumber = "";
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select MAX(KUNDENNR) from KUNDE");
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
            return incementLastNumber(KUNDENNR);
        }
        return incementLastNumber(lastNumber);
    }

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
}
