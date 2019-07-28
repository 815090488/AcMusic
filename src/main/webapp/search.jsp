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
    <title>音乐列表</title>
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
                <h4 class="modal-title" id="myModalLabel">添加歌单</h4>
            </div>
            <form>
                <div class="modal-body">
                    选择歌单：
                    <select id="sele" class="form-control">
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button id="songBtn" type="button" class="btn btn-primary">确定</button>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="container">
    <div class="header">
        <h1 class="logo" style="background-image: url(images/logo.jpg);margin-top: -37px;width: 240px;height: 100px;">
        <a><img src="images/logo2.jpg" alt=""></a></h1>
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
                <li><a class="normal " href="#">首页</a></li>
                <li><a class="normal active" href="songlist?pageNumber=1">歌曲列表</a></li>
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
        <div class="col-md-12 col-md-offset-3">
            <form method="get" action="search" class="form-inline">
                <div class="form-group">
                    <input type="text" name="search" class="form-control" id="exampleInputName2" placeholder="Jane Doe">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
        </div>
    </div>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
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
                    <th>添加</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${musicList}" var="music">
                    <tr>
                        <td><input type="checkbox" value="${music.id}"/></td>
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
                                            type: "GET",
                                            url: "/AcMusic1/count?id=${music.id}"
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
                        <td>
                            <button onclick="getTableContent(this)" type="button" class="btn btn-default"
                                    aria-label="Left Align" data-toggle="modal" data-target="#myModal">
                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                <script>

                    function getTableContent(node) {
                        $("#sele").empty();
                        $.ajax({
                            url: "/AcMusic1/songmenu?&songMenu1=ajax",
                            type: "GET",
                            success: function (str) {
                                console.log(str);
                                var str = $.parseJSON(str);
                                $(str).each(function (index, ele) {
                                    var optionEle = $("<option></option>").append(this.menuname).attr("value", this.id);
                                    $("select").append(optionEle);
                                })
                            }
                        });
                    }

                    //添加歌单
                    $("#songBtn").click(function () {
                        var opti = $("#sele").val();
                        var musicid = $("table tr").eq(1).children().eq(0).children().eq(0).val();
                        //var musicid = $(this).find("td").eq(0).children().eq(0).val();
                        $.ajax({
                            url: "/AcMusic1/songmenu?songMenu1=addSong",
                            type: "GET",
                            data: {
                                musicid: musicid,
                                seleVal: opti
                            },
                            dataType: "json"
                        });
                        window.close();
                    })
                </script>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>

