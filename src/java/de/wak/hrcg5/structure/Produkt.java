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
public class Produkt {

    private String produktNR;
    private String bezeichnung;
    private String hersteller;
    private String beschreibung;
    private String details;
    private String mietzins;
    private String kategorieNR;
    private String alternative;

    public Produkt(String produktNR, String bezeichnung, String hersteller, String beschreibung, String details, String mietzins, String kategorieNR, String alternative) {
        this.produktNR=produktNR;
        this.bezeichnung=bezeichnung;
        this.hersteller=hersteller;
        this.beschreibung=beschreibung;
        this.details=details;
        this.mietzins=mietzins;
        this.kategorieNR=kategorieNR;
        this.alternative=alternative;
    }

    /**
     * @return the produktNR
     */
    public String getProduktNR() {
        return produktNR;
    }

    /**
     * @return the bezeichnung
     */
    public String getBezeichnung() {
        return bezeichnung;
    }

    /**
     * @return the hersteller
     */
    public String getHersteller() {
        return hersteller;
    }

    /**
     * @return the beschreibung
     */
    public String getBeschreibung() {
        return beschreibung;
    }

    /**
     * @return the details
     */
    public String getDetails() {
        return details;
    }

    /**
     * @return the mietzins
     */
    public String getMietzins() {
        return mietzins;
    }

    /**
     * @return the kategorieNR
     */
    public String getKategorieNR() {
        return kategorieNR;
    }

    /**
     * @return the alternative
     */
    public String getAlternative() {
        return alternative;
    }
    
    

}
