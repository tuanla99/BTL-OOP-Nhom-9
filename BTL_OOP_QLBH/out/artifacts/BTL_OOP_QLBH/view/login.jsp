<%--
  Created by IntelliJ IDEA.
  User: luong
  Date: 12/10/2019
  Time: 11:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/form.css">
    <title>Đăng nhập</title>

</head>
<body>
<h2 style="margin: auto" >HAVE A NICE DAY!</h2>
<%
    String error = "";
    if (request.getAttribute("error") != null) {
        error = (String) request.getAttribute("error");
    }
%>


<div class="container">
    <div class="row">
        <div class="col-md-6 center-block">
            <form action="login" method="post" >
                <div style="text-align: center;">
                    <h1>Đăng Nhập</h1>
                </div>

                <div style="color: red; margin-left: 200px;"><%=error%></div>


                <div class="row">
                    <div class="col-25">
                        <label for="TENTK">Tên Tài Khoản:</label>
                    </div>
                    <div class="col-75" style="width: 200px" >
                        <input type="text" name="username" id="TENTK" placeholder="Tên đăng nhập..">
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="MatKhau">Mật Khẩu:</label>
                    </div>
                    <div class="col-75" style="width: 200px">
                        <input type="password" name="password" id="MatKhau" placeholder="Mật khẩu.." style="width: 198px; height : 32px; border-radius: 5px;" >
                    </div>
                </div>

                <div class="row" style="margin-left: 125px" >
                    <button type="submit" value="Đăng nhập">Đăng Nhập</button>
                </div>
            </form>

        </div>

    </div>

</div>
<%@include file="footer.jsp"%>
</body>
</html>
