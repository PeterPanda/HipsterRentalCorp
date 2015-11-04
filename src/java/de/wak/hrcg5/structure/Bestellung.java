/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.structure;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author janFk
 */
public class Bestellung {

    private final String bestellNR;
    private final String von;
    private final String bis;
    private final Kunde kunde;
    private final String verfuegbar;
    private final Gast gast;
    private final List<Produkt> produkte = new ArrayList<>();
    private final List<Paket> pakete = new ArrayList<>();

    public Bestellung(String bestellNR, String von, String bis, Kunde kunde, String verfuegbar, Gast gast) {
        this.bestellNR = bestellNR;
        this.von = von;
        this.bis = bis;
        this.kunde = kunde;
        this.verfuegbar = verfuegbar;
        this.gast = gast;
    }

    /**
     * @return the bestellNR
     */
    public String getBestellNR() {
        return bestellNR;
    }

    /**
     * @return the von
     */
    public String getVon() {
        return von;
    }

    /**
     * @return the bis
     */
    public String getBis() {
        return bis;
    }

    /**
     * @return the produkte
     */
    public List<Produkt> getProdukte() {
        return produkte;
    }

    /**
     * @return the pakete
     */
    public List<Paket> getPakete() {
        return pakete;
    }

    /**
     * @return the kunde
     */
    public Kunde getKunde() {
        return kunde;
    }

    /**
     * @return the verfuegbar
     */
    public String getVerfuegbar() {
        return verfuegbar;
    }

    /**
     * @return the gast
     */
    public Gast getGast() {
        return gast;
    }

}
