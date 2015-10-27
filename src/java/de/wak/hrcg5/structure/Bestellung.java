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

    private String bestellNR;
    private String von;
    private String bis;
    private List<Produkt> produkte = new ArrayList<>();
    private List<Paket> pakete = new ArrayList<>();

    public Bestellung(String bestellNR, String von, String bis) {
        this.bestellNR = bestellNR;
        this.von = von;
        this.bis = bis;
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
    
    
}
