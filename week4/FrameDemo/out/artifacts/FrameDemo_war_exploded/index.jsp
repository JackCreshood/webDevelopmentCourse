<%--
  Created by IntelliJ IDEA.
  User: Vefa
  Date: 2023/3/18
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>frame.jsp</title>
    <link rel="stylesheet" type="text/css" href="index.css">
    <script type="text/javascript" src="index.js"></script>
  </head>
  <body>
  <div class="all_div">
    <div class="header_div" onclick="toggleHeader()">网页的头部</div>
    <div class="body_div">
      <div class="body_left_div" id="bodyLeft" onclick="toggleLeft()">网页的左部</div>
      <div class="body_right_div" onclick="toggleRight()">网页的右部</div>
    </div>
    <div class="footer_div" onclick="toggleFooter()">网页的底部</div>
  </div>
  </body>
</html>