/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.structure;

/**
 *
 * @author Jan
 */
public class Kategorie {

    private final String kategorieNR;
    private final String name;
    private String fotoNR;

    public Kategorie(String kategorieNR, String name) {
        this.kategorieNR = kategorieNR;
        this.name = name;
    }

    public void setFotoNR(String fotoNR) {
        this.fotoNR = fotoNR;
    }

    /**
     * @return the kategorieNR
     */
    public String getKategorieNR() {
        return kategorieNR;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @return the fotoNR
     */
    public String getFotoNR() {
        return fotoNR;
    }
}
