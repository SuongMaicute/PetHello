/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.dao;

import com.birdtradingplatform.model.Order;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.birdtradingplatform.model.OrderHistory;
import com.birdtradingplatform.utils.DBHelper;

/**
 *
 * @author Minh Quan
 */
public class OrderDAO {

    private List<Order> ordersList;

    public List<Order> getOrderList() {
        return ordersList;
    }

    public void getOrders() throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Order result = null;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                con = DBHelper.makeConnection();
                if (con != null) {
                    String sql = "SELECT * FROM [BirdPlatform].[dbo].[Order]";
                    stm = con.prepareStatement(sql);
                    rs = stm.executeQuery();

                    while (rs.next()) {
                        int orderID = rs.getInt("orderID");
                        Date orderDate = rs.getDate("orderDate");
                        float total = rs.getFloat("total");
                        int paymentID = rs.getInt("paymentID");
                        int customerID = rs.getInt("customerID");
                        int addressShipID = rs.getInt("addressShipID");
                        Date shipDate = rs.getDate("shipDate");
                        String status = rs.getString("status");

                        result = new  Order(orderID, status, total, paymentID, customerID, addressShipID, status, status);
                        if (this.ordersList == null) {
                            ordersList = new ArrayList<>();
                        }
                        this.ordersList.add(result);
                    }
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }

    }
 public List<OrderHistory> getOrderHistory(int accountID, String status) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<OrderHistory> list = new ArrayList<>();
        try {
            con = DBHelper.makeConnection();
            if(con!=null){
//                String sql = "select * from [Order] where "
//                        + "customerID = (select customerID "
//                        + "from [customer] left join [account] "
//                        + "on [customer].accountID=?)";
                  String sql = "select * from "
                          + "orderHistory(?) as oHis "
                          + "left join orderHistoryQuantity() as oQuan "
                          + "on oHis.orderID=oQuan.orderID "
                          + "left join orderHistoryFirstProduct() as stProNa "
                          + "on oHis.orderID=stProNa.orderID";
                  if(status!=null&& ! status.isEmpty()){
                      sql += "where status = '" + status +"'";
                  }
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, accountID);
                rs = pstm.executeQuery();
                while(rs.next()){
                    list.add(new OrderHistory( rs.getInt("totalQuantity"), 
                            rs.getString("firstProductName"), 
                            rs.getInt("orderID"),
                            rs.getString("orderDate"), 
                            rs.getDouble("total"),
                            rs.getInt("addressShipID"),
                            rs.getString("shipDate"),
                            rs.getString("status")));
                            
                            
                         
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        OrderDAO dao = new OrderDAO();
        dao.getOrders();
        List<Order> ordersDTOs = dao.getOrderList();
        System.out.println(ordersDTOs.size());
    }
}
