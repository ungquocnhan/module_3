<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>index.jsp</title>
  <style type="text/css">
    .login{
      height: 180px;
      width: 230px;
      margin: 0;
      padding: 10px;
      border: 1px solid #CCCCCC;
    }

    .login input{
      padding: 5px;
      margin: 5px;
    }
  </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/login" method="post">
  <div class="login">
    <h2>Login</h2>
    <input type="text" name="username" size="30" placeholder="username">
    <input type="password" name="password" size="30" placeholder="password">
    <input type="submit" value="Sign in">
  </div>
</form>
</body>
</html>