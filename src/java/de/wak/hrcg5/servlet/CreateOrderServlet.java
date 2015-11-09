/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.servlet;

import de.wak.hrcg5.database.NumberHelper;
import de.wak.hrcg5.database.Orders;
import de.wak.hrcg5.database.ShoppingCart;
import de.wak.hrcg5.database.User;
import de.wak.hrcg5.structure.Paket;
import de.wak.hrcg5.structure.Produkt;
import de.wak.hrcg5.structure.Warenkorb;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jan
 */
@WebServlet(name = "CreateOrderServlet", urlPatterns = {"/CreateOrderServlet"})
public class CreateOrderServlet extends HttpServlet {

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
            out.println("<title>Servlet CreateOrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateOrderServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();

        String userEmail = (String) session.getAttribute("User");
        String guest = (String) request.getParameter("guest");

        Warenkorb shoppingCart = ShoppingCart.getShoppingCart(userEmail);

        String from = NumberHelper.dateParser((String) request.getParameter("from"));
        String till = NumberHelper.dateParser((String) request.getParameter("till"));

        String msg = null;
        String orderNumber = Orders.createOrder(from, till, shoppingCart, userEmail, guest);
        if (orderNumber != null) {
            if (ShoppingCart.clearShoppingCart(userEmail)) {
                session.setAttribute("rent", null);
                request.setAttribute("shoppingCart", null);
                msg = "success";

                StringBuilder mailtext = new StringBuilder();
                mailtext.append("Sie haben folgende Bestellung aufgegeben:\r\n");
                mailtext.append("Bestellnummer: ");
                mailtext.append(orderNumber);
                mailtext.append("\r\n");
                mailtext.append("\r\n");

                mailtext.append("Produkte:");
                mailtext.append("\r\n");
                for (Produkt p : shoppingCart.getProdukte()) {
                    mailtext.append(p.getBezeichnung());
                    mailtext.append("\r\n");
                }

                mailtext.append("\r\n");

                mailtext.append("Pakete:");
                mailtext.append("\r\n");
                for (Paket p : shoppingCart.getPakete()) {
                    mailtext.append(p.getBezeichnung());
                    mailtext.append("\r\n");
                }
                mailtext.append("\r\n");
                mailtext.append("Sie erhalten eine weitere Mail, sobald Ihre Bestellung durch unsere Sachbearbeiter geprüft wurde.");

                if (userEmail == null) {
                    if (guest != null) {
                        String[] g = guest.split(",", -1);
                        String email = g[0];
                        new Mailer().sendMail(email, mailtext.toString());
                    }
                }
                else{
                    new Mailer().sendMail(userEmail, mailtext.toString());
                }
            }
        } else {
            msg = "failure";
        }

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(msg);
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
