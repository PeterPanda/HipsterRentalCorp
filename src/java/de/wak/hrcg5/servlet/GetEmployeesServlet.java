/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package de.wak.hrcg5.servlet;

import de.wak.hrcg5.database.User;
import de.wak.hrcg5.structure.Mitarbeiter;
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
 * @author janFk
 */
@WebServlet(name = "GetEmployeesServlet", urlPatterns = {"/GetEmployeesServlet"})
public class GetEmployeesServlet extends HttpServlet {

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
            out.println("<title>Servlet GetEmployeesServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetEmployeesServlet at " + request.getContextPath() + "</h1>");
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

        StringBuilder sb = new StringBuilder();
        List<Mitarbeiter> employees = User.getEmployees();
        for (Mitarbeiter e : employees) {
            sb.append("<tr>");
            sb.append("<td >");
            sb.append(e.getMitarbeiterNR());
            sb.append("</td>");
            sb.append("<td class='cart_description'>");
            sb.append("<h4>");
            sb.append(e.getVorname());
            sb.append("</h4>");
            sb.append("</td>");
            sb.append("<td class='cart_description'>");
            sb.append("<h4>");
            sb.append(e.getNachname());
            sb.append("</h4>");
            sb.append("</td>");
            sb.append("<td class='cart_total'>");
            sb.append("<p class='cart_total_price'>");
            sb.append(e.getEmail());
            sb.append("</p>");
            sb.append("</td>");

            sb.append("<td class='cart_delete'>");
            sb.append("<form action='/HipsterRentalCorp/DeleteEmployeeServlet?employeeNumber=").append(e.getMitarbeiterNR()).append("' method='post'>");
            sb.append("<a class='cart_quantity_delete' onclick='this.parentNode.submit();' href='#'><i class='fa fa-times'></i></a>");
            sb.append("</form>");
            sb.append("</td>");

            sb.append("</tr>");
        }

        request.setAttribute("employees", sb.toString());
        getServletContext().getRequestDispatcher("/DeleteEmployee.jsp").forward(request, response);
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
