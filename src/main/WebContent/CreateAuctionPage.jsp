<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.dbproj.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>


<body>
	<br><h3>Enter Item Info</h3>
		<form method="get" action="ItemProcessing.jsp">
			<table>
				<tr>    
					<td>Item Type</td><td><input type="text" name="type"></td>
				</tr>
				<tr>
					<td>Model Number</td><td><input type="text" name="model"></td>
				</tr>
				<tr>
					<td>Miles (car or truck only)</td><td><input type="text" name="miles"></td>
				</tr>
				<tr>
					<td>Year</td><td><input type="text" name="year"></td>
				</tr>
				<tr>
					<td>Color</td><td><input type="text" name="color"></td>
				</tr>
			</table>
			<input type="submit" value="Enter">
		</form>
		
</body>
</html>
	