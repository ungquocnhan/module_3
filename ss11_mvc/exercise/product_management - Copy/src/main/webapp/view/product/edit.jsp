<%--
  Created by IntelliJ IDEA.
  User: QUOC NHAN
  Date: 11/4/2022
  Time: 4:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
<h1>Edit Product</h1>
<a href="/product">Back list</a>

<c:if test="${message != null}">
    <span style="color: blue">${message}</span>
</c:if>

<form method="post">
    <pre>Name:        <input type="text" name="name" value="${product.getName()}"></pre>
    <pre>Price:       <input type="text" name="price" value="${product.getPrice()}"></pre>
    <pre>Description: <input type="text" name="description" value="${product.getDescription()}"></pre>
    <pre>Manufacturer:<input type="text" name="manufacturer" value="${product.getManufacture()}"></pre>
    <pre>             <button>Edit Product</button></pre>
</form>
</body>
</html>
