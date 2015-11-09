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
import java.util.Calendar;
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
        Kategorie c = Categories.getCategory(categoryNumber);
        if (c != null) {
            if (c.getUnterkategorie() != null) {
                if (c.getUnterkategorie().size() > 0) {
                    for (String catnumb : c.getUnterkategorie()) {
                        if (catnumb != null && !catnumb.equals("") && !catnumb.equals("null")) {
                            Kategorie cat = Categories.getCategory(catnumb);

                            sub.addAll(getProductsByCategory(cat.getKategorieNR()));
                        }
                    }
                    productsByCategory.addAll(productsByCategory.size(), sub);
                }
            }
        }
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
                    if (rs.getString(10)==null||rs.getString(10).equals("")) {
                        product = new Produkt(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
                    }
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
                PreparedStatement ps = con.prepareStatement("insert into PRODUKT values(?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, NumberHelper.getNextPRODUKTNR());
                ps.setString(2, bezeichnung);
                ps.setString(3, herstellername);
                ps.setString(4, beschreibung);
                ps.setString(5, details);
                ps.setString(6, mietzins);
                ps.setString(7, kategorie);
                ps.setString(8, alternative.equals("") ? null : alternative);
                ps.setString(9, "j");
                ps.setString(10, null);
                ps.executeUpdate();
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
                PreparedStatement ps = con.prepareStatement("select distinct(bp.PRODUKTNR) FROM BESTELLPRODUKTPOS bp, BESTELLUNG b where b.BESTELLNR = bp.BESTELLNR and b.von<? and b.bis>?");
                ps.setString(1, now);
                ps.setString(2, now);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    ps = con.prepareStatement("update PRODUKT set VERFUEGBAR='' where PRODUKTNR=?");
                    ps.setString(1, rs.getString(1));
                    ps.executeUpdate();
                }
                ps = con.prepareStatement("select distinct(bp.PRODUKTNR) FROM BESTELLPRODUKTPOS bp, BESTELLUNG b where b.BESTELLNR = bp.BESTELLNR and b.bis<?");
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

    public static List<Produkt> getBestProducts(int max) {
        int count = 1;
        List<Produkt> products = new ArrayList<>();
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select bp.PRODUKTNR, count(*) as ANZAHL FROM BESTELLPRODUKTPOS bp, BESTELLUNG b where b.BESTELLNR = bp.BESTELLNR group by bp.PRODUKTNR order by ANZAHL DESC");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    products.add(getProduct(rs.getString(1)));
                    count++;
                    if (count >= max) {
                        break;
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return products;
    }

    public static List<Produkt> getProducts() {
        List<Produkt> products = new ArrayList<>();
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select * from PRODUKT");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    products.add(getProduct(rs.getString(1)));
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return products;
    }

    public static void delete(String productNumber) {
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("update PRODUKT set GELOESCHT='j' where PRODUKTNR=?");
                ps.setString(1, productNumber);
                ps.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
