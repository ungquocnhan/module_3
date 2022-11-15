<%--
  Created by IntelliJ IDEA.
  User: QUOC NHAN
  Date: 11/9/2022
  Time: 1:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Header</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<div>
<nav class="navbar navbar-expand-lg navbar-light bg-primary">
    <div class="container">
        <a class="navbar-brand me-2" href="/">
            <img
                    src="img/logo@2x.png"
                    height="60"
                    alt="Furama Logo"
                    loading = "lazy"
                    style="margin-top: -1px;"
            />
        </a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="/">Furama Resort</a>
                </li>
            </ul>
            <div class="d-flex align-items-center">
                <button type="button" class="btn btn-success btn-sm px-3 me-2">
                    Login
                </button>
            </div>
        </div>
    </div>
</nav>


<nav class="navbar navbar-expand-sm bg-success navbar-light">
    <div class="container-fluid justify-content-center">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link active" href="/">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/employee">Employee</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="/customer" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Customer
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/customer">Customer</a></li>
                    <li><a class="dropdown-item" href="/customer_use_facility">Customer Use Facility</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                </ul>
            </li>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link" href="/customer">Customer</a>--%>
<%--            </li>--%>
            <li class="nav-item">
                <a class="nav-link" href="/facility">Facility</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Contract</a>
            </li>
        </ul>
    </div>
</nav>
</div>
</body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</html>
