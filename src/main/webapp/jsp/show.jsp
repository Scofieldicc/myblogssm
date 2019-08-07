<%--
  User: xyLonely
  Date: 2018/12/19 13:54
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Md2Html</title>
<!-- 这个文件用来转换 Markdown 到Html 显示 -->
<!-- 参数: ${article.content} -->
</head>

<!-- preview的css -->
<link rel="stylesheet" href="editormd/css/style.css" />
 <link rel="stylesheet" href="editormd/css/editormd.preview.css" />


<body style="background:#eee;">
 <div id="mdView"  style="background:#eee;">  	
  <textarea id="article_content"  >${article.content}</textarea>   
 </div>  
<br />
</body>
<%--<!-- 引入editormd相关 -->--%>
<script src="js/jquery-2.1.1.min.js"></script>
<script src="editormd/js/zepto.min.js"></script>
<script src="editormd/js/editormd.js"></script>
<script src="editormd/lib/marked.min.js"></script>
<script src="editormd/lib/prettify.min.js"></script>
<script src="editormd/lib/raphael.min.js"></script>
<script src="editormd/lib/underscore.min.js"></script>
<script src="editormd/lib/sequence-diagram.min.js"></script>
<script src="editormd/lib/flowchart.min.js"></script>
<script src="editormd/lib/jquery.flowchart.min.js"></script>
<script type="text/javascript">
    $(function mdToHtml() {
        //获取要显示的内容
        editormd.markdownToHTML("mdView", {
            htmlDecode : "style,script,iframe",
            emoji : true,
            taskList : true,
            tex : true, // 默认不解析
            flowChart : true, // 默认不解析
            sequenceDiagram : true, // 默认不解析
        });
    });
</script>
</html>