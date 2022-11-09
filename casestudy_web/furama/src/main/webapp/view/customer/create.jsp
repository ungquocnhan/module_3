<%--
  Created by IntelliJ IDEA.
  User: QUOC NHAN
  Date: 11/7/2022
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Customer Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</head>
<body>
<c:import url="../../html/header.jsp"></c:import>
<nav class="navbar bg-light">
    <div class="container-fluid">
        <a href="/customer" class="btn bg-secondary btn-sm">Back List Customer</a>
        <h1>Customer Management</h1>
        <form class="d-flex" action="/customer?action=search" method="post">
            <input class="form-control-sm me-2" type="text" name="search" placeholder="Search">
            <button class="btn btn-primary btn-sm" type="submit">Search</button>
        </form>
    </div>
</nav>
<center>
    <h2><c:if test="${message != null}">
        <span style="color: darkred">${message}</span>
    </c:if></h2>
</center>

<form class="row" action="/customer?action=save" method="post">
    <div class="col-md-6">
        <label class="form-label">Name Customer</label>
        <input type="text" name="name" class="form-control" placeholder="Name Customer">
    </div>
    <div class="col-md-6">
        <label class="form-label">Day of Birth</label>
        <input type="date" name="birthday" class="form-control">
    </div>
    <div class="col-md-6">
        <label class="form-label">Customer Type</label>
        <select name="customerTypeId" id="" class="form-select">
            <option>Please choose</option>
            <option value="1">Diamond</option>
            <option value="2">Platinium</option>
            <option value="3">Gold</option>
            <option value="4">Silver</option>
            <option value="5">Member</option>
        </select>
    </div>
    <div class="col-md-6">
        <label class="form-label">ID Card</label>
        <input type="text" name="idCard" class="form-control" placeholder="ID Card">
    </div>
    <div class="col-md-6">
        <label class="form-label">Phone Number</label>
        <input type="text" name="phoneNumber" class="form-control" placeholder="Phone Number">
    </div>
    <div class="col-md-6">
        <label class="form-label">Address</label>
        <input type="text" name="address" class="form-control" placeholder="Address">
    </div>
    <div class="col-md-6">
        <label class="form-label">Email</label>
        <input type="email" name="email" class="form-control" placeholder="Email">
    </div>
    <div class="col-md-6">
        <label class="form-label">Gender</label>
        <br>
        <div class="form-check form-check-inline col-md-3">
            <label>
                <input type="radio" class="form-check-input"  value="true" name="gender" checked>
            </label>
            <label class="form-check-label">Male</label>
        </div>
        <div class="form-check form-check-inline col-md-3">
            <label>
                <input type="radio" class="form-check-input" value="false" name="gender">
            </label>
            <label class="form-check-label">Female</label>
        </div>
    </div>
    <div class="col-md-6">
        <br>
        <button class="btn btn-primary form-control">Save</button>
    </div>
</form>

<c:import url="../../html/footer.jsp"></c:import>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</html>
