<%--
  Created by IntelliJ IDEA.
  User: 81509
  Date: 2019/7/3
  Time: 13:32
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
    <title>专辑列表</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>


    <link href="${pageContext.request.contextPath}/images/favicon.ico" rel="shortcut icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index_04cfa9d3c4.css">

</head>
<body>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">购买专辑</h4>
            </div>
            <div class="modal-body">

                <div class="row">
                    <div class="col-md-3">
                        <img src="images/20190531093342805801.jpg" alt="" class="img-thumbnail">
                    </div>
                    <div class="col-md-6">
                        <span style="font-size: 20px; font:bold">专辑：${clipe.clipename}<br/></span>
                        歌手：${clipe.player}<br/>
                        价格：${clipe.price}
                        <br>
                        <img id="PayImg" src="images/wechat.jpg" alt="支付码" class="img-thumbnail">
                        <hr/>
                        支付方式：
                        <button type="button" class="btn btn-success" id="weiBtn">微信支付</button>
                        <button type="button" class="btn btn-default" id="zhiBtn">支付宝支付</button>
                    </div>
                    <script type="text/javascript">
                        $(function () {
                            $("#weiBtn").click(function () {
                                $("#weiBtn").removeClass("btn-default").addClass("btn-success");
                                $("#zhiBtn").removeClass("btn-success").addClass("btn-default");
                                $("#PayImg").attr("src", "images/wechat.jpg");
                            });

                            $("#zhiBtn").click(function () {
                                $("#zhiBtn").removeClass("btn-default").addClass("btn-success");
                                $("#weiBtn").removeClass("btn-success").addClass("btn-default");
                                $("#PayImg").attr("src", "images/alipay.jpg");
                            });
                        })
                    </script>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn btn-danger" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">购买</button>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <div class="header">
        <h1 class="logo" style="background-image: url(images/logo.jpg);margin-top: -37px;width: 240px;height: 100px;">
        <a  ><img src="images/logo.jpg" alt=""></a></h1>
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
                <li><a class="normal" href="#" >首页</a></li>
                <li><a class="normal" href="songlist?pageNumber=1">歌曲列表</a></li>
                <li><a class="normal" id="productCenter" href="Ranking?pageNumber=1">排行榜</a></li>
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
        <div class="col-md-3">
            <h1>专辑列表</h1><br>
            <table style="width: 200px;">
                <tr>
                    <img style="width: 200px;height: 200px;" src="${pageContext.request.contextPath}/${clipe.cover}"
                         alt="..." class="img-thumbnail">
                </tr>
                <tr>
                    <td>
                        专辑名：${clipe.clipename}
                    </td>
                </tr>
                <tr>
                    <td>
                        歌手：${clipe.player}
                    </td>
                </tr>
                <tr>
                    <td>
                        唱片公司：${clipe.com}
                    </td>
                </tr>
                <tr>
                    <td>
                        发行时间：${clipe.pubyear}
                    </td>
                </tr>
            </table>
        </div>
        <div class="col-md-6"><span style="font-size: 30px;">专辑歌曲列表</span>
            <!-- Button trigger modal -->
            <button type="button" class="btn col-md-offset-4  btn-primary " data-toggle="modal" data-target="#myModal">
                购买专辑
            </button>
            <br>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox"/>
                    </th>
                    <th>歌曲</th>
                    <th>歌手</th>
                    <th>专辑</th>
                    <th>播放</th>
                    <th>下载</th>
                </tr>
                </thead>
                <tbody
                <c:forEach items="${musicList}" var="musicList">
                    <tr>
                        <td><input type="checkbox"/></td>
                        <td>${musicList.musicname}</td>
                        <td>${musicList.player}</td>
                        <td>${musicList.clipe.clipename}</td>
                        <td>
                            <button type="button" class="btn btn-default" aria-label="Left Align">
                                <span class="glyphicon glyphicon-play" id="playBtnClass${musicList.id}"
                                      aria-hidden="true"></span>
                                <audio id="audio${musicList.id}"
                                       src="${pageContext.request.contextPath}/${musicList.storeaddress}"></audio>
                            </button>
                        </td>
                        <script type="text/javascript">
                            $(function () {
                                var onOff = true;
                                $("#playBtnClass${musicList.id}").click(function () {
                                    if (onOff) {
                                        audio${musicList.id}.play();
                                        $.ajax({
                                            type: "GET",
                                            url: "/AcMusic1/count?id=${musicList.id}"
                                        });
                                        onOff = false;
                                        $("#playBtnClass${musicList.id}").removeClass("glyphicon-play").addClass("glyphicon-pause");
                                    } else {
                                        onOff = true;
                                        audio${musicList.id}.pause();
                                        $("#playBtnClass${musicList.id}").removeClass("glyphicon-pause").addClass("glyphicon-play");
                                    }
                                });

                            })
                        </script>
                        <td>
                            <button type="button" class="btn btn-default" aria-label="Left Align">
                                <c:url value="downLoad" var="downUrl">
                                    <c:param name="filename" value="${musicList.storeaddress}"/>
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
        </div>
    </div>
</div>
</body>
</html>
