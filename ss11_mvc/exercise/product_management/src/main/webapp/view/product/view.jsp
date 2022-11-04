<%--
  Created by IntelliJ IDEA.
  User: QUOC NHAN
  Date: 11/4/2022
  Time: 4:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Product</title>
</head>
<body>
<h1>View Product</h1>
<a href="/product">Back list</a>

<form>
    <pre>Name:        ${product.getName()}</pre>
    <pre>Price:       ${product.getPrice()}</pre>
    <pre>Description: ${product.getDescription()}</pre>
    <pre>Manufacturer:${product.getManufacture()}</pre>
</form>
</body>
</html>
