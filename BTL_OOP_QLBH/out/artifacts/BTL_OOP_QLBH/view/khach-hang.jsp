<%--
  Created by IntelliJ IDEA.
  User: luong
  Date: 12/3/2019
  Time: 9:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Khách Hàng</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/style.css">
</head>
<body>
<%@include file="header.jsp"%>
<!--Search by MAKH -->
<div class="search">
    <div class="search_text">
        <p>Search by Mã KH</p>
    </div>
    <div class="container">
        <form action="${pageContext.request.contextPath}/search-customer" method="get" >
            <label>
                <input type="search" class="search_input" name="soDT" placeholder="Search by phone...">
            </label>
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

    th,td {
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
            <th>MÃ KH</th>
            <th>TÊN KH</th>
            <th>SDT</th>
            <th>EMAIL</th>
            <th>ĐỊA CHỈ</th>

        </tr>
        <c:forEach var="customer" items="${customers}" >
            <tr>
                <td>${customer.maKH}</td>
                <td>${customer.tenKH}</td>
                <td>${customer.dienThoai}</td>
                <td>${customer.email}</td>
                <td>${customer.diaChi}</td>
                <td><a href="${pageContext.request.contextPath}/view/form-editKH.jsp?maKH=${customer.maKH}">Sửa</a></td>
            </tr>
        </c:forEach>
    </table>

    <div class="content_themKH" style="margin: auto;padding-left: 400px; ">
        <button style="margin: auto;">
            <a href="${pageContext.request.contextPath}/view/form-addSP_KH.jsp">Thêm Khách hàng</a>
        </button>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
