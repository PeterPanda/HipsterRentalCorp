/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.structure;

import de.wak.hrcg5.database.Images;
import de.wak.hrcg5.database.Products;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author janFk
 */
public class Produkt {

    private String produktNR;
    private String bezeichnung;
    private String hersteller;
    private String beschreibung;
    private String details;
    private String mietzins;
    private String kategorieNR;
    private String alternative;
    private String verfuegbar;
    private List<String> fotos = new ArrayList<>();

    public Produkt(String produktNR, String bezeichnung, String hersteller, String beschreibung, String details, String mietzins, String kategorieNR, String alternative, String verfuegbar) {
        this.produktNR = produktNR;
        this.bezeichnung = bezeichnung;
        this.hersteller = hersteller;
        this.beschreibung = beschreibung;
        this.details = details;
        this.mietzins = mietzins;
        this.kategorieNR = kategorieNR;
        this.alternative = alternative;
        this.verfuegbar = verfuegbar;
        fotos.addAll(Images.getProductImages(produktNR));
    }

    /**
     * @return the produktNR
     */
    public String getProduktNR() {
        return produktNR;
    }

    /**
     * @return the bezeichnung
     */
    public String getBezeichnung() {
        return bezeichnung;
    }

    /**
     * @return the hersteller
     */
    public String getHersteller() {
        return hersteller;
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
     * @return the kategorieNR
     */
    public String getKategorieNR() {
        return kategorieNR;
    }

    /**
     * @return the alternative
     */
    public Produkt getAlternative() {
        return Products.getProduct(alternative);
    }

    /**
     * @return the verfuegbar
     */
    public String getVerfuegbar() {
        return verfuegbar;
    }

    /**
     * @return the fotos
     */
    public List<String> getFotos() {
        return fotos;
    }

    public String getThumbnails() {
        if (fotos.size() > 0) {
            StringBuilder sb = new StringBuilder();

            for (String foto : fotos) {
                String name = foto.substring(foto.lastIndexOf("/") + 1, foto.lastIndexOf("."));
                sb.append("<img onclick='preview.src = ");
                sb.append(name);
                sb.append(".src' name='");
                sb.append(name);
                sb.append("' src='");
                sb.append(foto);
                sb.append("' /><br>");
            }
            return sb.toString();
        }
        return null;
    }

    public String firstImage() {
        if (fotos.size() > 0) {
            StringBuilder sb = new StringBuilder();

            sb.append("<img name='preview' src='");
            sb.append(fotos.get(0));
            sb.append("' alt='' width='100px' height='100px'/>");
            return sb.toString();
        }
        return null;
    }

    public boolean verfuegbar() {
        return (verfuegbar.equals("j"));
    }

}
