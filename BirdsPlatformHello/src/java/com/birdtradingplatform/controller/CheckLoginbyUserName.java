/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.controller;

import com.birdtradingplatform.dao.AccountDAO;
import com.birdtradingplatform.model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CheckLoginbyUserName", urlPatterns = {"/CheckLoginbyUserName"})
public class CheckLoginbyUserName extends HttpServlet {

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
            throws ServletException, IOException, NamingException {
        String url = "Login.jsp";
        Account dto = null;
        AccountDAO dao = new AccountDAO();
        PrintWriter out = response.getWriter();
        try {

            // use cookie to remember user 
            Cookie[] cookie = null;
            cookie = request.getCookies();

            if (cookie != null) {
                //2. get last cookies
                Cookie lastCookie = cookie[cookie.length - 1];
                String usernameC = lastCookie.getName();
                String passwordC = lastCookie.getValue();
                //3.Call model
                Account result = dao.CheckLoginbyUserName(usernameC, passwordC);
            }
            String rememberMe = request.getParameter("item");
            String username = request.getParameter("username");
            String password = request.getParameter("pass");

            //login by username and 
            dto = dao.CheckLoginbyUserName(username, password);

            HttpSession session = request.getSession();

            if (dto != null) {
                System.out.println(" result != null ");
                url = "HomePage.jsp";
                session.setAttribute("USERDTOBYUSERNAME", dto);
                // System.out.println("Check by Username IMg ne" + dto.getImg());

                /* if (dto.getRole().getRoleName().equalsIgnoreCase("admin")) {
                    url = "HomePage.jsp";
                    // HomePage controller for system admin nhe
                }else  if (dto.getRole().getRoleName().equalsIgnoreCase("sdmin")) {
                    url = "HomePage.jsp";
                    // HomePage controller for Shop nhe
                
                } else{
                // Cusstomer ne 
                }*/
                if (rememberMe != null) {
                    System.out.println(" Save ne ");
                    System.out.println(" username :" + username);
                    System.out.println(" pass :" + password);
                    Cookie save = new Cookie(username, password);
                    // save.setMaxAge(60*10);
                    response.addCookie(save);
                }

            } else {
                url = "Login.jsp";
                request.setAttribute("validAcc", "false");
            }

        } catch (ClassNotFoundException ex) {
            log("LoginServlet " + ex.getMessage());
        } catch (SQLException ex) {
            log("LoginServlet " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
        } catch (NamingException ex) {
            Logger.getLogger(CheckLoginbyUserName.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (NamingException ex) {
            Logger.getLogger(CheckLoginbyUserName.class.getName()).log(Level.SEVERE, null, ex);
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
