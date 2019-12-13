<%-- 
    Document   : form-editNV
    Created on : Dec 9, 2019, 12:42:55 AM
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
    <title>Form Chỉnh Sửa Nhân Viên</title>
    <link rel="stylesheet" href="view/css/style.css">
    <link rel="stylesheet" href="view/css/form.css">
</head>

<body>
   <%@include file="header.jsp"%>

    <!--Form Chỉnh Sửa Nhân Viên-->
    <div class="container">
        <h2 style="color: red; margin-left: 200px;">${error}</h2>
        <form action="edit-employees" method="post">
            <input name="MANV" value="${MANV}" hidden="">
            <h3>Chỉnh Sửa Thông Tin Nhân Viên có Mã là ${MANV}</h3>
            <div class="row">
                <div class="col-25">
                    <label for="TENNV">Tên nhân viên :</label>
                </div>
                <div class="col-75">
                    <input type="text" id="TENNV" name="TENNV" value="" placeholder="Tên nhân viên..">
                </div>
            </div>

            <div class="row">
                <div class="col-25">
                    <label for="SDT">Số điện thoại :</label>
                </div>
                <div class="col-75">
                    <input type="text" id="SDT" name="SDT" value="" placeholder="Số điện thoại..">
                </div>
            </div>

            <div class="row">
                <div class="col-25">
                    <label for="EMAIL">Email :</label>
                </div>
                <div class="col-75">
                    <input type="text" id="EMAIL" name="EMAIL" value="" placeholder="Email..">
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="DCNV">Địa chỉ :</label>
                </div>
                <div class="col-75">
                    <input type="text" id="DCNV" name="DCNV" value="" placeholder="Địa chỉ..">
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