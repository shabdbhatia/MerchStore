/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.shopapp.model;

/**
 *
 * @author shabd
 */
import java.util.Date;
import java.util.List;

public class Order {
    private int id;
    private int userId;
    private Date orderDate;
    private double totalPrice;
    private List<OrderItem> items; // List of items in the order

    public Order(int id, int userId, Date orderDate, double totalPrice, List<OrderItem> items) {
        this.id = id;
        this.userId = userId;
        this.orderDate = orderDate;
        this.totalPrice = totalPrice;
        this.items = items;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
    }
}