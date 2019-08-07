<%--
  User: xyLonely
  Date: 2018/12/19 13:54
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>首页 | MyBlog</title>
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
</head>

<body>
<div class="head_line"></div>

<div class="container" id="main">

    <div id="header"></div>

    <div class="row c_center">
        <div class="col-md-3" id="left_content">
            <!-- blog标题 -->
            <div id="title">
                <h2><a href="users/loginout">MyBlog</a></h2>
                <h5 class="text-muted">Winner Winner Chicken Dinner!</h5>
            </div>
            <!-- 用户信息 -->
            <div class="c_center" id="person_info">
                <img src="img/header.jpg" height="130" width="130"
                     alt="丢失了我的头像?" class="img-circle">
                <h4 class="text-muted">${user.userName}</h4>
                <h5 class="text-muted">星星和浮云.</h5>
            </div>

            <!-- 这里初始化侧边栏的三个小标签 -->
            <div class="c_center">
                <!-- 点击日志按钮跳转到index.jsp -->
                <div class="inline ">
                    <a href="users/index">${article_number}<br/>日志</a>
                </div>
                <!--点击分类按钮跳转到sort.jsp 并且加载所有分类以及分类下面对应的文章 -->
                <div class="inline ">
                    <a href="articles/getSortInfo"><span> ${sort_number} </span><br/>分类</a>
                </div>
                <!--点击分类按钮跳转到tag.jsp 并且加载所有标签以及标签下面对应的文章 -->
                <div class="inline ">
                    <a href="tags/getTagInfo"><span>${tag_number}</span><br/>标签</a>
                </div>
            </div>

            <!-- 这里初始化侧边栏的三个大标签 -->
            <div id="list">
                <table class="table table-hover c_center">
                    <tr class="active">
                        <!-- 点击日志按钮跳转到index.jsp -->
                        <td><a href="users/index"><span class="glyphicon glyphicon-home"></span>
                            &nbsp;&nbsp;首页</a></td>
                    </tr>
                    <tr>
                        <!--点击分类按钮跳转到sort.jsp 并且加载所有分类以及分类下面对应的文章 -->
                        <td><a href="articles/getSortInfo"><span class="glyphicon glyphicon-list"></span>
                            &nbsp;&nbsp;分类</a></td>
                    </tr>
                    <tr>
                        <!--点击分类按钮跳转到tag.jsp 并且加载所有标签以及标签下面对应的文章 -->
                        <td><a href="tags/getTagInfo"><span class="glyphicon glyphicon-tags"></span>
                            &nbsp;&nbsp;标签</a></td>
                    </tr>
                    <tr>
                        <td><a href="about.html"><span class="glyphicon glyphicon-user"></span>
                            &nbsp;&nbsp;关于</a></td>
                    </tr>
                </table>
            </div>
            <br/>

            <!-- 这里初始化分类 -->
            <div class="sort">
                <div class="list-group">
                    <span class="list-group-item active">分类</span>
                    <c:forEach var="entity" items="${sort_count_map}">
                        <a href="articles/getSortAndArticle?get=${entity.key}" class="list-group-item">${entity.key}&nbsp;&nbsp;&nbsp;&nbsp;
                            (${entity.value})</a>
                    </c:forEach>
                </div>
            </div>

            <!-- 这里初始化阅读排行 -->
            <div class="visit">
                <div class="list-group">
                    <span class="list-group-item active">阅读排行</span>
                    <c:forEach var="a" items="${article_list}">
                        <a href="articles/getById?id=${a.id}" class="list-group-item">${a.title}&nbsp;&nbsp; <span
                                class="c_right">(${a.visit})</span></a>
                    </c:forEach>
                </div>
            </div>

            <!-- 这里初始化标签 -->
            <div id="tag">
                <div class="list-group">
                    <span class="list-group-item active">标签</span>
                    <br/>
                    <c:forEach var="t" varStatus="status" items="${tag_list}">
                        <c:choose>
                            <c:when test="${status.count%2==1}">
							<span class="label label-info"><a href="tags/getTagByName?get=${t.tag}">
							&nbsp;${t.tag}&nbsp;</a></span>
                            </c:when>
                            <c:otherwise>
								<span class="label label-success"><a href="tags/getTagByName?get=${t.tag}">
								&nbsp;${t.tag}&nbsp;</a></span>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </div><!-- tag -->


            <!-- 管理员操作的权限 -->
            <c:if test="${sessionScope.user!=null}">
                <a href="AddServlet">
                    <span class="glyphicon glyphicon-plus">&nbsp;&nbsp;写新文章&nbsp;&nbsp;</span>
                </a>
                <a href="AdminServlet">
                    <span class="glyphicon glyphicon glyphicon-user">&nbsp;&nbsp;管理更多&nbsp;&nbsp;</span>
                </a>
            </c:if>
            <!--  -->
        </div>
        <div class="col-md-2" id="center_content">
        </div>

        <!-- 初始化文章列表完成 -->
        <div class="col-md-7 " id="right_Content">
            <br/>
            <br/>
            <div class="list-group">
                <a href="javascript:void(0);" class="list-group-item active">文章</a>
                <!-- 这里初始化文章列表 -->
                <c:forEach var="article" items="${article_list}">
                    <div class="list-group-item">
                        <h4><a href="articles/getById?id=${article.id}">${article.title}</a></h4>
                        <br/>
                        <span>${article.time}&nbsp;&nbsp;|</span>
                        <a href="articles/getSortAndArticle?get=${article.sort}">${article.sort}</a>&nbsp;&nbsp;|
                        <span>阅读次数: ${article.visit}</span>
                        <br/><br/>
                        <span>${article.content}</span>
                        <br/><br/><br/>
                        <a href="articles/getById?id=${article.id}">阅读全文</a>
                        <br/>
                    </div>
                </c:forEach>
            </div>
        </div>

    </div>
    <div class="foot_line"></div>
</div><!-- container -->
<!-- 底部信息 -->
<div id="footer">
    <div>
        <a href="https://github.com/LonelyXy"><img src="img/github.png" width="20px" height="20px"
                                                   class="img-circle">&nbsp;&nbsp;GitHub</a>
        &nbsp;|
        <a href="javascript:scroll(0,0)">&nbsp;&nbsp;MyBlog</a>
        <br/>
    </div>
</div>
</body>
</html>
