/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package checkout;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;


public class OrderDAO {
    private static final String CREATE_ORDER = "INSERT INTO HOADON(TONGTIEN,EMAIL,TINHTRANG) "
            + "VALUES (?,?,?)";
    private static final String CREATE_DETAIL_ORDER = "INSERT INTO CT_HOADON(GIA, SOLUONG, MA_HD, MA_SP,TINHTRANG) "
            + "VALUES (?,?,?,?,?)";
    private static final String GET_ALL_ORDER = "SELECT * FROM HOADON WHERE TINHTRANG = 1";
    public static final String DELETE = "UPDATE HOADON SET TINHTRANG=0 WHERE MA_HD= ?";
    public OrderDTO createOrder(OrderDTO order) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int orderID = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_ORDER, Statement.RETURN_GENERATED_KEYS);
                ptm.setDouble(1, order.getTotalOrder());
                ptm.setString(2, order.getEmailOrder());
                ptm.setBoolean(3, true);
                if (ptm.executeUpdate() > 0) {
                    rs = ptm.getGeneratedKeys();
                    if (rs.next()) {
                        orderID = rs.getInt(1);
                    }
                    if (createOrderDetail(order.getOrders(), orderID) != null) {
                        return order;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return null;
    }

    public List<OrderDetailDTO> createOrderDetail(List<OrderDetailDTO> orderD, int orderID) throws SQLException {
        int effectedRow = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_DETAIL_ORDER);
                OrderDetailDTO order;
                for (int i = 0; i < orderD.size(); i++) {
                    order = orderD.get(i);
                    ptm.setDouble(1, order.getPriceProduct());
                    ptm.setInt(2, order.getQuantity());
                    ptm.setInt(3, orderID);
                    ptm.setInt(4, order.getProductID());
                    ptm.setBoolean(5, true);
                    if (ptm.executeUpdate() > 0) {
                        effectedRow++;
                    }
                }
                if (effectedRow == orderD.size()) {
                    return orderD;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return null;
    }

    public List<OrderDTO> getAllProduct() throws SQLException {
        List<OrderDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_ORDER);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("MA_HD");
                    String orderDate = rs.getString("NGAYMUA");
                    double totalOrder = rs.getDouble("TONGTIEN");
                    String email = rs.getString("EMAIL");
                    list.add(new OrderDTO(orderID, orderDate, totalOrder, email));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    public boolean deleteOrder(int productID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setInt(1, productID);
                int value = ptm.executeUpdate();
                result = value > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

}
