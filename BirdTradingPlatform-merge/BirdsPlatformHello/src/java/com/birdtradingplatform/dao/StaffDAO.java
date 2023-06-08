/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.dao;

import com.birdtradingplatform.model.Staff;
import com.birdtradingplatform.utils.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author leyen
 */
public class StaffDAO {
    public Staff getStaff(int accountID) throws SQLException{
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Staff staff = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select * Staff where accountID = ?";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, accountID);
                rs = pstm.executeQuery();
                if (rs.next()){
                    staff = new Staff(rs.getInt("shopID"), rs.getInt("accountID"));
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
       return staff;
    }
}
