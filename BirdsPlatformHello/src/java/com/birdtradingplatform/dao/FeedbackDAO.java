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
                        + " left join [Role] "
                        + " on [Role].roleName = [Account].role "
                        + " where productID = ?";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, productID);
                rs = pstm.executeQuery();
                while (rs.next()){
                    list.add(new FeedbackDetail(rs.getString("username"),
                            rs.getString("roleName"),
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
    
    
}
