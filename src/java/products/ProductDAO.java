//Load du lieu tu db len
package products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;


public class ProductDAO {

    public static final String GETALLCATEGORY = "  SELECT * FROM SANPHAM WHERE MA_DM = ? AND TINHTRANG = 1 AND SOLUONG > 0";
    public static final String GETALL = "  SELECT * FROM SANPHAM WHERE TINHTRANG = 1 AND SOLUONG > 0 ";
    public static final String SEARCH = "SELECT * FROM SANPHAM WHERE TEN_SP like ? AND TINHTRANG = 1 AND SOLUONG > 0";
    public static final String DELETE = "UPDATE SANPHAM SET TINHTRANG=0 WHERE MA_SP= ?";
    public static final String GET_PRODUCT_DETAIL = "SELECT * FROM SANPHAM WHERE TINHTRANG = 1 AND MA_SP=?";
    public static final String UPDATE = "UPDATE SANPHAM "
            + "SET TEN_SP= ?,GIABAN= ?,SOLUONG = ?,MA_DM = ?,NGAY_THEMSP = ?,HINHANH_SP = ? WHERE MA_SP = ?";
    public static final String INSERT = "INSERT INTO SANPHAM(TEN_SP,GIABAN,SOLUONG,HINHANH_SP,TINHTRANG,MA_DM) "
            + "VALUES(?,?,?,?,?,?)";
    public static final String GET_PRODUCT_QUANTITY = "SELECT SOLUONG FROM SANPHAM "
            + "WHERE MA_SP = ? AND TINHTRANG = 1";
    private static final String UPDATE_NEW_QUANTITY = "UPDATE SANPHAM "
                                                    + "SET SOLUONG = ? "
                                                    + "WHERE MA_SP = ?";
    public List<ProductDTO> getAllProductCategory(int idCategory) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETALLCATEGORY);
                ptm.setInt(1, idCategory);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("MA_SP");
                    String productName = rs.getString("TEN_SP");
                    double price = rs.getDouble("GIABAN");
                    int quantity = rs.getInt("SOLUONG");
                    String importDate = rs.getString("NGAY_THEMSP");
                    String image = rs.getString("HINHANH_SP");
                    int status = rs.getInt("TINHTRANG");
                    list.add(new ProductDTO(productID, productName, price, quantity, importDate, image, status, 0));
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

    public List<ProductDTO> getAllProduct() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETALL);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("MA_SP");
                    String productName = rs.getString("TEN_SP");
                    double price = rs.getDouble("GIABAN");
                    int quantity = rs.getInt("SOLUONG");
                    String importDate = rs.getString("NGAY_THEMSP");
                    String image = rs.getString("HINHANH_SP");
                    int status = rs.getInt("TINHTRANG");
                    list.add(new ProductDTO(productID, productName, price, quantity, importDate, image, status, 0));
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

    public List<ProductDTO> searchProductName(String search) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("MA_SP");
                    String productName = rs.getString("TEN_SP");
                    double price = rs.getDouble("GIABAN");
                    int quantity = rs.getInt("SOLUONG");
                    String importDate = rs.getString("NGAY_THEMSP");
                    String image = rs.getString("HINHANH_SP");
                    int status = rs.getInt("TINHTRANG");
                    int category = rs.getInt("MA_DM");
                    list.add(new ProductDTO(productID, productName, price, quantity, importDate, image, status, category));
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

    public boolean deleteProduct(int productID) throws SQLException {
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

    public ProductDTO getProductDetail(int productID) throws SQLException {
        ProductDTO product = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_DETAIL);
                ptm.setInt(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String productName = rs.getString("TEN_SP");
                    double price = rs.getDouble("GIABAN");
                    int quantity = rs.getInt("SOLUONG");
                    int categoryID = rs.getInt("MA_DM");
                    String importDate = rs.getString("NGAY_THEMSP");
                    String image = rs.getString("HINHANH_SP");
                    product = new ProductDTO(productID, productName, price, quantity, importDate, image, 1, categoryID);
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
        return product;
    }

    public boolean updateProduct(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, product.getTEN_SP());
                ptm.setDouble(2, product.getGIABAN());
                ptm.setInt(3, product.getSOLUONG());
                ptm.setInt(4, product.getMA_DM());
                ptm.setString(5, product.getNGAY_THEMSP());
                ptm.setString(6, product.getHINHANH_SP());
                ptm.setInt(7, product.getMA_SP());
                check = ptm.executeUpdate() > 0;
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
        return check;
    }

    public boolean insertProduct(ProductDTO product) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, product.getTEN_SP());
                ptm.setDouble(2, product.getGIABAN());
                ptm.setInt(3, product.getSOLUONG());
                ptm.setString(4, product.getHINHANH_SP());
                ptm.setBoolean(5, true);
                ptm.setInt(6, product.getMA_DM());
                check = ptm.executeUpdate() > 0;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public int getProductQuantity(int productID) throws SQLException {
        int quantity = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_QUANTITY);
                ptm.setInt(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    quantity = rs.getInt("SOLUONG");
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
        return quantity;
    }
        public boolean updateProductQuantity(int productID, int newQuantity) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_NEW_QUANTITY);
                ptm.setInt(1, newQuantity);
                ptm.setInt(2, productID);
                check = ptm.executeUpdate() > 0;
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
        return check;
    }
}
