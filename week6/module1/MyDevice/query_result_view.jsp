<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"  %>
<%@page import="java.sql.*,java.io.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	</head>
	<body>
		<%
			String id = request.getParameter("id");

			request.setCharacterEncoding("UTF-8");

			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException classNotFoundException) {
				classNotFoundException.printStackTrace();
			}
			try {
				Connection conn = DriverManager
						.getConnection("jdbc:mysql://localhost:3306/mydb?user=root&password=1356&useUnicode=true&characterEncoding=UTF-8");
				Statement statement = conn.createStatement();
				out.println("Connect Database OK!!!");
				ResultSet rs = statement
						.executeQuery("select * from device_file where id=" + id);
				while (rs.next()) {
		%>
		<form name="changeForm" action="change_ok.jsp">
			<input type="hidden" name="id" value="<%=id%>">
			设备ID
			<input type="text" name="device_id"
				value="<%=rs.getString("device_id")%>">
			<br>
			设备名称
			<input type="text" name="device_name"
				value="<%=rs.getString("device_name")%>">
			<input type="submit" name="subbtn" value="提交">
		</form>
		<%
			}
				out.println("<br>");
				statement.close();
				conn.close();
				out.println("Database Closed!!!");		
			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			}		
		%>
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