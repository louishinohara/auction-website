<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.dbproj.pkg.*,com.AuctionSite.*"%>
    
<%@ page language="java" import="com.dbproj.pkg.*"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
			<title>View Items Page</title>
			<style>
				ol {
				  background: #9b9b9b;
				  padding: 20px;
				}
				
				ol li {
					list-style-type: none;
				}
			</style>
			
			<style type="text/css">	 
				.container { 
					width:100% ; 
					margin-bottom: 200px;
					background-color: lightblue;
				}
					
				.align-left { 	
					float: left ; 
					width:50% ; 
				}
					
				.align-right { 
					float: right ;
					width:50% ; 
				 }
				
				.item-container {
					display: flex;
					flex-direction: row;
					align-items: center;
					background: #ffe5e5;
				  	margin-left: 20px;
				  	margin-bottom: 20px;
				  	padding: 8;
				  	height: 100px;
				}
				
				.sub-container {
					display: 'flex';
					flex-direction: 'column';
					padding-left: 20px;
				}
				
				.sub-container-date-time {
					display: 'flex';
					flex-direction: 'column';
					margin-right: 12px;
					margin-left: 12px;
				}
				
				.description-container {
					marginTop: 8px;
					marginBottom: 8px;
					
					}
				.fit-picture {
				    width: 100px;
				}
				.right-align-sub-container{
					margin-left: auto;
					margin-right: 20px;
				}
			</style> 

		</head>

	<body BGCOLOR="#e6e6e6">
		<% 	String userName = (String) session.getAttribute("userName");
			String pass = (String) session.getAttribute("pass");
		%>
	<a href="Dashboard.jsp?username=<%=userName%>&pass=<%=pass%>"> <button>Back To Dash Board</button></a> 
	
		<CENTER>     
			<H2>Your Alerts</H2>
			
			<div class='container'>
				<form  method="get">
	
					
					<div class='align-left'>	
						<H3>Sort By Viewed </H3>    
							<select name="availability" >  
								<option value="null"> All </option>       
								<option value="Viewed"> Viewed </option>     
								<option value="Not Viewed"> Not Viewed </option>         
							</select>    
					</div>
						
					<div class='align-right'>	
						<H3>Sort By Criteria</H3>    
							<select name="sortBy" >  
								<option value="null"> Any </option>         
								<option value="lowest"> Lowest Bid Price </option> 
								<option value="highest"> Highest Bid Price </option>          
							</select>    
						<input type="submit" value="Submit"/> 
					</div>

				</form> 
			</div>



		</CENTER>
	  
	<% 
		try {
 
		    ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
 
			int id = (Integer) session.getAttribute("accountID");	
 	
			
			if (  request.getParameter("availability") != null ){

				String query = " select * from alert where buyerID =" + String.valueOf(id);
				
				String availabilityType = request.getParameter("availability");
				
				if ( availabilityType.equals("All") ) {					// Get requested item
					// Do Nothing? 
				} else if ( availabilityType.equals("Not Viewed") ){
					query = query + " AND acknowledgedAlert = False";
				} else if ( availabilityType.equals("Viewed") ) {
					query = query + " AND acknowledgedAlert = True";
				} 
				

				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				
		%>
			<ol>
				<%
				while (rs.next()) {
					String alertID = String.valueOf(rs.getInt("alertID"));
					String itemID = String.valueOf(rs.getInt("itemID"));
					String message = rs.getString("message");
					String date = rs.getString("date");
					String time = rs.getString("time");
					boolean acknowledgedAlert = rs.getBoolean("acknowledgedAlert");
					%>
						<li  > 
								<div class='item-container' >	
									<div class='sub-container'>
										<div class='description-container'>
											Alert ID: <%= alertID %>
										</div>
										<div>
											Item ID: <%= itemID %>
										</div>
										
									</div>			

									<div class='sub-container-date-time'>
										<div class='description-container'>
											Date: <%= date %>
										</div>
										<div>
											Time:  <%= time %>
										</div>
									</div>		

									<div class='sub-container'>
										<div class='description-container'>
											Message:  <%= message %> 
										</div>
									</div>		
											
									<div class='right-align-sub-container'> 
										
										<div class='sub-container-message' method = "get" onClick="" >
											<button type="submit" > Acknowledge  </button>
										</div>
									</div>
									
								</div>
						</li>
					<% 
				}
				%>
			</ol> 
			<% 
			
			}
			
		} catch (Exception ex) {
				System.err.println(ex);
				out.print("Unable To Get Data");
		}
	%>
	
	</body>
</html>


