/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.database;

import de.wak.hrcg5.structure.Bestellung;
import de.wak.hrcg5.structure.Kunde;
import de.wak.hrcg5.structure.Paket;
import de.wak.hrcg5.structure.Produkt;
import de.wak.hrcg5.structure.Warenkorb;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author janFk
 */
public abstract class Orders {

    public static List<Bestellung> getOrders() {
        List<Bestellung> orders = new ArrayList<>();

        Connection con = Connector.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("select * from BESTELLUNG");
            ResultSet rs;
            rs = ps.executeQuery();

            while (rs.next()) {
                orders.add(new Bestellung(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(5)));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        for (Bestellung o : orders) {
            o.getProdukte().addAll(getProducts(o.getBestellNR()));
            o.getPakete().addAll(getPackages(o.getBestellNR()));
        }

        return orders;
    }

    public static List<Bestellung> getCustomerOrders(String email) {
        Kunde c = User.getCustomer(email);
        List<Bestellung> orders = new ArrayList<>();

        Connection con = Connector.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("select * from BESTELLUNG where KUNDENNR=?");
            ps.setString(1, c.getKundenNR());
            ResultSet rs;
            rs = ps.executeQuery();

            while (rs.next()) {
                orders.add(new Bestellung(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(5)));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        for (Bestellung o : orders) {
            o.getProdukte().addAll(getProducts(o.getBestellNR()));
            o.getPakete().addAll(getPackages(o.getBestellNR()));
        }

        return orders;
    }

    private static List<Produkt> getProducts(String orderNumber) {
        List<Produkt> products = new ArrayList<>();

        Connection con = Connector.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("select PRODUKTNR from BESTELLPRODUKTPOS where BESTELLNR=?");
            ps.setString(1, orderNumber);
            ResultSet rs;
            rs = ps.executeQuery();

            while (rs.next()) {
                products.add(Products.getProduct(rs.getString(1)));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    private static List<Paket> getPackages(String orderNumber) {
        List<Paket> packages = new ArrayList<>();

        Connection con = Connector.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("select PAKETNR from BESTELLPAKETPOS where BESTELLNR=?");
            ps.setString(1, orderNumber);
            ResultSet rs;
            rs = ps.executeQuery();

            while (rs.next()) {
                packages.add(Packages.getPackage(rs.getString(1)));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return packages;
    }

    public static String createOrder(String from, String till, Warenkorb shoppingCart, String userEmail, String guest) {
        String guestNumber = null;
        if (guest != null) {
            String[] g = guest.split(",", -1);
            User.addGuest(g[1], g[2], g[0], g[5], g[6], g[7], g[8], g[9], g[3], g[4]);
            guestNumber = User.getGuest(g[0]).getGastNR();
        }
        Bestellung b = shoppingCart.erzeugeBestellung(from, till);

        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("insert into BESTELLUNG values (?, ?, ?, ?, ?, ?)");
                ps.setString(1, b.getBestellNR());
                ps.setString(2, b.getVon());
                ps.setString(3, b.getBis());
                ps.setString(4, (userEmail == null || userEmail.equals("") || userEmail.equals("null")) ? null : User.getCustomer(userEmail).getKundenNR());
                ps.setString(5, null);
                ps.setString(6, (guestNumber == null || guestNumber.equals("") || guestNumber.equals("null")) ? null : guestNumber);
                ps.executeUpdate();

                for (Produkt p : b.getProdukte()) {
                    ps = con.prepareStatement("insert into BESTELLPRODUKTPOS values (?, ?)");
                    ps.setString(1, b.getBestellNR());
                    ps.setString(2, p.getProduktNR());
                    ps.executeUpdate();
                }
                for (Paket p : b.getPakete()) {
                    ps = con.prepareStatement("insert into BESTELLPAKETPOS values (?, ?)");
                    ps.setString(1, b.getBestellNR());
                    ps.setString(2, p.getPaketNR());
                    ps.executeUpdate();
                }
            } catch (Exception e) {
                return null;
            }
        }
        return b.getBestellNR();
    }

    public static Bestellung getOrder(String orderNumber) {
        Bestellung o = null;
        Connection con = Connector.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("select * from BESTELLUNG where BESTELLNR=?");
            ps.setString(1, orderNumber);
            ResultSet rs;
            rs = ps.executeQuery();

            while (rs.next()) {
                o = new Bestellung(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(5));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        o.getProdukte().addAll(getProducts(o.getBestellNR()));
        o.getPakete().addAll(getPackages(o.getBestellNR()));

        return o;
    }

    public static String getCustomerEmail(String orderNumber) {
        String customerNumber = null;
        Connection con = Connector.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("select k.EMAIL from BESTELLUNG b, KUNDE K where b.KUNDENNR=k.KUNDENNR and b.BESTELLNR=?");
            ps.setString(1, orderNumber);
            ResultSet rs;
            rs = ps.executeQuery();

            while (rs.next()) {
                customerNumber = rs.getString(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return customerNumber;
    }

    public static String getGuestEmail(String orderNumber) {
        String guestNumber = null;
        Connection con = Connector.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("select g.EMAIL from BESTELLUNG b, GAST g where b.GASTNR=g.GASTNR and b.BESTELLNR=?");
            ps.setString(1, orderNumber);
            ResultSet rs;
            rs = ps.executeQuery();

            while (rs.next()) {
                guestNumber = rs.getString(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return guestNumber;
    }

    public static void deleteOrder(String orderNumber) {
        Connection con = Connector.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("update BESTELLUNG set BESTAETIGT='s' where BESTELLNR=?");
            ps.setString(1, orderNumber);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void setOrderStatusTrue(String orderNumber) {
        Connection con = Connector.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("update BESTELLUNG set BESTAETIGT='j' where BESTELLNR=?");
            ps.setString(1, orderNumber);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean didThreeOrders(String email, String from) {
        int count = 0;
        Connection con = Connector.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("select b.* from BESTELLUNG b, KUNDE k where k.EMAIL=? and k.KUNDENNR=b.KUNDENNR and b.BIS<?");
            ps.setString(1, email);
            ps.setString(2, from);
            ResultSet rs;
            rs = ps.executeQuery();

            while (rs.next()) {
                count++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return (count >= 3);
    }

    public static void denialOrder(String orderNumber) {
        Connection con = Connector.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("update BESTELLUNG set BESTAETIGT='a' where BESTELLNR=?");
            ps.setString(1, orderNumber);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<Bestellung> getOrdersByStatus(String statShort) {
        List<Bestellung> orders = new ArrayList<>();

        Connection con = Connector.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("select * from BESTELLUNG where BESTAETIGT=?");
            ps.setString(1, statShort);
            ResultSet rs;
            rs = ps.executeQuery();

            while (rs.next()) {
                orders.add(new Bestellung(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(5)));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        for (Bestellung o : orders) {
            o.getProdukte().addAll(getProducts(o.getBestellNR()));
            o.getPakete().addAll(getPackages(o.getBestellNR()));
        }

        return orders;
    }
}
