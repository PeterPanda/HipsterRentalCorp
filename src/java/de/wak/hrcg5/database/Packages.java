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
import java.util.Calendar;
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
                    if (rs.getString(8) == null || rs.getString(8).equals("")) {
                        p = new Paket(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), Images.getPackageImage(rs.getString(7)));
                    }
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
        Kategorie c = Categories.getCategory(categoryNumber);
        if (c != null) {
            if (c.getUnterkategorie() != null) {
                if (c.getUnterkategorie().size() > 0) {
                    for (String catnumb : c.getUnterkategorie()) {
                        if (catnumb != null && !catnumb.equals("") && !catnumb.equals("null")) {
                            Kategorie cat = Categories.getCategory(catnumb);

                            sub.addAll(getPackagesByCategory(cat.getKategorieNR()));
                        }
                    }
                    productsByCategory.addAll(productsByCategory.size(), sub);
                }
            }
        }

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

    public static void checkAvailability() {
        Calendar cal = Calendar.getInstance();
        String now = cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH) + 1) + "-" + cal.get(Calendar.DAY_OF_MONTH) + " " + cal.get(Calendar.HOUR_OF_DAY) + ":" + cal.get(Calendar.MINUTE) + ":" + cal.get(Calendar.SECOND);
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select distinct(pp.PRODUKTNR) FROM PAKETPOS pp, PAKET p, BESTELLPAKETPOS bp, BESTELLUNG b where b.BESTELLNR = bp.BESTELLNR and pp.PAKETNR = p.PAKETNR and p.PAKETNR = bp.PAKETNR and b.von<? and b.bis>?");
                ps.setString(1, now);
                ps.setString(2, now);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    ps = con.prepareStatement("update PRODUKT set VERFUEGBAR='' where PRODUKTNR=?");
                    ps.setString(1, rs.getString(1));
                    ps.executeUpdate();
                }
                ps = con.prepareStatement("select distinct(pp.PRODUKTNR) FROM PAKETPOS pp, PAKET p, BESTELLPAKETPOS bp, BESTELLUNG b where b.BESTELLNR = bp.BESTELLNR and pp.PAKETNR = p.PAKETNR and p.PAKETNR = bp.PAKETNR and b.bis<?");
                ps.setString(1, now);
                rs = ps.executeQuery();
                while (rs.next()) {
                    ps = con.prepareStatement("update PRODUKT set VERFUEGBAR='j' where PRODUKTNR=?");
                    ps.setString(1, rs.getString(1));
                    ps.executeUpdate();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static List<Paket> getPackages() {
        List<Paket> packages = new ArrayList<>();
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select * from PAKET");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    packages.add(getPackage(rs.getString(1)));
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return packages;
    }
    
        public static void delete(String packageNumber) {
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("update PAKET set GELOESCHT='j' where PAKETNR=?");
                ps.setString(1, packageNumber);
                ps.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
