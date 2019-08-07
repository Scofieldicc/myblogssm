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
    <title>${article.title} | MyBlog</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- 引入本页面的特殊样式 -->
    <link type="text/css" rel="stylesheet" href="css/article.css"/>
    <link type="text/css" rel="stylesheet" href="css/comment.css"/>
</head>
<body>
<div class="head_line"></div>
<div class="container" id="main">
    <!--头部-->
    <div class="head">
        <div id="title">
            <h2>
                <a href="users/index">MyBlog</a>
            </h2>
        </div>
    </div>

    <!--文章内容-->
    <div id="article">
        <!--标题-->
        <div id="a_head ">
            <h3>${article.title}</h3>
            <br/>
            <!--展示 文章时间   文章类别(可以跳转连接)  文章作者-->
            <div>
                <h5>
                    <span>${article.time}</span> <a href="articles/getSortAndArticle?get=${article.sort}">${article.sort}</a>
                    ${article.author}
                </h5>
            </div>
            <!--展示文章的访问次数    喜欢次数   评论次数-->
            <div class="r_div">
                <h5>
                    <span class="glyphicon glyphicon-eye-open">&nbsp;${article.visit}&nbsp;</span>
                    <span class="glyphicon glyphicon-heart" id="love">&nbsp;${article.star}&nbsp;</span>
                    <span class="glyphicon glyphicon-comment">&nbsp;${article.comment}&nbsp; </span>
                </h5>
            </div>
            <!--展示该文章的标签-->
            <div id="tag">
                <c:forEach var="t" items="${article_tags}">
                    <a href="tags/getTagByName?get=${t.tag}">${t.tag}&nbsp;</a>
                </c:forEach>
            </div>
        </div>
    </div>
    <!--分割线-->
    <div class="line"></div>

    <!-- 引入 show.jsp 显示文章内容 ${article.content}-->
    <div id="a_content">
        <jsp:include page="show.jsp"/>
    </div>
    <div>
        <div class="f_div">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <c:choose>
                <c:when test="${article_pre!=null}">
                    <a href="articles/getById?id=${article_pre.id}">&nbsp;上一篇:${article_pre.title}</a>
                </c:when>
                <c:otherwise>
                    &nbsp;没有更早的文章了
                </c:otherwise>
            </c:choose>

        </div>
        <div class="r_div">
            <c:choose>
                <c:when test="${article_next!=null}">
                    <a href="articles/getById?id=${article_next.id}">下一篇:&nbsp;${article_next.title}</a>
                </c:when>
                <c:otherwise>
                    &nbsp;没有更多的文章了
                </c:otherwise>
            </c:choose>
            <span class="glyphicon glyphicon-chevron-right"></span>
        </div>

        <div>
            <span class="btn btn-default" style="color:#d9534f;" onclick="star_article(${article.id})">点赞</span>
        </div>
        <br/>
    </div>
    <div class="line"></div>
    <!-- 评论 -->
    <div class="comment">
        <!-- 加载文章评论 -->
        <c:if test="${comment!=null}">
            <c:forEach var="comm" varStatus="status" items="${comment}">
                <div class="row">
                    <div class="f_div">
                        <img src="img/comment.jpg" height="50" width="50" class="img-circle"/>
                        &nbsp;&nbsp;
                        <span style="color: #428bca"> ${comm.nickname}</span>
                        <span>&nbsp;&nbsp;${comm.time}</span>
                    </div>
                    <div id="c_content" class="c_left">
                        <pre>${comm.content }</pre>
                    </div>
                    <div class="r_div">
                        <a><span class="glyphicon glyphicon-thumbs-up"
                                 onclick="star(this,${comm.id})">${comm.star}</span></a>
                        &nbsp;
                        <a><span class="glyphicon glyphicon-thumbs-down"
                                 onclick="diss(this,${comm.id})">${comm.diss}</span></a>
                        &nbsp;
                        <!-- admin here -->
                        <c:if test="${sessionScope.user!=null}">
                            <span class="btn btn-default" style="color:red;"
                                  onclick="deletecm(this,${comm.id})">删除</span>
                            &nbsp;
                        </c:if>
                    </div>
                    <div class="line"></div>
                </div>

            </c:forEach>

        </c:if>
    </div>
    <!-- 这里可以扩展子评论 -->


    <!-- 写评论 -->
    <div class="r_div">
        <a href="javascript:void(0);"><span class="glyphicon glyphicon-pencil">&nbsp;写评论....</span></a>
    </div>
    <div id="comment">
        <form id="form">
            <input style="width:30%;display: none;" class="form-control" type="text" name="articleId" value="${article.id}" >
            <input style="width:30%" class="form-control" type="text" name="nickname" value="热心网友">
            <br/>
            <textarea style="resize:none; width:100%; height:180px;" name="content"></textarea>
            <br/>
            <br/>
            <input class="btn btn-default" type="button" value="评论" id="btn" onclick="comment_article(${article.id})"/>
            <br/>
        </form>
    </div>
    <div class="line"></div>
</div>
<div id="footer">

</div>  <a href="index.jsp">MyBlog首页&nbsp;&nbsp;</a>|
<a href="javascript:scroll(0,0)">&nbsp;&nbsp;返回顶部</a>
<!-- footer -->
</body>
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/layer/layer.js"></script>

<script type="text/javascript">

    //删除功能
    function deletecm(e,id) {
        $.ajax({
            //请求方式
            type:"GET",
            //请求地址
            url:"comment/delete?id=" + id,
            success:function () {
                e.parentElement.parentElement.remove();
                console.log("成功");
            },
            error:function (a,b,c) {
                console.log("错误");
                console.log(c);
            }
        })
    }
    //点赞功能
    function star_article(aId) {
        //jquery的ajax
        $.ajax({
            //请求方式
            type:"GET",
            //请求地址
            url:"articles/star?id="+aId,
            //声明服务器返回了数据的类型
            dataType:"json",
            //data:$("#form").serialize(),
            success:function(data){
                document.getElementById("love").innerHTML = "&nbsp"+data.star+"&nbsp";
            }//,
            // errror:function(a,b,c){
            //     console.log(c);
            // }
        })
    }
    // window.oneload =function(){
    // $(".bth").click(function () {
    //
    // })}
    //增加评论功能
    function comment_article(aId) {
        $.ajax({
            //请求方式
            type:"POST",
            //请求地址
            url:"comment/insert/"+aId+"/",
            // data:{
            //     "content": $("#content").val(),
            // },
            data:$("#form").serialize(),
            //声明服务器返回类型
        dataType:"json",
        success:function () {
                window.location.reload();//刷新页面
        },
            error:function (a,b,c) {//a状态 b时间 c错误信息
                console.log(c);
            }
        })
    }
</script>
</html>