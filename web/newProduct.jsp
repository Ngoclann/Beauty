<%-- 
    Document   : newProduct
    Created on : Jul 1, 2020, 12:09:08 AM
    Author     : Ngọc Lan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new product</title>
        <link rel="stylesheet" href="css/admin.css">
        <link rel="stylesheet" href="css/new-product-style.css">
        <link href="https://fonts.googleapis.com/css?family=Anton&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
        <%@include file="part/icon.html" %>
    </head>
    <body>
        <%
            if (session.getAttribute("admin") == null) {
        %>
        <div id="alert" class="alert">
            <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
            <strong>Sorry!</strong> You don't have permission to view this site 😢
        </div>
        <% } else {%>
        <div class="wrapper">
            <div class="sidebar">
                <h4>L-Beauty</h4>
                <ul>
                    <li><a href="viewStock">View Stocks</a></li>
                    <li><a href="viewOrder.jsp">View Orders</a></li>
                </ul>
                <div class="social_media">
                    <a href="logoutAdmin">Log-out</a>
                </div>
            </div>
            <div class="main_content">
                <div class="header">Add new Product</div>

                <div class="info">
                    <%
                        if (request.getAttribute("error") != null) {
                            String err = (String) request.getAttribute("error");
                    %>
                    <div id="alert" class="alert">
                        <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                        <strong><%=err%></strong>
                    </div>
                    <% }%>
                    <div class="add-product">
                        <form action="addproduct" method="post">
                            Product ID 
                            <input id="id" type="text" name="id" required> &nbsp;
                            Product Name
                            <input id="name" class="text-field" type="text" name="name" required> <br>
                            <c:set var="typedb" value="<%=new model.ProductTypeDAO()%>"/>
                            <c:set var="typeList" value="${typedb.getAllTypes()}"/>
                            Type
                            <select class="drop-down" name="type" required>
                                <option value="none">--choose type--</option>
                                <c:forEach items="${typeList}" var="pt">
                                    <option value="${pt.typeid}">${pt.tname}</option>
                                </c:forEach>
                            </select> &nbsp;
                            <c:set var="bdb" value="<%=new model.BrandDAO()%>"/>
                            <c:set var="bList" value="${bdb.getAllBrands()}"/>
                            Brand 
                            <select class="drop-down" name="brand" required>
                                <option value="none">--choose brand--</option>
                                <c:forEach items="${bList}" var="b">
                                    <option value="${b.id}" selected>${b.name}</option>
                                </c:forEach>
                            </select> <br>
                            Image
                            <input id="image" class="text-field" type="text" name="image" required> &nbsp;
                            Price 
                            <input id="price" class="text-field" type="number" min="0" name="price" required> &nbsp;
                            Stock 
                            <input id="stock" class="text-field" type="number" min="0" name="stock" required><br>
                            <div class="button-outer">
                                <input  class="submit" type="submit" value="Add">
                                <input class="cancel" type="button" value="Cancel" onclick="location.href='viewStock';">
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <% }%>
    </body>
</html>
