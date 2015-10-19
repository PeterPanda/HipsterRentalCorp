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
public abstract class Warenkorb {
    private static List<Produkt> produkte = new ArrayList<>();
    
    public static void addProdukt(Produkt produkt){
        produkte.add(produkt);
    }
    
}
