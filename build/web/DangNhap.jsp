

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE-edge">
        <meta name="viewport" content="width-device width, initial - scare=1.0">
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="./css/login.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <title>Sign In</title>
    </head>
    <body>
        <div id="wrapper">
            <form action="LoginController"  id="form-login">
                <h1 class="form-heading">Sign In</h1>
                <div class="form-group">
                    <i class="fa-solid fa-user"></i>
                    <input name="email" type="text" class="form-input" 
                           placeholder=" Email">
                </div>
                <div class="form-group">
                    <i class="fa-solid fa-key"></i>
                    <input name="password" type="password" class="form-input" 
                           placeholder=" Password">
                    <div id="eye">
                        <i class="far fa-eye"></i>
                    </div>
                </div>
                <input type="submit" value="Sign In" 
                       class="submit form-submit">
                <a href="DangKy.jsp">Sign Up</a>
                <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/DoAnJava/LoginGoogleServlet&response_type=code
                   &client_id=967579769667-5n9kltsllcnqnm6o8fkok1goeugtc03j.apps.googleusercontent.com&approval_prompt=force" class="btn-google m-b-20">
                    <img src="./img/icon-google.png" alt="GOOGLE">
                    Google
                </a>
        </div>
    </body>

</html>