<%--
  Created by IntelliJ IDEA.
  User: QUOC NHAN
  Date: 11/6/2022
  Time: 10:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Furama Web</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</head>
<body>

<%--  <c:redirect url="/customer"></c:redirect>--%>
<div id="main" class="vh-100">

    <nav class="navbar navbar-expand-lg navbar-light bg-primary">
        <div class="container">
            <a class="navbar-brand me-2" href="/">
                <img
                        src="img/logo@2x.png"
                        height="60"
                        alt="Furama Logo"
                        loading="lazy"
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
                    <a class="nav-link active" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/employee">Employee</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/customer" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        Customer
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/customer">Customer</a></li>
                        <li><a class="dropdown-item" href="/customer_use_facility">Customer Use Facility</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/facility">Facility</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contract</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="row" style="min-height: 28rem">
        <div class="col-lg-6">
            <img src="img/furama-da-nang-resort.jpg" height="100%" width="100%"/>
        </div>
        <div class="col-lg-6">
            <img src="img/furama-da-nang-resort-1.jpg" height="100%" width="100%"/>
        </div>
    </div>

    <!-- Footer -->
    <footer class="text-center text-lg-start bg-white text-muted">
        <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
            <div class="me-5 d-none d-lg-block">
                <span>Get connected with us on social networks:</span>
            </div>

            <div>
                <a href="" class="me-4 link-secondary">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="" class="me-4 link-secondary">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="" class="me-4 link-secondary">
                    <i class="fab fa-google"></i>
                </a>
                <a href="" class="me-4 link-secondary">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="" class="me-4 link-secondary">
                    <i class="fab fa-linkedin"></i>
                </a>
                <a href="" class="me-4 link-secondary">
                    <i class="fab fa-github"></i>
                </a>
            </div>

        </section>
        <section class="bg-success text-white">
            <div class="container text-center text-md-start mt-5">
                <div class="row mt-3">
                    <div class="col-md-4 col-lg-5 col-xl-5 mx-auto mb-4">
                        <h6 class="text-uppercase fw-bold mb-4">
                            <i class="fas fa-gem me-3 text-secondary"></i>Hướng Dẫn Di Chuyển
                        </h6>
                        <p>
                            Khu nghỉ dưỡng Furama là cơ sở hàng đầu để khám phá một trong những điểm đến hấp dẫn nhất
                            Châu Á. Chỉ cách Đà Nẵng một quãng lái xe ngắn là bốn Di sản Văn hóa Thế giới được UNESCO
                            công nhận:
                        </p>
                        <p>
                            Địa Điểm
                        </p>
                        <ol>
                            <li>Cố đô Huế 2 tiếng</li>
                            <li>Phố cổ Hội An 30 phút</li>
                            <li>Thánh địa Mỹ Sơn 90 phút</li>
                            <li>Động Phong Nha 3 tiếng</li>
                        </ol>
                    </div>

                    <div class="col-md-4 col-lg-2 col-xl-2 mx-auto mb-4">
                        <p>
                            <a href="#" class="text-reset">Giá Công Bố</a>
                        </p>
                        <p>
                            <a href="#" class="text-reset">Lifestyle Blog</a>
                        </p>
                        <p>
                            <a href="#" class="text-reset">Tuyển Dụng</a>
                        </p>
                        <p>
                            <a href="#" class="text-reset">Liên Hệ</a>
                        </p>
                    </div>

                    <div class="col-md-4 col-lg-5 col-xl-5 mx-auto mb-md-0 mb-4">
                        <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                        <p><i class="fas fa-home text-secondary"></i>Address: 103 - 105 Vo Nguyen Giap Street, Khue
                            My Ward, Ngu Hanh Son District, Danang City, Vietnam</p>
                        <p>
                            <i class="fas fa-envelope text-secondary"></i>
                            Email: reservation@furamavietnam.com
                        </p>
                        <p><i class="fas fa-phone text-secondary"></i>Tel.: 84-236-3847 333/888</p>
                        <p><i class="fas fa-print text-secondary"></i>Fax: 84-236-3847 666</p>
                    </div>
                </div>
            </div>
        </section>

        <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.025);">
            © 2022 Copyright:
            <a class="text-reset fw-bold" href="#">www.furamavietnam.com</a>
        </div>
    </footer>
</div>
</body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</html>
