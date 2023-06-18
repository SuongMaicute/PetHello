/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.dao;

import com.birdtradingplatform.model.Cart;
import com.birdtradingplatform.model.Item;
import com.birdtradingplatform.model.MutilShopCart;
import com.birdtradingplatform.model.Order;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.birdtradingplatform.model.OrderHistory;
import com.birdtradingplatform.model.Shop;
import com.birdtradingplatform.utils.DBHelper;
import java.util.Map;

/**
 *
 * @author Minh Quan
 */
public class OrderDAO {

    private List<Order> ordersList;

    public List<Order> getOrderList() {
        return ordersList;
    }

    public void addOrder(int customerID, MutilShopCart order, int addressShipID) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                for (Map.Entry<Integer, Cart> en : order.getMutilShopCart().entrySet()) {
                    String sql = "insert into [Order](customerID, addressShipID, shopID,total) values(?,?,?,?)";
                    pstm = con.prepareStatement(sql);

                    Integer shopID = en.getKey();
                    Cart shopcart = en.getValue();
                    pstm.setInt(1, customerID);
                    pstm.setInt(2, addressShipID);
                    pstm.setInt(3, shopID);
                    pstm.setDouble(4, shopcart.getTotalMoney());
                    pstm.executeUpdate();
                    //addOrderDetail
                    String sqlOrderID = "select top 1 orderID from [Order] "
                            + " order by orderID desc";
                    pstm = con.prepareStatement(sqlOrderID);
                    rs = pstm.executeQuery();
                    if (rs.next()) {
                        int orderID = rs.getInt("orderID");
                        for (Map.Entry<Integer, Item> entry : shopcart.getCart().entrySet()) {
                            int productID = entry.getKey();
                            Item item = entry.getValue();
                            String sqlOrderDetail = "insert into [OrderDetail](orderID, productID, price, quantity) values (?, ?, ?, ?)";
                            PreparedStatement pstm2 = con.prepareStatement(sqlOrderDetail);
                            pstm2.setInt(1, orderID);
                            pstm2.setInt(2, productID);
                            pstm2.setDouble(3, item.getProduct().getPriceOut());
                            pstm2.setInt(4, item.getQuantity());
                            pstm2.executeUpdate();
                        }

                    }
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
    }

    public int updateOrder(Order order) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE [BirdPlatform].[dbo].[Order] SET status = ?"
                        + " WHERE orderID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, order.getStatus());
                stm.setInt(2, order.getOrderID());
                result = stm.executeUpdate();
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

                        result = new Order(orderID, status, total, paymentID, customerID, addressShipID, status, status);
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
            if (con != null) {
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
                if (status != null && !status.isEmpty()) {
                    sql += "where status = '" + status + "'";
                }
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, accountID);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    list.add(new OrderHistory(rs.getInt("totalQuantity"),
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

    public ArrayList<Order> getOrderByShopID(Shop shop) throws ClassNotFoundException, SQLException {
        ArrayList<Order> orders = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Order result = null;
        con = DBHelper.makeConnection();

        if (con != null) {
            try {
                String sql = "SELECT * FROM [BirdPlatform].[dbo].[Order] WHERE shopID = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, shop.getShopID());
                rs = stm.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    String orderDate = rs.getString("orderDate");
                    double total = rs.getDouble("total");
                    int paymentID = rs.getInt("paymentID");
                    int customerID = rs.getInt("customerID");
                    int addressShipID = rs.getInt("addressShipID");
                    String shipDate = rs.getString("shipDate");
                    String status = rs.getString("status");
                    result = new Order(orderID, orderDate, total, paymentID, customerID, addressShipID, shipDate, status);
                    orders.add(result);
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
        return orders;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        OrderDAO dao = new OrderDAO();
        dao.getOrders();
        List<Order> ordersDTOs = dao.getOrderList();
        System.out.println(ordersDTOs.size());
    }
}
