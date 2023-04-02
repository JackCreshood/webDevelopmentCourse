<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"  %>
<%@page import="java.sql.*,java.io.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	</head>
	<body>
		<form id="registerForm" action="register_ok.jsp">
			设备ID
			<input type="text" name="device_id" value="">
			<br>
			设备名称
			<input type="text" name="device_name" value="">
			<input type="submit" name="subbtn" value="提交">
		</form>
		<input type="button" value="添加" onclick="add()"/>
		<input type="button" value="修改" onclick="modify()"/>
		<input type="button" value="查询" onclick="query()"/>
	</body>
</html>
<script>
function add() {
	window.location="register.jsp";
}
function modify() {
	window.location="change_list.jsp";
}
function query() {
	window.location="query_list.jsp";
}
</script>