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
    <h2><c:if test="${message != null}">
        <span style="color: darkred">${message}</span>
    </c:if></h2>
</center>

<form action="/facility?action=save" method="post" id="show_form">
    <div>
        <select name="facilityTypeId" class="custom-select" onchange="selectTypeFacility();" id="typeFacility">
            <option>Choose Facility</option>
            <option value="1">Villa</option>
            <option value="2">House</option>
            <option value="3">Room</option>
        </select>
    </div>
    <div class="form-group">
        <label for="name">Name</label>
        <input type="text" class="form-control" id="name" placeholder="Name facility" name="name" required pattern="^([A-Z]*[0-9a-z]{2,7}(\s)*)*$" title="Incorrect Format">
    </div>
    <div class="form-group">
        <label for="area">Area</label>
        <input type="text" class="form-control" id="area" placeholder="Area" name="area">
    </div>
    <div class="form-group">
        <label for="cost">Cost</label>
        <input type="text" class="form-control" id="cost" placeholder="Cost" name="cost" required pattern="^[1-9]+[0-9]*$" title="Cost must be positive number">
    </div>
    <div class="form-group">
        <label for="max-people">Max people</label>
        <input type="text" class="form-control" id="max-people" placeholder="Max people" name="maxPeople">
    </div>
    <div class="form-group" style="display: block" id="standardRoomDiv">
        <label for="standard-room">Standard Room</label>
        <input type="text" class="form-control" id="standard-room" placeholder="Standard room" name="standardRoom">
    </div>
    <div class="form-group" style="display: block" id="descriptionOtherConvenienceDiv">
        <label for="description-other-convenience">Description other convenience</label>
        <input type="text" class="form-control" id="description-other-convenience"
               placeholder="Description other convenience" name="descriptionOtherConvenience">
    </div>
    <div class="form-group" style="display: block" id="poolAreaDiv">
        <label for="pool-area">Pool Area</label>
        <input type="text" class="form-control" id="pool-area" placeholder="Pool area" name="poolArea" value="0">
    </div>
    <div class="form-group" style="display: block" id="numberOfFloorDiv">
        <label for="number-of-floor">Number of floor</label>
        <input type="text" class="form-control" id="number-of-floor" placeholder="Number of floor" name="numberOfFloor" value="0" pattern="[0-9]{1,2}" title="Number of floor must be positive integer">
    </div>
    <div class="form-group" style="display: block" id="facilityFreeDiv">
        <label for="facility-free">Facility free</label>
        <input type="text" class="form-control" id="facility-free" placeholder="Facility free" name="facilityFree">
    </div>
    <div>
        <select name="rentTypeId" class="custom-select">
            <option selected>Rent type</option>
            <option value="1">Year</option>
            <option value="2">Month</option>
            <option value="3">Day</option>
            <option value="4">Hour</option>
        </select>
    </div>

    <button type="submit" class="btn btn-primary">Save</button>
</form>

<c:import url="../../html/footer.jsp"></c:import>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<script>
    function selectTypeFacility() {
        debugger
        let facilityType = document.getElementById("typeFacility").value;
        switch (facilityType) {
            case "1":
                document.getElementById("facilityFreeDiv").style.display = "none";
                break;
            case "2":
                document.getElementById("facilityFreeDiv").style.display = "none";
                document.getElementById("poolAreaDiv").style.display = "none";
                break;
            case "3":
                document.getElementById("numberOfFloorDiv").style.display = "none";
                document.getElementById("poolAreaDiv").style.display = "none";
                document.getElementById("descriptionOtherConvenienceDiv").style.display = "none";
                document.getElementById("standardRoomDiv").style.display = "none";
                break;
        }
    }
</script>
</html>
