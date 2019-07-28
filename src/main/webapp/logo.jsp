﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html><html lang="en" class="no-js"><head>    <meta charset="utf-8">    <title>登录页面</title>    <meta name="viewport" content="width=device-width, initial-scale=1.0">    <meta name="description" content="">    <link href="${pageContext.request.contextPath}/images/favicon.ico" rel="shortcut icon">    <meta name="author" content="">    <!-- CSS -->    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css">    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/supersized.css">    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css"></head><body><div class="page-container">    <h1>Login</h1>    <form action="login" method="post">        <input type="text" name="username" class="username" placeholder="Username">        <input type="password" name="password" class="password" placeholder="Password">        <button type="submit">登录</button>        <div class="error"><span>+</span></div>    </form>    <div class="connect">        <p>Or connect with:</p>        <p>            <a class="facebook" href=""></a>            <a class="twitter" href=""></a>        </p>    </div></div><!-- Javascript --><script src="${pageContext.request.contextPath}/assets/js/jquery-1.8.2.min.js"></script><script src="${pageContext.request.contextPath}/assets/js/supersized.3.2.7.min.js"></script><script src="${pageContext.request.contextPath}/assets/js/supersized-init.js"></script><script src="${pageContext.request.contextPath}/assets/js/scripts.js"></script></body></html>