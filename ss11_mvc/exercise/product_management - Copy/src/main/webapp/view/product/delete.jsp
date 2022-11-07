<%--
  Created by IntelliJ IDEA.
  User: QUOC NHAN
  Date: 11/4/2022
  Time: 4:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Product</title>
</head>
<body>
<h1>Delete Product</h1>
<a href="/product">Back list</a>

<form method="post">
    <h3>Are you sure?</h3>

    <pre>Name:        ${product.getName()}</pre>
    <pre>Price:       ${product.getPrice()}</pre>
    <pre>Description: ${product.getDescription()}</pre>
    <pre>Manufacturer:${product.getManufacture()}</pre>
    <pre>             <button>Delete Product</button></pre>
    <pre>             <a href="/product">Back List Product</a></pre>
</form>
</body>
</html>
