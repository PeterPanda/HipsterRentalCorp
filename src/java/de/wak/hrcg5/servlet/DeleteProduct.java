/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.servlet;

import de.wak.hrcg5.database.Products;
import de.wak.hrcg5.structure.Produkt;
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
@WebServlet(name = "DeleteProduct", urlPatterns = {"/DeleteProduct"})
public class DeleteProduct extends HttpServlet {

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
            out.println("<title>Servlet DeleteProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteProduct at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String productNumber = request.getParameter("productNumber");
        Products.delete(productNumber);

        StringBuilder data = new StringBuilder();
        data.append("<div>");
        for (Produkt p : Products.getProducts()) {
            if (p != null) {
                data.append("<div class='col-sm-4'>");
                data.append("<div class='product-image-wrapper'>");
                data.append("<div class='single-products'>");
                data.append("<div class='productinfo text-center'>");

                data.append("<div>");
                data.append("<img src='").append((p.getFotos().size() > 0) ? p.getFotos().get(0) : "images/home/logo.png").append("' height='150px' alt='' />");
                data.append(" <h2>").append(p.getProduktNR()).append("</h2>");
                data.append("<p>").append(p.getBezeichnung()).append("</p>");
                data.append("</div>");
                data.append("<form action='/HipsterRentalCorp/DeleteProduct?productNumber=").append(p.getProduktNR()).append("' method='post'>");
                data.append("<button type='submit' class='btn btn-default'></i>Produkt l&ouml;schen</button>");
                data.append("</form>");
                data.append("</div>");
                data.append("</div>");
                data.append("</div>");
                data.append("</div>");
            }
        }
        data.append("</div>");
        request.setAttribute("products", data.toString());
        getServletContext().getRequestDispatcher("/DeleteProduct.jsp").forward(request, response);
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
