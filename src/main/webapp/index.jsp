<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>AC音乐</title>
    <link href="images/favicon.ico" rel="shortcut icon">
    <link rel="stylesheet" href="css/index_04cfa9d3c4.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/slide.css">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/slide.js"></script>
</head>

<body>
<div class="mainPage">
    <div class="header">
        <h1 class="logo" style="background-image: url(images/logo.jpg);margin-top: -37px;width: 240px;height: 100px;">
            <a><img src="images/logo.jpg" alt=""></a></h1>
        <div class="topNav fr">
            <ul>
                <li><a target="_blank" >客服中心</a></li>
                <li><a target="_blank" >招贤纳士</a></li>
                <li><a target="_blank" >会员中心 </a></li>
            </ul>
            <div class="login_area">
                <div id="login_in" class="clearfix">
                    <c:if test="${user!=null}">
                        <a>${sessionScope.user.username}</a>
                        <a href="loginOut">退出</a>
                    <a target="_blank"  class="regin_btn">注册</a></div>
                </c:if>
                <c:if test="${user==null}">
                    <a href="logo.jsp">登录</a>
                    <a href="register.jsp">注册</a>
                    <a target="_blank"  class="regin_btn">注册</a></div>
                </c:if>
            <div id="login_out" class="clearfix">
            </div>
            <div id="user_menu" class="user_menu">
                <div class="topArrow1"></div>
                <div class="topArrow2"></div>
                <ul>
                    <li><a target="_blank" ><span class="user_icon1"></span>个人帐号</a></li>
                    <li><a ><span class="user_icon2"></span>退出登录</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="navWrap">
    <div class="nav">
        <ul class="homeNav">
            <li><a class="normal active" href="#" >首页</a></li>
            <li><a class="normal" href="songlist?pageNumber=1">歌曲列表</a></li>
            <li><a class="normal" id="productCenter" href="Ranking?pageNumber=1">排行榜</a></li>
            <li><a class="normal" href="songmenu?songMenu1=songMenu1&id=1">歌单</a></li>
        </ul>
        <ul class="secondMenu" id="secondMenu">
            <li><a >电台</a></li>
            <li><a >MV</a></li>
            <li><a >歌单</a></li>
            <li><a >歌手</a></li>
        </ul>
        <ul class="subNav">
            <li><a target="_blank"  class="icon icon-nav1">音乐直播</a></li>
            <li><a target="_blank"  class="icon icon-nav2">ACLIVE</a></li>
            <li><a target="_blank"  class="icon icon-nav3">音乐人</a></li>
            <li><a target="_blank"  class="icon icon-nav8">成为主播</a></li>
            <li><a target="_blank"  class="icon icon-nav5">商城</a></li>

        </ul>
    </div>
</div>
<div>
    <div id="show" rel="autoPlay">
        <div class="img">
						<span>
							<a  target="_blank"><img src="images/1.jpg"/></a>
							<a  target="_blank"><img src="images/2.jpg"/></a>
							<a  target="_blank"><img src="images/3.jpg"/></a>
							<a  target="_blank"><img src="images/4.jpg"/></a>
							<a  target="_blank"><img src="images/5.jpg"/></a>
						</span>
            <div class="masks mk1"></div>
            <div class="masks mk2"></div>
        </div>
    </div>
</div>
</div>
</body>
</html>
