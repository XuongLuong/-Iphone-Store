/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package checkout;

import java.util.List;


public class OrderDTO {

    private int orderID;
    private String orderDate;
    private double totalOrder;
    private String emailOrder;
    private List<OrderDetailDTO> orders;
    
    public OrderDTO() {
        this.orderID = 0;
        this.orderDate = "";
        this.totalOrder = 0;
        this.emailOrder = "";
        this.orders = null;
    }

    public OrderDTO(int orderID, String orderDate, double totalOrder, String emailOrder, List<OrderDetailDTO> orders) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.totalOrder = totalOrder;
        this.emailOrder = emailOrder;
        this.orders = orders;
    }
    public OrderDTO(int orderID, String orderDate, double totalOrder, String emailOrder) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.totalOrder = totalOrder;
        this.emailOrder = emailOrder;
    }
     public OrderDTO( String orderDate, double totalOrder, String emailOrder, List<OrderDetailDTO> orders) {
        this.orderDate = orderDate;
        this.totalOrder = totalOrder;
        this.emailOrder = emailOrder;
        this.orders = orders;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalOrder() {
        return totalOrder;
    }

    public void setTotalOrder(double totalOrder) {
        this.totalOrder = totalOrder;
    }

    public String getEmailOrder() {
        return emailOrder;
    }

    public void setEmailOrder(String emailOrder) {
        this.emailOrder = emailOrder;
    }

    public List<OrderDetailDTO> getOrders() {
        return orders;
    }

    public void setOrders(List<OrderDetailDTO> orders) {
        this.orders = orders;
    }
}
