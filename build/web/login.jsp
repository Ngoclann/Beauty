
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="css/login-style.css">
        <link rel="stylesheet" href="css/sign-up-style.css">
        <%@include file="part/icon.html" %>
        <link href="https://fonts.googleapis.com/css?family=Doppio+One|Oxanium&display=swap" rel="stylesheet">

    </head>
    <body>
        <%
            Cookie[] listCookie = request.getCookies();
            String u = "";
            String p = "";
            String r = "";
            int i = 0;
            if (listCookie != null) {
                while (i < listCookie.length) {
                    if (listCookie[i].getName().equals("user")) {
                        u = listCookie[i].getValue();
                    }
                    if (listCookie[i].getName().equals("pass")) {
                        p = listCookie[i].getValue();
                    }
                    if (listCookie[i].getName().equals("rem")) {
                        r = listCookie[i].getValue();
                    }
                    i++;
                }
            }
        %>

        <div class="hero">
            <%
                if (request.getAttribute("error") != null) {
                    String err = (String) request.getAttribute("error");
            %>
            <div id="alert" class="alert">
                <strong><%=err%></strong>
            </div>
            <% }%>
            <div class="form-box">
                <div class="button-box">
                    <div id="btn"></div>
                    <button type="button" class="toggle-btn" onclick="loginuser()">User</button>
                    <button type="button" class="toggle-btn" onclick="loginadmin()">Admin</button>
                </div>
                <div class="social-icons">
                    <img src="img/logo.png" alt="">
                </div>
                <form id="login-user" action="login" method="post" class="input-group">
                    <input type="text" name="username" value="<%=u%>" class="input-field" placeholder="Account" required>
                    <input type="password" name="password" value="<%=p%>" class="input-field" placeholder="Password" required>
                    <input type="checkbox" name ="rem" value="ON"
                           <%= "ON".equals(r) ? "checked = 'checked'" : ""%> class="check-box"><span>Remember me</span>
                    <input type="submit" class="submit-btn" value="Login">
                </form>
                <form id="login-admin" action="loginAdmin" method = "post" class="input-group">
                    <input type="text" class="input-field" name="username" placeholder="Account" required>
                    <input type="password" class="input-field" name="password" placeholder="Password" required>
                    <input type="submit" class="submit-btn" id="loginAd" value="Login">
                </form>


            </div>

        </div>
        <script>
            var x = document.getElementById("login-user");
            var y = document.getElementById("login-admin");
            var z = document.getElementById("btn");

            function loginadmin() {
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
            function loginuser() {
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }
        </script>
    </body>
</html>
