/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.structure;

import de.wak.hrcg5.database.Images;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author janFk
 */
public class Paket {

    private final String paketNR;
    private final String kategorieNR;
    private final String bezeichnung;
    private final String beschreibung;
    private final String details;
    private final String mietzins;
    private final String foto;
    private final List<Produkt> produkte;

    public Paket(String PAKETNR, String KATEGORIENR, String BEZEICHNUNG, String BESCHREIBUNG, String DETAILS, String MIETZINS, String FOTONR) {
        this.produkte = new ArrayList<>();
        this.paketNR = PAKETNR;
        this.kategorieNR = KATEGORIENR;
        this.bezeichnung = BEZEICHNUNG;
        this.beschreibung = BESCHREIBUNG;
        this.details = DETAILS;
        this.mietzins = MIETZINS;
        this.foto = FOTONR;
    }

    /**
     * @return the paketNR
     */
    public String getPaketNR() {
        return paketNR;
    }

    /**
     * @return the kategorieNR
     */
    public String getKategorieNR() {
        return kategorieNR;
    }

    /**
     * @return the bezeichnung
     */
    public String getBezeichnung() {
        return bezeichnung;
    }

    /**
     * @return the beschreibung
     */
    public String getBeschreibung() {
        return beschreibung;
    }

    /**
     * @return the details
     */
    public String getDetails() {
        return details;
    }

    /**
     * @return the mietzins
     */
    public String getMietzins() {
        return mietzins;
    }

    /**
     * @return the fotoNR
     */
    public String getFoto() {
        return foto;
    }

    /**
     * @return the produkte
     */
    public List<Produkt> getProdukte() {
        return produkte;
    }

    public String getProduktView() {
        StringBuilder data = new StringBuilder();
        data.append("<div>\n");
        for (Produkt p : produkte) {
            if (p != null) {
                if (p.verfuegbar()) {
                    data.append("<div class='product-image-wrapper'>");
                    data.append("<div class='single-products'>");
                    data.append("<div class='productinfo text-center'>");
                    data.append("<form action='/HipsterRentalCorp/LoadProductServlet?productNumber=").append(p.getProduktNR()).append("' method='post'>");
                    data.append("<div onclick='this.parentNode.submit();'>");
                    data.append("<img src='").append((p.getFotos().size() > 0) ? p.getFotos().get(0) : "images/home/logo.png").append("' height='150px' alt='' />");
                    data.append(" <h2>").append(p.getMietzins()).append("€</h2>");
                    data.append("<p>").append(p.getBezeichnung()).append("</p>");
                    data.append("</div>");
                    data.append("</form>");
                    data.append("<form action='/HipsterRentalCorp/AddProductToShoppingCartServlet?productNumber=").append(p.getProduktNR()).append("' method='post'>");
                    data.append("<button type='submit' class='btn btn-default add-to-cart'><i class='fa fa-shopping-cart'></i>Zum Warenkorb hinzuf&uuml;gen</button>");
                    data.append("</form>");
                    data.append("</div>");
                    data.append("</div>");
                    data.append("</div>");
                }
            }
        }
        data.append("</div>");
        return data.toString();
    }
}
