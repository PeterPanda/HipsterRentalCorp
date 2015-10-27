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
 * @author Jan
 */
public class Kategorie {

    private final String kategorieNR;
    private final String name;
    private String fotoNR;
    private List<String> unterkategorie = new ArrayList<>();

    public Kategorie(String kategorieNR, String name, String fotoNR, String unterkategorie) {
        this.kategorieNR = kategorieNR;
        this.name = name;
        this.fotoNR=fotoNR;
        this.unterkategorie.add(unterkategorie);
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

    /**
     * @param fotoNR the fotoNR to set
     */
    public void setFotoNR(String fotoNR) {
        this.fotoNR = fotoNR;
    }

    /**
     * @return the unterkategorie
     */
    public List<String> getUnterkategorie() {
        return unterkategorie;
    }
}
