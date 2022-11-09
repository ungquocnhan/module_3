<%--
  Created by IntelliJ IDEA.
  User: QUOC NHAN
  Date: 11/8/2022
  Time: 10:22 PM
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
<c:import url="../../html/header.jsp"></c:import>
<nav class="navbar bg-light">
    <div class="container-fluid">
        <a href="/facility" class="btn bg-secondary btn-sm">Back List Facility</a>
        <h1>Facility Management</h1>
        <form class="d-flex" action="/facility?action=search" method="post">
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
            Edit Facility
        </h2>
    </caption>
    <c:if test="${facility != null}">
        <input type="hidden" name="id" value="<c:out value='${facility.getId()}' />"/>
    </c:if>
    <div class="col-md-12">
        <label class="form-label">Name</label>
        <input type="text" class="form-control" id="name" placeholder="Name facility" name="name" value="<c:out value='${facility.getName()}' />">
    </div>
    <div class="col-md-3">
        <label class="form-label">Area</label>
        <input type="text" class="form-control" id="area" placeholder="Area" name="area" value="<c:out value='${facility.getArea()}' />">
    </div>
    <div class="col-md-3">
        <label class="form-label">Cost</label>
        <input type="text" class="form-control" id="cost" placeholder="Cost" name="cost" value="<c:out value='${facility.getCost()}' />">
    </div>
    <div class="col-md-3">
        <label class="form-label">Max people</label>
        <input type="text" class="form-control" id="max-people" placeholder="Max people" name="maxPeople" value="<c:out value='${facility.getMaxPeople()}' />">
    </div>
    <div class="col-md-3">
        <label class="form-label">Standard Room</label>
        <input type="text" class="form-control" id="standard-room" placeholder="Standard Room" name="standardRoom" value="<c:out value='${facility.getStandardRoom()}' />">
    </div>
    <div class="col-md-3">
        <label class="form-label">Description other convenience</label>
        <input type="text" class="form-control" id="description-other-convenience"
               placeholder="Description other convenience" name="descriptionOtherConvenience" value="<c:out value='${facility.getDescriptionOtherConvenience()}' />">
    </div>
    <div class="col-md-3">
        <label class="form-label">Pool Area</label>
        <input type="text" class="form-control" id="pool-area" placeholder="Pool Area" name="poolArea" value="<c:out value='${facility.getPoolArea()}' />">
    </div>
    <div class="col-md-3">
        <label class="form-label">Number of floor</label>
        <input type="text" class="form-control" id="number-of-floor" placeholder="Number of floor"
               name="numberOfFloor" value="<c:out value='${facility.getNumberOfFloor()}' />">
    </div>
    <div class="col-md-3">
        <label class="form-label">Facility free</label>
        <input type="text" class="form-control" id="facility-free" placeholder="Facility free" name="facilityFree" value="<c:out value='${facility.getFacilityFree()}' />">
    </div>
    <div class="col-md-6">
        <label class="form-label">Rent Type</label>
        <select name="rentTypeId" id="rentTypeId" class="form-select">
            <c:forEach var="rentType" items="${rentTypeList}">
                <option value="${rentType.id}">${rentType.name}</option>
            </c:forEach>
        </select>
    </div>
    <div class="col-md-6">
        <label class="form-label">Rent Type</label>
        <select name="facilityTypeId" id="facilityTypeId" class="form-select">
            <c:forEach var="facilityType" items="${facilityTypeList}">
                <option value="${facilityType.id}">${facilityType.name}</option>
            </c:forEach>
        </select>
    </div>


    <button class="btn btn-primary form-control">Edit</button>
</form>

<c:import url="../../html/footer.jsp"></c:import>

</body>
</html>
