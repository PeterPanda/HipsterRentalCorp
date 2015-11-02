/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.structure;

import de.wak.hrcg5.database.Images;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author janFk
 */
public class Paket {

    private final String paketNR;
    private final String kategorieNR;
    private final String bezeichnung;
    private final String beschreibung;
    private final String details;
    private final String mietzins;
    private final String foto;
    private final List<Produkt> produkte;

    public Paket(String PAKETNR, String KATEGORIENR, String BEZEICHNUNG, String BESCHREIBUNG, String DETAILS, String MIETZINS, String FOTONR) {
        this.produkte = new ArrayList<>();
        this.paketNR = PAKETNR;
        this.kategorieNR = KATEGORIENR;
        this.bezeichnung = BEZEICHNUNG;
        this.beschreibung = BESCHREIBUNG;
        this.details = DETAILS;
        this.mietzins = MIETZINS;
        this.foto = Images.getPackageImage(FOTONR);
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
    public String getFoto() {
        return foto;
    }

    /**
     * @return the produkte
     */
    public List<Produkt> getProdukte() {
        return produkte;
    }

    public String getProduktView(){
        StringBuilder sb = new StringBuilder();
        sb.append("<div>");
        for(Produkt p:produkte){
            sb.append("<button>");
            sb.append(p.getBezeichnung());
            sb.append("</button>");
        }
        sb.append("</div>");
        return sb.toString();
    }
}
