/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.dao;

import com.birdtradingplatform.model.Customer;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.naming.NamingException;
import com.birdtradingplatform.utils.DBHelper;

/**
 *
 * @author Admin
 */
public class CustomerDAO implements Serializable{
    
    public Boolean Insert_new_into_Customer(Customer dto )
            throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        Boolean result = false;
        Boolean sucess = false;
        try {
            //1. connect BD
            con = DBHelper.makeConnection();
            //2. write sql 
            if (con != null) {
                String sql = "insert into Customer(phoneNumber,point,accountID) " +
                                "values (?,0,?);";
                //3. create stm
                stm = con.prepareStatement(sql);
                stm.setString(1, dto.getPhonenumber());
                stm.setInt(2, dto.getAccountID());
                //4.excute stm
                int row  = stm.executeUpdate();
                //5.process result 
                if (row > 0) {
                    sucess =true;
                }
            } else {

            }

        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return sucess;
    }
    
    public Boolean UpdatePhoneNumber(int accountID, String PhoneNumber)
            throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        Boolean result = false;
        try {
            //1. connect BD
            con = DBHelper.makeConnection();
            //2. write sql 
            if (con != null) {
                String sql = "update Customer set phoneNumber = ? "
                        + " where accountID = ? ";
                //3. create stm
                stm = con.prepareStatement(sql);
                stm.setString(1, PhoneNumber);
                stm.setInt(2, accountID);

                //4.excute stm
                int row = stm.executeUpdate();
                //5.process result 
                if (row != 0) {
                    result = true;
                }
            } else {

            }

        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return result;
    }
    
    
}
