<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.dbproj.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="AuctionSite.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>


<body>

	<% ItemList itemList = new ItemList(); %>

	<br><h3>Enter Item Info</h3>
		<form method="get">
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
		
		
		<%
		if( (request.getParameter("type") != null) && (request.getParameter("model") != null) && (request.getParameter("year") != null) && (request.getParameter("color") != null)){
				
				String itemType = request.getParameter("type");
				String model = request.getParameter("model");
				
				String year = request.getParameter("year");
				String color = request.getParameter("color");
				
				if(!(request.getParameter("miles").equals("")) || (itemType.equals("bike") || itemType.equals("bicycle"))){
				
				itemType = itemType.toLowerCase();
					
					if(itemType.equals("bike") || itemType.equals("bicycle")){
						int id = Item.generateItemID();
						Item newItem = new Item(id, "bike", model, false, Integer.parseInt(year), color);
						%> Bike created with id: "<%=id %>" <%
					   //itemList.addItemToList(newItem, "Bike");
					   newItem.addToSQL();
					}else if(itemType.equals("car")){
					
					}else if(itemType.equals("truck")){
					
					}else{
						%>Invalid Item Type "<%=itemType%>"<%
					}
			}else{
				%>Please fill out all relevant fields<%
			}
		}else{
			%>Please fill out all relevant fields<%
		}
		
		
		%>
		
</body>
</html>
	