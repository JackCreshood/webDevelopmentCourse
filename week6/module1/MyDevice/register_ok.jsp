<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"  %>
<%@page import="java.sql.*,java.io.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	</head>
	<body>
		<%
			String id = request.getParameter("id");
			String deviceId = request.getParameter("device_id");
			String deviceName = request.getParameter("device_name");

			out.println("传递过来的设备名称是：" + deviceName);
			System.out.println("得到的：" + deviceName);

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
				String sql = "insert into device_file(device_id, device_name) values('"
						+ deviceId + "','" + deviceName +"')";
				statement.executeUpdate(sql);
				out.println(sql);
				statement.close();
				conn.close();
				out.println("Database Closed!!!<br>");
		%>
添加成功！请返回。
<input type="button" name="listBtn" value="返回列表" onclick="window.location='query_list.jsp'">
		<%
			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
		%>
添加失败！！！请返回。
<input type="button" name="listBtn" value="返回列表" onclick="window.location='query_list.jsp'">
		<%
			}
		%>
	</body>
</html>