/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;


public class UserError {

    private String emailError;
    private String nameError;
    private String passwordError;
    private String phoneError;
    private String addressError;
    private String birthdayError;
    private String confirmPasswordError;

    public UserError() {
    }

    public UserError(String emailError, String nameError, String passwordError, String phoneError, String addressError, String birthdayError, String confirmPasswordError) {
        this.emailError = emailError;
        this.nameError = nameError;
        this.passwordError = passwordError;
        this.phoneError = phoneError;
        this.addressError = addressError;
        this.birthdayError = birthdayError;
        this.confirmPasswordError = confirmPasswordError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    public String getNameError() {
        return nameError;
    }

    public void setNameError(String nameError) {
        this.nameError = nameError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    public String getAddressError() {
        return addressError;
    }

    public void setAddressError(String addressError) {
        this.addressError = addressError;
    }

    public String getBirthdayError() {
        return birthdayError;
    }

    public void setBirthdayError(String birthdayError) {
        this.birthdayError = birthdayError;
    }

    public String getConfirmPasswordError() {
        return confirmPasswordError;
    }

    public void setConfirmPasswordError(String confirmPasswordError) {
        this.confirmPasswordError = confirmPasswordError;
    }

}
