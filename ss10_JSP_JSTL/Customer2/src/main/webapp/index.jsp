<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.customer2.Customer" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách khách hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</head>
<body>
<%
    List<Customer> customers = new ArrayList<>();
    customers.add(new Customer("Huỳnh Dụng", "26/03/1994", "Quảng Ngãi", "https://images.secretlab.co/theme/common/collab_pokemon_catalog_charizard-min.png"));
    customers.add(new Customer("Đăng Pháp", "12/12/1997", "Huế", "https://assets.pokemon.com/assets/cms2/img/pokedex/full/133.png"));

    request.setAttribute("cus", customers);
%>

<table class="table">
    <tr>
        <th scope="col">Tên</th>
        <th scope="col">Ngày sinh</th>
        <th scope="col">Địa chỉ</th>
        <th scope="col">Ảnh</th>
    </tr>
    <c:forEach items="${cus}" var="c">
        <tbody>
        <tr>
            <td>${c.name}</td>
            <td>${c.dateOfBirth}</td>
            <td>${c.address}</td>
            <td>
                <img src="${c.img}" style="width: 80px; height: 100px">
            </td>
        </tr>
        </tbody>
    </c:forEach>
</table>
</body>
</html>