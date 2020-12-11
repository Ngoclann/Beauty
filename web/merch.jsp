
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Item"%>
<%@page import="entity.Cart"%>
<%@page import="entity.Brand"%>
<%@page import="java.util.List"%>
<%@page import="model.BrandDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>SHOP</title>
        <link rel="stylesheet" href="css/home-style.css">
        <link rel="stylesheet" href="css/merch-style.css">
        <%@include file="part/icon.html" %>
        <link href="https://fonts.googleapis.com/css?family=Economica|Rancho|Special+Elite&display=swap" rel="stylesheet">
        <link
            href="https://fonts.googleapis.com/css?family=Alegreya+SC|Amatic+SC|Bahianita|Bubblegum+Sans|Fredericka+the+Great|Handlee|Love+Ya+Like+A+Sister|Luckiest+Guy|Nothing+You+Could+Do|Open+Sans+Condensed:300|Permanent+Marker|Shadows+Into+Light|Zilla+Slab&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Dosis&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
              integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8=" crossorigin="anonymous"></script>
        <script>
            $(function () {
                $(".toggle").on("click", function () {
                    if ($(".item").hasClass("active")) {
                        $(".item").removeClass("active");
                    } else {
                        $(".item").addClass("active");
                    }
                });
            });
        </script>
    </head>
    <body>
        <header>
            <nav>
                <ul class="menu">
                    <li class="logo"><a href="index.jsp"><img src="img/logo.png" alt=""></a></li>
                    <li class="item"><a href="getMerch?name=Hair Care">Hair Care</a></li>
                    <li class="item"><a href="getMerch?name=Makeup">Makeup</a></li>
                    <li class="item"><a href="getMerch?name=Mask">Mask</a></li>
                    <li class="item"><a href="getMerch?name=Moisturizer">Moisturizer</a></li>
                    <li class="item"><a href="getMerch?name=Sun Care">Sun Care</a></li>
                    <li class="item"><a href="getMerch?name=Toner">Toner</a></li>
                    </li>
                    <%
                        if (session.getAttribute("visitor") == null) {
                    %>
                    <li class="item button"><a href="login.jsp">Log In</a></li>
                    <li class="item button secondary"><a href="signup.jsp">Sign Up</a></li>
                    <li class="item cart"><a href="" onclick="noticeLogin()"><i class="fas fa-shopping-cart"></i></a></li>
                            <% } else {
                                Object obj = session.getAttribute("cart");
                                int noOfItems = 0;
                                if (obj != null) {
                                    Cart cart = (Cart) obj;
                                    ArrayList<Item> list = (ArrayList<Item>) cart.getItems();
                                    noOfItems = list.size();
                                }
                            %>
                    <li class="item" id="user"><a href=""><i class="fas fa-user"></i> ${sessionScope.visitor.username}</a></li>
                    <li class="item button secondary"><a href="logout">Log Out</a></li>
                    <li class="item cart"><a href="cart.jsp"><i class="fas fa-shopping-cart"></i>(<%=noOfItems%>)</a></li>
                        <%
                            }%>
                    <li class="toggle"><span class="bars"></span></li>
                </ul>
            </nav>
        </header>
        <!-- HEADER -->
        <% String title = "";
            if (request.getAttribute("title") != null) {
                title = (String) request.getAttribute("title");
            }
        %>
        <section class="breadcrumb_part">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb_iner">
                            <h2>MERCH</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Best Seller -->
        <c:set var="pdb" value="<%= new model.ProductDAO()%>"/>
        <c:set var="mostBoughtProduct" value="${pdb.getTopProducts()}"/>
        <section class="product_list section_padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="banner col-lg-12 col-md-12 col-sm-12">
                            Best Seller
                        </div>
                        <form id="f1">
                            <div class="product_list">
                                <div class="row">
                                    <c:forEach items="${mostBoughtProduct}" var="mbp">
                                        <div class="col-lg-2 col-md-4 col-sm-6">
                                            <div class="single_product_item">
                                                <img id="pro-image" src="${mbp.image}" alt="#" class="img-fluid">
                                                <h3 style="font-size: 20px;"> <a href="#">${mbp.pname}</a> </h3>
                                                <p>$${mbp.price}</p>
                                                <c:if test="${mbp.stock==0}">

                                                    <input class="add-to-cart" type="button" value="SOLD OUT" style="color: white; background-color: red" onclick="soldOutNotice()">
                                                </c:if>
                                                <c:if test="${mbp.stock > 0}">
                                                    <%
                                                        if (session.getAttribute("visitor") == null) {
                                                    %>
                                                    <input class="add-to-cart" type="button" value="Add to Cart" onclick="notice()">
                                                    <% } else {%>
                                                    <input class="add-to-cart" type="button" value="Add to Cart" onclick="location.href = 'addtocart?pid=${mbp.pid}&title=<%=title%>';">
                                                    <% }%>
                                                </c:if>

                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <!-- breadcrumb part start-->
        <section class="product_list section_padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <c:set var="s" value="${param.search}"/>
                        <c:set var="b" value="${param.brand}"/>
                        <c:set var="p" value="${param.price}"/>
                        <%
                            String brand = "";
                            String price = "";
                            if (request.getAttribute("brand") != null) {
                                brand = (String) request.getAttribute("brand");
                            }
                            if (request.getAttribute("price") != null) {
                                price = (String) request.getAttribute("price");
                            }
                        %>
                        <form action="getMerch?name=<%=title%>" method="post">
                            <div class="product_sidebar">
                                <div class="single_sedebar">
                                    <input type="text" name="search" value="${s}" placeholder="Search keyword">
                                    <i class="ti-search"></i>
                                </div>
                                <div class="single_sedebar">
                                    <div class="select_option">
                                        <%
                                            BrandDAO bdb = new BrandDAO();
                                            List<Brand> bList = bdb.getAllBrands();
                                        %>
                                        <select name="brand" id="" class="select_option_list"><i
                                                class="right fas fa-caret-down"></i>
                                            <option value="all" class="select_option_dropdown">--ANY BRAND--</option>
                                            <%
                                                for (Brand a : bList) {
                                            %>
                                            <option value="<%=a.getName()%>" class="select_option_dropdown" <%=(a.getName().equalsIgnoreCase(brand)) ? "selected" : ""%>><%=a.getName()%></option>
                                            <% }%>
                                        </select>
                                    </div>
                                </div>
                                <div class="single_sedebar">
                                    <div class="select_option">
                                        <select name="price" id="" class="select_option_list"><i
                                                class="right fas fa-caret-down"></i>
                                            <option value="all" <%=(price.equalsIgnoreCase("all") ? "selected" : "")%>  class="select_option_dropdown">--ANY PRICE--</option>
                                            <option value="<20" <%=(price.equalsIgnoreCase("<20") ? "selected" : "")%> class="select_option_dropdown">Less than 20$</option>
                                            <option value="20-30" <%=(price.equalsIgnoreCase("20-30") ? "selected" : "")%> class="select_option_dropdown">From 20$ to 30$</option>
                                            <option value="30-50" <%=(price.equalsIgnoreCase("30-50") ? "selected" : "")%> class="select_option_dropdown">From 30$ to 50$</option>
                                            <option value=">=50" <%=(price.equalsIgnoreCase(">=50") ? "selected" : "")%> class="select_option_dropdown">More than 50$</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="single_sedebar">
                                    <div class="search-button">
                                        <input type="submit" value="Search">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="col-md-9">
                        <div class="banner col-lg-12 col-md-12 col-sm-12">
                            <%=title%>
                        </div>
                        <form id="f1">
                            <div class="product_list">
                                <div class="row">
                                    <c:forEach items="${requestScope.pList}" var="product">
                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                            <div class="single_product_item">
                                                <img src="${product.image}" alt="#" class="img-fluid">
                                                <h3> <a href="#">${product.pname}</a> </h3>
                                                <p>$${product.price}</p>
                                                <c:if test="${product.stock==0}">

                                                    <input class="sold-out" type="button" value="SOLD OUT" style="color: white; background-color: red" onclick="soldOutNotice()">
                                                </c:if>
                                                <c:if test="${product.stock > 0}">
                                                    <%
                                                        if (session.getAttribute("visitor") == null) {
                                                    %>
                                                    <input class="add-to-cart" type="button" value="Add to Cart" onclick="notice()">
                                                    <% } else {%>
                                                    <input class="add-to-cart" type="button" value="Add to Cart" onclick="location.href = 'addtocart?pid=${product.pid}&title=<%=title%>';">
                                                    <% }%>
                                                </c:if>

                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- PRODUCT -->
        <!-- Most bought -->

        <%@include file="part/footer.html" %>
        <script>
            function soldOutNotice() {
                alert("This item has sold out :( please buy another one");
            }

            function notice() {
                alert("You have to login to start shopping :(");
            }
            function noticeLogin() {
                alert("You need to login first!");
            }
        </script>
    </body>
</html>
