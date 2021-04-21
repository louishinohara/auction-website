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
	<%
	try {
		
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the InfoPage.jsp
		String username = request.getParameter("username");
		String pass = request.getParameter("pass");
		
		//craft query
		String select = "SELECT count(*) FROM account WHERE username=\"" + username + "\" and pass=\"" + pass + "\";";
	
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(select);
		%>
		<!-- SQL query how many accounts exist with that username and password. If login is valid this should be 1, if invalid, 0 -->
		
		<h3><%
			
			result.next();
			if(result.getString("count(*)").equals("1")){
				%>Valid Login <br>
				<%
				String newQuery = "SELECT * FROM account WHERE username=\"" + username + "\";";
				//result.next();
				result = stmt.executeQuery(newQuery);
				result.next();
				
				String accountType = result.getString("type");
				%>Username: "<%=username %>" <br>Account Type: "<%=accountType %>"
		
				
				<br>
				
				if(accountType.equals("customer"))
				<form method = "get" action="InfoPage.jsp">
					<input type="button" value="Continue" onclick=location.href="CreateAuctionPage.jsp">
					
				if(accountType.equals("admin"))
				<form method = "get" action="InfoPage.jsp">
					<input type="button" value="Continue" onclick=location.href="AdminPage.jsp">	
					
				
				</form>
				
				<%
				
			}else{
				%>Invalid Login
				
				<br>
				
				<form method = "get" action="InfoPage.jsp">
					<input type="button" value="Back" onclick=location.href="InfoPage.jsp">
				
				</form>
				
				<%
				
			}
				%></h3>
		
	<% } catch (Exception ex) {
		out.print(ex);
		out.print("Login failed :()");
	}
%>
</body>
</html>
