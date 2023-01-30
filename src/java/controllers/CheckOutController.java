/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import checkout.OrderDAO;
import checkout.OrderDTO;
import checkout.OrderDetailDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import products.ProductDAO;
import products.ProductDTO;
import shopping.Cart;
import users.UserDAO;
import users.UserDTO;


@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    public static final String ERROR = "checkout.jsp";
    public static final String SUCCESS = "HomeControl";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String birthday = request.getParameter("birthday");
            String phone = request.getParameter("phone");
            UserDAO userDAO = new UserDAO();
            boolean checkEmail = userDAO.checkDuplicate(email);
            if (checkEmail) {
                OrderDAO orderDao = new OrderDAO();
                HttpSession session = request.getSession();
                if (session != null) {
                    Cart cart = (Cart) session.getAttribute("CART");
                    double totalOrderPrice = 0;
                    List<OrderDetailDTO> orderDetails = new ArrayList<>();
                    ProductDAO productDao = new ProductDAO();
                    OrderDTO order = order = new OrderDTO(0, "", totalOrderPrice, email, orderDetails);
                    if (cart != null) {
                        Map<Integer, ProductDTO> product = cart.getCart();
                        if (!product.isEmpty()) {
                            for (ProductDTO pro : product.values()) {
                                totalOrderPrice += (pro.getGIABAN()* pro.getQuantityPurchased());
                                orderDetails.add(new OrderDetailDTO(0, pro.getGIABAN(), pro.getQuantityPurchased(), order.getOrderID(), pro.getMA_SP()));
                                int inventory = productDao.getProductQuantity(pro.getMA_SP());
                                boolean check = productDao.updateProductQuantity(pro.getMA_SP(), (inventory - pro.getQuantityPurchased()));
                                if (check == false) {
                                    break;
                                }
                            }
                            session.removeAttribute("CART");
                            order.setTotalOrder(totalOrderPrice);
                            order.setOrders(orderDetails);
                            orderDao.createOrder(order);
                            request.setAttribute("CHECKOUT_MESSAGE", "Checkout successfully!!!");
                            url = SUCCESS;
                        }
                    }
                }
            } else {
                UserDTO newUser = new UserDTO(email, name, 2, "123456", phone, address, birthday,true);
                boolean checkCreate = userDAO.signUpUser(newUser);
                if (checkCreate) {
                    OrderDAO orderDao = new OrderDAO();
                    HttpSession session = request.getSession();
                    if (session != null) {
                        Cart cart = (Cart) session.getAttribute("CART");
                        double totalOrderPrice = 0;
                        List<OrderDetailDTO> orderDetails = new ArrayList<>();
                        ProductDAO productDao = new ProductDAO();
                        OrderDTO order = order = new OrderDTO(0, "", totalOrderPrice, email, orderDetails);
                        if (cart != null) {
                            Map<Integer, ProductDTO> product = cart.getCart();
                            if (!product.isEmpty()) {
                                for (ProductDTO pro : product.values()) {
                                    totalOrderPrice += (pro.getGIABAN() * pro.getQuantityPurchased());
                                    orderDetails.add(new OrderDetailDTO(0, pro.getGIABAN(), pro.getQuantityPurchased(), order.getOrderID(), pro.getMA_SP()));
                                    int inventory = productDao.getProductQuantity(pro.getMA_SP());
                                    boolean check = productDao.updateProductQuantity(pro.getMA_SP(), (inventory - pro.getQuantityPurchased()));
                                    if (check == false) {
                                        break;
                                    }
                                }
                                session.removeAttribute("CART");
                                order.setTotalOrder(totalOrderPrice);
                                order.setOrders(orderDetails);
                                orderDao.createOrder(order);
                                request.setAttribute("CHECKOUT_MESSAGE", "Checkout successfully!!!");
                                url = SUCCESS;
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            log("Error at CheckoutController: " + e.toString());
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
