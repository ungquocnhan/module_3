<%--
  Created by IntelliJ IDEA.
  User: QUOC NHAN
  Date: 11/12/2022
  Time: 9:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Employee Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<c:import url="../../html/header.jsp"></c:import>
<nav class="navbar bg-light">
    <div class="container-fluid">
        <%--        <a href="/employee?action=create" class="btn bg-secondary btn-sm">Add New Employee</a>--%>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addEmployee">
            Add new Employee
        </button>
        <h1>Employee Management</h1>
        <form class="d-flex" action="/employee?action=search" method="post">
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

<table class="table" id="tableEmployee">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">Name</th>
        <th scope="col">Birthday</th>
        <th scope="col">Id Card</th>
        <th scope="col">Salary</th>
        <th scope="col">Phone Number</th>
        <th scope="col">Email</th>
        <th scope="col">Address</th>
        <th scope="col">Position</th>
        <th scope="row">Education Degree</th>
        <th scope="row">Division</th>
        <th scope="row">Edit</th>
        <th scope="row">Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="employee" items="${employeeList}" varStatus="status">
        <tr>

            <th scope="row">${status.count}</th>
            <td>${employee.getName()}</td>
            <td>${employee.getBirthday()}</td>
            <td>${employee.getIdCard()}</td>
            <td>${employee.getSalary()}</td>
            <td>${employee.getPhoneNumber()}</td>
            <td>${employee.getEmail()}</td>
            <td>${employee.getAddress()}</td>
            <td>${employee.getPosition().getName()}</td>
            <td>${employee.getEducationDegree().getName()}</td>
            <td>${employee.getDivision().getName()}</td>
            <td>
                    <%--                <button type="button" class="btn btn-success btn-sm color-palette">--%>
                    <%--                    <a href="/employee?action=edit&id=${employee.getId()}">Edit</a>--%>
                    <%--                </button>--%>
                <a onclick="getDetailEdit('${employee.getId()}','${employee.getName()}','${employee.getBirthday()}','${employee.getIdCard()}',
                        '${employee.getSalary()}','${employee.getPhoneNumber()}','${employee.getEmail()}','${employee.getAddress()}',
                        '${employee.getPosition().getId()}','${employee.getEducationDegree().getId()}','${employee.getDivision().getId()}')"
                   class="edit btn btn-sm btn-primary"
                   data-bs-toggle="modal" href="#editEmployee">
                    Edit
                </a>
            </td>
            <td>
                <button onclick="infoDelete('${employee.getId()}','${employee.getName()}')" type="button"
                        class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>

<c:import url="../../html/footer.jsp"></c:import>
<!-- Modal Delete -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/employee" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete Employee</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" hidden name="action" value="delete">
                    <input type="text" hidden id="deleteId" name="deleteId">
                    <pre>Are you want to delete employee ?</pre>
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


<!-- Modal Add -->
<div class="modal fade" id="addEmployee" tabindex="-1" aria-labelledby="addEmployeeLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="row" action="/employee?action=add" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="addEmployeeLabel">Add Employee</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12">
                        <label class="form-label">Name Employee</label>
                        <input type="text" class="form-control" placeholder="Name Employee" name="name" id="name"
                               required pattern="([A-Z][a-z]{1,5}(\s)*)*" title="Incorrect Format">
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Birthday</label>
                        <input type="date" class="form-control" name="birthday" id="birthday"
                               required pattern="^[0-3]?[0-9].[0-3]?[0-9].([0-9]{1,2})?[0-9]{2}$"
                               title="Incorrect Format">
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">ID Card</label>
                        <input type="text" class="form-control" placeholder="ID Card" name="idCard" id="idCard"
                               required pattern="([0-9]{12})|([0-9]{9})" title="Incorrect Format">
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Salary</label>
                        <input type="text" class="form-control" placeholder="Salary" name="salary" id="salary"
                               required pattern="[0-9]{6,7}" title="Salary must positive number">
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Phone Number</label>
                        <input type="text" class="form-control" placeholder="Phone Number" name="numberPhone"
                               id="numberPhone" required
                               pattern="(090|091|[(][84]{2}[)][+][90]{2}|[(][84]{2}[)][+][91]{2})[0-9]{7}"
                               title="Incorrect Format">
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" placeholder="Email" name="email" id="email"
                               required pattern="^[A-Za-z0-9]+[A-Za-z0-9]*@[A-Za-z0-9]+(\.[A-Za-z0-9]+)*$"
                               title="Incorrect Format">
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Address</label>
                        <input type="text" class="form-control" placeholder="Address" name="address" id="address">
                    </div>
                    <%--                    <div class="col-md-12">--%>
                    <%--                        <label class="form-label">Account</label>--%>
                    <%--                        <input type="text" class="form-control" placeholder="Account">--%>
                    <%--                    </div>--%>
                    <%--                    <div class="col-md-12">--%>
                    <%--                        <label class="form-label">Gender</label>--%>
                    <%--                        <br>--%>
                    <%--                        <div class="form-check form-check-inline">--%>
                    <%--                            <input type="radio" class="form-check-input" name="rdo" checked>--%>
                    <%--                            <label class="form-check-label">Male</label>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="form-check form-check-inline">--%>
                    <%--                            <input type="radio" class="form-check-input" name="rdo">--%>
                    <%--                            <label class="form-check-label">Female</label>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="form-check form-check-inline">--%>
                    <%--                            <input type="radio" class="form-check-input" name="rdo">--%>
                    <%--                            <label class="form-check-label">Other</label>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <div class="col-md-12">
                        <label class="form-label">Position</label>
                        <select name="positionId" id="position" class="form-select">
                            <option>Please choose</option>
                            <option value="1">Quản Lý</option>
                            <option value="2">Nhân Viên</option>
                        </select>
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Education Degree</label>
                        <select name="educationDegreeId" id="educationDegree" class="form-select">
                            <option>Please choose</option>
                            <option value="1">Trung Cấp</option>
                            <option value="2">Cao Đẳng</option>
                            <option value="3">Đại Học</option>
                            <option value="4">Sau Đại Học</option>
                        </select>
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Division</label>
                        <select name="divisionId" id="division" class="form-select">
                            <option>Please choose</option>
                            <option value="1">Sale-Marketing</option>
                            <option value="2">Hành Chính</option>
                            <option value="3">Phục vụ</option>
                            <option value="4">Quản lý</option>
                        </select>
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Flag</label>
                        <input type="number" class="form-control" name="flag" id="flag" value="1" hidden>
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


<!-- Modal Edit -->
<div class="modal fade" id="editEmployee" tabindex="-1" aria-labelledby="editEmployeeLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="row" action="/employee?action=edit" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="editEmployeeLabel">Edit Employee</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="idEdit" id="idEdit">
                    <div class="col-md-12">
                        <label class="form-label">Name Employee</label>
                        <input type="text" class="form-control" placeholder="Name Employee" name="nameEdit"
                               id="nameEdit">
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Birthday</label>
                        <input type="date" class="form-control" name="birthdayEdit" id="birthdayEdit">
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">ID Card</label>
                        <input type="text" class="form-control" placeholder="ID Card" name="idCardEdit" id="idCardEdit">
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Salary</label>
                        <input type="text" class="form-control" placeholder="Salary" name="salaryEdit" id="salaryEdit">
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Phone Number</label>
                        <input type="text" class="form-control" placeholder="Phone Number" name="phoneNumberEdit"
                               id="phoneNumberEdit">
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" placeholder="Email" name="emailEdit" id="emailEdit">
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Address</label>
                        <input type="text" class="form-control" placeholder="Address" name="addressEdit"
                               id="addressEdit">
                    </div>
                    <%--                    <div class="col-md-12">--%>
                    <%--                        <label class="form-label">Account</label>--%>
                    <%--                        <input type="text" class="form-control" placeholder="Account">--%>
                    <%--                    </div>--%>
                    <%--                    <div class="col-md-12">--%>
                    <%--                        <label class="form-label">Gender</label>--%>
                    <%--                        <br>--%>
                    <%--                        <div class="form-check form-check-inline">--%>
                    <%--                            <input type="radio" class="form-check-input" name="rdo" checked>--%>
                    <%--                            <label class="form-check-label">Male</label>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="form-check form-check-inline">--%>
                    <%--                            <input type="radio" class="form-check-input" name="rdo">--%>
                    <%--                            <label class="form-check-label">Female</label>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="form-check form-check-inline">--%>
                    <%--                            <input type="radio" class="form-check-input" name="rdo">--%>
                    <%--                            <label class="form-check-label">Other</label>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <div class="col-md-12">
                        <label class="form-label">Position</label>
                        <select name="positionEdit" id="positionEdit" class="form-select">
<%--                            <option>Please choose</option>--%>
                            <option value="1">Quản Lý</option>
                            <option value="2">Nhân Viên</option>
                        </select>
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Education Degree</label>
                        <select name="educationDegreeEdit" id="educationDegreeEdit" class="form-select">
                            <option>Please choose</option>
                            <option value="1">Trung Cấp</option>
                            <option value="2">Cao Đẳng</option>
                            <option value="3">Đại Học</option>
                            <option value="4">Sau Đại Học</option>
                        </select>
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Division</label>
                        <select name="divisionEdit" id="divisionEdit" class="form-select">
                            <option>Please choose</option>
                            <option value="1">Sale-Marketing</option>
                            <option value="2">Hành Chính</option>
                            <option value="3">Phục vụ</option>
                            <option value="4">Quản lý</option>
                        </select>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-danger btnEdit">Edit</button>
                </div>
            </form>
        </div>
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
        $('#tableEmployee').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
<script>
    function getDetailEdit(id, name, birthday, idCard, salary, phoneNumber, email, address, position, educationDegree, division) {
        document.getElementById("idEdit").value = id;
        document.getElementById("nameEdit").value = name;
        document.getElementById("birthdayEdit").value = birthday;
        document.getElementById("idCardEdit").value = idCard;
        document.getElementById("salaryEdit").value = salary;
        document.getElementById("phoneNumberEdit").value = phoneNumber;
        document.getElementById("emailEdit").value = email;
        document.getElementById("addressEdit").value = address;
        document.getElementById("positionEdit").value = position;
        document.getElementById("educationDegreeEdit").value = educationDegree;
        document.getElementById("divisionEdit").value = division;
    }
</script>

</html>

