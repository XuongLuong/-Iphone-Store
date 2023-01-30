

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE-edge">
        <meta name="viewport" content="width-device width, initial - scare=1.0">
        <link rel="stylesheet" href="CSS/reset.css">
        <link rel="stylesheet" href="./css/login.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <title>Sign Up</title>
    </head>
    <body>
        <div id="wrapper">
            <form action="SignUpController" method="POST"  id="form-login">
                <h1 class="form-heading">Sign Up</h1>

                <div class="form-group">
                    <i class=""></i>
                    <input name="name" type="text"  class="form-input" placeholder="Full Name" required="">
                    <span style="color: red">${requestScope.USER_ERROR.nameError}</span>
                </div>

                <div class="form-group">
                    <i class=""></i>
                    <input name="phone" type="text" id="phone" pattern="[0-9]{10}" class="form-input" placeholder="Number phone" required="">
                    <span style="color: red">${requestScope.USER_ERROR.phoneError}</span>
                </div>

                <div class="form-group">
                    <i class=""></i>
                    <input name="email" type="email"  class="form-input" placeholder="Email" required="">
                    <span style="color: red">${requestScope.USER_ERROR.emailError}</span>
                </div>

                <div class="form-group">
                    <i class="fa-solid fa-user"></i>
                    <input name="address" type="text" class="form-input" placeholder="Address" required="">
                    <span style="color: red">${requestScope.USER_ERROR.addressError}</span>
                </div>
                <div class="form-group">
                    <i class="fa-solid fa-user"></i>
                    <input name="birthday" type="date" pattern="\d{4}-\d{1,2}-\d{1,2}" class="form-input" placeholder="Birthday" required="">
                    <span style="color: red">${requestScope.USER_ERROR.birthdayError}</span>
                </div>
                <div class="form-group">
                    <i class=""></i>
                    <input name="password" type="password" class="form-input" placeholder="Password" required="">
                    <span style="color: red">${requestScope.USER_ERROR.passwordError}</span>
                </div>

                <div class="form-group">
                    <i class=""></i>
                    <input name="confirmPassword" type="password" class="form-input" placeholder="Confirm password" required="">
                    <span style="color: red">${requestScope.USER_ERROR.confirmPasswordError}</span>
                </div>

                <input type="submit" value="Đăng ký" class="submit form-submit">
            </form>
        </div>
    </body>
</html>