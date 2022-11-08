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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</head>
<body>
<center>
    <h1>Facility Management</h1>
    <h2><a href="/facility" class="btn btn-primary">Back List Facility</a></h2>
    <h2><c:if test="${message != null}">
        <span style="color: darkred">${message}</span>
    </c:if></h2>
</center>

<form action="/facility?action=save" method="post">
    <div class="form-group">
        <label for="name">Name</label>
        <input type="text" class="form-control" id="name" placeholder="Name facility" name="name">
    </div>
    <div class="form-group">
        <label for="area">Area</label>
        <input type="text" class="form-control" id="area" placeholder="Area" name="area">
    </div>
    <div class="form-group">
        <label for="cost">Cost</label>
        <input type="text" class="form-control" id="cost" placeholder="Cost" name="cost">
    </div>
    <div class="form-group">
        <label for="max-people">Max people</label>
        <input type="text" class="form-control" id="max-people" placeholder="Max people" name="maxPeople">
    </div>
    <div class="form-group">
        <label for="standard-room">Standard Room</label>
        <input type="text" class="form-control" id="standard-room" placeholder="Standard room" name="standardRoom">
    </div>
    <div class="form-group">
        <label for="description-other-convenience">Description other convenience</label>
        <input type="text" class="form-control" id="description-other-convenience" placeholder="Description other convenience" name="descriptionOtherConvenience">
    </div>
    <div class="form-group">
        <label for="pool-area">Pool Area</label>
        <input type="text" class="form-control" id="pool-area" placeholder="Pool area" name="poolArea">
    </div>
    <div class="form-group">
        <label for="number-of-floor">Number of floor</label>
        <input type="text" class="form-control" id="number-of-floor" placeholder="Number of floor" name="numberOfFloor">
    </div>
    <div class="form-group">
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
        </select></div>
    <div>
        <select name="facilityTypeId" class="custom-select">
            <option selected>Facility type</option>
            <option value="1">Villa</option>
            <option value="2">House</option>
            <option value="3">Room</option>
        </select></div>
    <button type="submit" class="btn btn-primary">Save</button>
</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</html>
