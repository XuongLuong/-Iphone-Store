/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;


public class UserDTO {
    private String email;
    private String name;
    private int role;
    private String password;
    private String phone;
    private String address;
    private String birthday;
    private boolean status;

    public UserDTO() {
    }

    public UserDTO(String email, String name, int role, String password, String phone, String address, String birthday, boolean status) {
        this.email = email;
        this.name = name;
        this.role = role;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.birthday = birthday;
        this.status = status;
    }
     public UserDTO(String email,int role) {
        this.email = email;
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
}
