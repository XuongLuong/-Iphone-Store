/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;


public class UserDAO {

    public static final String LOGIN = "SELECT EMAIL,TEN_NG,MA_CV,SĐT,DIACHI,NGAYSINH "
            + "FROM NGUOIDUNG WHERE EMAIL = ? AND MATKHAU = ? AND TINHTRANG=1";
    public static final String SIGN_UP = "INSERT INTO NGUOIDUNG(EMAIL,TEN_NG,MA_CV,MATKHAU,SĐT,DIACHI,NGAYSINH,TINHTRANG) VALUES(?,?,?,?,?,?,?,?)";

    public static final String SEARCH = "SELECT EMAIL,TEN_NG,MA_CV,SĐT,DIACHI,NGAYSINH "
            + "FROM NGUOIDUNG WHERE TEN_NG like ? AND TINHTRANG = 1 ";
    public static final String DELETE = "UPDATE NGUOIDUNG SET TINHTRANG=0 WHERE EMAIL= ?";

    public static final String GET_USER_DETAIL = "SELECT EMAIL,TEN_NG, MA_CV, MATKHAU,SĐT,DIACHI,NGAYSINH "
            + "FROM NGUOIDUNG WHERE TINHTRANG = 1 AND EMAIL=?";
    public static final String UPDATE = "UPDATE NGUOIDUNG"
            + " SET TEN_NG= ?,MA_CV= ?,DIACHI = ?,NGAYSINH = ?,SĐT = ? WHERE EMAIL = ?";
    public static final String CHECK_DUPLICATE = "SELECT EMAIL FROM NGUOIDUNG WHERE EMAIL=? AND TINHTRANG = 1";

    private static final String CHECK_EMAIL_LOGIN = "SELECT EMAIL,TEN_NG,MA_CV,DIACHI,NGAYSINH,SĐT "
            + "FROM NGUOIDUNG "
            + "WHERE EMAIL = ? AND TINHTRANG = 1";

    public UserDTO checkLogin(String email, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, email);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("TEN_NG");
                    int roleID = rs.getInt("MA_CV");
                    String phone = rs.getString("SĐT");
                    String address = rs.getString("DIACHI");
                    String birthday = rs.getString("NGAYSINH");
                    user = new UserDTO(email, fullName, roleID, "", phone, address, birthday, true);
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
        return user;
    }

    public boolean signUpUser(UserDTO user) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SIGN_UP);
                ptm.setString(1, user.getEmail());
                ptm.setString(2, user.getName());
                ptm.setInt(3, user.getRole());
                ptm.setString(4, user.getPassword());
                ptm.setString(5, user.getPhone());
                ptm.setString(6, user.getAddress());
                ptm.setString(7, user.getBirthday());
                ptm.setBoolean(8, true);
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

    public List<UserDTO> getListUserByFullName(String search) throws SQLException {
        List<UserDTO> list = new ArrayList<>();
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
                    String email = rs.getString("EMAIL");
                    String fullName = rs.getString("TEN_NG");
                    int roleID = rs.getInt("MA_CV");
                    String password = "***";
                    String address = rs.getString("DIACHI");
                    String birthday = rs.getString("NGAYSINH");
                    String phone = rs.getString("SĐT");
                    list.add(new UserDTO(email, fullName, roleID, password, phone, address, birthday, true));
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

    public boolean deleteUser(String email) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, email);
                int value = ptm.executeUpdate();
                result = value > 0 ? true : false;
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

    public UserDTO getUserDetail(String email) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_USER_DETAIL);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("TEN_NG");
                    int roleID = rs.getInt("MA_CV");
                    String address = rs.getString("DIACHI");
                    String birthday = rs.getString("NGAYSINH");
                    String phone = rs.getString("SĐT");
                    String password = "***";
                    user = new UserDTO(email, fullName, roleID, password, phone, address, birthday, true);
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
        return user;
    }

    public boolean updateUser(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, user.getName());
                ptm.setInt(2, user.getRole());
                ptm.setString(3, user.getAddress());
                ptm.setString(4, user.getBirthday());
                ptm.setString(5, user.getPhone());
                ptm.setString(6, user.getEmail());
                check = ptm.executeUpdate() > 0 ? true : false;
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

    public boolean checkDuplicate(String email) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
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

        return check;
    }
    public UserDTO getUserByEmail(String email) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_EMAIL_LOGIN);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("TEN_NG");
                    int roleID = rs.getInt("MA_CV");
                    String address = rs.getString("DIACHI");
                    String birthday = rs.getString("NGAYSINH");
                    String phone = rs.getString("SĐT");
                    user = new UserDTO(email,fullName, roleID, "", phone, address, birthday,true);
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
        return user;
    }
}
