<%-- 
    Document   : viewBill
    Created on : Jul 1, 2020, 6:53:42 PM
    Author     : Ngọc Lan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entity.Item"%>
<%@page import="entity.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Purchase Succeed</title>
        <link rel="stylesheet" href="css/home-style.css">
        <link rel="stylesheet" href="css/merch-style.css">
        <link rel="stylesheet" href="css/viewBill-style.css">
        <link rel="stylesheet" href="css/cart-style.css">
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
    </head>
    <body>
        <%
            if (session.getAttribute("visitor") == null) {
        %> 
        <h1 style="margin: 0; position: absolute; top: 50%; left: 50%;
            transform: translate(-50%, -50%);
            background: -webkit-linear-gradient(#ff96f6, #5b95d5);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;">You cannot access this site!</h1>
        <% } else {%>
        <!--        HEADER-->

        <header>
            <nav>
                <ul class="menu">
                    <li class="logo"><a href="index.jsp"><img src="img/logo.png" alt=""></a></li>
                    <li class="item"><a href="index.jsp">Home</a></li>
                    <li class="item"><a href="discovery.jsp">Discovery</a></li>
                    <li class="item"><a href="findus.jsp">Find us</a></li>
                    <li class="item"><a href="getMerch">Shop</a></li>
                    </li>
                    <li class="item" id="user"><a href=""><i class="fas fa-user"></i> ${sessionScope.visitor.username}</a></li>
                    <li class="item button secondary"><a href="logout">Log Out</a></li>
                        <%
                            Object obj = session.getAttribute("cart");
                            int noOfItems = 0;
                            if (obj != null) {
                                Cart cart = (Cart) obj;
                                ArrayList<Item> list = (ArrayList<Item>) cart.getItems();
                                noOfItems = list.size();

                        %>
                    <li class="item cart"><a href="cart.jsp"><i class="fas fa-shopping-cart"></i>(<%=noOfItems%>)</a></li>
                        <% } else {%>
                    <li class="item cart"><a href="cart.jsp"><i class="fas fa-shopping-cart"></i>(0)</a></li>
                        <% }%>
                    <li class="toggle"><span class="bars"></span></li>
                </ul>
            </nav>
        </header>
        <section class="breadcrumb_part">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb_iner" style="font-size: 50px; letter-spacing: 10px;">
                            <h2>Order Successful</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <h3>Thanks, ${sessionScope.visitor.username} 😍</h3>
        <div class="backtohome">
            <input type="button" value="Back to Homepage" onclick="location.href = 'index.jsp';">
        </div>

        <%@include file="part/footer.html" %>
        <% }%>
    </body>
</html>
