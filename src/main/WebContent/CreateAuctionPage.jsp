<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.dbproj.pkg.*,com.AuctionSite.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>


<body>

	<% ItemList itemList = new ItemList();
		itemList = (ItemList) session.getAttribute("itemList"); 
		%>

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
						Bike newBike = new Bike(id, model, false, Integer.parseInt(year), color);
						%> Bike created with id: "<%=id %>" <br><%
					   itemList.addItemToTheList(newBike);
						
					   newBike.addToSQL();
					}else if(itemType.equals("car")){
						String miles = request.getParameter("miles");
						int id = Item.generateItemID();
						Car newCar = new Car(id, model, false, Integer.parseInt(year), color, Integer.parseInt(miles));
						%> Car created with id: "<%=id %>" <br><%
						itemList.addItemToTheList(newCar);
						newCar.addToSQL();
					}else if(itemType.equals("truck")){
						String miles = request.getParameter("miles");
						int id = Item.generateItemID();
						Truck newTruck = new Truck(id, model, false, Integer.parseInt(year), color, Integer.parseInt(miles));
						%> Truck created with id: "<%=id %>" <br><%
						itemList.addItemToTheList(newTruck);
						newTruck.addToSQL();
					}else{
						%>Invalid Item Type "<%=itemType%>"<%
					}
			}else{
				%>Please fill out all relevant fields<%
			}
		}else{
			%>Please fill out all relevant fields<%
		}
		
		if(itemList != null && !itemList.isEmpty()){
			%>Current Item List <br><%
			for(Item item : itemList.getCurrentList()){
				String line = item.toString();
				%><%=line %> <br><%
				
			}
			%>
			<form method="get">
			<table>
				<tr>    
					<td>Closing Time</td><td><input type="text" name="closingTime"></td>
				</tr>
				<tr>
					<td>Closing Date</td><td><input type="text" name="closingDate"></td>
				</tr>
				<tr>
					<td>Minimum Price (hidden)</td><td><input type="text" name="minPrice"></td>
				</tr>
				<tr>
					<td>Increment Value</td><td><input type="text" name="increment"></td>
				</tr>
				<tr>
					<td>Initial Price</td><td><input type="text" name="initialPrice"></td>
				</tr>
			</table>
			<input type="submit" value="Enter">
		</form>
			<%  
				if(request.getParameter("initialPrice") != null && request.getParameter("minPrice") != null && request.getParameter("increment") != null && request.getParameter("closingTime") != null && request.getParameter("closingDate") != null){
			
				int auctionID = Auction.generateAuctionID();
				int accountID = (Integer) session.getAttribute("accountID");
				float initialPrice = Float.parseFloat(request.getParameter("initialPrice"));
				float reservePrice = Float.parseFloat(request.getParameter("minPrice"));
				float incrementValue = Float.parseFloat(request.getParameter("increment"));
				String closeTime = request.getParameter("closingTime");
				String closeDate = request.getParameter("closingDate");
				//Auction auction = new Auction(auctionID, )
				for(Item item : itemList.getCurrentList()){
					
					ApplicationDB db = new ApplicationDB();	
					Connection con = db.getConnection();
					String insert = "INSERT INTO auction(auctionID, itemID, sellerID, buyerInLeaderID, initialPrice, currentBidPrice, reservePrice, incrementVal, isOpen, time, date)"
						+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
					PreparedStatement ps = con.prepareStatement(insert);
				
					ps.setInt(1, auctionID);
					ps.setInt(2, item.getItemID());
					ps.setInt(3, accountID);
					ps.setInt(4, 0);
					ps.setFloat(5, initialPrice);
					ps.setFloat(6, initialPrice);
					ps.setFloat(7, reservePrice);
					ps.setFloat(8,incrementValue);
					ps.setBoolean(9, true);
					ps.setString(10, closeTime);
					ps.setString(11, closeDate);
					
					ps.executeUpdate();
					
				}
				itemList = new ItemList();
				session.setAttribute("itemList", itemList);
				%>Auction has been posted, itemList has been reset!<%
					
				}
		}
		
		%>
		
</body>
</html>
	