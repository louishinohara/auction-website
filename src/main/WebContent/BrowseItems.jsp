<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="AuctionSite.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>





<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>View Items Page</title>
	<style>
		ol {
		  background: #ff9999;
		  padding: 20px;
		}
		
		ol li {
		  background: #ffe5e5;
		  margin-left: 20px;
		  list-style-type: none;
		  margin-bottom: 20px;
		  padding: 8;
		}
	</style>
	</head>

	<body BGCOLOR="#ffffcc">
		<CENTER>     
			<H2>Browse Items</H2>     
			<form method="POST"> 
					<select id="ItemTypeOptions" name="All" >       
						<option value="All" >All</option>       
						<option value="Bike" >Bike</option>       
						<option value="Car" >Car</option>   
						<option value="Truck" >Truck </option> 
					</select>    
				<input type="submit" value="Select" /> 
			</form> 
			<H2>Sort By Criteria</H2>    
			<form action="select" method="POST"> 
					<select name="In Auction" >       
						<option> In Auction </option>     
						<option> Lowest Bid Price </option> 
						<option> Highest Bid Price </option>          
					</select>    
				<input type="submit"/> 
			</form> 
		</CENTER>
	  
	<% // Add items to list as test
		try {
			AuctionSite auctionSite = new AuctionSite();
	//        Bike item1 = new Bike(111, "111", true, 1994, "Black" );
	  //      item1.addToSQL();
	   //     auctionSite.addToItemList(item1, item1.getItemType());
	    //    Bike item2 = new Bike(222, "222", true, 1994, "Black");
	     //   auctionSite.addToItemList(item2, item2.getItemType());
	      //  item2.addToSQL();
	        //Bike item3 = new Bike(333, "333", true, 1994, "Black" );
	        //auctionSite.addToItemList(item3, item3.getItemType());
	        //item3.addToSQL();
	        //Bike item4 = new Bike(444, "444", true, 1994, "Black");
	        //auctionSite.addToItemList(item4, item4.getItemType());
	        //item4.addToSQL();
	        //Bike item5 = new Bike(555, "555", true, 1994, "Black");
	        //auctionSite.addToItemList(item5, item5.getItemType());
	        //item5.addToSQL();
	        //Truck item6 = new Truck(666, "666", true, 1994, "Black", 999 );
	        //auctionSite.addToItemList(item6, item6.getItemType());
	        //item6.addToSQL();
	        //Car item7 = new Car(777, "777", true, 1994, "Black", 999);
	        //auctionSite.addToItemList(item7, item7.getItemType());
	        //item7.addToSQL();
	        //Truck item8 = new Truck(888, "888", true, 1994, "Black", 999 );
	        //auctionSite.addToItemList(item8, item8.getItemType());
	        //item8.addToSQL();
	        //Car item9 = new Car(999, "999", true, 1994, "Black", 999);
	        //auctionSite.addToItemList(item9, item9.getItemType());
	        //item9.addToSQL();
	        List<Item> itemList = auctionSite.getItemList();
	        String itemTypeToFind = request.getParameter("All");
	%>
		
	
	<ol>
	<%	// Render those items
	for (int i = 0; i < itemList.size(); i++ ){
		Item item = itemList.get(i);
		int itemID = item.getItemID();
		%>
		<li> 
			<a href="#">  
				<div>
				Item ID: <%= itemID %>
				</div>
				<div>
				ItemType: <%= item.getItemType() %>
				</div>
				<div>
				Model: <%= item.getModelNumber() %>
				</div>
				<div>
				Year: <%= String.valueOf(item.getYear()) %>
				</div>
				<div>
				Color: <%= item.getColor() %>
				</div>
				<div>
				In Auction: <%= item.getInAuction() %>
				</div>
			  </a>
		</li>
		<% 
		}
	%>
	</ol>	
	<% 
		} catch (Exception ex) {
				out.print("Unable To Get Data");
		}
	%>
	
	</body>
</html>
