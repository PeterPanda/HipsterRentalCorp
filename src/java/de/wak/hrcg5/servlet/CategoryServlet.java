/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.servlet;

import de.wak.hrcg5.database.Categories;
import de.wak.hrcg5.database.User;
import de.wak.hrcg5.structure.Kategorie;
import de.wak.hrcg5.structure.Mitarbeiter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "categoryServlet", urlPatterns = {"/CategoryServlet"})
public class CategoryServlet extends HttpServlet {

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
            out.println("<title>Servlet CategoryServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoryServlet at " + request.getContextPath() + "</h1>");
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

        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("User");
        Mitarbeiter e = User.getEmployee(userEmail);
        if (e != null) {
            data.append("<div>");
            if (User.isAdmin(userEmail)) {
                data.append("<div class='panel panel-default'>");
                data.append("<div class='panel-heading'>");
                data.append("<h4 class='panel-title'><a href='AddEmployee.jsp'>Mitarbeiter anlegen</a></h4>");
                data.append("</div>");
                data.append("</div>");
            }
            data.append("<div class='panel panel-default'>");
            data.append("<div class='panel-heading'>");
            data.append("<h4 class='panel-title'><a href='EmployeeOrderView.jsp'>Bestellungen anzeigen</a></h4>");
            data.append("</div>");
            data.append("</div>");
            data.append("<div class='panel panel-default'>");
            data.append("<div class='panel-heading'>");
            data.append("<h4 class='panel-title'><a href='AddProduct.jsp'>Produkt anlegen</a></h4>");
            data.append("</div>");
            data.append("</div>");
            data.append("<div class='panel panel-default'>");
            data.append("<div class='panel-heading'>");
            data.append("<h4 class='panel-title'><a href='AddPackage.jsp'>Paket anlegen</a></h4>");
            data.append("</div>");
            data.append("</div>");
            data.append("</div>");
        } else {
            data.append("<div>\n");
            for (Kategorie c : filterCategories(Categories.getCategories())) {

                data.append("<div class='panel panel-default'>");
                if (c.getUnterkategorie().size() < 1) {
                    data.append("<div class='panel-heading'>");
                    data.append("<h4 class='panel-title'><a onclick='getProducts(\"");
                    data.append(c.getKategorieNR());
                    data.append("\")'>");
                    data.append(c.getName());
                    data.append("</a></h4>");
                    data.append("</div>");
                } else {
                    data.append("<div class='panel-heading'>");
                    data.append("<h4 class='panel-title'>");
                    data.append("<a data-toggle='collapse' data-parent='#accordian' href='#"+c.getName()+"' onclick='getProducts(\"");
                    data.append(c.getKategorieNR());
                    data.append("\")'>");
                    data.append("<span class='badge pull-right'><i class='fa fa-plus'></i></span>");
                    data.append(c.getName());
                    data.append("</a>");
                    data.append("</h4>");
                    data.append("</div>");
                    data.append("<div id='" + c.getName() + "' class='panel-collapse collapse'>");
                    data.append("<div class='panel-body'>");
                    data.append("<ul>");
                    for (String s : c.getUnterkategorie()) {
                        Kategorie k = Categories.getCategory(s);
                        data.append("<li><a href='#' onclick='getProducts(\"");
                        data.append(k.getKategorieNR());
                        data.append("\")'>");
                        data.append(k.getName());
                        data.append("</a></li>");
                    }
                    data.append("</ul>");
                    data.append("</div>");
                    data.append("</div>");

                }

                data.append("</div>");

            }
            data.append("</div>");
        }
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(data.toString());
    }

    /**
     * Filters the Categories => throws out double entries and subcategories.
     *
     * @param unsorted Unsorted category list out of database
     * @return Returns a beautiful list of categories.
     */
    private List<Kategorie> filterCategories(List<Kategorie> unsorted) {
        List<Kategorie> filtered = new ArrayList<>();
        String breaker = null;
        /* combine doubles */
        for (Kategorie c : unsorted) {
            if (!c.getKategorieNR().equals(breaker)) {
                for (Kategorie d : unsorted) {

                    if (!c.equals(d)) {
                        if (c.getKategorieNR().equals(d.getKategorieNR())) {
                            if (!filtered.contains(c)) {
                                c.getUnterkategorie().addAll(d.getUnterkategorie());
                                filtered.add(c);
                                breaker = c.getKategorieNR();
                            } else {
                                filtered.get(filtered.indexOf(c)).getUnterkategorie().addAll(d.getUnterkategorie());
                            }
                        }
                    }
                }
            }
        }
        /* Get the rest of the pack back. Filtered only
           knows what happened in the previous loop*/
        List<Kategorie> toAdd = new ArrayList<>();
        for (Kategorie c : unsorted) {
            for (Kategorie d : filtered) {
                if (!d.getKategorieNR().equals(c.getKategorieNR())) {
                    toAdd.add(c);
                }
            }
        }
        filtered.addAll(toAdd);
        
        /* Remove those doubles. We don't need them any more. */
        List<Kategorie> toRemove = new ArrayList<>();
        for (Kategorie c : filtered) {
            for (Kategorie d : filtered) {
                if (!c.equals(d)) {
                    if (c.getUnterkategorie().contains(d.getKategorieNR())) {
                        toRemove.add(d);
                    }
                }
            }
        }
        filtered.removeAll(toRemove);
        return filtered;
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
