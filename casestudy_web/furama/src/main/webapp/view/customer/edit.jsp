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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

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
    <h2>
        <c:if test="${message != null}">
            <span style="color: darkred">${message}</span>
        </c:if>
    </h2>
</center>

<form class="row" method="post">
    <caption>
        <h2>
            Edit Customer
        </h2>
    </caption>
    <c:if test="${customer != null}">
        <input type="hidden" name="id" value="<c:out value='${customer.getId()}'/>"/>
    </c:if>
    <div class="col-md-12">
        <label class="form-label">Name Customer</label>
        <input type="text" class="form-control" placeholder="Name" name="name"
               value="<c:out value='${customer.getName()}'/>">
    </div>
    <div class="col-md-3">
        <label class="form-label">Day of Birth</label>
        <input type="date" class="form-control" name="birthday" value="<c:out value='${customer.getBirthday()}'/>">
    </div>
    <div class="col-md-3">
        <label class="form-label">Customer Type</label>
        <select name="customerTypeId" id="" class="form-select">
            <c:forEach var="customerType" items="${customerTypeList}">
                <c:if test="${customerType.id == customer.getCustomerTypeId()}">
                    <option selected value="${customerType.id}">${customerType.name}</option>
                </c:if>
                <c:if test="${customerType.id != customer.getCustomerTypeId()}">
                    <option value="${customerType.id}">${customerType.name}</option>
                </c:if>
            </c:forEach>
        </select>
    </div>
    <div class="col-md-3">
        <label class="form-label">ID Card</label>
        <input type="text" class="form-control" placeholder="ID Card" name="idCard"
               value="<c:out value='${customer.idCard}'/>">
    </div>
    <div class="col-md-3">
        <label class="form-label">Phone Number</label>
        <input type="text" class="form-control" placeholder="Phone Number" name="phoneNumber"
               value="<c:out value='${customer.phoneNumber}'/>">
    </div>
    <div class="col-md-3">
        <label class="form-label">Address</label>
        <input type="text" class="form-control" placeholder="Address" name="address"
               value="<c:out value='${customer.address}'/>">
    </div>
    <div class="col-md-3">
        <label class="form-label">Email</label>
        <input type="email" class="form-control" placeholder="Email" name="email"
               value="<c:out value='${customer.email}'/>">
    </div>
    <div class="col-md-6">
        <label class="form-label">Gender</label>
        <br>
        <div class="form-check form-check-inline col-md-3">
            <input type="radio" class="form-check-input" value="true" ${customer.isGender() == true ? "checked" : ""} name="gender">
            <label class="form-check-label">Male</label>
        </div>
        <div class="form-check form-check-inline col-md-3">
            <input type="radio" class="form-check-input" value="false" ${customer.isGender() == false ? "checked" : ""} name="gender">
            <label class="form-check-label">Female</label>
        </div>
    </div>
    <div class="col-md-3">
        <br>
        <button class="btn btn-success form-control">Edit</button>
    </div>
</form>

<c:import url="../../html/footer.jsp"></c:import>
</body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</html>
