package shopping;

import java.util.HashMap;
import java.util.Map;
import products.ProductDTO;


public class Cart {

    private Map<Integer, products.ProductDTO> cart;

    public Cart() {
    }

    public Cart(Map<Integer, ProductDTO> cart) {
        this.cart = cart;
    }

    public Map<Integer, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<Integer, ProductDTO> cart) {
        this.cart = cart;
    }

    public boolean add(ProductDTO product) {
        boolean check = false;
        try {
            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
            if (cart.containsKey(product.getMA_SP())) {
                int currentQuantity = cart.get(product.getMA_SP()).getQuantityPurchased();
                product.setQuantityPurchased(currentQuantity + product.getQuantityPurchased());
            }
            this.cart.put(product.getMA_SP(), product);
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean delete(int productID) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(productID)) {
                    this.cart.remove(productID);
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return check;
    }

    public boolean update(int productID, ProductDTO newProduct) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(productID)) {
                    this.cart.replace(productID, newProduct);
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return check;
    }

    public int getQuantityProductInCart(int productID) {
        int quantity = 0;
        if (this.cart.containsKey(productID)) {
            quantity = this.cart.get(productID).getQuantityPurchased();
        }
        return quantity;
    }
}
