/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.servlet;

import de.wak.hrcg5.database.Categories;
import de.wak.hrcg5.database.Packages;
import de.wak.hrcg5.database.Products;
import de.wak.hrcg5.structure.Kategorie;
import de.wak.hrcg5.structure.Paket;
import de.wak.hrcg5.structure.Produkt;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jan
 */
@WebServlet(name = "ProductsByCategoryServlet", urlPatterns = {"/ProductsByCategoryServlet"})
public class ProductsByCategoryServlet extends HttpServlet {

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
            out.println("<title>Servlet ProductsByCategoryServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductsByCategoryServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Gets the Products within the parameter-specified product-category.
     * Returns values as html. Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String categoryNumber;
        List<Produkt> products;
        List<Paket> packages;

        /* Get the categoryNumber from request sender */
        categoryNumber = request.getParameter("categoryNumber");
        if (categoryNumber != null) {
            /* Get all Products assigned to the categorynumber */
            products = Products.getProductsByCategory(categoryNumber);
            StringBuilder data = new StringBuilder();
            data.append("<div>\n");

            /* Visualize the products */
            if (products != null) {
                data.append("<div>\n");
                for (Produkt p : products) {
                    data.append("<div class='col-sm-4'>");
                    data.append("<div class='product-image-wrapper'>");
                    data.append("<div class='single-products'>");
                    data.append("<div class='productinfo text-center'>");
                    data.append("<form action='/HipsterRentalCorp/LoadProductServlet?productNumber=" + p.getProduktNR() + "' method='post'>");
                    data.append("<div onclick='document.forms[0].submit();'>");
                    data.append("<img src='" + p.getFotos().get(0) + "' height='150px' alt='' />");
                    data.append(" <h2>" + p.getMietzins() + "€</h2>");
                    data.append("<p>" + p.getBezeichnung() + "</p>");
                    data.append("</div>");
                    data.append("</form>");
                    data.append("<a href='#' class='btn btn-default add-to-cart'><i class='fa fa-shopping-cart'></i>Zum Warenkorb hinzuf&uuml;gen</a>");
                    data.append("</div>");
                    data.append("</div>");
                    data.append("</div>");
                    data.append("</div>");
                    /*
                    data.append("<button type='button' value='");
                    data.append(p.getProduktNR());
                    data.append("' name='");
                    data.append(p.getBezeichnung());
                    data.append("' onclick='loadProduct(this.value);'>");
                    data.append(p.getBezeichnung());
                    data.append("</button>\n");
                     */
                }
                data.append("</div>");
            }
            packages = Packages.getPackagesByCategory(categoryNumber);
            if (packages != null) {
                data.append("<div>\n");
                for (Paket p : packages) {
                    if (!data.toString().contains(p.getPaketNR())) {
                        data.append("<div class='col-sm-4'>");
                        data.append("<div class='product-image-wrapper'>");
                        data.append("<div class='single-products'>");
                        data.append("<div class='productinfo text-center'>");
                        data.append("<form action='/HipsterRentalCorp/LoadPackageServlet?productNumber=" + p.getPaketNR() + "' method='post'>");
                        data.append("<div onclick='document.forms[0].submit();'>");
                        data.append("<img src='" + p.getFoto() + "' max-height='150px' alt='' />");
                        data.append(" <h2>" + p.getMietzins() + "€</h2>");
                        data.append("<p>" + p.getBezeichnung() + "</p>");
                        data.append("</div>");
                        data.append("</form>");
                        data.append("<a href='#' class='btn btn-default add-to-cart'><i class='fa fa-shopping-cart'></i>Zum Warenkorb hinzuf&uuml;gen</a>");
                        data.append("</div>");
                        data.append("</div>");
                        data.append("</div>");
                        data.append("</div>");
                        /*
                    data.append("<button type='button' value='");
                    data.append(p.getPaketNR());
                    data.append("' name='");
                    data.append(p.getBezeichnung());
                    data.append("' onclick='loadPackage(this.value);'>");
                    data.append(p.getBezeichnung());
                    data.append("</button>\n");
                         */
                    }
                }
                data.append("</div>");
            }
            data.append("</div>");

            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(data.toString());
        }

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
