/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.model;

/**
 *
 * @author leyen
 */
public class FeedbackDetail extends Feedback{
    private String username;
    private String role;
    private String avatar;

    public FeedbackDetail() {
    }

    public FeedbackDetail(String username, String role, String avatar, int feedbackID, String img, int star, String detail, int productID, int accID, String publishedDate) {
        super(feedbackID, img, star, detail, productID, accID, publishedDate);
        this.username = username;
        this.role = role;
        this.avatar = avatar;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

   
    
}
