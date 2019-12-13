<%-- 
    Document   : form-addLK
    Created on : Dec 4, 2019, 10:23:27 AM
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
    <title>Form Thêm Linh Kiện</title>
    <link rel="stylesheet" href="view/css/style.css">
    <link rel="stylesheet" href="view/css/form.css">
</head>

<body>
   <%@include file="header.jsp"%>
    <!--Form Thêm Linh Kiện-->
    <div class="container">
        
        <form action="${pageContext.request.contextPath}/add-device" method="POST" >
            <h3>Nhập Thông Tin Linh Kiện</h3>
            <div class="row">
                <div class="col-25">
                    <label for="TENLK">Tên linh kiện :</label>
                </div>
                <div class="col-75">
                    <input type="text" id="TENLK" name="TENLK" placeholder="Tên linh kiện..">
                </div>
            </div>

            <div class="row">
                <div class="col-25">
                    <label for="NSX">Nhà sản xuất :</label>
                </div>
                <div class="col-75">
                    <input type="text" id="NSX" name="NSX" placeholder="Nhà sản xuất..">
                </div>
            </div>

            <div class="row">
                <div class="col-25">
                    <label for="GIALK">Giá linh kiện :</label>
                </div>
                <div class="col-75">
                    <input type="text" id="GIALK" name="GIALK" placeholder="Giá linh kiện..">
                </div>
            </div>

            <div class="row">
                <input type="submit" value="Submit">
            </div>
        </form>


    </div>

    <!--Footder-->
    <%@include file="footer.jsp"%>
</body>

</html>