<%@ page import="model.Customer" %>
<%@ page import="services.CustomerService" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: luong
  Date: 12/7/2019
  Time: 2:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Edit Customer</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/form.css">

</head>
<body>
<%@include file="header.jsp"%>

<!--Form edit customer -->
<div class="container">
    <h2 style="color: red; margin-left: 200px;">${mesErr}</h2>
    <form action="${pageContext.request.contextPath}/edit-customer" method="get" >
        <%
            CustomerService customerService = new CustomerService();
            String maKH = request.getParameter("maKH");
            Customer customer =customerService.searchByMaKH(Integer.parseInt(maKH));


        %>
        <h3>Chỉnh Sửa thông tin khách hàng</h3>
        <div class="row">
            <div class="col-25">
                <label for="MAKH">Mã khách hàng :</label>
            </div>
            <div class="col-75">
                <input type="text" id="MAKH" name="MAKH" value="<%=customer.getMaKH()%>" readonly >
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label for="TENKH">Tên khách hàng :</label>
            </div>
            <div class="col-75">
                <input type="text" id="TENKH" name="TENKH" value="<%=customer.getTenKH()%>" placeholder="Tên khách hàng.." >
            </div>
        </div>

        <div class="row">
            <div class="col-25">
                <label for="DIENTHOAI">Số điện thoại :</label>
            </div>
            <div class="col-75">
                <input type="text" id="DIENTHOAI" name="DIENTHOAI" value="<%=customer.getDienThoai()%>" placeholder="Số điện thoại..">
            </div>
        </div>

        <div class="row">
            <div class="col-25">
                <label for="EMAIL">Email :</label>
            </div>
            <div class="col-75">
                <input type="text" id="EMAIL" name="EMAIL" value="<%=customer.getEmail()%>" placeholder="Email..">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label for="DIACHI">Địa chỉ :</label>
            </div>
            <div class="col-75">
                <input type="text" id="DIACHI" name="DIACHI" value="<%=customer.getDiaChi()%>" placeholder="Địa chỉ..">
            </div>
        </div>

        <div class="row">
            <input type="submit" value="Update">
        </div>



    </form>
</div>

<%@include file="footer.jsp"%>
</body>
</html>
