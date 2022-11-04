<%--
  Created by IntelliJ IDEA.
  User: QUOC NHAN
  Date: 11/4/2022
  Time: 1:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create Product</title>
</head>
<body>
<h1>Add New Product</h1>
<a href="/product">Back list</a>

<c:if test="${message != null}">
    <span style="color: darkred">${message}</span>
</c:if>

<form action="/product?action=add" method="post">
    <pre>ID:          <input type="text" name="id"></pre>
    <pre>Name:        <input type="text" name="name"></pre>
    <pre>Price:       <input type="text" name="price"></pre>
    <pre>Description: <input type="text" name="description"></pre>
    <pre>Manufacturer:<input type="text" name="manufacturer"></pre>
    <pre>             <button>Save</button></pre>
</form>
</body>
</html>
