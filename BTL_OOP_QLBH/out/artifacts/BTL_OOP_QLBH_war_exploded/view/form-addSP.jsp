<%--
  Created by IntelliJ IDEA.
  User: luong
  Date: 12/9/2019
  Time: 11:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Product" %>
<%@ page import="services.ProductService" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="services.CustomerService" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Customer" %><%--
  Created by IntelliJ IDEA.
  User: luong
  Date: 12/7/2019
  Time: 1:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Add Product</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/form.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
<%@include file="header.jsp"%>

<!--Form Chỉnh Sửa Khác Hàng Và Sản Phẩm-->
<div class="container">
    <h2 style="color: red; margin-left: 200px;">${mesErr}</h2>
    <form action="${pageContext.request.contextPath}/addProduct" method="get" >
        <h3>Chỉnh Sửa thông tin sản phẩm</h3>
        <%
            CustomerService customerService = new CustomerService();
            List<Customer> customers = customerService.getAllCustomer();


        %>

        <div class="row">
            <div class="col-25">
                <label for="IMEI">IMEI :</label>
            </div>
            <div class="col-75">
                <input type="text" id="IMEI" name="IMEI"  placeholder="IMEI.."  >
            </div>
        </div>


        <div class="row">
            <div class="col-25">
                <label for="MAKH">Mã Khách hàng :</label>
            </div>
            <div class="col-75">
                <div class="form-group">
                    <select class="form-control" name="MAKH" id="MAKH">
                        <option selected >Chọn khách hàng</option>
                        <%
                            for (Customer customer: customers){


                        %>
                        <option value="<%=customer.getMaKH()%>"><%=customer.getDienThoai()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label for="TENSP">Tên Sản Phẩm :</label>
            </div>
            <div class="col-75">
                <input type="text" id="TENSP" name="TENSP"  placeholder="Tên Sản Phẩm..">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label for="NSX">Nhà Sản Xuất :</label>
            </div>
            <div class="col-75">
                <input type="text" id="NSX" name="NSX"  placeholder="Nhà Sản Xuất..">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label for="LOAISP">Loại SP :</label>
            </div>
            <div class="col-75">
                <input type="text" id="LOAISP" name="LOAISP" value="" placeholder="Loại SP..">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label for="THOIGIANBAOHANH">Thời gian bảo hành:</label>
            </div>
            <div class="col-75">
                <input type="text" id="THOIGIANBAOHANH" name="THOIGIANBAOHANH" value="" placeholder="Thời gian bảo hành..">
            </div>
        </div>

        <div class="col-25">
            <label for="THONGTINSP">Thông Tin SP</label>
        </div>
        <div class="col-75">
                <textarea id="THONGTINSP" id="THONGTINSP" name="THONGTINSP" value="" placeholder="Thông Tin SP.."
                          style="height:200px"></textarea>
        </div>

        <div class="row">
            <input type="submit" value="Update">
        </div>


    </form>
</div>

<%@include file="footer.jsp"%>
</body>
</html>
v
