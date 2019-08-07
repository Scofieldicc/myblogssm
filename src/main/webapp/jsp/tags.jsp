<%--
  User: xyLonely
  Date: 2018/12/19 13:54
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <title>标签 | MyBlog</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="css/public.css"/>
    <link type="text/css" rel="stylesheet" href="css/tags.css"/>
    <script src="js/jquery-2.1.1.min.js"></script>
</head>
<body>
<div class="head_line"></div>

<div class="container" id="main">

    <div id="header"></div>

    <div class="row c_center">
        <div class="col-md-3" id="left_content">

            <div id="title">
                <h2>
                    <a href="users/index">MyBlog</a>
                </h2>
                <h5 class="text-muted">Winner Winner Chicken Dinner!</h5>
            </div>

            <div class="c_center" id="person_info">
                <img src="img/header.jpg" height="130" width="130"
                     alt="what?" class="img-circle">
                <h5 class="text-muted">Chicken Dinner Again!</h5>
            </div>


            <div id="list">
                <table class="table table-hover c_center">
                    <tr>
                        <td><a href="users/index"><span class="glyphicon glyphicon-home"></span>
                            &nbsp;&nbsp;首页</a></td>
                    </tr>
                    <tr>
                        <td><a href="articles/getSortInfo"><span class="glyphicon glyphicon-list"></span>
                            &nbsp;&nbsp;分类</a></td>
                    </tr>
                    <tr>
                        <td class="active"><a href="tags/getTagInfo"><span class="glyphicon glyphicon-tags"></span>
                            &nbsp;&nbsp;标签</a></td>
                    </tr>
                    <tr>
                        <td><a href="about.html"><span class="glyphicon glyphicon-user"></span>
                            &nbsp;&nbsp;关于</a></td>
                    </tr>
                </table>
            </div>
            <!-- list -->
            <br/>
        </div>
        <div class="col-md-2" id="center_content"></div>
        <div class="col-md-7 " id="right_content">
            <br/><br/>
            <div class="list-group">

                <a href="#" class="list-group-item active">标签</a>
                <!-- 这里初始化标签 -->
                <c:forEach var="map" items="${tag_map}">
                    <div class="tags_name">
                        <!-- 标签名字 -->
                        <span class="glyphicon glyphicon-triangle-bottom"></span>&nbsp; &nbsp;${map.key}
                    </div>
                    <div>
                        <!-- 标签信息 -->
                        <ul class="list-group">
                            <c:forEach var="list" items="${map.value}">
                                <li class="list-group-item">
                                    <div>
                                        <div>
                                            <div>
                                                <a href="articles/getById?id=${list.id}">${list.title}</a>
                                            </div>
                                            <div class="c_right">
                                                <img src="img/time.png">
                                                    ${list.time}&nbsp;&nbsp;
                                                <span class="visit"><img src="img/visit.png">
									${list.visit}	</span>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:forEach>
                <!-- 初始化标签完成 -->

            </div>
        </div>
    </div>

    <div class="foot_line"></div>
</div>
<!-- container -->


<div id="footer">
    <a href="javascript:scroll(0,0)">&nbsp;&nbsp;MyBlog</a>
</div>
<!-- footer -->

</body>
</html>