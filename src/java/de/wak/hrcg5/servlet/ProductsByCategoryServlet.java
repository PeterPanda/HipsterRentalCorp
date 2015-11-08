/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.servlet;

import de.wak.hrcg5.database.Packages;
import de.wak.hrcg5.database.Products;
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
        if (categoryNumber != null && !categoryNumber.equals("") && !categoryNumber.equals("null")) {
            /* Get all Products assigned to the categorynumber */
            products = Products.getProductsByCategory(categoryNumber);
            StringBuilder data = new StringBuilder();
            data.append("<div>\n");

            /* Visualize the products */
            if (products != null && products.size() > 0) {
                data.append("<div>\n");
                for (Produkt p : products) {
                    if (p != null) {
                        if (p.verfuegbar()) {
                            data.append("<div class='col-sm-4'>");
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
                            data.append("</div>");
                        }
                    }
                }
                data.append("</div>");
            }
            packages = Packages.getPackagesByCategory(categoryNumber);
            if (packages != null && packages.size() > 0) {
                data.append("<div>\n");
                for (Paket p : packages) {
                    if (p != null) {
                        if (!data.toString().contains(p.getPaketNR())) {
                            data.append("<div class='col-sm-4'>");
                            data.append("<div class='product-image-wrapper'>");
                            data.append("<div class='single-products'>");
                            data.append("<div class='productinfo text-center'>");
                            data.append("<form action='/HipsterRentalCorp/LoadPackageServlet?packageNumber=").append(p.getPaketNR()).append("' method='post'>");
                            data.append("<div onclick='this.parentNode.submit();'>");
                            data.append("<img src='").append((p.getFoto() != null) ? p.getFoto() : "images/home/logo.png").append("' max-height='150px' alt='' />");
                            data.append(" <h2>").append(p.getMietzins()).append("€</h2>");
                            data.append("<p>").append(p.getBezeichnung()).append("</p>");
                            data.append("</div>");
                            data.append("</form>");
                            data.append("<form action='/HipsterRentalCorp/AddPackageToShoppingCartServlet?packageNumber=").append(p.getPaketNR()).append("' method='post'>");
                            data.append("<button type='submit' class='btn btn-default add-to-cart'><i class='fa fa-shopping-cart'></i>Zum Warenkorb hinzuf&uuml;gen</button>");
                            data.append("</form>");
                            data.append("</div>");
                            data.append("</div>");
                            data.append("</div>");
                            data.append("</div>");
                        }
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
