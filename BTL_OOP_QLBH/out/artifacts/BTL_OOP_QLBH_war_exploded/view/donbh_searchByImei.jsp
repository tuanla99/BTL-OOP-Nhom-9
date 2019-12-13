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

        <!--Banner-->
        <div class="banner">
            <div class="img_banner"><img src="img/logo.png" alt=""></div>
            <div class="text_banner"><h2>QU?N L� B?O H�NH</h2></div>
        </div>

        <!--Menu-->
        <div class="menu">
            <ul>
                <li>
                    <a href="#">TRANG CH?</a>
                </li>
                <li>
                    <a href="#">S?N PH?M </a>
                </li>
                <li>
                    <a href="#">KH�CH H�NG</a>
                </li>
                <li>
                    <a href="#">LINH KI?N</a>
                </li>
                <li>
                    <a href="#">NH�N VI�N</a>
                </li>
                <li>
                    <a href="#">TH?NG K�</a>
                </li>
            </ul>
        </div>
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
                        <th>M� B?O H�NH</th>
                        <th>M� S?N PH?M</th>
                        <th>T�N S?N PH?M</th>
                        <th>KH�CH H�NG</th>
                        <th>?I?N THO?I</th>
                        <th>L?I</th>
                        <th>LINH KIEN THAY THE</th>
                        <th>B�O GI�</th>
                        <th>KTV</th>
                        <th>T�NH TR?NG B?O H�NH</th>
                        <th>NG�Y T?O ??N</th>
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
                        <td><a href="<c:url value="donbh-edit?${searching_result.maDon}"/>">S?a</a></td>
                        <td><a href="<c:url value="donbh-delete?${searching_result.maDon}"/>">X�a</a></td>
                    </tr>
                </table>

                <div class="content_themSP" style="margin: auto;padding-left: 400px; ">
                    <button style="margin: auto;">
                        <a href="/donbh-add">Tao DON BAO HANH moi</a>
                    </button>
                </div>
            </div>

        </div>

        <!--Footer-->
        <div class="footer">
            <p>Copy right 2019 by Nh�m 9 Company</p>
            <p>V?n ph�ng t?i H� N?i</p>
            <p>Tr? s?: TC-206 B�ch Khoa-H� N?i</p>
            <p>Chi nh�nh: 196 L� Thanh Ngh?-Hai B� Tr?ng-H� N?i</p>
        </div>


    </body>
</html>