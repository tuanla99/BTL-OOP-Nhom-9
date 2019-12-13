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

        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/style.css">
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
                    <label>
                        <input type="search" class="search_input" name="search-by-imei" placeholder="Search...">
                    </label>
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
                        <th>ĐIỆN THOAI</th>
                        <th>LỖI</th>
                        <th>LINH KIỆN</th>
                        <th>BÁO GIÁ</th>
                        <th>KTV</th>
                        <th>BẢO HÀNH</th>
                        <th>NGÀY TẠO</th>
                    </tr>

                    <%
                        DonBhService ser = new DonBhService();
                        List<DonBh> list = ser.getAll();
                        for (DonBh don : list) {
                            Customer customer = new CustomerService().searchByMaKH(don.getMaKH());
                            Product product = new ProductService().searchByImei(don.getImei());
                            Employees employee = new EmployeesService().searchByMaNV(don.getMaNV());
                            Device device = new DeviceService().find(don.getMaLK());
                    %>
                    <tr>

                        <td><%=don.getMaDon()%></td>
                        <td><%=don.getImei()%></td>
                        <td><%=product.getTenSP()%></td>
                        <td><%=customer.getTenKH()%></td>
                        <td><%=customer.getDienThoai()%></td>
                        <td><%=don.getLoi()%></td>
                        <td><%=device.getTenLK()%></td>
                        <td><%=don.getGiaDon()%></td>
                        <td><%=employee.getTenNV()%></td>
                        <td><%=don.getTrangThai()%></td>
                        <td><%=don.getDate()%></td>
                        <td><a href="donbh-edit?<%=don.getMaDon()%>">Sửa</a></td>
                        <td><a href="donbh-delete?<%=don.getMaDon()%>">Xóa</a></td>

                    </tr>
                    <%
                        }
                    %>
                </table>

                <div class="content_themSP" style="margin: auto;padding-left: 400px; ">
                    <button style="margin: auto;">
                        <a href="${pageContext.request.contextPath}/donbh-add">THÊM ĐƠN BẢO HÀNH.</a>
                    </button>
                </div>
            </div>

        </div>

        <!--Footer-->
       <%@include file="footer.jsp"%>


    </body>
</html>