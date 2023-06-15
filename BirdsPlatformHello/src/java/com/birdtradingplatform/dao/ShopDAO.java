/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.dao;

import com.birdtradingplatform.model.Account;
import com.birdtradingplatform.model.Shop;
import com.birdtradingplatform.utils.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Minh Quan
 */
public class ShopDAO {

    public Shop getShopInforByShopID(Account shops) throws ClassNotFoundException, SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stm = null;
        Shop result = null;
        try {
            con = DBHelper.makeConnection();
            String sql = "SELECT [shopID],[shopName],[avatar],[rate],[contact],shop.accountID,[addressID] FROM shop,Account "
                    + "WHERE shop.accountID like ? and shop.accountID = Account.accountID";
            stm = con.prepareStatement(sql);
            stm.setInt(1, shops.getAccountID());
            rs = stm.executeQuery();

            while (rs.next()) {
                int shopId = rs.getInt("shopID");
                String shopName = rs.getString("shopName");
                String avatar = rs.getString("avatar");
                double rate = rs.getDouble("rate");
                int accountID = rs.getInt("accountID");
                int addressID = rs.getInt("addressID");

                result = new Shop(shopId, shopName, avatar, rate, null, accountID, addressID);
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
        return result;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        AccountDAO accountDAO = new AccountDAO();
        Account acc1 = accountDAO.getAccountByUsername("bird");
        ShopDAO shopDAO = new ShopDAO();
        Shop s = shopDAO.getShopInforByShopID(acc1);
        System.out.println(s);
    }
}
