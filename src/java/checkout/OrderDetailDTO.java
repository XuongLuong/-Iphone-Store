/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package checkout;


public class OrderDetailDTO {

    private int detailID;
    private double priceProduct;
    private int quantity;
    private int orderID;
    private int productID;

    public OrderDetailDTO() {
    }

    public OrderDetailDTO(int detailID, double priceProduct, int quantity, int orderID, int productID) {
        this.detailID = detailID;
        this.priceProduct = priceProduct;
        this.quantity = quantity;
        this.orderID = orderID;
        this.productID = productID;
    }

    public OrderDetailDTO(double priceProduct, int quantity, int orderID, int productID) {
        this.priceProduct = priceProduct;
        this.quantity = quantity;
        this.orderID = orderID;
        this.productID = productID;
    }

    public int getDetailID() {
        return detailID;
    }

    public void setDetailID(int detailID) {
        this.detailID = detailID;
    }

    public double getPriceProduct() {
        return priceProduct;
    }

    public void setPriceProduct(double priceProduct) {
        this.priceProduct = priceProduct;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

}
