/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.structure;

import de.wak.hrcg5.database.NumberHelper;
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

    public String getItemsView() {
        StringBuilder sb = new StringBuilder();

        for (Produkt p : produkte) {
            sb.append("<tr>");
            sb.append("<td class=\'cart_product\'>");
            sb.append(p.firstImage());
            sb.append("</td>");
            sb.append("<td class='cart_description'>");
            sb.append("<h4>");
            sb.append(p.getBezeichnung());
            sb.append("</h4>");
            sb.append("</td>");
            sb.append("<td class='cart_total'>");
            sb.append("<p class='cart_total_price'>");
            sb.append(p.getMietzins());
            sb.append("&euro;</p>");
            sb.append("</td>");
            sb.append("<td class='cart_delete'>");           
            sb.append("<form action='/HipsterRentalCorp/DeleteFromShoppingCartServlet?toDeleteNumber=").append(p.getProduktNR()).append("' method='post'>");
            sb.append("<a class='cart_quantity_delete' onclick='this.parentNode.submit();' href='#'><i class='fa fa-times'></i></a>");
            sb.append("</form>");
            sb.append("</td>");
            sb.append("</tr>");

        }

        for (Paket p : pakete) {
            sb.append("<tr>");
            sb.append("<td class=\'cart_product\'>");
            sb.append("<img src='").append(p.getFoto()).append("' width='100px' height='100px'/>");
            sb.append("</td>");
            sb.append("<td class='cart_description'>");
            sb.append("<h4>");
            sb.append(p.getBezeichnung());
            sb.append("</h4>");
            sb.append("</td>");
            sb.append("<td class='cart_total'>");
            sb.append("<p class='cart_total_price'>");
            sb.append(p.getMietzins());
            sb.append("&euro;</p>");
            sb.append("</td>");
            sb.append("<td class='cart_delete'>");
            sb.append("<form action='/HipsterRentalCorp/DeleteFromShoppingCartServlet?toDeleteNumber=").append(p.getPaketNR()).append("' method='post'>");
            sb.append("<a class='cart_quantity_delete' onclick='this.parentNode.submit();' href='#'><i class='fa fa-times'></i></a>");
            sb.append("</form>");
            sb.append("</td>");
            sb.append("</tr>");
        }

        return sb.toString();
    }

    public String getBestellView() {
        StringBuilder sb = new StringBuilder();

        for (Produkt p : produkte) {
            sb.append("<tr>");
            sb.append("<td class=\'cart_product\'>");
            sb.append(p.firstImage());
            sb.append("</td>");
            sb.append("<td class='cart_description'>");
            sb.append("<h4>");
            sb.append(p.getBezeichnung());
            sb.append("</h4>");
            sb.append("</td>");
            sb.append("<td class='cart_total'>");
            sb.append("<p class='cart_total_price'>");
            sb.append(p.getMietzins());
            sb.append("&euro;</p>");
            sb.append("</td>");
            sb.append("</tr>");

        }

        for (Paket p : pakete) {
            sb.append("<tr>");
            sb.append("<td class=\'cart_product\'>");
            sb.append("<img src='" + p.getFoto() + "' width='100px' height='100px'/>");
            sb.append("</td>");
            sb.append("<td class='cart_description'>");
            sb.append("<h4>");
            sb.append(p.getBezeichnung());
            sb.append("</h4>");
            sb.append("</td>");
            sb.append("<td class='cart_total'>");
            sb.append("<p class='cart_total_price'>");
            sb.append(p.getMietzins());
            sb.append("&euro;</p>");
            sb.append("</td>");
            sb.append("</tr>");
        }

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
        Bestellung b = new Bestellung(NumberHelper.getNextBESTELLNR(), von, bis, null);
        b.getProdukte().addAll(this.produkte);
        b.getPakete().addAll(this.pakete);
        return b;
    }
}
