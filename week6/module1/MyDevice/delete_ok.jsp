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
				out.println("Connect Database OK!!!<br>");
				String sql = "delete from device_file where id=" + id;
				statement.executeUpdate(sql);
				out.println(sql);
				statement.close();
				conn.close();
				out.println("Database Closed!!!<br>");
		%>
删除成功！请返回。
<input type="button" name="listBtn" value="返回列表" onclick="window.location='change_list.jsp'">
		<%
			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
		%>
删除失败！！！请返回。
<input type="button" name="listBtn" value="返回列表" onclick="window.location='change_list.jsp'">
		<%
			}
		%>
	</body>
</html>