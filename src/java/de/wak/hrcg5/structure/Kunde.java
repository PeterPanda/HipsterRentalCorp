/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.structure;

/**
 *
 * @author janFk
 */
public class Kunde {
    private String kundenNR;
    private String vorname;
    private String nachname;
    private String email;
    private String organisationsname;      
    private String strasse;
    private String hausnummer;
    private String plz;
    private String telefonNR;     
    private String handynummer;
    
    public Kunde (String kundenNR,String vorname,String nachname,String email,String organisationsname,String strasse,String hausnummer,String plz,String telefonNR,String handynummer){
        this.kundenNR=kundenNR;
        this.vorname=vorname;
        this.nachname=nachname;
        this.email=email;
        this.organisationsname=organisationsname;
        this.strasse=strasse;
        this.hausnummer=hausnummer;
        this.plz=plz;
        this.telefonNR=telefonNR;
        this.hausnummer=hausnummer;
    }

    /**
     * @return the kundenNR
     */
    public String getKundenNR() {
        return kundenNR;
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

    /**
     * @return the organisationsname
     */
    public String getOrganisationsname() {
        return organisationsname;
    }

    /**
     * @return the strasse
     */
    public String getStrasse() {
        return strasse;
    }

    /**
     * @return the hausnummer
     */
    public String getHausnummer() {
        return hausnummer;
    }

    /**
     * @return the plz
     */
    public String getPlz() {
        return plz;
    }

    /**
     * @return the telefonNR
     */
    public String getTelefonNR() {
        return telefonNR;
    }

    /**
     * @return the handynummer
     */
    public String getHandynummer() {
        return handynummer;
    }
    
}
