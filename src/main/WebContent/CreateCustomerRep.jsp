<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.AuctionSite.*"%>
<%@ page import="java.util.stream.Collectors" %>
<%@ page language="java" import="com.dbproj.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<style type="text/css">
		.body {
			background-color: #ffe5e5;
		}
		</style>
		<title>Register Costumer Rep</title>
	</head>
	<body class ="body">
	 <% 
   				String username = request.getParameter("username");
				String pass = request.getParameter("pass");
			
				session.setAttribute("username", username);
				session.setAttribute("pass", pass);
	%>
	<br>
	REGISTER NEW CUSTOMER REP:
	<br>
	<br>
		<form method="get" action="Register.jsp">
					<label for="username">Username:</label><br>
					<input type="text" id="username" name="username"><br>
					<label for="pass">Password:</label><br>
					<input type="text" id="pass" name="pass"><br>
					<br>
					<input type="submit" value="Register">
		</form>
	<br>
	<form method = "get" action="InfoPage.jsp">
				<input type="button" value="Return" onclick=location.href="AdminPage.jsp?username=<%=username%>&pass=<%=pass%>">
		</form>
	<br>
	
	</body>
</html>
=======
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.AuctionSite.*"%>
<%@ page import="java.util.stream.Collectors" %>
<%@ page language="java" import="com.dbproj.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<style type="text/css">
		.body {
			background-color: #ffe5e5;
		}
		</style>
		<title>Register Costumer Rep</title>
	</head>
	<body class ="body">
	<br>
	REGISTER NEW CUSTOMER REP:
	<br>
	<br>
		<form method="get" action="Register.jsp">
					<label for="username">Username:</label><br>
					<input type="text" id="username" name="username"><br>
					<label for="pass">Password:</label><br>
					<input type="text" id="pass" name="pass"><br>
					<br>
					<input type="submit" value="Register">
		</form>
	<br>
	<br>
	<input type="button" value="Back" onclick=location.href="AdminPage.jsp">
	</body>
</html>
>>>>>>> 989e22749a936039f0451df7b162f565dde770b7
