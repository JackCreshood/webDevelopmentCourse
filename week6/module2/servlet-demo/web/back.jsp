<%@page contentType="text/html; charset=UTF-8" language="java"
	import="java.text.*,org.json.JSONObject,java.util.ArrayList,java.io.PrintWriter"
	import="java.util.HashMap,java.util.List,java.sql.*,java.util.Map,java.io.IOException"%>
<%
//front.html和back.jsp。
//功能是接收用户从页面输入的时间和设备ID，查询对应的gps数据，把经纬度和GPS时间查到，显示在页面上。
//点查询后，back.jsp根据设备ID和时间范围从ylxdb数据库的gps_history表里查询数据，返回json给前端front.html。
//然后front.html可以解析json，显示在textarea里。
//可以先编写back.jsp，在front.html没有编写出来的情况下，用
//http://xxx.xxx.xxx.xxx:9998/gps/back.jsp?device_id=868120122684159&gps_time_from=2015-11-02&gps_time_to=2015-11-04&action=get_gps_record
//来查看数据是否已经能查询出来。这是一种调试方法。
//以后要是前后端出了问题，就可以用这种方式一步步排除。

	response.setContentType("text/xml;charset=utf-8");
	response.setCharacterEncoding("utf-8");
	response.setHeader("Cache-Control", "no-cache");
	String deviceId=request.getParameter("device_id");
	String gpsTimeFrom=request.getParameter("gps_time_from");
	String gpsTimeTo=request.getParameter("gps_time_to");
	String action=request.getParameter("action");
	System.out.println("获得的参数是：action="+action+",device_id="+deviceId+",gps_time_from="+gpsTimeFrom+",gps_time_to="+gpsTimeTo);
	//开始查询数据库
	List jsonList = new ArrayList();
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException classnotfoundexception) {
		classnotfoundexception.printStackTrace();
	}
	try {
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=root&password=1356&useUnicode=true&characterEncoding=UTF-8");
		Statement statement = conn.createStatement();
		System.out.println("连接数据库Ok！！！");
		//构造sql语句，根据传递过来的查询条件参数，目前是deviceId和gpsTime
		String sql="select * from gps_history where gpstime>'"+gpsTimeFrom+"' and gpstime<'"+gpsTimeTo+"' and deviceId='"+deviceId+"' order by gpstime";
		System.out.println("构造出来的sql语句是："+sql);
		ResultSet rs = statement.executeQuery(sql);
		while (rs.next()) {
			Map map = new HashMap();
			map.put("device_id",rs.getString("deviceId"));
			map.put("gps_time",rs.getString("gpstime"));
			map.put("recv_time",rs.getString("recvtime"));
			map.put("longitude",rs.getString("longitude"));
			map.put("latitude",rs.getString("latitude"));
			jsonList.add(map);
		}
		statement.close();
		conn.close();
		System.out.println("数据库关闭了！！！");
	} catch (SQLException sqlexception) {
		sqlexception.printStackTrace();
	}
	//////////数据库查询完毕，得到了json数组jsonList//////////
	//下面开始构建返回的json
	JSONObject json=new JSONObject();
	json.put("record_list",jsonList);
	json.put("action",action);
	json.put("result_msg","ok");	//如果发生错误就设置成"error"等
	json.put("result_code",0);	//返回0表示正常，不等于0就表示有错误产生，错误代码
	System.out.println("最后构造得到的json是："+json.toString());
	response.setContentType("text/html; charset=UTF-8");
	try {
		response.getWriter().print(json);
		response.getWriter().flush();
		response.getWriter().close();
	} catch (IOException e) {
		e.printStackTrace();
	}
	System.out.println("返回结果给调用页面了。");
%>
