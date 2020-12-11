<%-- 
    Document   : cart
    Created on : Jul 1, 2020, 9:04:02 PM
    Author     : Ngọc Lan
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Item"%>
<%@page import="entity.Item"%>
<%@page import="entity.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" href="css/home-style.css">
        <link rel="stylesheet" href="css/merch-style.css">
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
        <!--HEADER-->

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
                        <% } %>
                    <li class="toggle"><span class="bars"></span></li>
                </ul>
            </nav>
        </header>
        <!-- BANNER -->
        <section class="breadcrumb_part">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb_iner">
                            <h2>Your Cart</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- CART AREA -->
        <%
            if (obj == null) {
        %>
        <div class="no-item">
            <p>You don't have any items in your cart!</p>
        </div>
        <% } else {
            Cart cart = (Cart) obj;
            List<Item> items = (ArrayList) cart.getItems();
            if (items.isEmpty()) {
        %>
        <div class="no-item">
            <p>You don't have any items in your cart!</p>
        </div>
        <% } else {%>

        <section class="cart_area section_padding">
            <div class="container">
                <div class="cart_inner">
                    <form action="checkout?username=${sessionScope.visitor.username}" method="post">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Product</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (Item i : items) {
                                    %>
                                    <tr>
                                        <td>
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img src="<%=i.getProduct().getImage()%>" alt="" />
                                                </div>
                                                <div class="media-body">
                                                    <p><%=i.getProduct().getPname()%></p>
                                                    <p class="stock">Available: <b><%=i.getProduct().getStock()%></b></p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <h5>$<%=i.getProduct().getPrice()%></h5>
                                        </td>
                                        <td>
                                            <div class="box">
                                                <input class="quantity" type="number" value="<%=i.getQuantity()%>" min="0" max="<%=i.getProduct().getStock()%>" readonly>
                                            </div>
                                        </td>
                                        <td>
                                            <h5 id="field">$<%=i.getQuantity() * i.getPrice()%></h5>
                                        </td>
                                        <td class="remove"><a href="removeItem?id=<%=i.getProduct().getPid()%>"><i class="far fa-window-close"></i></a></td>
                                    </tr>
                                    <% } %>
                                    <tr class="bottom_button">
                                        <td>
                                            <a class="btn_1" href="getMerch">Continue shopping</a>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <h2>Subtotal:</h2>
                                        </td>
                                        <%
                                            Double total = 0.0;
                                            for (Item i : items) {
                                                total += i.getPrice() * i.getQuantity();
                                            }
                                            DecimalFormat df = new DecimalFormat("#.##");

                                        %>
                                        <td>
                                            <h5>$<%=df.format(total)%></h5>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <p style="text-align: right; font-style: italic;">
                                Excluding taxes and shipping
                            </p>
                            <div class="checkout_btn_inner float-right" style="margin-bottom: 30px; margin-top: 20px;">
                                <input id="proceed" type="Submit" value="Proceed to checkout">
                            </div>
                        </div>
                    </form>
                </div>
        </section>
        <% }
            }
        %>
        <%@include file="part/footer.html" %>
        <% }%>
    </body>
</html>
