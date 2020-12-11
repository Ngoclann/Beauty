

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <link rel="stylesheet" href="css/sign-up-style.css">
        <%@include file="part/icon.html" %>
    </head>
    <body>
        <form id="frm" name="signup" class="box" action="signup" method="post" onsubmit="return validateForm(event)">
            <%
                if (request.getAttribute("error") != null) {
                    String err = (String) request.getAttribute("error");
            %>
            <div id="alert" class="alert">
                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                <strong><%=err%></strong>
            </div>
            <% }%>
            <p id="message" style="color: whitesmoke;"></p>
            <h1>Sign Up</h1>
            <input type="text" name="username" value="${requestScope.user}" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="text" name="email" placeholder="Email">
            <input type="password" name="repassword" placeholder="Confirm Password" required>
            <input type="submit" name="" value="Sign Up">
        </form>
        <script>
            function validateForm(event)
            {
                var username = document.signup.username.value;
                var pass = document.signup.password.value;
                var repass = document.signup.repassword.value;
                var email = document.signup.email.value;
                var regexUsername = new RegExp("^(?=.{8,10}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$");
                var regexEmail = new RegExp("^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$");
                var regexPass = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,10}/;
                event.preventDefault(); // this will prevent the submit event.
                if (document.signup.username.value == "")
                {
                    document.getElementById("message").innerHTML = 'Username cannot be left blank!';
                    document.signup.username.focus();
                    return false;
                } else if(!regexUsername.test(username)){
                    document.getElementById("message").innerHTML = 'Invalid username! Please choose another one';
                    document.signup.username.focus();
                } else if(email != "" && !regexEmail.test(email)){
                    document.getElementById("message").innerHTML = 'Invalid email address!';
                    document.signup.email.focus();
                    return false;
                }
                else if (document.signup.password.value == "")
                {
                    document.getElementById("message").innerHTML = 'Password cannot be left blank!';
                    document.signup.password.focus();
                    return false;
                }  else if(!regexPass.test(pass)){
                    document.getElementById("message").innerHTML = 'Invalid password! Please try another one';
                    document.signup.password.focus();
                    return false;
                }
                else if (pass != repass){
                    document.getElementById("message").innerHTML = 'Password not match!';
                    document.signup.repassword.focus();
                    return false;
                } else {
                    //document.getElementById("frm").submit();// fire submit event
                    document.signup.submit();
                }
            }
        </script>
    </body>
</html>
