<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hiển thị danh sách khách hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</head>
<body>
<h1>Danh sách khách hàng</h1>
<%--<form action="/customer" method="get">--%>
<%--    <input type="submit" id="submit" value="Danh Sách">--%>
<%--</form>--%>

<table class="table table-striped table-hover">
    <thead>
    <tr>
        <th scope="col">Tên</th>
        <th scope="col">Ngày sinh</th>
        <th scope="col">Địa chỉ</th>
        <th scope="col">Ảnh</th>
    </tr>
    </thead>

    <c:forEach items="${list}" var="c">
        <tbody>
        <tr>
            <td>${c.getName()}</td>
            <td>${c.getDateBirth()}</td>
            <td>${c.getAddress()}</td>
            <td>
                <img src="${c.getImage()}" alt="" style="width: 100px; height: 120px"/>
            </td>
        </tr>
        </tbody>

    </c:forEach>

</table>


</body>
</html>