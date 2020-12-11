<%-- 
    Document   : findus
    Created on : Jul 10, 2020, 12:34:39 AM
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
        <title>Find us</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Discovery</title>
        <link rel="stylesheet" href="css/home-style.css">
        <link rel="stylesheet" href="css/discovery-style.css">
        <%@include file="part/icon.html" %>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <link
            href="https://fonts.googleapis.com/css?family=Alegreya+SC|Amatic+SC|Bahianita|Bubblegum+Sans|Fredericka+the+Great|Handlee|Love+Ya+Like+A+Sister|Luckiest+Guy|Nothing+You+Could+Do|Open+Sans+Condensed:300|Permanent+Marker|Shadows+Into+Light|Zilla+Slab&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Dosis&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
              integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

        <!--        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">-->

        <script
            src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8="
        crossorigin="anonymous"></script>
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
        <link type="text/css" rel="stylesheet" href="css/findus-style.css">
    </head>
    <body>
        <nav>
            <ul class="menu">
                <li class="logo"><a href="index.jsp"><img src="img/logo.png" alt=""></a></li>
                <li class="item"><a href="index.jsp">Home</a></li>
                <li class="item"><a href="discovery.jsp">Discovery</a></li>
                <li class="item"><a href="findus.jsp">Find us</a></li>
                <li class="item"><a href="getMerch">Shop</a></li>
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
                <li class="item" id="user"><a href=""><i class="fas fa-user"></i>${sessionScope.visitor.username}</a></li>
                <li class="item button secondary"><a href="logout">Log Out</a></li>
                <li class="item cart"><a href="cart.jsp"><i class="fas fa-shopping-cart"></i>(<%=noOfItems%>)</a></li>
                    <% }%>
                <li class="toggle"><span class="bars"></span></li>
            </ul>
        </nav>
                
        <div class="content-contact">
            <h1>Contact me</h1>
            <div class="info">
                <span><em>Send your message</em></span>
                <div class="border-contact"></div>
                <div id="error-message" class="alert-error closeDialog">
                    <button type="button" class="close" onclick="closeDialog()">×</button>
                    <span id="content-message">We could not understand the email address.</span>
                </div>
                <div id="success-message" class="alert-success closeDialog">
                    Thank for your message.
                </div>
            </div>
            <form id="sendMessage">
                <div class="send">
                    <p>Write your message here. Fill out the form:</p>
                    <div class="row1">
                        <input type="text" name="name" placeholder="Write your name here" required="">
                        <input type="email" name="email" placeholder="Write your email here" required="">
                    </div>
                    <div class="row2">
                        <textarea name="message" placeholder="Write your message here" required=""></textarea>
                    </div>
                    <input type="submit" id="submit" name="submit" value="Send">
                </div>
            </form>
        </div>
                
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.4823308941677!2d105.52509761476313!3d21.013378286006777!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313454b32ca5086d%3A0xa3c62e29d8ab37e4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgSMOgIE7hu5lp!5e0!3m2!1svi!2s!4v1595266443487!5m2!1svi!2s" 
                width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
            <%@include file="part/footer.html" %>
    </body>
</html>
