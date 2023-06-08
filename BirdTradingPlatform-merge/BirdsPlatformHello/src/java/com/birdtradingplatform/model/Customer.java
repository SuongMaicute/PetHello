/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.model;

/**
 *
 * @author Admin
 */
public class Customer {
    
    private int customerID;
    private String Phonenumber;
    private int point;
    private int accountID;

    public Customer(int customerID, String Phonenumber, int point, int accountID) {
        this.customerID = customerID;
        this.Phonenumber = Phonenumber;
        this.point = point;
        this.accountID = accountID;
    }

    public Customer() {
    }

    public int getCustomerID() {
        return customerID;
    }

    public String getPhonenumber() {
        return Phonenumber;
    }

    public int getPoint() {
        return point;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public void setPhonenumber(String Phonenumber) {
        this.Phonenumber = Phonenumber;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }
    
    
    
    
}
