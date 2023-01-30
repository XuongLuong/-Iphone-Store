package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import users.UserDAO;
import users.UserDTO;
import users.UserError;


@WebServlet(urlPatterns = {"/SignUpController"})
public class SignUpController extends HttpServlet {

    
    private static final String ERROR = "DangKy.jsp";
    private static final String SUCCESS = "DangNhap.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        try {
            String fullName = request.getParameter("name");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirmPassword");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String birthday = request.getParameter("birthday");
            boolean check = true;
            if (fullName.length() > 50 || fullName.length() < 5) {
                userError.setNameError("Full Name length must be [5,50]");
                check = false;
            }
            if (!password.equals(confirm)) {
                userError.setConfirmPasswordError("Password not same");
                check = false;
            }
            if (address.length() > 50 || fullName.length() < 5) {
                userError.setAddressError("Address length must be [5,50]");
                check = false;
            }
            if (phone.length() != 10) {
                userError.setPhoneError("Phone length must be 10 number");
                check = false;
            }           
            if (check) {
                 UserDTO user = new UserDTO(email, fullName, 2, password, phone, address, birthday, true);
                 boolean checkCreate = new UserDAO().signUpUser(user);
                if (checkCreate) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            if (e.toString().contains("duplicate")) {
                userError.setEmailError("Email is duplicated!!!");
                request.setAttribute("USER_ERROR", userError);
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
