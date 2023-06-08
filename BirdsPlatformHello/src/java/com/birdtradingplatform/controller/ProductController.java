/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.birdtradingplatform.controller;

import com.birdtradingplatform.dao.FeedbackDAO;
import com.birdtradingplatform.dao.ProductDAO;
import com.birdtradingplatform.model.Feedback;
import com.birdtradingplatform.model.FeedbackDetail;
import com.birdtradingplatform.model.Product;
import com.birdtradingplatform.model.ProductWithRate;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author leyen
 */
@WebServlet(name = "ProductController", urlPatterns = {"/product"})
public class ProductController extends HttpServlet {

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

        if ("detail".equals(action)) {
            String productID = request.getParameter("pid");

            ProductDAO dao = new ProductDAO();
            Product product = dao.getProduct(productID);

            if (product != null) {
                request.setAttribute("productdetail", product);
                request.setAttribute("action", "suggestedproduct");
                request.getRequestDispatcher("productdetail.jsp").forward(request, response);
            }
        } else if ("suggestedproduct".equals(action)) {

            String category = request.getParameter("category");
            ProductDAO dao = new ProductDAO();
            int suggestionProduct = 15;
            int productPerPage = 3;
            int numPage = 5;
            int curPage;
            try {
                curPage = Integer.parseInt(request.getParameter("curPage"));
            } catch (Exception e) {
                curPage = 1;
            }
            List<Product> suggestedProductList = dao.getSuggestion(category,
                    productPerPage, curPage);
            //List of suggested product
            request.setAttribute("suggestedlist", suggestedProductList);
            //total page
            request.setAttribute("totalpage", numPage);
            //current page
            request.setAttribute("currentpage", curPage);
            request.getRequestDispatcher("productdetail.jsp")
                    .forward(request, response);
        } else if ("feedback".equals(action)) {
            int productID;
            try {
                productID = Integer.parseInt(request.getParameter("productID"));
            } catch (NumberFormatException e) {
                productID = -1;
            }
            FeedbackDAO feedbackDAO = new FeedbackDAO();
            List<FeedbackDetail> list = feedbackDAO.getFeedbackDetail(productID);
            int totalfeedback = list.size();
            int fivestar = 0;
            int fourstar = 0;
            int threestar = 0;
            int twostar = 0;
            int onestar = 0;
            for (FeedbackDetail feedback : list) {
                switch (feedback.getStar()) {
                    case 5:
                        fivestar += 1;
                        break;
                    case 4:
                        fourstar += 1;
                        break;
                    case 3:
                        threestar += 1;
                        break;
                    case 2:
                        twostar += 1;
                        break;
                    case 1:
                        onestar += 1;
                        break;
                }
            }
            request.setAttribute("feedbacklist", list);
            request.setAttribute("totalfeedback", totalfeedback);
            request.setAttribute("fivestar", fivestar);
            request.setAttribute("fourstar", fourstar);
            request.setAttribute("threestar", threestar);
            request.setAttribute("twostar", twostar);
            request.setAttribute("onestar", onestar);
            request.getRequestDispatcher("feedback.jsp")
                    .forward(request, response);

        } else if ("pagingshopproductlist".equals(action)) {
            ProductDAO dao = new ProductDAO();
            String search = request.getParameter("search");
            String colSort = request.getParameter("colSort");
            String sortType = request.getParameter("sortType");
            String category = request.getParameter("category");
            if (colSort == null) {
                colSort = "star";
            }
            if (search == null) {
                search = "";
            }
            if (sortType == null) {
                sortType = "";
            }
           
            int totalProduct = dao.getProductCount(search);
            int productPerPage = 16;
            int numPage = (int)Math.ceil((double)totalProduct/(double)productPerPage);
            int curPage;
            try {
                curPage = Integer.parseInt(request.getParameter("curPage"));
            } catch (Exception e) {
                curPage = 1;
            }
            List<ProductWithRate> shopProductList = dao.getShopProductListByPage(search, 
                    productPerPage, curPage, colSort, category, sortType);
            //List of suggested product
            request.setAttribute("shopProductList", shopProductList);
            //total page
            request.setAttribute("totalpage", numPage);
            //current page
            request.setAttribute("currentpage", curPage);
            request.getRequestDispatcher("productdetail.jsp")
                    .forward(request, response);
            
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
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
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
