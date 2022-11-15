<%--
  Created by IntelliJ IDEA.
  User: QUOC NHAN
  Date: 11/10/2022
  Time: 9:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Customer Use Facility Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<c:import url="../../html/header.jsp"></c:import>
<nav class="navbar bg-light">
    <div class="container-fluid">
        <a></a>
        <h1>Customer Use Facility Management</h1>
        <form class="d-flex" action="/customer_use_facility?action=search" method="post">
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


<table class="table" id="tableCustomer">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">Name</th>
        <th scope="col">Id Card</th>
        <th scope="col">Phone Number</th>
        <th scope="col">Address</th>
        <th scope="col">Start Date</th>
        <th scope="col">End Date</th>
        <th scope="col">Facility Name</th>
        <th scope="col">Attach Facility</th>
        <th scope="row">Edit</th>
        <th scope="row">Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="customerUseFacility" items="${customerUseFacilityDTOList}" varStatus="status">
        <tr>
            <th scope="row">${status.count}</th>
            <td>${customerUseFacility.getName()}</td>
            <td>${customerUseFacility.getIdCard()}</td>
            <td>${customerUseFacility.getPhoneNumber()}</td>
            <td>${customerUseFacility.getAddress()}</td>
            <td>${customerUseFacility.contract.getStartDate()}</td>
            <td>${customerUseFacility.contract.getEndDate()}</td>
            <td>${customerUseFacility.facility.getName()}</td>
            <td>
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#attachFacilityModal">
                    +
                </button>
            </td>
            <td>
                <a class="btn btn-success btn-sm color-palette" href="<c:url value="/customer_use_facility?action=edit&id=${customerUseFacility.getId()}"/>">Edit</a>
            </td>
            <td>
                <button onclick="infoDelete('${customerUseFacility.getId()}','${customerUseFacility.getName()}')" type="button"
                        class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/customer_use_facility" method="get">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteLabel">Delete Customer</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" hidden name="action" value="delete">
                    <input type="text" hidden id="deleteId" name="deleteId">
                    <pre>Are you want to delete customer ?</pre>
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


<!-- Modal -->
<div class="modal fade" id="attachFacilityModal" tabindex="-1" aria-labelledby="attachFacilityModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/customer_use_facility" method="get">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="attachFacilityModalLabel">Attach Facility</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
<%--                    <input type="text" hidden name="action" value="">--%>
<%--                    <input type="text" hidden id="" name="">--%>
<%--                    <pre></pre>--%>
<%--                    <pre style="color: darkred" id=""></pre>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
<%--                    <button type="submit" class="btn btn-danger">Delete</button>--%>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script>
    function infoDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</html>
