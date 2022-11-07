<%--
  Created by IntelliJ IDEA.
  User: QUOC NHAN
  Date: 11/7/2022
  Time: 2:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Customer Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</head>
<body>
<center>
    <h1>Customer Management</h1>
    <h2><a href="/customer?action=create">Add New Customer</a></h2>
    <h2>
        <form action="/customer?action=search" method="post">
            <pre>Search Name:   <input type="text" name="name"><button>Search</button></pre>
        </form>
    </h2>
</center>

<table class="table">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">Name</th>
        <th scope="col">Birthday</th>
        <th scope="col">Gender</th>
        <th scope="col">Id Card</th>
        <th scope="col">Phone Number</th>
        <th scope="col">Email</th>
        <th scope="col">Address</th>
        <th scope="col">Customer Type Id</th>
        <th scope="row">Edit</th>
        <th scope="row">Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="customer" items="${customerList}">
        <tr>
            <th scope="row">${customer.getId()}</th>
            <td>${customer.getName()}</td>
            <td>${customer.getBirthday()}</td>
            <td>${customer.isGender() == true ? "Nam" : "Nữ"}</td>
            <td>${customer.getIdCard()}</td>
            <td>${customer.getPhoneNumber()}</td>
            <td>${customer.getEmail()}</td>
            <td>${customer.getAddress()}</td>
            <td>${customer.getCustomerTypeId()}</td>
            <td>
                <button type="button" class="btn btn-success btn-sm color-palette">
                    <a href="/customer?action=edit&id=${customer.getId()}">Edit</a>
                </button>
            </td>
            <td>
                <button type="button" class="btn btn-success btn-sm color-palette">
                    <a href="/customer?action=delete&id=${customer.getId()}">Delete</a>
                </button>
            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

</html>
