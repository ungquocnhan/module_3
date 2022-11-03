<%--
  Created by IntelliJ IDEA.
  User: QUOC NHAN
  Date: 11/3/2022
  Time: 10:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>List Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</head>
<body>
<h1 style="text-align: center">Danh sách khách hàng</h1>
<table class="table">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">Name</th>
        <th scope="col">Day of Birth</th>
        <th scope="col">Address</th>
        <th scope="col">Image</th>
    </tr>
    </thead>
    <tbody>
   <c:forEach var="customer" items="${customerList}" varStatus="status">
       <tr>
           <th scope="row">${status.count}</th>
           <td>${customer.getName()}</td>
           <td>${customer.getDateOfBirth()}</td>
           <td>${customer.getAddress()}</td>
           <td><img src="${customer.getUrlImg()}" style="height: 100px; width: 100px"></td>
       </tr>
   </c:forEach>

    </tbody>
</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</html>
