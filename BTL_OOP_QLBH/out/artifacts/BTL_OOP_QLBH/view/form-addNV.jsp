<%-- 
    Document   : form-addNV
    Created on : Dec 9, 2019, 12:12:19 AM
    Author     : Admin
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Form Thêm Nhân Viên</title>
        <link rel="stylesheet" href="view/css/style.css">
        <link rel="stylesheet" href="view/css/form.css">
    </head>

    <body>
      <%@include file="header.jsp"%>
        <!--Form Thêm Nhân Viên-->
        <div class="container">
            <h2 style="color: red; margin-left: 200px;">${error}</h2>
        <form action="${pageContext.request.contextPath}/add-employees" method="POST" >
            <h3>Nhập Thông Tin Nhân Viên</h3>
            <div class="row">
                <div class="col-25">
                    <label for="TENNV">Tên nhân viên :</label>
                </div>
                <div class="col-75">
                    <input type="text" id="TENNV" name="TENNV" placeholder="Tên nhân viên..">
                </div>
            </div>

            <div class="row">
                <div class="col-25">
                    <label for="SDT">Số điện thoại :</label>
                </div>
                <div class="col-75">
                    <input type="text" id="SDT" name="SDT" placeholder="Số điện thoại..">
                </div>
            </div>

            <div class="row">
                <div class="col-25">
                    <label for="EMAIL">Email :</label>
                </div>
                <div class="col-75">
                    <input type="text" id="EMAIL" name="EMAIL" placeholder="Email..">
                </div>
            </div>
            
            <div class="row">
                <div class="col-25">
                    <label for="DCNV">Địa chỉ :</label>
                </div>
                <div class="col-75">
                    <input type="text" id="DCNV" name="DCNV" placeholder="Địa chỉ..">
                </div>
            </div>

            <div class="row">
                <input type="submit" value="Thêm">
            </div>
        </form>


    </div>

        <!--Footder-->
       <%@include file="footer.jsp"%>
    </body>

</html>