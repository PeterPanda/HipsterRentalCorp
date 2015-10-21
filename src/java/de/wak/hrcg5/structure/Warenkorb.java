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
public class Warenkorb {

    private List<Produkt> produkte = new ArrayList<>();
    private List<Paket> pakete = new ArrayList<>();

    /**
     * @return the warenkorbProdukt
     */
    public List<Produkt> getProdukte() {
        return produkte;
    }

    /**
     * @return the warenkorbPaket
     */
    public List<Paket> getPakete() {
        return pakete;
    }

    public String getProduktView() {
        StringBuilder sb = new StringBuilder();
        sb.append("<div>");
        sb.append("<table>");
        sb.append("<tbody>");
        for (Produkt p : produkte) {
            sb.append("<tr>");
            sb.append("<td>");
            sb.append(p.getBezeichnung());
            sb.append("</td>");
            sb.append("<td>");
            sb.append("<button value='").append(p.getProduktNR()).append("'>Löschen</button>");
            sb.append("</td>");
            sb.append("</tr>");
        }
        sb.append("</tbody>");
        sb.append("</table>");
        sb.append("</div>");

        return sb.toString();
    }

    public String getPaketView() {
        StringBuilder sb = new StringBuilder();
        sb.append("<div>");
        sb.append("<table>");
        sb.append("<tbody>");
        for (Paket p : pakete) {
            sb.append("<tr>");
            sb.append("<td>");
            sb.append(p.getBezeichnung());
            sb.append("</td>");
            sb.append("<td>");
            sb.append("<button value='").append(p.getPaketNR()).append("'>Löschen</button>");
            sb.append("</td>");
            sb.append("</tr>");
        }
        sb.append("</tbody>");
        sb.append("</table>");
        sb.append("</div>");

        return sb.toString();
    }

}
