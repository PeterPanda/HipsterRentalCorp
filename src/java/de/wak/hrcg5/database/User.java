/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.database;

import de.wak.hrcg5.structure.Gast;
import de.wak.hrcg5.structure.Kunde;
import de.wak.hrcg5.structure.Mitarbeiter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Jan
 */
public abstract class User {

    /**
     * Checks if the given user data can be found in the table USER.
     *
     * @param email User-email.
     * @param pass User-password.
     * @return True, if email and password correct.
     */
    public static boolean checkCustomer(String email, String pass) {
        boolean userFound = false;

        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select u.* from USER u, KUNDE k where u.EMAIL=? and u.PASSWORT=? and u.EMAIL = k.EMAIL");
                ps.setString(1, email);
                ps.setString(2, pass);
                ResultSet rs;
                rs = ps.executeQuery();
                userFound = rs.next();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return userFound;
    }

    public static boolean checkEmployee(String email, String pass) {
        boolean userFound = false;

        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select u.* from USER u, MITARBEITER m where u.EMAIL=? and u.PASSWORT=? and u.EMAIL = m.EMAIL");
                ps.setString(1, email);
                ps.setString(2, pass);
                ResultSet rs;
                rs = ps.executeQuery();
                userFound = rs.next();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return userFound;
    }

    public static Kunde getCustomer(String email) {
        Kunde k = null;
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select * from KUNDE where email=?");
                ps.setString(1, email);
                ResultSet rs;
                rs = ps.executeQuery();
                while (rs.next()) {
                    k = new Kunde(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if(k==null){
            return getDummyUser();
        }
        return k;
    }

    public static Mitarbeiter getEmployee(String email) {
        Mitarbeiter m = null;
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select * from MITARBEITER where email=?");
                ps.setString(1, email);
                ResultSet rs;
                rs = ps.executeQuery();
                while (rs.next()) {
                    m = new Mitarbeiter(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return m;
    }
    
        public static Gast getGuest(String email) {
        Gast g = null;
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select * from GAST where email=?");
                ps.setString(1, email);
                ResultSet rs;
                rs = ps.executeQuery();
                while (rs.next()) {
                    g = new Gast(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return g;
    }

    static Kunde createDummyUser() {
        Kunde c = null;
        c = new Kunde(NumberHelper.getNextKUNDENNR(), "dummy", "dummy", null, "dummy", "dummy", "dummy", null, "dummy", "dummy");
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("insert into KUNDE values (?, ? , ?, ? ,? ,? ,? ,? ,? ,?)");
                ps.setString(1, c.getKundenNR());
                ps.setString(2, c.getVorname());
                ps.setString(3, c.getNachname());
                ps.setString(4, c.getEmail());
                ps.setString(5, c.getOrganisationsname());
                ps.setString(6, c.getStrasse());
                ps.setString(7, c.getHausnummer());
                ps.setString(8, c.getPlz());
                ps.setString(9, c.getTelefonNR());
                ps.setString(10, c.getHandynummer());

                ps.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return c;
    }

    static Kunde getDummyUser() {
        Kunde c = null;

        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                PreparedStatement ps = con.prepareStatement("select * from KUNDE where VORNAME=? and NACHNAME=? and EMAIL is ? and ORGANISATIONSNAME=? AND STRASSE=? AND HAUSNUMMER =? AND PLZ is ? and TELEFONNR=? and HANDYNR=?");
                ps.setString(1, "dummy");
                ps.setString(2, "dummy");
                ps.setString(3, null);
                ps.setString(4, "dummy");
                ps.setString(5, "dummy");
                ps.setString(6, "dummy");
                ps.setString(7, null);
                ps.setString(8, "dummy");
                ps.setString(9, "dummy");
                ResultSet rs;
                rs = ps.executeQuery();
                while (rs.next()) {
                    c = new Kunde(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if (c == null) {
            c = createDummyUser();
        }
        return c;
    }

    public static boolean hasShoppingCart(String customerNumber) {
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                /* Retrieve products */
                PreparedStatement ps = con.prepareStatement("select * from KUNDE k where k.KUNDENNR =? AND k.KUNDENNR IN (select KUNDENNR from WARENKORB)");
                ps.setString(1, customerNumber);
                ResultSet rs;
                rs = ps.executeQuery();

                return rs.next();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public static boolean isAdmin(String email) {
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                /* Retrieve products */
                PreparedStatement ps = con.prepareStatement("select * from User where email =? AND ISADMIN = 'j'");
                ps.setString(1, email);
                ResultSet rs;
                rs = ps.executeQuery();

                return rs.next();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return false;
    }

    private static boolean addUser(String email, String pass) {
        Connection con = Connector.getConnection();
        if (con != null) {
            try {
                /* Retrieve products */
                PreparedStatement ps = con.prepareStatement("insert into User values(?,?,?)");
                ps.setString(1, email);
                ps.setString(2, pass);
                ps.setString(3, null);
                ps.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }
        return true;
    }

    public static boolean addEmployee(String surename, String lastname, String email, String pass) {
        boolean success = addUser(email, pass);
        if (success) {
            Connection con = Connector.getConnection();
            if (con != null) {
                try {
                    /* Retrieve products */
                    PreparedStatement ps = con.prepareStatement("insert into MITARBEITER values(?,?,?,?)");
                    ps.setString(1, NumberHelper.getNextMITARBEITERNR());
                    ps.setString(2, surename);
                    ps.setString(3, lastname);
                    ps.setString(4, email);
                    ps.executeUpdate();
                } catch (Exception e) {
                    return false;
                }
            }
        } else {
            return false;
        }
        return true;
    }

    public static boolean addCustomer(String firstname, String lastname, String email, String pass, String organisation, String place, String postalcode, String streat, String housenumber, String telephonenumber, String mobilenumber) {
        boolean success = addUser(email, pass);
        if (success) {
            success = Place.addPlace(place, postalcode);
            if (success) {
                Connection con = Connector.getConnection();
                if (con != null) {
                    try {
                        /* Retrieve products */
                        PreparedStatement ps = con.prepareStatement("insert into KUNDE values(?,?,?,?,?,?,?,?,?,?)");
                        ps.setString(1, NumberHelper.getNextKUNDENNR());
                        ps.setString(2, firstname);
                        ps.setString(3, lastname);
                        ps.setString(4, email);
                        ps.setString(5, organisation);
                        ps.setString(6, streat);
                        ps.setString(7, housenumber);
                        ps.setString(8, postalcode);
                        ps.setString(9, telephonenumber);
                        ps.setString(10, mobilenumber);

                        ps.executeUpdate();
                    } catch (Exception e) {
                        return false;
                    }
                }
            } else {
                return false;
            }
        } else {
            return false;
        }

        return true;
    }

    public static boolean addGuest(String surename, String lastname, String email, String organisation, String place, String postalcode, String streat, String housenumber, String telephonenumber, String mobilenumber) {
        boolean success = Place.addPlace(place, postalcode);
        if (success) {
            Connection con = Connector.getConnection();
            if (con != null) {
                try {
                    /* Retrieve products */
                    PreparedStatement ps = con.prepareStatement("insert into GAST values(?,?,?,?,?,?,?,?,?,?)");
                    ps.setString(1, NumberHelper.getNextGASTNR());
                    ps.setString(2, surename);
                    ps.setString(3, lastname);
                    ps.setString(4, email);
                    ps.setString(5, organisation);
                    ps.setString(6, streat);
                    ps.setString(7, housenumber);
                    ps.setString(8, postalcode);
                    ps.setString(9, telephonenumber);
                    ps.setString(10, mobilenumber);

                    ps.executeUpdate();
                } catch (Exception e) {
                    return false;
                }
            }

        } else {
            return false;
        }

        return true;
    }
}
