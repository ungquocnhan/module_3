<%--
  Created by IntelliJ IDEA.
  User: QUOC NHAN
  Date: 11/8/2022
  Time: 10:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Facility Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<center>
    <h1>Facility Management</h1>
    <h2><a href="/facility?action=create" class="btn btn-primary">Add New Facility</a></h2>
    <h2>
        <c:if test="${message != null}">
            <span style="color: green">${message}</span>
        </c:if>
    </h2>
</center>

<table class="table">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">Name</th>
        <th scope="col">Area</th>
        <th scope="col">Cost</th>
        <th scope="col">Max People</th>
        <th scope="col">Standard Room</th>
        <th scope="col">Description other convenience</th>
        <th scope="col">Pool Area</th>
        <th scope="col">Number of floor</th>
        <th scope="col">Facility free</th>
        <th scope="col">Rent type</th>
        <th scope="col">Facility type</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="facility" items="${facilityList}">
        <tr>
            <th scope="row">${facility.getId()}</th>
            <td>${facility.getName()}</td>
            <td>${facility.getArea()}</td>
            <td>${facility.getCost()}</td>
            <td>${facility.getMaxPeople()}</td>
            <td>${facility.getStandardRoom()}</td>
            <td>${facility.getDescriptionOtherConvenience()}</td>
            <td>${facility.getPoolArea()}</td>
            <td>${facility.getNumberOfFloor()}</td>
            <td>${facility.getFacilityFree()}</td>
            <td>${facility.getRentTypeId()}</td>
            <td>${facility.getFacilityTypeId()}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</html>
