<%--
  Created by IntelliJ IDEA.
  User: luong
  Date: 12/10/2019
  Time: 11:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
    Document   : thong-ke
    Created on : Dec 10, 2019, 4:11:17 PM
    Author     : Tu Nguyen
--%>
<%@page import="services.DonBhService"%>
<%@page import="model.DonBh"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/form.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/style.css">
    <title>Thống kê</title>
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
</head>
<body>
<%@include file="header.jsp"%>
<h2 style="text-align: center">Thống kê bảo hành trong 1 tháng</h2>
<div style="overflow-x:auto;">
    <table>
        <tr>
            <th></th>
            <th>ĐƠN ĐÃ XONG</th>
            <th>ĐƠN CHƯA XONG</th>
        </tr>
        <%
            int a = 0, b = 0, x = 0, y = 0;
            DonBhService ser = new DonBhService();
            List<DonBh> list = ser.getAll();
            for (DonBh don : list) {
                if (don.getTrangThai().equals("xong")) {
                    x += 1;
                    a += don.getGiaDon();
                }
                if (don.getTrangThai().equals("dangSua")) {
                    y += 1;
                    b += don.getGiaDon();
                }
            }
        %>


        <tr>
            <td></td>
            <td><%=x%></td>
            <td><%=y%></td>
        </tr>
        <tr>
            <th>Tổng tiền:</th>
            <th><%=a%> VND</th>
            <td><%=b%> VND</td>
        </tr>
    </table>
</div>
<%@include file="footer.jsp"%>
</body>
</html>