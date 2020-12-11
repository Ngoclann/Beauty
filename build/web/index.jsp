
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Item"%>
<%@page import="entity.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>L-BEAUTY!</title>
        <link rel="stylesheet" href="css/home-style.css">
        <%@include file="part/icon.html" %>
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
                    <li class="item" id="user"><a href=""><i class="fas fa-user"></i> ${sessionScope.visitor.username}</a></li>
                    <li class="item button secondary"><a href="logout">Log Out</a></li>
                    <li class="item cart"><a href="cart.jsp"><i class="fas fa-shopping-cart"></i>(<%=noOfItems%>)</a></li>
                        <% }
                        %>

                    <li class="toggle"><span class="bars"></span></li>
                </ul>
            </nav>
        </header>
        <!-- HEADER -->
        <div class="wrapper">
            <div id="quote">
                <p>" Since love grows within you, so beauty grows. For love is the beauty of the soul. "</p>
                <p>Saint Augustine</p>
            </div>

            <header class="text-center text-white d-flex">
                <div class="container my-auto">
                    <div class="row">
                        <div class="col-lg-12 my-auto">
                            <h1 class="text-uppercase faded" id="tek">
                                <strong>
                                    <p id="wt">WELCOME TO</p>
                                    <p id="highlight">L-BEAUTY</p>
                                </strong>
                            </h1>
                            <hr>
                        </div>
                        <div class="col-lg-12 my-auto" id="sns">
                            <a href="https://www.facebook.com/ngoclann22/" target="blank"><i
                                    class="fab fa-facebook"></i></a>
                            <a href="https://www.instagram.com/meow_bubble/" target="blank"><i
                                    class="fab fa-instagram"></i></a>
                            <a href="https://twitter.com/TriLy9" target="blank"><i
                                    class="fab fa-twitter" ></i></a>
                            <a href="https://www.youtube.com/channel/UC6gp1ymmcB2MVZGLuXy_VEQ" target="blank"><i
                                    class="fab fa-youtube"></i></a>
                        </div>
                    </div>
                </div>


            </header>
        </div>
        <%@include file="part/footer.html" %>
        <script>
            function noticeLogin() {
                alert("You need to login first!");
            }
        </script>
    </body>
</html>
