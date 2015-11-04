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
public class Gast extends Person{
    private final String gastNR;
    
    public Gast(String gastNR,String vorname, String nachname, String email, String organisationsname, String strasse, String hausnummer, String plz, String telefonNR, String handynummer) {
        super(vorname, nachname, email, organisationsname, strasse, hausnummer, plz, telefonNR, handynummer);
        this.gastNR=gastNR;
    }

    /**
     * @return the gastNR
     */
    public String getGastNR() {
        return gastNR;
    }
    
}
