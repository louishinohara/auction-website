<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.dbproj.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
	<style type="text/css">
				.body {
					background-color: #ffe5e5;
				}	 
				.app-body {
					display: flex;
					flex-direction: row;
					justify-content: space-around;
				  	margin-left: 20px;
				  	margin-bottom: 20px;
				  	padding: 8;
				  	height: 200px;
				}
				.img-container {
					display: flex;
					flex-direction: row;
				}
				.img {
					height: 250px;
					width: 350px;
					margin-left: auto;
					margin-right: auto;
					margin-bottom: 32px;
				}
				.login-form {
					float: left;
					margin-top: 16px;
					background: #c9c9c9;
					padding: 16px;
					border-radius: 16px;
				}	
				.register-form{
					float: right;
					margin-top: 16px;
					background: #c9c9c9;
					padding: 16px;
					border-radius: 16px;
				}
				.header {
				text-align: center;
			
				}
	</style> 
			
	</head>
	<body class='body'>
	<div class="header">
		<h2>
		Spring 2021 Database Ebay Application
		</h2>
	</div>

	<div class="img-container">
		<img class="img" src="https://i.imgur.com/LE0gJqp.jpg" />
	</div>
			
	<div class="app-body">
		<div class="login-form">
			<h3>
			LOGIN: 
			</h3>
				<form method="get" action="Dashboard.jsp">
			<table>
				<tr>    
					<td>User name</td><td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>Password</td><td><input type="text" name="pass"></td>
				</tr>
			</table>
			<input type="submit" value="Login">
		</form>
		
		</div>
	
	
		<div class="register-form">
			<h3>
			Register: 
			</h3> 
			<form method="get" action="Register.jsp">
			<table>
				<tr>    
					<td>Username</td><td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>Password</td><td><input type="text" name="pass"></td>
				</tr>
			</table>
			<input type="submit" value="Register">
		</form>
	
		</div>
	</div>

	<div class="header">
	
		<h4>
			Group # 
		</h4>
		<h4>
			Joshua Hymowitz, Ushio Shinohara, Isaac Perez 
		</h4>
	</div>
	</body>

</html>