/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.controller;

import com.birdtradingplatform.dao.CustomerDAO;
import com.birdtradingplatform.dao.ProductDAO;
import com.birdtradingplatform.model.Account;
import com.birdtradingplatform.model.AddressShipment;
import com.birdtradingplatform.model.Cart;
import com.birdtradingplatform.model.Item;
import com.birdtradingplatform.model.MutilShopCart;
import com.birdtradingplatform.model.Product;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author leyen
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/checkout"})
public class CheckOutController extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if ("Check-out".equals(action)) {
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");

//            if (account == null) {
//                request.getRequestDispatcher("Login.jsp").include(request, response);
//            }
//            if (account != null) {
//                CustomerDAO cusDAO = new CustomerDAO();
//                AddressShipment addressShipment = cusDAO.getAddressShip(account.getAccountID());
//                //deliveryto
//                request.setAttribute("addressShipment", addressShipment);
//            }
            String checkoutList[] = request.getParameterValues("checkoutlist");
            if (checkoutList != null) {
                MutilShopCart checkoutMap = new MutilShopCart();
                for (String value : checkoutList) {
                    int productID = Integer.parseInt(value);
                    ProductDAO dao = new ProductDAO();
                    Product product = dao.getProduct(productID + "");
                    MutilShopCart allShopCart = (MutilShopCart) session.getAttribute("allShopCart");
                    for (Map.Entry<Integer, Cart> en : allShopCart.getMutilShopCart().entrySet()) {
                        int key = en.getKey();
                        Cart shopcart = en.getValue();
                        for (Map.Entry<Integer, Item> entry : shopcart.getCart().entrySet()) {
                            int key1 = entry.getKey();
                            Item item = entry.getValue();
                            if (item.getProduct().getProductID() == productID) {
                                checkoutMap.addMutilShop(item);
                            }
                        }

                    }

                }

                session.setAttribute("checkoutMap", checkoutMap);
                session.setAttribute("totalpriceCheckout", checkoutMap.getTotalMoneyAllShop());
                session.setAttribute("totalquantityCheckout", checkoutMap.getTotalCountAllShop());

                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            } //else {
//                response.sendRedirect("err.html");
//            }

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
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(CheckOutController.class
                    .getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(CheckOutController.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
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
