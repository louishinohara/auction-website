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
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<style type="text/css">
		.body {
			background-color: #ffe5e5;
		}
		</style>
		<title>Remove Bid</title>
    </head>
    <body class="body">
        
       <%
            String bidID=request.getParameter("BidID");
            
            try 
            {
                    ApplicationDB db = new ApplicationDB();	
		   			Connection con = db.getConnection();
		    		Statement stmt = con.createStatement();
                    
                    String remove = "DELETE FROM bid WHERE bidID="+ bidID;
                    
                    int result = stmt.executeUpdate(remove);
                    
                    if(result==1) {
                           out.println("Bid Deleted Successfully!"); 
                     }
                    else {
                        out.println("Failed to delete Bid!");
                    }
		     
            } catch(Exception e) {
                    out.print(e);
            }
	    
       %>
        <br>
        <br>
	
		<input type="button" value="Back" onclick=location.href="CustomerRep.jsp">
	
		<br>
       </body>
</html>