/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import products.ProductDAO;
import products.ProductDTO;
import shopping.Cart;


@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {

    private static final String SUCCESS = "SearchProductName";
    private static final String ERROR = "HomeControl";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int productID = Integer.parseInt(request.getParameter("productID"));
            String productName = request.getParameter("productName");
            String productImage = request.getParameter("productImage");
            double productPrice = Double.parseDouble(request.getParameter("productPrice"));
            int quantityPurchased = Integer.parseInt(request.getParameter("quantityPurchased"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            HttpSession session = request.getSession();
            ProductDAO dao = new ProductDAO();
            boolean check = quantityPurchased <= quantity;
            if (check) {
                ProductDTO product = new ProductDTO(productID,productName, productPrice, productImage, quantityPurchased);
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart == null) {
                    cart = new Cart();
                    cart.add(product);
                    session.setAttribute("CART", cart);
                    String messageSuccess = "Add To Cart Successfully!!";
                    request.setAttribute("SHOPPING_MESSAGE", messageSuccess);
                    url = SUCCESS;
                } else {
                    int cartQuantity = cart.getQuantityProductInCart(productID);
                    int inventory = dao.getProductQuantity(productID);
                    boolean checkCart = (cartQuantity + quantityPurchased) <= inventory;
                    if (checkCart) {
                        cart.add(product);
                        session.setAttribute("CART", cart);
                        String messageSuccess = "Add To Cart Successfully!!";
                        request.setAttribute("SHOPPING_MESSAGE", messageSuccess);
                        url = SUCCESS;
                    } else {
                        String messageError = "Over quantity product";
                        request.setAttribute("ERROR_SHOPPING_MESSAGE", messageError);
                    }
                }

            } else {
                String messageError = "Over quantity product";
                request.setAttribute("ERROR_SHOPPING_MESSAGE", messageError);
            }
        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
