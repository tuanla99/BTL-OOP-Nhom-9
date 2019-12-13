<%@page import="services.EmployeesService"%>
<%@page import="model.Employees"%>
<%@page import="services.ProductService"%>
<%@page import="model.Product"%>
<%@page import="services.CustomerService"%>
<%@page import="model.Customer"%>
<%@page import="services.DonBhService"%>
<%@page import="model.DonBh"%>
<%@page import="services.DeviceService"%>
<%@page import="services.DeviceService"%>
<%@page import="model.Device"%>
<%@page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Home</title>

        <link rel="stylesheet" href="view/css/style.css">
    </head>
    <body>
        <%@include file="header.jsp"%>
        <!--Search by imei -->
        <div class="search">
            <div class="search_text">
                <p>Search by imei</p>
            </div>
            <div class="container">
                <form action="donbh-search" method="get">
                    <input type="search" class="search_input" name="search-by-imei" placeholder="Search...">
                    <input type="submit" class="submit" value="Search">
                </form>
            </div>
        </div>
        <!--Content-->
        <div class="content">
            <style>
                table {
                    border-collapse: collapse;
                    border-spacing: 0;
                    width: 100%;
                    border: 1px solid #ddd;
                }

                th, td {
                    text-align: center;
                    padding: 8px;
                }

                tr:nth-child(even){background-color: #f2f2f2}
            </style>
            <div style="overflow-x:auto;">
                <table>
                    <tr>
                        <th>MÃ BẢO HÀNH</th>
                        <th>MÃ SẢN PHẨM</th>
                        <th>TÊN SẢN PHẨM</th>
                        <th>KHÁCH HÀNG</th>
                        <th>ĐIỆN THOẠI</th>
                        <th>LỖI</th>
                        <th>LINH KIỆN THAY THẾ</th>
                        <th>BÁO GIÁ</th>
                        <th>KTV</th>
                        <th>TÌNH TRẠNG BẢO HÀNH</th>
                        <th>NGÀY TẠO</th>
                    </tr>
                    <tr>
                        <td>${searching_result.getMaDon()}</td>
                        <td>${searching_result.imei}</td>
                        <td>${product.tenSP}</td>
                        <td>${customer.tenKH}</td>
                        <td>${customer.dienThoai}</td>
                        <td>${searching_result.loi}</td>
                        <td>${device.tenLK}</td>
                        <td>${searching_result.giaDon}</td>
                        <td>${employee.tenNV}</td>
                        <td>${searching_result.trangThai}</td>
                        <td>${searching_result.date}</td>
                        <td><a href="<c:url value="donbh-edit?${searching_result.maDon}"/>">Sửa</a></td>
                        <td><a href="<c:url value="donbh-delete?${searching_result.maDon}"/>">Xóa</a></td>
                    </tr>
                </table>

                <div class="content_themSP" style="margin: auto;padding-left: 400px; ">
                    <button style="margin: auto;">
                        <a href="${pageContext.request.contextPath}/donbh-add">Tao DON BAO HANH moi</a>
                    </button>
                </div>
            </div>

        </div>

        <!--Footer-->
        <%@include file="footer.jsp"%>


    </body>
</html>