/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.structure;

import java.util.ArrayList;
import java.util.List;
import de.wak.hrcg5.database.NumberHelper;

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
    
    public String getItemsView() {
        StringBuilder sb = new StringBuilder();
        
        for (Produkt p : produkte) {
           
           sb.append("<tr>");
           sb.append("<td class=\"cart_product\">");
           sb.append(p.firstImage());
           sb.append("</td>");
           sb.append("<td class='cart_description'>");
           sb.append("<h4><a href=\"\">");
           sb.append(p.getBezeichnung());
           sb.append("</a></h4>");
           sb.append("</td>");
           sb.append("<td class='cart_total'>");
           sb.append("<p class='cart_total_price'>");       
           sb.append(p.getMietzins());
           sb.append("</p>");
           sb.append("</td>");
           sb.append("<td class='cart_delete'>");
           sb.append("<a class='cart_quantity_delete' href=''><i class='fa fa-times'></i></a>");
           sb.append("</td>");
           sb.append("</tr>");
           
        }

          for (Paket p : pakete) {
            sb.append("<tr>");
            sb.append("<td>");
            sb.append("</td>");
            sb.append("<td>");
            sb.append(p.getBezeichnung());
            sb.append("</td>");
            sb.append("<td>");
            sb.append(p.getMietzins());
            sb.append("</td>");
            sb.append("<td>");
            sb.append("<button id='deleteButton' onclick='alert();' value='").append(p.getPaketNR()).append("'>Löschen</button>");
            sb.append("</td>");
            sb.append("</tr>");
        }
        sb.append("<tr height='20'>");
        sb.append("</tr>");
        sb.append("<tr>");
        sb.append("<td>");
        sb.append("Mietzins gesamt:");
        sb.append("</td>");
        sb.append("<td>");
        sb.append("</td>");
        sb.append("<td>");
        sb.append(getMietzins());
        sb.append("</td>");
        sb.append("<td>");
        sb.append("</td>");
        sb.append("</tr>");
        
        sb.append("</tbody>");
        sb.append("</table>");
        sb.append("</div>");

        return sb.toString();
    }

    public String getMietzins() {
        String sum = "0";

        for (Paket p : pakete) {
            sum = String.valueOf(Double.parseDouble(sum) + Double.parseDouble(p.getMietzins().replace(',', '.')));
        }
        for (Produkt p : produkte) {
            sum = String.valueOf(Double.parseDouble(sum) + Double.parseDouble(p.getMietzins().replace(',', '.')));
        }
        return sum;
    }

    public Bestellung erzeugeBestellung(String von, String bis) {
        Bestellung b = new Bestellung(NumberHelper.getNextBESTELLNR(), von, bis);
        b.getProdukte().addAll(this.produkte);
        b.getPakete().addAll(this.pakete);
        return b;
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
