<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="AuctionSite.*"%>
<%@ page import="java.util.stream.Collectors" %>
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
     		<title>Best Buyers<title>

    	</head>
	<body>
      		<%
        	try {
          
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
		
			String BestBuyers = "SELECT TOP 5 * FROM aution WHERE buyerInLeadID IN (SELECT a.buyerInLeadID,SUM(a.currentBidPrice - a.initialBidPrice) FROM auctions a WHERE a.isOpen == false) GROUP BY a.buyerInLeadID DESC";
	
			ResultSet result = stmt.executeQuery(BestBuyers);
			
			out.println("buyerID");		
					
			while(result.next()) {
				string customerID = result.getString("buyerInLeadID");
				out.println(customerID);
			} catch(Exception ex) {
							out.print(ex);
					}
					
			<input type="button" value="Return" onclick=location.href="AdminPage.jsp">	
							
		%>
	</body>
</html>    
