<%-- 
    Document   : viewStock
    Created on : Jul 1, 2020, 3:36:49 PM
    Author     : Ngọc Lan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entity.Product"%>
<%@page import="model.ProductDAO"%>
<%@page import="entity.ProductType"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="model.ProductTypeDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stocks</title>
        <link rel="stylesheet" href="css/admin.css">
        <link href="https://fonts.googleapis.com/css?family=Anton&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
        <%@include file="part/icon.html" %>
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    </head>
    <body>
        <%
            if (session.getAttribute("admin") == null) {
        %>
        <div id="alert" class="alert">
            <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
            <strong>Sorry!</strong> You don't have permission to view this site 😢
        </div> 
        <%  } else {%>
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
            <%
                ProductTypeDAO ptdb = new ProductTypeDAO();
                ProductDAO pdb = new ProductDAO();
                List<Product> listAll = pdb.getAllProducts();
                int noOfPros = listAll.size();
                int noOfHai = pdb.getProductStock("hai");
                int noOfMak = pdb.getProductStock("mak");
                int noOfMas = pdb.getProductStock("mas");
                int noOfMoi = pdb.getProductStock("moi");
                int noOfSun = pdb.getProductStock("sun");
                int noOfTon = pdb.getProductStock("ton");
                List<ProductType> typeList = ptdb.getAllTypes();
                String typeN = (String) request.getAttribute("typeN");
            %>
            <div class="main_content">
                <div class="header">View Stock</div>

                <div class="info">
                    <div>
                        <table class="table table-sm" id="sumTable">
                            <thead>
                                <tr>
                                    <% 
                                    for(ProductType type : typeList){
                                    %>
                                    <th scope="col"><%=type.getTname()%></th>
                                    <% } %>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                <% 
                                for(ProductType type2 : typeList){
                                    String typeid = type2.getTypeid();
                                %>
                                
                                    <td><%=pdb.getProductStock(typeid)%></td>
                                
                                <% } %>
                                </tr>
                            </tbody>
                        </table>
                        <div class="sumup">
                            <h3>Total Product: <%=noOfPros%></h3>
                        </div>
                    </div>
                    <form action="viewStock" method="post" id="f1" >
                        <div class="product-type" id="#product-type">
                            <div>
                                <select name="productType" onchange="f1.submit()">
                                    <option value="all">--All--</option>
                                    <%
                                        for (ProductType pt : typeList) {
                                    %>
                                    <option value="<%=pt.getTname()%>" ><%=pt.getTname()%></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                        <div class="addnew">
                            <input type="button" value="Add Product" onclick="location.href = 'newProduct.jsp';">
                        </div>
                        <div class="product-info">
                            <table class="table">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Product Name</th>
                                        <th scope="col">Type</th>
                                        <th scope="col">Brand</th>
                                        <th scope="col">image</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Stock</th>
                                        <th scope="col"></th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List<Product> pList = (ArrayList<Product>) request.getAttribute("pList");
                                        for (Product p : pList) {
                                    %>
                                    <tr>
                                        <td><%= p.getPid()%></td>
                                        <td><%= p.getPname()%></td>
                                        <td><%=p.getTypeid()%></td>
                                        <td><%=p.getBrand()%></td>
                                        <td><img class="zoom" src="<%=p.getImage()%>"></td>
                                        <td><%=p.getPrice()%></td>
                                        <td><%=p.getStock()%></td>
                                        <td><input type="button" class="edit-btn" onclick="location.href = 'edit?pid=<%= p.getPid()%>'" value="Edit"></td>
                                        <td><input type="button" class="remove-btn" onclick="location.href = 'remove?pid=<%= p.getPid()%>'" value="Remove"></td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </form>

                </div>
            </div>
        </div>
        <% }%>
    </body>
</html>
