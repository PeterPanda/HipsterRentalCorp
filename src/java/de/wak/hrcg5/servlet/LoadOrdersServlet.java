/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.servlet;

import de.wak.hrcg5.database.Categories;
import de.wak.hrcg5.database.Orders;
import de.wak.hrcg5.structure.Bestellung;
import de.wak.hrcg5.structure.Kategorie;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author janFk
 */
@WebServlet(name = "LoadOrdersServlet", urlPatterns = {"/LoadOrdersServlet"})
public class LoadOrdersServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoadOrdersServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoadOrdersServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StringBuilder data = new StringBuilder();
        data.append("<div>\n");
        data.append("<table>");
        data.append("<thead>");
        data.append("<tr>");
        data.append("<th>");
        data.append("Bestellnummer");
        data.append("</th>");
        data.append("<th>");
        data.append("Zeitraum Von");
        data.append("</th>");
        data.append("<th>");
        data.append("Zeitraum Bis");
        data.append("</th>");
        data.append("<th>");
        data.append("Bestätigen");
        data.append("</th>");
        data.append("</tr>");
        data.append("</thead>");
        data.append("<tbody>");
        for (Bestellung o : Orders.getOrders()) {
            data.append("<tr>");
        data.append("<th>");
            data.append(o.getBestellNR());
            data.append("</th>");
            data.append("<th>");
            data.append(o.getVon());
            data.append("</th>");
            data.append("<th>");
            data.append(o.getBis());
            data.append("</th>");
            data.append("<th>");
            if(o.getVerfuegbar()== null||o.getVerfuegbar().equals("null")||o.getVerfuegbar().equals("")){   
                data.append("<input type='checkbox' onclick='parent.checkOrder(");
                data.append(o.getBestellNR());
                data.append("'>");
            }else{
                data.append("<input type='checkbox' checked onclick='return false'>");
            }
            data.append("</th>");
        data.append("</tr>");
        }

        data.append("</tbody>");
        data.append("</table>");
        data.append("</div>");

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(data.toString());
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
