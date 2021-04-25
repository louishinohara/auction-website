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
		<title>Forum</title>
       </head>
       <body class="body">
       <br>
       Forum
       <br>
       <%  
   			String username = request.getParameter("username");
			String pass = request.getParameter("pass");
			String threadID = request.getParameter("threadID");
			session.setAttribute("username", username);
   			session.setAttribute("pass", pass);
   			session.setAttribute("ThreadId",threadID);
			
            try 
            {
                    ApplicationDB db = new ApplicationDB();	
		    		Connection con = db.getConnection();
		   			Statement stmt = con.createStatement();
                    
                    String threads = "SELECT * FROM posts WHERE threadID="+threadID;
                    
                    ResultSet result = stmt.executeQuery(threads);
                    
                    while(result.next()) {
                    	%> <br>  <%
                    	String user= result.getString("PostMadeBy");
                    	String post=result.getString("Message");
                    	out.println(user);
                    	%> <br>  <%
                    	out.println(post);
                    }
            } catch(Exception e) {
                    out.print(e);
            }    
       %>
       
        <br>
        <br>
        
        <form method = "get" action="Reply.jsp">
        			<input type="text" id="Message" name="Message" style="width:200px">
        			<input type="hidden" id="ThreadID" value=<%=threadID %> name="ThreadID">
        			<input type="hidden" id="username" value=<%=username%> name="username">
        			<input type="hidden" id="pass" value=<%=pass%> name="pass">
				<input type="submit" value="Reply" onclick=location.href="Reply.jsp">
		</form>
		<br>
        
        <form method = "get" action="InfoPage.jsp">
					<input type="button" value="Back" onclick=location.href="Forum.jsp?username=<%=username%>&pass=<%=pass%>">
				
		</form>
		<br>
	
		<form method = "get" action="InfoPage.jsp">
					<input type="button" value="Return to Dashboard" onclick=location.href="Dashboard.jsp?username=<%=username%>&pass=<%=pass%>">
				
		</form>
		<br>
		
		<input type="button" value="Log Out" onclick=location.href="InfoPage.jsp">
	
		<br>
       </body>
</html>
