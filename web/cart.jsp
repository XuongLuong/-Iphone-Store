
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="products.ProductDTO"%>
<%@page import="shopping.Cart"%>
<%@page import="users.UserDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

        <!-- title -->
        <title>Cart</title>

        <!-- favicon -->
        <link rel="shortcut icon" type="image/png" href="assets/img/favicon.png">
        <!-- google font -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
        <!-- fontawesome -->
        <link rel="stylesheet" href="assets/css/all.min.css">
        <!-- bootstrap -->
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <!-- owl carousel -->
        <link rel="stylesheet" href="assets/css/owl.carousel.css">
        <!-- magnific popup -->
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <!-- animate css -->
        <link rel="stylesheet" href="assets/css/animate.css">
        <!-- mean menu css -->
        <link rel="stylesheet" href="assets/css/meanmenu.min.css">
        <!-- main style -->
        <link rel="stylesheet" href="assets/css/main.css">
        <!-- responsive -->
        <link rel="stylesheet" href="assets/css/responsive.css">
        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>

    </head>
    <body>

        <!-- HEADER -->
        <header>
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a href="#"><i class="fa fa-phone"></i>0999999999</a></li>
                        <li><a href="#"><i class="fa fa-envelope-o"></i> NLX@gmail.com</a></li>
                        <li><a href="#"><i class="fa fa-map-marker"></i> NB-Q12-BT</a></li>
                    </ul>
                    <ul class="header-links pull-right">
                        <li><a href="#"><i class="fa fa-dollar"></i> USD</a></li>
                            <%
                                UserDTO userLogin = (UserDTO) session.getAttribute("LOGIN_USER");
                                double totalPrice = 0;
                                Cart cart = (Cart) session.getAttribute("CART");
                                if (cart != null) {
                                    for (ProductDTO product : cart.getCart().values()) {
                                        totalPrice += product.getQuantityPurchased() * product.getGIABAN();
                                    }
                                }
                                if (userLogin == null) {
                                    userLogin = new UserDTO();
                            %>
                        <li><a href="DangNhap.jsp"><i class="fa fa-user-o"></i> Login</a></li>
                            <%
                            } else {
                            %>
                        <li><a href="LogoutController"><i class="fa fa-user-o"></i> Logout</a></li>
                            <%
                                }
                            %>
                    </ul>
                </div>
            </div>
            <!-- /TOP HEADER -->

            <!-- MAIN HEADER -->
            <div id="header">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- LOGO -->
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="HomeControl" class="logo">
                                    <span style="font-size: 40px">NLX APPLE</span>
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="col-md-6">
                            <div class="header-search">
                                <form action="SearchProductName">
                                    <input name="search" class="input" placeholder="Search here">
                                    <button class="search-btn">Search</button>
                                </form>
                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                                <!-- Cart -->
                                <div class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Your Cart</span>
                                        <div class="qty">${sessionScope.CART.getCart().size()}</div>
                                    </a>
                                    <div class="cart-dropdown">
                                        <div class="cart-list">
                                            <%
                                                if (cart == null) {
                                            %>
                                            <p style="color: red">Không có hàng ở đây</p>
                                            <%
                                            } else {
                                                for (ProductDTO product : cart.getCart().values()) {
                                            %>
                                            <div class="product-widget">
                                                <div class="product-img">
                                                    <img src="<%= product.getHINHANH_SP()%>" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="#"><%= product.getTEN_SP()%></a></h3>
                                                    <h4 class="product-price"><span class="qty"><%= product.getQuantityPurchased()%></span><%= product.getGIABAN()%></h4>
                                                </div>
                                                <a href="RemoveCart?productID=<%=product.getMA_SP()%>"><button class="delete"><i class="fa fa-close"></i></button></a>                                        
                                            </div>
                                            <%
                                                    }
                                                }
                                            %>                                           
                                        </div>
                                        <div class="cart-btns">
                                            <a href="cart.jsp">View Cart</a>
                                            <c:if test="${sessionScope.LOGIN_USER != null}">
                                                <a href="checkout.jsp" class="boxed-btn black">Check Out</a>
                                            </c:if>
                                            <c:if test="${sessionScope.LOGIN_USER == null}">
                                                <a href="DangNhap.jsp" class="boxed-btn black">Check Out</a>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Cart -->

                                <!-- Menu Toogle -->
                                <div class="menu-toggle">
                                    <a href="#">
                                        <i class="fa fa-bars"></i>
                                        <span>Menu</span>
                                    </a>
                                </div>
                                <!-- /Menu Toogle -->
                            </div>
                        </div>
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->

        <!-- cart -->
        <div class="cart-section mt-150 mb-150">
            <div class="container">
                <div class="row">                
                    <div class="col-lg-8 col-md-12">                       
                        <div class="cart-table-wrap">
                            <table class="cart-table">
                                <thead class="cart-table-head">
                                    <tr class="table-head-row">
                                        <th class="product-remove">Remove</th>
                                        <th class="product-image">Product Image</th>
                                        <th class="product-name">Name</th>
                                        <th class="product-price">Price</th>
                                        <th class="product-quantity">Quantity</th>
                                        <th class="product-total">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        if (cart == null) {
                                    %>
                                <h1>Không có hàng ở đây </h1>
                                <%
                                } else {
                                %>
                                <c:if test="${requestScope.SUCCESS_MESSAGE != null}">
                                    <div class="alert alert-success" role="alert">
                                        <center>
                                            <strong>Success!</strong> ${requestScope.SHOPPING_MESSAGE}
                                        </center>
                                    </div>
                                </c:if>
                                <c:if test="${requestScope.ERROR_MESSAGE != null}">
                                    <div " class="alert alert-danger">
                                        <center>
                                            <strong>Alert!</strong> ${requestScope.ERROR_MESSAGE}
                                        </center>
                                    </div>
                                </c:if> 
                                <%
                                    for (ProductDTO product : cart.getCart().values()) {
                                %>
                                <form action="UpdateCart" method="POST">
                                    <tr class="table-body-row">
                                        <td class="product-remove"><a href="RemoveCart?productID=<%=product.getMA_SP()%>">Delete</a></td>
                                        <td class="product-image"><img src="<%= product.getHINHANH_SP()%>" alt=""></td>
                                        <td class="product-name"><%=product.getTEN_SP()%></td>
                                        <td class="product-price"><%=product.getGIABAN()%></td>
                                        <td class="product-quantity"><input type="number" name="quantity" min="1" required="" value="<%=product.getQuantityPurchased()%>"><input type="hidden" name="productID" value="<%=product.getMA_SP()%>" ></td>
                                        <td class="product-total"><%=product.getQuantityPurchased() * product.getGIABAN()%> $</td>
                                    </tr>   
                                </form>                                                
                                <%
                                        }
                                    }
                                %>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="total-section">
                            <table class="total-table">
                                <thead class="total-table-head">
                                    <tr class="table-total-row">
                                        <th>Total</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="total-data">
                                        <td><strong>Total: </strong></td>
                                        <td><%= totalPrice%>$</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="cart-buttons">
                                <c:if test="${sessionScope.LOGIN_USER != null}">
                                    <a href="checkout.jsp" class="boxed-btn black">Check Out</a>
                                </c:if>
                                <c:if test="${sessionScope.LOGIN_USER == null}">
                                    <a href="DangNhap.jsp" class="boxed-btn black">Check Out</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end cart -->

            <!-- end logo carousel -->
            <!-- end copyright -->

            <!-- jquery -->
            <script>
                window.setTimeout(function () {
                    $(".alert").fadeTo(500, 0).slideUp(500, function () {
                        $(this).remove();
                    });
                }, 3000);
            </script>
            <script src="assets/js/jquery-1.11.3.min.js"></script>
            <!-- bootstrap -->
            <script src="assets/bootstrap/js/bootstrap.min.js"></script>
            <!-- count down -->
            <script src="assets/js/jquery.countdown.js"></script>
            <!-- isotope -->
            <script src="assets/js/jquery.isotope-3.0.6.min.js"></script>
            <!-- waypoints -->
            <script src="assets/js/waypoints.js"></script>
            <!-- owl carousel -->
            <script src="assets/js/owl.carousel.min.js"></script>
            <!-- magnific popup -->
            <script src="assets/js/jquery.magnific-popup.min.js"></script>
            <!-- mean menu -->
            <script src="assets/js/jquery.meanmenu.min.js"></script>
            <!-- sticker js -->
            <script src="assets/js/sticker.js"></script>
            <!-- main js -->
            <script src="assets/js/main.js"></script>

            <script src="js/jquery.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/slick.min.js"></script>
            <script src="js/nouislider.min.js"></script>
            <script src="js/jquery.zoom.min.js"></script>
            <script src="js/main.js"></script>

          <!-- NEWSLETTER -->
       
 <div id="newsletter" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="newsletter">
                            <p>Please Login for <strong>BETTER EXPRERIENCE</strong></p>
                            <form>
                                <input class="input" type="email" placeholder="Enter Your Email">
                                <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                            </form>
                            <ul class="newsletter-follow">
                                <li>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /NEWSLETTER -->

        <!-- FOOTER -->
        <footer id="footer">
            <!-- top footer -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">About Us</h3>
                                <p style="color: #B9BABC">If you know APPLE come visit us. APPLE NLX Store will give you the best experience.</p>
                                <ul class="footer-links">
                                    <li><a href="#"><i class="fa fa-map-marker"></i>NB-Q12-BT</a></li>
                                    <li><a href="#"><i class="fa fa-phone"></i>0999999999</a></li>
                                    <li><a href="#"><i class="fa fa-envelope-o"></i>NLX@gmail.com</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Categories</h3>
                                <ul class="footer-links">
                                    <li><a href="#">New Products</a></li>
                                    <li><a href="#">Iphone</a></li>
                                    <li><a href="#">Macbook</a></li>
                                    <li><a href="#">Tablet</a></li>
                                    <li><a href="#">Accessories</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="clearfix visible-xs"></div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Information</h3>
                                <ul class="footer-links">
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Contact Us</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Orders and Returns</a></li>
                                    <li><a href="#">Terms & Conditions</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Service</h3>
                                <ul class="footer-links">
                                    <li><a href="#">My Account</a></li>
                                    <li><a href="#">View Cart</a></li>
                                    <li><a href="#">Wishlist</a></li>
                                    <li><a href="#">Track My Order</a></li>
                                    <li><a href="#">Help</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /top footer -->

            <!-- bottom footer -->
            <div id="bottom-footer" class="section">
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="footer-payments">
                                <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                                <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                            </ul>
                            <span class="copyright">
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </span>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /bottom footer -->
        </footer>
        <!-- jQuery Plugins -->
        <script>
            window.setTimeout(function () {
                $(".alert").fadeTo(500, 0).slideUp(500, function () {
                    $(this).remove();
                });
            }, 3000);
        </script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
