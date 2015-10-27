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
public class Paket {

    private String paketNR;
    private String kategorieNR;
    private String bezeichnung;
    private String beschreibung;
    private String details;
    private String mietzins;
    private String fotoNR;

    public Paket(String PAKETNR, String KATEGORIENR, String BEZEICHNUNG, String BESCHREIBUNG, String DETAILS, String MIETZINS, String FOTONR) {
        this.paketNR = PAKETNR;
        this.kategorieNR = KATEGORIENR;
        this.bezeichnung = BEZEICHNUNG;
        this.beschreibung = BESCHREIBUNG;
        this.details = DETAILS;
        this.mietzins = MIETZINS;
        this.fotoNR = FOTONR;
    }

    /**
     * @return the paketNR
     */
    public String getPaketNR() {
        return paketNR;
    }

    /**
     * @return the kategorieNR
     */
    public String getKategorieNR() {
        return kategorieNR;
    }

    /**
     * @return the bezeichnung
     */
    public String getBezeichnung() {
        return bezeichnung;
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
     * @return the fotoNR
     */
    public String getFotoNR() {
        return fotoNR;
    }

}
