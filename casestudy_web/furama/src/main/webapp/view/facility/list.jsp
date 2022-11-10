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
<c:import url="../../html/header.jsp"></c:import>
<nav class="navbar bg-light">
    <div class="container-fluid">
        <a href="/facility?action=create" class="btn bg-secondary btn-sm">Add New Facility</a>
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
            <span style="color: green">${message}</span>
        </c:if>
    </h2>
</center>

<table class="table" id="tableFacility">
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
        <th scope="row">Edit</th>
        <th scope="row">Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="facility" items="${facilityList}" varStatus="status">
        <tr>
            <th scope="row">${status.count}</th>
            <td>${facility.getName()}</td>
            <td>${facility.getArea()}</td>
            <td>${facility.getCost()}</td>
            <td>${facility.getMaxPeople()}</td>
            <td>${facility.getStandardRoom()}</td>
            <td>${facility.getDescriptionOtherConvenience()}</td>
            <td>${facility.getPoolArea()}</td>
            <td>${facility.getNumberOfFloor()}</td>
            <td>${facility.getFacilityFree()}</td>
            <c:forEach var="rentType" items="${rentTypeList}">
                <c:if test="${rentType.id == facility.getRentTypeId()}">
                    <td>${rentType.name}</td>
                </c:if>
            </c:forEach>
            <c:forEach var="facilityType" items="${facilityTypeList}">
                <c:if test="${facilityType.id == facility.getFacilityTypeId()}">
                    <td>${facilityType.name}</td>
                </c:if>
            </c:forEach>
            <td>
                <button type="button" class="btn btn-success btn-sm color-palette">
                    <a href="/facility?action=edit&id=${facility.getId()}">Edit</a>
                </button>
            </td>
            <td>
                <button onclick="infoDelete('${facility.getId()}','${facility.getName()}')" type="button"
                        class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<c:import url="../../html/footer.jsp"></c:import>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/facility" method="get">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete Facility</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" hidden name="action" value="delete">
                    <input type="text" hidden id="deleteId" name="deleteId">
                    <pre>Are you want to delete facility ?</pre>
                    <pre style="color: darkred" id="deleteName"></pre>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<script>
    function infoDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
</script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.js"></script>
<script src="datatables/js/dataTables.bootstrap5.js"></script>
<script>
    $(document).ready(function () {
        $('#tableFacility').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</html>
