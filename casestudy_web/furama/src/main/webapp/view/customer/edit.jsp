<%--
  Created by IntelliJ IDEA.
  User: QUOC NHAN
  Date: 11/7/2022
  Time: 11:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Customer Management Edit</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</head>
<body>
<center>
    <h1>Customer Management</h1>
    <h2><a href="/customer">Back List</a></h2>
    <h2>
        <c:if test="${message != null}">
            <span style="color: darkred">${message}</span>
        </c:if>
    </h2>
</center>

<form class="row" method="post">
    <caption>
        <h2>
            Edit User
        </h2>
    </caption>
    <c:if test="${customer != null}">
        <input type="hidden" name="id" value="<c:out value='${customer.getId()}' />"/>
    </c:if>
    <div class="col-md-12">
        <label class="form-label">Name Customer</label>
        <input type="text" class="form-control" placeholder="Name" name="name" value="<c:out value='${customer.getName()}'/>">
    </div>
    <div class="col-md-3">
        <label class="form-label">Day of Birth</label>
        <input type="date" class="form-control" name="birthday" value="<c:out value='${customer.getBirthday()}'/>">
    </div>
    <div class="col-md-3">
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
    <div class="col-md-3">
        <label class="form-label">ID Card</label>
        <input type="text" class="form-control" placeholder="ID Card" name="idCard" value="<c:out value='${customer.idCard}'/>">
    </div>
    <div class="col-md-3">
        <label class="form-label">Phone Number</label>
        <input type="text" class="form-control" placeholder="Phone Number" name="phoneNumber" value="<c:out value='${customer.phoneNumber}'/>">
    </div>
    <div class="col-md-3">
        <label class="form-label">Address</label>
        <input type="text" class="form-control" placeholder="Address" name="address" value="<c:out value='${customer.address}'/>">
    </div>
    <div class="col-md-3">
        <label class="form-label">Email</label>
        <input type="email" class="form-control" placeholder="Email" name="email" value="<c:out value='${customer.email}'/>">
    </div>
    <div class="col-md-6">
        <label class="form-label">Gender</label>
        <br>
        <div class="form-check form-check-inline col-md-3">
            <input type="radio" class="form-check-input" value="true" name="gender" checked>
            <label class="form-check-label">Male</label>
        </div>
        <div class="form-check form-check-inline col-md-3">
            <input type="radio" class="form-check-input" value="false" name="gender">
            <label class="form-check-label">Female</label>
        </div>
    </div>
    <div class="col-md-3">
        <br>
        <button class="btn btn-success form-control">Save</button>
    </div>
</form>
</body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</html>
