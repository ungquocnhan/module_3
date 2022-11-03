<%--
  Created by IntelliJ IDEA.
  User: QUOC NHAN
  Date: 11/3/2022
  Time: 1:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</head>
<body>
<h1>Simple Calculator</h1>
<form action="/calculate" method="get">
    <div class="row">
        <div class="col">
            <label>First operand: </label>
            <input type="text" class="form-control" placeholder="First operand" name="first_operand">
        </div>
        <div class="row">
            <label>Operator: </label>
            <select class="form-select" name="operator">
            <option>Choose</option>
            <option>+</option>
            <option>-</option>
            <option>*</option>
            <option>/</option>
        </select>
        </div>
        <div class="col">
            <label>Second operand: </label>
            <input type="text" class="form-control" placeholder="Second operand" name="second_operand">
        </div>
        <div>
        <input type="submit" id="submit" value="Calculate">
        </div>
    </div>
</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</html>
