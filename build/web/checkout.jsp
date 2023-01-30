
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="shopping.Cart"%>
<%@page import="users.UserDTO"%>
<%@page import="products.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Check Out</title>

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

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <!-- HEADER -->
        <header>
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a href="#"><i class="fa fa-phone"></i> 0999999999</a></li>
                        <li><a href="#"><i class="fa fa-envelope-o"></i> NLX@gmail.com</a></li>
                        <li><a href="#"><i class="fa fa-map-marker"></i> NB-Q12-BT</a></li>
                    </ul>
                    <ul class="header-links pull-right">
                        <li><a href="#"><i class="fa fa-dollar"></i> USD</a></li>
                            <%
                                UserDTO userLogin = (UserDTO) session.getAttribute("LOGIN_USER");
                                Cart cart = (Cart) session.getAttribute("CART");
                                double totalPrice = 0;
                                if (cart == null) {
                                    response.sendRedirect("HomeControl");
                                    return;
                                }
                                if (userLogin.getRole() == 1) {
                                    response.sendRedirect("admin.jsp");
                                    return;
                                }
                                for (ProductDTO product : cart.getCart().values()) {
                                    totalPrice += product.getQuantityPurchased() * product.getGIABAN();
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
                                    <input name="search" class="input" placeholder="Search...">
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
                                                <a href="checkout.jsp">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
                                                </c:if>
                                                <c:if test="${sessionScope.LOGIN_USER == null}">
                                                <a href="DangNhap.jsp">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
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
        <!-- BREADCRUMB -->
        <div id="breadcrumb" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="breadcrumb-header">Checkout</h3>
                        <ul class="breadcrumb-tree">
                            <li><a href="#">Home</a></li>
                            <li class="active">Checkout</li>
                        </ul>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <div class="col-md-7">
                        <!-- Billing Details -->
                        <form action="CheckOutController" method="POST">
                            <div class="billing-details">
                                <div class="section-title">
                                    <h3 class="title">Billing address</h3>
                                </div>
                                <div class="form-group">                                
                                    <label>Full Name</label>
                                    <c:choose>
                                        <c:when test="${sessionScope.LOGIN_USER.name != null}">
                                            <input name="name" style="color: black !important;" type="text" class="form-control" placeholder=""value="${sessionScope.LOGIN_USER.name}"readonly="">
                                        </c:when>
                                        <c:otherwise>
                                            <input name="name" style="color: black !important;" type="text" class="form-control" placeholder=""value="">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="form-group">
                                    <label >Email</label>
                                    <input name="email" style="color: black !important;" type="email" class="form-control" placeholder="" value="${sessionScope.LOGIN_USER.email}" readonly="">
                                </div>
                                <div class="form-group">
                                    <label>Street Address</label>
                                    <c:choose>
                                        <c:when test="${sessionScope.LOGIN_USER.address != null}">
                                            <input name="address" style="color: black !important;" type="text" class="form-control" placeholder="House number and street name"value="${sessionScope.LOGIN_USER.address}"readonly="">
                                        </c:when>
                                        <c:otherwise>
                                            <input name="address" style="color: black !important;" type="text" class="form-control" placeholder="House number and street name"value="${sessionScope.LOGIN_USER.address}">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="form-group">
                                    <label>Phone</label>
                                    <c:choose>
                                        <c:when test="${sessionScope.LOGIN_USER.phone != null}">
                                            <input name="phone" style="color: black !important;" type="text" class="form-control" placeholder="" value="${sessionScope.LOGIN_USER.phone}" readonly="">
                                        </c:when>
                                        <c:otherwise>
                                            <input name="phone" style="color: black !important;" type="text" class="form-control" placeholder="" value="${sessionScope.LOGIN_USER.phone}">
                                        </c:otherwise>
                                    </c:choose> 
                                </div>
                                <div class="form-group">
                                    <label>Birthday</label>
                                    <c:choose>
                                        <c:when test="${sessionScope.LOGIN_USER.birthday != null}">
                                            <input name="birthday" style="color: black !important;" type="date" class="form-control" placeholder="" value="${sessionScope.LOGIN_USER.birthday}"readonly="">
                                        </c:when>
                                        <c:otherwise>
                                            <input name="birthday" style="color: black !important;" type="date" class="form-control" placeholder="" value="${sessionScope.LOGIN_USER.birthday}">
                                        </c:otherwise>
                                    </c:choose>                               
                                </div>
                            </div>
                            <!-- /Billing Details -->
                    </div>

                    <!-- Order Details -->
                    <div class="col-md-5 order-details">
                        <div class="section-title text-center">
                            <h3 class="title">Your Order</h3>
                        </div>
                        <div class="order-summary">
                            <div class="order-col">
                                <div><strong>PRODUCT</strong></div>
                                <div><strong>TOTAL</strong></div>
                            </div>
                            <div class="order-products">
                                <%
                                    for (ProductDTO product : cart.getCart().values()) {
                                %>
                                <div class="order-col">
                                    <div><%=product.getQuantityPurchased()%>x<%=product.getTEN_SP()%></div>
                                    <div><%=product.getGIABAN()%></div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                            <div class="order-col">
                                <div><strong>TOTAL</strong></div>
                                <div><strong class="order-total"><%= totalPrice%>$</strong></div>
                            </div>
                        </div>
                        <div class="payment-method">
                            <div class="input-radio">
                                <input type="radio" name="payment" id="payment-1">
                                <label for="payment-1">
                                    <span></span>
                                    Direct Bank Transfer
                                </label>
                                <div class="caption">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                </div>
                            </div>
                            <div class="input-radio">
                                <input type="radio" name="payment" id="payment-2">
                                <label for="payment-2">
                                    <span></span>
                                    Cheque Payment
                                </label>
                                <div class="caption">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                </div>
                            </div>
                            <div class="input-radio">
                                <input type="radio" name="payment" id="payment-3">
                                <label for="payment-3">
                                    <span></span>
                                    Paypal System
                                </label>
                                <div class="caption">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                </div>
                            </div>
                        </div>
                        <div class="input-checkbox">
                            <input type="checkbox" id="terms">
                            <label for="terms">
                                <span></span>
                                I've read and accept the <a href="#">terms & conditions</a>
                            </label>
                        </div>
                            <input class="primary-btn order-submit" type="submit" value="Place Order" />
                        </form>                       
                    </div>
                    <!-- /Order Details -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

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
                                <p>If you know APPLE come visit us. APPLE NLX Store will give you the best experience.</p>
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
