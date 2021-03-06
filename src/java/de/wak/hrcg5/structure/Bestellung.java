/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.structure;

import java.util.ArrayList;
import java.util.List;
import de.wak.hrcg5.database.NumberHelper;
import de.wak.hrcg5.database.Orders;
import de.wak.hrcg5.database.User;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author janFk
 */
public class Bestellung {

    private String bestellNR;
    private String von;
    private String bis;
    private String bestaetigt;
    private List<Produkt> produkte = new ArrayList<>();
    private List<Paket> pakete = new ArrayList<>();

    public Bestellung(String bestellNR, String von, String bis, String bestaetigt) {
        this.bestellNR = bestellNR;
        this.von = von;
        this.bis = bis;
        this.bestaetigt = bestaetigt;
    }

    public String getKosten() {
        String sum = "0";

        for (Paket p : pakete) {
            sum = String.valueOf(Double.parseDouble(sum) + Double.parseDouble(p.getMietzins().replace(',', '.')));
        }
        for (Produkt p : produkte) {
            sum = String.valueOf(Double.parseDouble(sum) + Double.parseDouble(p.getMietzins().replace(',', '.')));
        }

        Calendar cal = Calendar.getInstance();

        cal.set(Integer.parseInt(von.split(" ")[0].split("-")[0]), Integer.parseInt(von.split(" ")[0].split("-")[1]) - 1, Integer.parseInt(von.split(" ")[0].split("-")[2]), Integer.parseInt(von.split(" ")[1].split(":")[0]), Integer.parseInt(von.split(" ")[1].split(":")[1]), 0);
        Date v = cal.getTime();
        cal.set(Integer.parseInt(bis.split(" ")[0].split("-")[0]), Integer.parseInt(bis.split(" ")[0].split("-")[1]) - 1, Integer.parseInt(bis.split(" ")[0].split("-")[2]), Integer.parseInt(bis.split(" ")[1].split(":")[0]), Integer.parseInt(bis.split(" ")[1].split(":")[1]), 0);
        Date b = cal.getTime();
        float mil = Math.abs(b.getTime() - v.getTime());
        float days = mil / 1000 / 60 / 60 / 24;
        double starteddays = Math.ceil(days);
        starteddays--;
        String cost = String.valueOf(Double.parseDouble(sum) * starteddays * 0.6 + Double.parseDouble(sum));

        if (Orders.didThreeOrders(Orders.getCustomerEmail(bestellNR), von)) {
            cost = String.valueOf(Double.parseDouble(cost) * 0.8);
        }
        DecimalFormat df = new DecimalFormat("#.##");
        df.setRoundingMode(RoundingMode.HALF_UP);
        cost = df.format(Double.parseDouble(cost));
        return cost;
    }

    public String getKundenBestellView() {
        String status = getStatus();

        if (status == null) {
            status = "Noch nicht freigegeben";
        } else {
            if (status.equals("j")) {
                status = "Bestätigt";
            }
            if (status.equals("s")) {
                status = "Storniert";
            }
            if (status.equals("a")) {
                status = "Abgelehnt";
            }
        }
        StringBuilder sb = new StringBuilder();
        sb.append("<tr>");
        sb.append("<td >");
        sb.append("<form action='/HipsterRentalCorp/LoadOrderDetailsServlet?orderNumber=").append(bestellNR).append("' method='post'>");
        sb.append("<a class='cart_quantity_delete' onclick='this.parentNode.submit();' href='#'>").append(bestellNR).append("</a>");
        sb.append("</form>");
        sb.append("</td>");
        sb.append("<td class='cart_description'>");
        sb.append("<h4>");
        sb.append(von);
        sb.append("</h4>");
        sb.append("</td>");
        sb.append("<td class='cart_description'>");
        sb.append("<h4>");
        sb.append(bis);
        sb.append("</h4>");
        sb.append("</td>");
        sb.append("<td class='cart_total'>");
        sb.append("<p class='cart_total_price'>");
        sb.append(getKosten());
        sb.append("&euro;</p>");
        sb.append("</td>");
        sb.append("<td class='cart_description'>");
        sb.append("<h4>");
        sb.append(status);
        sb.append("</h4>");
        sb.append("</td>");
        if (status.equals("Noch nicht freigegeben")) {
            sb.append("<td class='cart_delete'>");
            sb.append("<form action='/HipsterRentalCorp/DeleteOrderServlet?orderNumber=").append(bestellNR).append("' method='post'>");
            sb.append("<a class='cart_quantity_delete' onclick='this.parentNode.submit();' href='#'><i class='fa fa-times'></i></a>");
            sb.append("</form>");
            sb.append("</td>");
        } else {
            sb.append("<td>");
            sb.append("</td>");
        }
        sb.append("</tr>");

        return sb.toString();
    }

    public String getMitarbeiterBestellView() {
        String status = getStatus();

        if (status == null) {
            status = "Noch nicht freigegeben";
        } else {
            if (status.equals("j")) {
                status = "Bestätigt";
            }
            if (status.equals("s")) {
                status = "Storniert";
            }
            if (status.equals("a")) {
                status = "Abgelehnt";
            }
        }
        StringBuilder sb = new StringBuilder();
        sb.append("<tr>");
        sb.append("<td>");
        sb.append("<form action='/HipsterRentalCorp/LoadOrderDetailsServlet?orderNumber=").append(bestellNR).append("' method='post'>");
        sb.append("<a class='cart_quantity_delete' onclick='this.parentNode.submit();' href='#'>").append(bestellNR).append("</a>");
        sb.append("</form>");
        sb.append("</td>");
        sb.append("<td class='cart_description'>");
        sb.append("<h4>");
        sb.append(von);
        sb.append("</h4>");
        sb.append("</td>");
        sb.append("<td class='cart_description'>");
        sb.append("<h4>");
        sb.append(bis);
        sb.append("</h4>");
        sb.append("</td>");
        sb.append("<td class='cart_total'>");
        sb.append("<p class='cart_total_price'>");
        sb.append(getKosten());
        sb.append("&euro;</p>");
        sb.append("</td>");
        sb.append("<td class='cart_description'>");
        sb.append("<h4>");
        sb.append(status);
        sb.append("</h4>");
        sb.append("</td>");
        if (status.equals("Noch nicht freigegeben")) {
            sb.append("<td class='cart_delete'>");
            sb.append("<form action='/HipsterRentalCorp/SwitchOrderStatusServlet?orderNumber=").append(bestellNR).append("' method='post'>");
            sb.append("<button type='submit'></i>Freigeben</button>");
            sb.append("</form>");
            sb.append("</td>");

            sb.append("<td class='cart_delete'>");
            sb.append("<form action='/HipsterRentalCorp/DenialOrderServlet?orderNumber=").append(bestellNR).append("' method='post'>");
            sb.append("<button type='submit'><i class='fa fa-times'></i>Ablehenen</button>");
            sb.append("</form>");
            sb.append("</td>");
        } else {
            sb.append("<td>");
            sb.append("</td>");
            sb.append("<td>");
            sb.append("</td>");
        }
        sb.append("</tr>");

        return sb.toString();
    }

    private String getStatus() {
        if (bestaetigt == null || bestaetigt.equals("") || bestaetigt.equals("null")) {
            return null;
        }
        return bestaetigt;
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
