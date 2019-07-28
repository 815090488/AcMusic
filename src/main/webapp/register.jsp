<%--
  Created by IntelliJ IDEA.
  User: 81509
  Date: 2019/7/2
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>注册界面</title>
    <link href="${pageContext.request.contextPath}/images/favicon.ico" rel="shortcut icon">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="col-md-3 col-md-offset-4">
        <form method="post" action="register">
            <div class="form-group" style="margin-top:40%">
                <label >用户名</label>
                <input name="username" type="text" class="form-control"  placeholder="Password">
            </div>
            <div class="form-group">
                <label>密码</label>
                <input name="password" type="password" class="form-control"  placeholder="Password">
            </div>
            <div class="form-group">
                <label >邮箱</label>
                <input name="email" type="email" class="form-control"  placeholder="Password">
            </div>
            <label class="radio-inline">
                <input type="radio" name="sex" id="inlineRadio1" value="1"> 男
            </label>
            <label class="radio-inline">
                <input type="radio" name="sex" id="inlineRadio2" value="0"> 女
            </label>
            <br />
            <button type="submit" class="btn btn-default">Submit</button>
        </form>
    </div>
</div>
</body>
</html>
