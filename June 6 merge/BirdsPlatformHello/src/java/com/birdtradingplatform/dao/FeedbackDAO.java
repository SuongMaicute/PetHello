/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.dao;

import com.birdtradingplatform.model.Feedback;
import com.birdtradingplatform.model.FeedbackDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.birdtradingplatform.utils.DBHelper;

/**
 *
 * @author leyen
 */
public class FeedbackDAO {

     public List<FeedbackDetail> getFeedbackDetail(int productID) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<FeedbackDetail> list = new ArrayList<>();
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select * from [Feedback] "
                        + " left join [Account] "
                        + " on [Feedback].accID=[Account].accountID"
                        + " where productID = ?";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, productID);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    list.add(new FeedbackDetail(rs.getString("username"),
                            "",
                            rs.getString("avatar"),
                            rs.getInt("feedbackID"),
                            rs.getString("img"),
                            rs.getInt("star"),
                            rs.getString("detail"),
                            rs.getInt("productID"),
                            rs.getInt("accID"),
                            rs.getString("publishedDate")));
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

    public List<FeedbackDetail> getFeedbackListStaff(int entry, int page, String sortCol, String trend, int shopID) throws SQLException {
        List<FeedbackDetail> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select * from [Feedback] "
                        + "left join [Product] "
                        + "on [Feedback].productID=[Product].productID "
                        + "left join [Account] "
                        + "on [Feedback].accID=[Account].accountID "
                        + "where shopID = ? "
                        + "order by " + sortCol + " " + trend
                        + " offset " + (page - 1) * entry + " rows "
                        + "fetch next ? rows only";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, shopID);
                pstm.setInt(2, entry);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    list.add(new FeedbackDetail(rs.getString("username"),
                            rs.getString("productName"),
                            rs.getInt("feedbackID"),
                            rs.getString("img"),
                            rs.getInt("star"),
                            rs.getString("detail"),
                            rs.getInt("productID"),
                            rs.getInt("accID"),
                            rs.getString("publishedDate")));
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

    public int getTotalFeedbackOfShop(int shopID) throws SQLException {
        int total = 0;
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select count(*) as total"
                        + "from [Feedback] "
                        + "left join [Product] "
                        + "on [Feedback].productID=[Product].productID "
                        + "where shopID = ?";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, shopID);

                rs = pstm.executeQuery();
                if (rs.next()) {
                    total = rs.getInt("total");
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
        return total;

    }

    
    
}
