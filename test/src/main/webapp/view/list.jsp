<%--
  Created by IntelliJ IDEA.
  User: QUOC NHAN
  Date: 11/14/2022
  Time: 9:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Management Room Rent</title>
    <link rel="stylesheet" href="bootstrap-5.1.3-dist/css/bootstrap.css">
    <script src="bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</head>
<body>
<nav class="navbar bg-light">
    <div class="container-fluid">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addRoomRent">
            Add New Room Rent
        </button>
        <h1>Room Rent Management</h1>
        <form class="d-flex" action="/room?action=search" method="post">
            <input class="form-control-sm me-2" type="text" name="search" placeholder="Search">
            <button class="btn btn-primary btn-sm" type="submit">Search</button>
        </form>
    </div>
</nav>
<table class="table" id="tableRoom">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">Name</th>
        <th scope="col">Phone Number</th>
        <th scope="col">Start Date</th>
        <th scope="col">Note</th>
        <th scope="col">Payment Name</th>
        <th scope="row">Edit</th>
        <th width="10%" style="text-align:center">
            CheckBox
        </th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="roomRent" items="${roomRentList}" varStatus="status">
        <tr>
            <th scope="row">${status.count}</th>
            <td>${roomRent.getName()}</td>
            <td>${roomRent.getNumberPhone()}</td>
            <td>${roomRent.getStartDate()}</td>
            <td>${roomRent.getNote()}</td>
            <td>${roomRent.getPayment().getName()}</td>

            <td>
                <button type="button" class="btn btn-success btn-sm color-palette">
                    <a href="/room?action=edit&id=${roomRent.getId()}">Edit</a>
                </button>
            </td>
            <td>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                </div>
            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>
<button onclick="infoDelete('${roomRent.getId()}','${roomRent.getName()}')" type="button"
        class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Delete
</button>
<!-- Modal Add -->
<div class="modal fade" id="addRoomRent" tabindex="-1" aria-labelledby="addRoomRentLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="row" action="/room?action=add" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="addRoomRentLabel">Add Room Rent</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12">
                        <label class="form-label">Name Employee</label>
                        <input type="text" class="form-control" placeholder="Name Employee" name="name" id="name"
<%--                               required pattern="([A-Z][a-z]{1,5}(\s)*)*" title="Incorrect Format">--%>
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Phone Number</label>
                        <input type="text" class="form-control" name="phoneNumber" placeholder="Phone Number"
<%--                               id="numberPhone" required pattern="(090|091|[(][84]{2}[)][+][90]{2}|[(][84]{2}[)][+][91]{2})[0-9]{7}" title="Incorrect Format">--%>
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Start Date</label>
                        <input type="date" class="form-control" name="startDate" id="startDate">
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Note</label>
                        <input type="text" class="form-control" placeholder="Note" name="note" id="note">
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Payment</label>
                        <select name="payment" id="payment" class="form-select">
                            <option>Please choose</option>
                            <option value="1">Month</option>
                            <option value="2">Quarter</option>
                            <option value="3">Year</option>
                        </select>
                    </div>
                    <div class="col-md-12" hidden>
                        <label class="form-label">Flag</label>
                        <input type="radio" class="form-control" name="flag" id="flag" value="true" checked>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-danger btnAdd">Add</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
