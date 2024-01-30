<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<h2>Currency Converter</h2>
<form action="/calculator" method="post">
    <label>Product Description: </label><br>
    <input type="text" name="describe" placeholder="DESCRIBE"/><br>
    <label>List Price: </label><br>
    <input type="text" name="price" placeholder="PRICE" value="0"/><br>
    <label>Discount Percent: </label><br>
    <input type="text" name="percent" placeholder="PERCENT" value="0"/><br>
    <input type="submit" id="submit" value="Discount"/>
</form>
</body>
</html>