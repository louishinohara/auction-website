<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="AuctionSite.*"%>
<%@ page import="java.util.stream.Collectors" %>
<%@ page language="java" import="com.dbproj.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
     		<title>Earnings Per Item<title>

    	</head>
	<body>
      		<%
        	try {
          
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
		
			String totalEarningsItem = "SELECT i.item_ID, SUM(a.currentBidPrice - a.initialBidPrice) as Total Earnings Item FROM items i inner join auction a WHERE i.item_id = a.itemID and a.isOPen == false";
	
			ResultSet result = stmt.executeQuery(totalEarningsItem);
			
			out.println("ItemID" + " " + "Item Earnings");		
					
			while(result.next()) {
				String sum = result.getString("Total Earnings Item");
				string itemID = result.getString("item_ID");
				out.println(itemID + " " + sum);
				} catch(Exception ex) {
							out.print(ex);
					}
					
			<input type="button" value="Return" onclick=location.href="AdminPage.jsp">	
							
		%>
	</body>
</html>    
