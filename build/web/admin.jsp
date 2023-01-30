

<%@page import="checkout.OrderDTO"%>
<%@page import="products.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>APPLE NLX - Admin</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="./css/bootstrap.min.admin.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="./css/styleadmin.css" rel="stylesheet">
    </head>

    <body>
        <div class="container-xxl position-relative bg-white d-flex p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->
            <%
                UserDTO userLogin = (UserDTO) session.getAttribute("LOGIN_USER");
                if (userLogin == null) {
                    userLogin = new UserDTO();
                }
                List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
                List<ProductDTO> listProduct = (List<ProductDTO>) request.getAttribute("LiST_PRODUCT_ADMIN");
                List<OrderDTO> listOrder = (List<OrderDTO>) request.getAttribute("LIST_ORDER_ADMIN");
                if (userLogin.getRole() != 1) {
                    response.sendRedirect("HomeControl");
                    return;
                }
            %>

            <!-- Sidebar Start -->
            <div class="sidebar pe-4 pb-3">
                <nav class="navbar bg-light navbar-light">
                    <a href="#" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>NLX Admin</h3>
                    </a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="ms-3">
                            <h6 class="mb-0">${sessionScope.LOGIN_USER.name}</h6>
                            <span>Admin</span>
                        </div>
                    </div>
                    <div class="navbar-nav w-100">
                        <a href="SearchUserController?search=" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>UserManagement</a>               
                        <a href="GetAllProductController?search=" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>ProductManagement</a>               
                        <a href="GetAllOrder" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>OrderManagement</a>   
                    </div>
                </nav>
            </div>
            <!-- Sidebar End -->


            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                    <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                        <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                    </a>
                    <a href="#" class="sidebar-toggler flex-shrink-0">
                        <i class="fa fa-bars"></i>
                    </a>
                    <form class="d-none d-md-flex ms-4">
                        <input class="form-control border-0" type="search" placeholder="Search">
                    </form>
                    <div class="navbar-nav align-items-center ms-auto">
                        
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <span   style="font-style: italic" class="d-none d-lg-inline-flex">${sessionScope.LOGIN_USER.name}</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">                             
                                <a href="LogoutController" class="dropdown-item">Log Out</a>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- Navbar End -->
                <!--UserManagement-->
                <!-- Recent Sales Start -->
                <%
                    if (listUser != null) {
                        if (!listUser.isEmpty()) {
                %>
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h3 style="margin-left: 20px;" class="mb-0">List Users</h3>
                            <%
                                String error_message = (String) request.getAttribute("ERROR_MESSAGE");
                                String success_message = (String) request.getAttribute("SUCCESS_MESSAGE");
                                if (error_message == null && success_message == null) {
                                    success_message = "";
                            %>
                            <h3 class="text-success"><%= success_message%></h3>
                            <%
                            } else if (success_message == null) {
                                success_message = "";
                            %>
                            <h3 class="text-danger"><%= error_message%></h3>
                            <%
                            } else if (error_message == null) {
                                error_message = "";
                            %>
                            <h3 class="text-success"><%= success_message%></h3>
                            <%
                                }
                            %>
                        </div>
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr style="text-align: center" class="text-dark">                                      
                                        <th scope="col">No</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Full Name</th>
                                        <th scope="col">Password</th>
                                        <th scope="col">Role ID</th>
                                        <th scope="col">Address</th>
                                        <th scope="col">Birthday</th>
                                        <th scope="col">Phone</th>
                                        <th scope="col">Update</th>
                                        <th scope="col">Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int count = 1;
                                        for (UserDTO user : listUser) {
                                    %>
                                    <tr>
                                        <td><%= count++%></td>
                                        <td><%= user.getEmail()%> </td>
                                        <td><%= user.getName()%></td>
                                        <td><%= user.getPassword()%></td>
                                        <td>
                                            <%
                                                if (user.getRole() == 1) {
                                            %>
                                            ADMIN   
                                            <%
                                            } else {
                                            %>
                                            USER
                                            <%
                                                }
                                            %>
                                        </td>
                                        <td><%= user.getAddress()%></td>
                                        <td><%= user.getBirthday()%></td>
                                        <td><%= user.getPhone()%></td>
                                        <td>
                                            <a id="update" class="btn btn-primary text-white"href="GetDetailUserController?email=<%=user.getEmail()%>&search=${param.search}">Update</a>
                                        </td>
                                        <td>
                                            <a class="btn btn-danger text-white"href="DeleteUserController?email=<%= user.getEmail()%>&search=${param.search}">Delete</a>
                                        </td>
                                    </tr>                               
                                    <%
                                            }
                                        }
                                    %>
                                </tbody>
                            </table> 
                        </div>
                        <%
                            UserDTO userDetail = (UserDTO) request.getAttribute("USER_DETAIL");
                            if (userDetail == null) {
                                userDetail = new UserDTO();
                            } else {
                        %>
                        <form action="UpdateUserController" 
                              method="POST" 
                              style="
                              width: 30%;
                              border: 1px solid;
                              border-radius: 30px;
                              margin: auto;
                              padding: 50px;" 
                              id="update-form"
                              >
                            <div style="text-align: center" class="form-group">
                                <label for="Email" class="form-label">Email:</label>
                                <input type="text" class="form-control" name="email"  placeholder="Email" value="<%= userDetail.getEmail()%>" readonly=""/>
                            </div>
                            <div style="text-align: center" class="form-group">
                                <label for="FullName" class="form-label">FullName:</label>
                                <input type="text" class="form-control" name="fullName" placeholder="Full Name" value="<%= userDetail.getName()%>" required=""/>
                            </div>
                            <div style="text-align: center" class="form-group">
                                <label for="Password" class="form-label">Password</label>
                                <input type="password" class="form-control" name="password"  placeholder="Password" value="<%= userDetail.getPassword()%>" readonly=""/>
                            </div>
                            <div style="text-align: center" class="form-group">
                                <label for="RoleID" class="form-label">RoleID:</label>
                                <%
                                    if (userLogin.getEmail().equals(userDetail.getEmail())) {
                                %>
                                <select name="roleID">
                                    <option  class="form-control" value="<%= userDetail.getRole()%>">ADMIN</option>
                                </select>
                                <%
                                } else {
                                %>
                                <select name="roleID">
                                    <%
                                        if (userDetail.getRole() == 1) {
                                    %>
                                    <option value="1">ADMIN</option>
                                    <option value="2">USER</option>
                                    <%
                                    } else {
                                    %>
                                    <option value="2">USER</option>
                                    <option value="1">ADMIN</option>
                                    <%
                                        }
                                    %>
                                </select>
                                <%
                                    }
                                %>
                            </div>
                            <div  class="form-group">
                                <label for="address" class="form-label">Address</label>
                                <input type="text" class="form-control" name="address" placeholder="Address" required="" value="<%= userDetail.getAddress()%>"/>
                            </div>
                            <div  class="form-group">
                                <label for="birthday" class="form-label">Birthday</label>
                                <input type="date" pattern="\d{4}-\d{1,2}-\d{1,2}" class="form-control" name="birthday"  placeholder="Birthday" required="" value="<%= userDetail.getBirthday()%>"/>
                            </div>
                            <div  class="form-group">
                                <label for="phone" style="text-align: center" class="form-label">Phone</label>
                                <input type="text" id="phone" pattern="[0-9]{10}" class="form-control" name="phone" placeholder="Phone" required="" value="<%= userDetail.getPhone()%>"/>
                            </div>
                            <div  class="form-group form-button">
                                <input class="btn btn-primary text-white" type="submit" value="UpdateUser"/>
                                <input  type="hidden" name="email" value="<%= userDetail.getEmail()%>"/>
                                <input  type="hidden" name="search" value="${param.search}"/>
                            </div>
                        </form>
                        <%
                            }
                        %>  
                    </div>
                </div>
                <!-- Recent Sales End -->
            </div>
            <!--Product-->
            <%
            } else if (listProduct != null) {
                if (!listProduct.isEmpty()) {
            %>
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h3 style="margin-left: 20px;"style="margin-left: 20px;" class="mb-0">List Product<a style="margin-left: 5px" class="btn btn-warning" href="insertProduct.jsp">Insert Product</a></h3>
                        <%
                            String error_message = (String) request.getAttribute("ERROR_MESSAGE");
                            String success_message = (String) request.getAttribute("SUCCESS_MESSAGE");
                            if (error_message == null && success_message == null) {
                                success_message = "";
                        %>
                        <h3 class="text-success"><%= success_message%></h3>
                        <%
                        } else if (success_message == null) {
                            success_message = "";
                        %>
                        <h3 class="text-danger"><%= error_message%></h3>
                        <%
                        } else if (error_message == null) {
                            error_message = "";
                        %>
                        <h3 class="text-success"><%= success_message%></h3>
                        <%
                            }
                        %>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr style="text-align: center" class="text-dark">                                      
                                    <th scope="col">No</th>
                                    <th scope="col">Product ID</th>
                                    <th scope="col">Product Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Import Date</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Category ID</th>
                                    <th scope="col">Update</th>
                                    <th scope="col">Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int count = 1;
                                    for (ProductDTO product : listProduct) {
                                %>
                                <tr>
                                    <td><%= count++%></td>
                                    <td><%= product.getMA_SP()%> </td>
                                    <td><%= product.getTEN_SP()%></td>
                                    <td><%= product.getGIABAN()%></td>
                                    <td><%= product.getSOLUONG()%></td>
                                    <td><%= product.getNGAY_THEMSP()%></td>
                                    <td>                                     
                                        <img style="width: 40%" src="<%= product.getHINHANH_SP()%>" />
                                    </td>
                                    <td>
                                        <%
                                            if (product.getMA_DM() == 1) {
                                        %>
                                        IPHONE  
                                        <%
                                        } else if (product.getMA_DM() == 2) {
                                        %>
                                        MACBOOK
                                        <%
                                        } else if (product.getMA_DM() == 3) {
                                        %>TABLET
                                        <%
                                        } else if (product.getMA_DM() == 4) {
                                        %>ACCESSORY
                                        <%
                                            }

                                        %>
                                    </td>

                                    <td>
                                        <a id="update" class="btn btn-primary text-white"href="GetDetailProductController?productID=<%= product.getMA_SP()%>&search=${param.search}">Update</a>
                                    </td>
                                    <td>
                                        <a class="btn btn-danger text-white"href="DeleteProductController?productID=<%= product.getMA_SP()%>&search=${param.search}">Delete</a>
                                    </td>
                                </tr>                               
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>                        
                    </div>
                    <%
                        ProductDTO productDetail = (ProductDTO) request.getAttribute("PRODUCT_DETAIL");
                        if (productDetail == null) {
                            productDetail = new ProductDTO();
                        } else {
                    %>
                    <form action="UpdateProductController" 
                          method="POST" 
                          style="
                          width: 30%;
                          border: 1px solid;
                          border-radius: 30px;
                          margin: auto;
                          padding: 50px;" 
                          id="update-form"
                          >
                        <div class="form-group">
                            <label for="ProductID" class="form-label">Product ID:</label>
                            <input type="text" class="form-control" name="productID"  placeholder="ProductID" value="<%= productDetail.getMA_SP()%>" readonly=""/>
                        </div>
                        <div class="form-group">
                            <label for="ProductName" class="form-label">Product Name:</label>
                            <input type="text" class="form-control" name="productName" placeholder="Product Name" value="<%= productDetail.getTEN_SP()%>" required=""/>
                        </div>
                        <div class="form-group">
                            <label for="Price" class="form-label">Price</label>
                            <input type="number" step="0.1" class="form-control" name="price"  placeholder="Price" value="<%= productDetail.getGIABAN()%>" required=""/>
                        </div>
                        <div class="form-group">
                            <label for="Quantity" class="form-label">Quantity</label>
                            <input type="text" pattern="\d*" class="form-control" name="quantity" placeholder="Quantity" required="" value="<%= productDetail.getSOLUONG()%>"/>
                        </div>
                        <div class="form-group">
                            <label for="CategoryID" class="form-label">Category ID</label>
                            <select name="categoryID">
                                <%
                                    if (productDetail.getMA_DM() == 1) {
                                %>
                                <option value="1">IPHONE</option>
                                <option value="2">MACBOOK</option>
                                <option value="3">TABLER</option>
                                <option value="4">ACCESSORY</option>
                                <%
                                } else if (productDetail.getMA_DM() == 2) {
                                %>
                                <<option value="1">MACBOOK</option>
                                <option value="2">IPHONE</option>
                                <option value="3">TABLER</option>
                                <option value="4">ACCESSORY</option>
                                <%
                                } else if (productDetail.getMA_DM() == 3) {
                                %>
                                <<option value="1">TABLET</option>
                                <option value="2">MACBOOK</option>
                                <option value="3">IPHONE</option>
                                <option value="4">ACCESSORY</option>
                                <%
                                } else if (productDetail.getMA_DM() == 4) {
                                %>
                                <<option value="1">ACCESSORY</option>
                                <option value="2">MACBOOK</option>
                                <option value="3">TABLER</option>
                                <option value="4">IPHONE</option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="ImportDate" class="form-label">Import Date</label>
                            <input type="date" pattern="\d{4}-\d{1,2}-\d{1,2}" class="form-control" name="importDate" placeholder="Import Date" required="" value="<%= productDetail.getNGAY_THEMSP()%>"/>
                        </div>
                        <div class="form-group">
                            <label for="Image" class="form-label">Image</label>
                            <input type="text" class="form-control" name="image" placeholder="Image" required="" value="<%= productDetail.getHINHANH_SP()%>"/>
                        </div>
                        <div class="form-group form-button">
                            <input class="btn btn-primary text-white" type="submit" name="action" value="UpdateProduct"/>
                            <input  type="hidden" name="productID" value="<%= productDetail.getMA_SP()%>"/>
                            <input  type="hidden" name="search" value="${param.search}"/>     
                        </div>
                    </form>
                    <%
                        }
                    %>          
                </div>
            </div>
            <!-- Content End -->
            <%
            } else if (listOrder != null) {
                if (!listOrder.isEmpty()) {
            %>
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h3 style="margin-left: 20px;"style="margin-left: 20px;" class="mb-0">List Order</h3>
                        <%
                            String error_message = (String) request.getAttribute("ERROR_MESSAGE");
                            String success_message = (String) request.getAttribute("SUCCESS_MESSAGE");
                            if (error_message == null && success_message == null) {
                                success_message = "";
                        %>
                        <h3 class="text-success"><%= success_message%></h3>
                        <%
                        } else if (success_message == null) {
                            success_message = "";
                        %>
                        <h3 class="text-danger"><%= error_message%></h3>
                        <%
                        } else if (error_message == null) {
                            error_message = "";
                        %>
                        <h3 class="text-success"><%= success_message%></h3>
                        <%
                            }
                        %>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr style="text-align: center" class="text-dark">                                      
                                    <th scope="col">No</th>
                                    <th scope="col">Order ID</th>
                                    <th scope="col">Order Date</th>
                                    <th scope="col">Total Price</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int count = 1;
                                    for (OrderDTO order : listOrder) {
                                %>
                                <tr>
                                    <td><%= count++%></td>
                                    <td><%= order.getOrderID()%> </td>
                                    <td><%= order.getOrderDate()%></td>
                                    <td><%= order.getTotalOrder()%></td>
                                    <td><%= order.getEmailOrder()%></td>                                      
                                    <td>
                                        <a  class="btn btn-danger text-white"href="DeletOrder?orderID=<%=order.getOrderID()%>">Delete</a>
                                    </td>
                                </tr>                               
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>                        
                    </div>
                    
                    <%
                        }
                    %>          
                </div>
            </div>
            <!-- Content End -->
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/chart/chart.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="./js/main_admin.js"></script>
    </body>

</html>
