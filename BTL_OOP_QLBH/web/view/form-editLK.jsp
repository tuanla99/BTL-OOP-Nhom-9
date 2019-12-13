<%-- 
    Document   : form-editLK
    Created on : Dec 8, 2019, 9:40:43 AM
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
    <title>Form Chỉnh Sửa Linh Kiện</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/form.css">
</head>

<body>
  <%@include file="header.jsp"%>
    <!--Form Chỉnh Sửa Linh Kiện-->
    <div class="container">
        
        <form action="edit-device" method="post">
            <input name="MALK" value="${MALK}" hidden="">
            <h3>Chỉnh Sửa Thông Tin Linh Kiện có Mã là ${MALK} </h3>
            <div class="row">
                <div class="col-25">
                    <label for="TENLK">Tên linh kiện :</label>
                </div>
                <div class="col-75">
                    <input type="text" id="TENLK" name="TENLK" value="" placeholder="Tên linh kiện..">
                </div>
            </div>

            <div class="row">
                <div class="col-25">
                    <label for="NSX">Nhà sản xuất :</label>
                </div>
                <div class="col-75">
                    <input type="text" id="NSX" name="NSX" value="" placeholder="Nhà sản xuất..">
                </div>
            </div>

            <div class="row">
                <div class="col-25">
                    <label for="GIALK">Giá linh kiện :</label>
                </div>
                <div class="col-75">
                    <input type="text" id="GIALK" name="GIALK" value="" placeholder="Giá linh kiện..">
                </div>
            </div>

            <div class="row">
                <input type="submit" value="Update">
            </div>
        </form>


    </div>

    <!--Footder-->
   <%@include file="footer.jsp"%>
</body>

</html>