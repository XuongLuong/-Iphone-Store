
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import products.ProductDAO;
import products.ProductDTO;
import products.ProductError;


@WebServlet(name = "InsertProductController", urlPatterns = {"/InsertProductController"})
public class InsertProductController extends HttpServlet {

    private static final String ERROR = "insertProduct.jsp";
    private static final String SUCCESS = "GetAllProductController?search=";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        ProductError productError = new ProductError();
        try {
            String productName = request.getParameter("productName");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int categoryID = Integer.parseInt(request.getParameter("categoryID"));
            String image = request.getParameter("image");
            boolean check = true;
            if (productName.length() > 50 || productName.length() < 5) {
                productError.setProductNameError("Product name length must be [5,50]");
                check = false;
            }
            if (check) {
                ProductDAO dao = new ProductDAO();
                ProductDTO product = new ProductDTO(0, productName, price, quantity, "", image, 0, categoryID);
                boolean checkInsertProduct = dao.insertProduct(product);
                if (checkInsertProduct) {
                    url = SUCCESS;
                } else {
                    productError.setMessageError("Can not insert,unknow error!");
                    request.setAttribute("PRODUCT_ERROR", productError);
                }
            } else {
                request.setAttribute("PRODUCT_ERROR", productError);
            }
        } catch (Exception e) {
              if (e.toString().contains("duplicate")) {
                productError.setProductIdError("Product ID is duplicated!!!");
                request.setAttribute("PRODUCT_ERROR", productError);
            }
            log("Error at CreateController:" + e.toString());
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
