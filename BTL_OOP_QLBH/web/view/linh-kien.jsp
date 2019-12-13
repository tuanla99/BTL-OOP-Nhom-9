<%-- 
    Document   : linh-kien
    Created on : Dec 6, 2019, 11:35:36 AM
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
    <title>Linh Kiện</title>
    <link rel="stylesheet" href="view/css/style.css">
</head>

<body>
   <%@include file="header.jsp"%>
    <!--Search by TENLK -->
    <div class="search">
        <div class="search_text">
            <p>Search by TÊN LK</p>
        </div>
        <div class="container">
            <form action="search-device" >
            <input type="search" class="search_input" name="search-by-TenLK" placeholder="Search...">
            <input type="submit" class="submit" value="Search">
            </form>
        </div>
    </div>

    <!--Content-->
    <style>
        table {
            border-collapse: collapse;
            border-spacing: 0;
            width: 100%;
            border: 1px solid #ddd;
        }

        th,
        td {
            text-align: center;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2
        }
    </style>
    
    <div style="overflow-x:auto;">
        <table>
            <tr>
                <th>MÃ LK</th>
                <th>TÊN LK</th>
                <th>NSX</th>
                <th>GIÁ LK</th>

            </tr>
            <c:forEach var="device" items="${listdevices}" >
                <tr>
                    <td>${device.getMaLK()}</td>
                    <td>${device.getTenLK()}</td>
                    <td>${device.getNsx()}</td>
                    <td>${device.getGiaLK()}</td>
                    <td><a href="<c:url value="edit-device?${device.maLK}"/>">Sửa</a></td>
                </tr>   
            </c:forEach>
        </table>
                
                
        <div class="content_themLK" style="margin: auto;padding-left: 400px; ">
            <button style="margin: auto;">
                <a href="add-device">Thêm Linh Kiện</a>
            </button>
        </div>
    </div>

    <!--fOOTER-->
     <!--Footer-->
    <%@include file="footer.jsp"%>
</body>

</html>