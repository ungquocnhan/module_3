<%--
  Created by IntelliJ IDEA.
  User: QUOC NHAN
  Date: 11/2/2022
  Time: 1:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="${pageContext.request.contextPath}/discount" method="post">
    <input type="text" name="product_description" placeholder="Product Description">
    <input type="text" name="list_price" placeholder="List Price">
    <input type="text" name="discount_percent" placeholder="Discount Percent">
    <input type="submit" id="submit" value="Calculate Discount">

  </form>
  </body>
</html>
