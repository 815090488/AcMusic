<%--
  Created by IntelliJ IDEA.
  User: 81509
  Date: 2019/7/4
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
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
    <meta charset="utf-8">
    <title>音乐排行榜</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>


    <link href="${pageContext.request.contextPath}/images/favicon.ico" rel="shortcut icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index_04cfa9d3c4.css">

</head>
<body>
<div class="container">
    <div class="header">
        <h1 class="logo" style="background-image: url(images/logo.jpg);margin-top: -37px;width: 240px;height: 100px;">
        <a><img src="./image/logo2.jpg" alt=""></a></h1>
        <div class="topNav fr">

            <div class="login_area">
                <div id="login_in" class="clearfix">
                    <img style="width: 50px; height: 50px;" src="images/20190531093342805801.jpg" alt="..."
                         class="col-md-offset-10 img-circle">
                    <a target="_blank"  class="regin_btn">注册</a></div>
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
                <li><a class="normal " href="#" >首页</a></li>
                <li><a class="normal" href="songlist?pageNumber=1">歌曲列表</a></li>
                <li><a class="normal active" id="productCenter" href="Ranking?pageNumber=1">排行榜</a></li>
                <li><a class="normal" href="songmenu?songMenu1=songMenu1&id=1">歌单</a></li>
                </li>
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
    <hr/>
    <div class="row">
        <div class="col-md-12"><span style="font-size: 30px;">排行榜</span>
            <button type="button" class="btn btn-primary col-md-offset-9"><span
                    class="glyphicon glyphicon-triangle-right" aria-hidden="true">播放全部</span></button>
            <br>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox"/>
                    </th>
                    <th>热度</th>
                    <th>歌曲</th>
                    <th>歌手</th>
                    <th>专辑</th>
                    <th>播放</th>
                    <th>下载</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pageBean.datalist}" var="music">
                    <tr>
                        <td><input type="checkbox"/></td>
                        <td id="playNUM${music.id}">${music.playnum}</td>
                        <td>${music.musicname}</td>
                        <td>${music.player}</td>
                        <td><a href="clipe?clip=${music.clipeid}">${music.clipe.clipename}</a></td>
                        <td>
                            <button type="button" class="btn btn-default" aria-label="Left Align">
                                <span class="glyphicon glyphicon-play" id="playBtnClass${music.id}"
                                      aria-hidden="true"></span>
                                <audio id="audio${music.id}"
                                       src="${pageContext.request.contextPath}/${music.storeaddress}"></audio>
                            </button>
                        </td>
                        <script type="text/javascript">
                            $(function () {
                                var onOff = true;
                                $("#playBtnClass${music.id}").click(function () {
                                    if (onOff) {
                                        audio${music.id}.play();
                                        $.ajax({
                                            type:"GET",
                                            url:"/AcMusic1/count?id=${music.id}",
                                            success:function (PlyaNum) {
                                               $("#playNUM${music.id}").text(PlyaNum);
                                            }
                                        });
                                        onOff = false;
                                        $("#playBtnClass${music.id}").removeClass("glyphicon-play").addClass("glyphicon-pause");
                                    } else {
                                        onOff = true;
                                        audio${music.id}.pause();
                                        $("#playBtnClass${music.id}").removeClass("glyphicon-pause").addClass("glyphicon-play");
                                    }
                                });
                            })
                        </script>
                        <td>
                            <button type="button" class="btn btn-default" aria-label="Left Align">
                                <c:url value="downLoad" var="downUrl">
                                    <c:param name="filename" value="${music.storeaddress}"/>
                                </c:url>
                                <a href="${downUrl}">
                                    <span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span>
                                </a>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <nav class="col-md-12 col-md-offset-4" aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="Ranking?pageNumber=${pageBean.pageNumber-1==0?1:pageBean.pageNumber-1}"
                           aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${pageBean.pageSize}" var="i">
                        <c:if test="${pageBean.pageNumber<=5}">
                            <c:if test="${pageBean.pageNumber==i}">
                                <li class="active"><a href="Ranking?pageNumber=${i}">${i}</a></li>
                            </c:if>
                            <c:if test="${pageBean.pageNumber!=i}">
                                <li><a href="Ranking?pageNumber=${i}">${i}</a></li>
                            </c:if>
                        </c:if>
                        <c:if test="${pageBean.pageNumber>5}">
                            <c:if test="${pageBean.pageNumber==i+5}">
                                <li class="active"><a href="Ranking?pageNumber=${i+5}">${i+5}</a></li>
                            </c:if>
                            <c:if test="${pageBean.pageNumber!=i+5}">
                                <li><a href="Ranking?pageNumber=${i+5}">${i+5}</a></li>
                            </c:if>
                        </c:if>
                        <c:if test="${pageBean.pageNumber>10}">
                            <c:if test="${pageBean.pageNumber==i+10}">
                                <li class="active"><a href="Ranking?pageNumber=${i+10}">${i+10}</a></li>
                            </c:if>
                            <c:if test="${pageBean.pageNumber!=i+10}">
                                <li><a href="Ranking?pageNumber=${i+10}">${i+10}</a></li>
                            </c:if>
                        </c:if>
                    </c:forEach>
                    <li>
                        <a href="Ranking?pageNumber=${pageBean.pageNumber>=pageBean.totalCount?pageBean.totalCount:pageBean.pageNumber+1}"
                           aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>

