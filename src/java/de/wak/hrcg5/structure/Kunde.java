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
public class Kunde extends Person{
    private final String kundenNR;
    
    public Kunde (String kundenNR,String vorname,String nachname,String email,String organisationsname,String strasse,String hausnummer,String plz,String telefonNR,String handynummer){
        super(vorname, nachname, email, organisationsname, strasse, hausnummer, plz, telefonNR, handynummer);
        this.kundenNR=kundenNR;
    }

    /**
     * @return the kundenNR
     */
    public String getKundenNR() {
        return kundenNR;
    }
}
