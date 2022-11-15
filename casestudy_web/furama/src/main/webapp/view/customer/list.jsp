<%--
  Created by IntelliJ IDEA.
  User: QUOC NHAN
  Date: 11/7/2022
  Time: 2:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Customer Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</head>
<body>
<c:import url="../../html/header.jsp"></c:import>
<nav class="navbar bg-light">
    <div class="container-fluid">
        <a href="/customer?action=create" class="btn bg-secondary btn-sm">Add New Customer</a>
        <h1>Customer Management</h1>
        <form class="d-flex" action="/customer?action=search" method="post">
<%--            <input class="form-control-sm me-2" type="text" name="search" placeholder="Search">--%>
            <input class="form-control-sm me-2" type="text" name="name" placeholder="Name" value="${name}">
            <input class="form-control-sm me-2" type="text" name="address" placeholder="Address" value="${address}">
            <input class="form-control-sm me-2" type="text" name="numberPhone" placeholder="NumberPhone" value="${numberPhone}">
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
        <th scope="col">Birthday</th>
        <th scope="col">Gender</th>
        <th scope="col">Id Card</th>
        <th scope="col">Phone Number</th>
        <th scope="col">Email</th>
        <th scope="col">Address</th>
        <th scope="col">Customer Type</th>
        <th scope="row">Edit</th>
        <th scope="row">Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="customer" items="${customerList}" varStatus="status">
        <tr>

            <th scope="row">${status.count}</th>
            <td>${customer.getName()}</td>
            <td>${customer.getBirthday()}</td>
            <td>${customer.isGender() == true ? "Male" : "Female"}</td>
            <td>${customer.getIdCard()}</td>
            <td>${customer.getPhoneNumber()}</td>
            <td>${customer.getEmail()}</td>
            <td>${customer.getAddress()}</td>
            <c:forEach var="customerType" items="${customerTypeList}">
                <c:if test="${customerType.id == customer.getCustomerTypeId()}">
                    <td>${customerType.name}</td>
                </c:if>
            </c:forEach>

            <td>
                <button type="button" class="btn btn-success btn-sm color-palette">
                    <a href="/customer?action=edit&id=${customer.getId()}">Edit</a>
                </button>
            </td>
            <td>
                <button onclick="infoDelete('${customer.getId()}','${customer.getName()}')" type="button"
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
        <form action="/customer" method="get">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete Customer</h5>
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
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</html>
