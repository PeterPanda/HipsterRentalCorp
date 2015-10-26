/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.structure;

import de.wak.hrcg5.database.User;

/**
 *
 * @author janFk
 */
public class Mitarbeiter {
    private String mitarbeiterNR;
    private String vorname;
    private String nachname;
    private String email;

    public Mitarbeiter(String mitarbeiterNR, String vorname, String nachname, String email) {
        this.mitarbeiterNR = mitarbeiterNR;
        this.vorname = vorname;
        this.nachname = nachname;
        this.email = email;
    }

    /**
     * @return the mitarbeiterNR
     */
    public String getMitarbeiterNR() {
        return mitarbeiterNR;
    }

    /**
     * @return the vorname
     */
    public String getVorname() {
        return vorname;
    }

    /**
     * @return the nachname
     */
    public String getNachname() {
        return nachname;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    public String administrator(){
        return User.isAdmin(email)? "Admin": "";
         
    }
}
