
<%@page import="shopping.Cart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="users.UserDTO"%>
<%@page import="products.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>STORE APPLE NLX</title>

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
                        <li><a href="#"><i class="fa fa-phone"></i> 09999999999</a></li>
                        <li><a href="#"><i class="fa fa-envelope-o"></i> NLX@gmail.com</a></li>
                        <li><a href="#"><i class="fa fa-map-marker"></i> NB-Q12-BT</a></li>
                    </ul>
                    <ul class="header-links pull-right">
                        <li><a href="#"><i class="fa fa-dollar"></i> USD</a></li>
                            <%
                                UserDTO userLogin = (UserDTO) session.getAttribute("LOGIN_USER");
                                Cart cart = (Cart) session.getAttribute("CART");
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
            <%
                List<ProductDTO> listProduct = (List<ProductDTO>) request.getAttribute("LIST_PRODUCT");
            %>
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

        <!-- /NAVIGATION -->
        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title"><a href="HomeControl">New Products</a></h3>
                            <div class="section-nav">
                                <ul class="section-tab-nav tab-nav">
                                    <li><a href="GetAllProductByCategory?categoryID=1">Iphone</a></li>
                                    <li><a href="GetAllProductByCategory?categoryID=2">Macbook</a></li>
                                    <li><a href="GetAllProductByCategory?categoryID=3">Table</a></li>
                                    <li><a href="GetAllProductByCategory?categoryID=4">Accessories</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab1" class="tab-pane active">
                                    <c:if test="${requestScope.SHOPPING_MESSAGE != null}">
                                        <div class="alert alert-success" role="alert">
                                            <center>
                                                <strong>Success!</strong> ${requestScope.SHOPPING_MESSAGE}
                                            </center>
                                        </div>
                                    </c:if>
                                    <c:if test="${requestScope.ERROR_SHOPPING_MESSAGE != null}">
                                        <div " class="alert alert-danger">
                                            <center>
                                                <strong>Alert!</strong> ${requestScope.ERROR_SHOPPING_MESSAGE}
                                            </center>
                                        </div>
                                    </c:if> 
                                    <div class="products-slick" data-nav="#slick-nav-1">
                                        <!-- product -->
                                        <%
                                            if (listProduct != null) {
                                                if (!listProduct.isEmpty()) {
                                                    for (ProductDTO product : listProduct) {
                                        %>
                                        <div class="product">
                                            <div class="product-img demo">
                                                <img src="<%= product.getHINHANH_SP()%>" alt="">
                                                <div class="product-label">                                                  
                                                    <span class="new">NEW</span>
                                                </div>
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category"><%= product.getMA_DM()%></p>
                                                <h3 class="product-name"><a href="#"><%= product.getTEN_SP()%></a></h3>
                                                <h4 class="product-price"><%= product.getGIABAN()%> $ <del class="product-old-price">$990.00</del></h4>
                                                <div class="product-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="product-btns">
                                                    <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                    <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                    <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                </div>
                                            </div>
                                            <div class="add-to-cart">                                                                
                                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> <a href="AddToCart?productID=<%= product.getMA_SP()%>&quantity=<%=product.getSOLUONG()%>&productName=<%= product.getTEN_SP()%>&productPrice=<%= product.getGIABAN()%>&productImage=<%= product.getHINHANH_SP()%>&quantityPurchased=1&search=${param.search}">Add to cart</a></button>
                                            </div>
                                        </div>
                                        <!-- /product -->
                                        <%
                                                    }
                                                }
                                            }
                                        %>

                                    </div>
                                    <div id="slick-nav-1" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->
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
