%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
      		<title>Remove Bid<title>
       </head>
       <body>
       <%
            String bidID=request.getParameter("bidID");
            
            try 
            {
                    ApplicationDB db = new ApplicationDB();	
		    Connection con = db.getConnection();
		    Statement stmt = con.createStatement();
                    
                    String remove = "DELETE FROM bid WHERE bidID="+bidID);
                    
                    ResultSet result = stmt.executeQuery(remove);
                    
                    if(result.next()) {
                           out.println("Auction Deleted Successfully!");
                     }
		     
            } catch(Exception e) {
                    out.print(e);
            }
            
            <input type="button" value="Return" onclick=location.href="CustomerRep.jsp">
            
       %>
            </body>
            </html>
