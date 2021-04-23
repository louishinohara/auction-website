<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
	
	<style type="text/css">
		.body {
			background-color: #ffe5e5;
		}
		.welcome-header : {
			display: flex;
			flex-direction: row;
		}
		.header {
			text-align: center;
		}
		.action-row-container{
			display: flex;
			flex-direction: row;
		}
		.action-container {
			background: #c9c9c9;
			height: 100px;
			width: 150px;
			margin: 6px;
			border-radius: 40px;
			padding: 16px;
		}

		.heading-text {
			text-align: center;
		}
		
		.button {
				 position: relative;
   				 top: 20%;
    			 transform: translateY(-50%);
		}		
						
	</style> 
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	</head>
	
	<title>Admin Portal</title>
	
	<body class="body">
		
		<div class="welcome_header">
			<div class ="header">
				<h2>
				Welcome back!
				</h2>
			</div>
		</div>
		
		<div class="action-row-container">
					
			<div class="action-container" style="cursor: pointer;" onclick=location.href="CreateCustomerRep.jsp">
					<div>
						<h3 class="heading-text">Create Customer Rep</h3>
					</div>
			</div>
			
			<div class="action-container" style="cursor: pointer;" onclick=location.href="TotalEarnings.jsp">
					<div>
						<h3 class="heading-text">Total Earnings</h3>
					</div>
			</div>
			
			<div class="action-container" style="cursor: pointer;" onclick=location.href="EarningsPerItem.jsp">
					<div >
						<h3 class="heading-text">Earnings Per Item</h3>
					</div>
			</div>
			
			<div class="action-container" style="cursor: pointer;" onclick=location.href="EarningsPerType.jsp">
					<div >
						<h3 class="heading-text">Earnings Per Type</h3>
					</div>
			</div>
			
			<div class="action-container" style="cursor: pointer;" onclick=location.href="EarningsPerUser.jsp">
					<div >
						<h3 class="heading-text">Earnings Per User</h3>
					</div>
			</div>
			
			<div class="action-container" style="cursor: pointer;" onclick=location.href="BestSelling.jsp">
					<div >
						<h3 class="heading-text">Best Selling Items</h3>
					</div>
			</div>
			
			<div class="action-container" style="cursor: pointer;" onclick=location.href="BestBuyers.jsp">
					<div >
						<h3 class="heading-text">Best Buyers</h3>
					</div>
			</div>
			
		</div>
		<br>
				
			<div class="button" style="cursor: pointer;" onclick=location.href="InfoPage.jsp">
					<div >
						<h3 class="heading-text">Log Out</h3>
					</div>
			</div>
		
	</body>
</html>