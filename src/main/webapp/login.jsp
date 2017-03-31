<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@page import="it.polito.ai.es1.implementation.CartService"%>
	
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Biglietti trasporto urbano</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>

    <div class="container">
		<div class="header clearfix">
			<!-- <nav class="navbar navbar-default navbar-fixed-top"> -->
			<nav class="nav nav-pills pull-right">
				<div class="container">
					<a type="button"
						class="btn btn-default navbar-btn navbar-right" href="/Es1_BigliettiTrasporto/LoginServlet">
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						Sign in
					</a>
					<%
						CartService cartService = (CartService) request.getSession().getAttribute("cartService");
					%>
					<a type="button"
						class="btn btn-default navbar-btn navbar-right" href="/Es1_BigliettiTrasporto/ShoppingCartServlet">
						<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
						Carrello <span class="badge"><%= cartService.getItems().size() %></span>
					</a>
				</div>
			</nav>
		</div>
		
		<form class="form-horizontal" action="LoginServlet" method="post">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="inputEmail" name="user"
						placeholder="Email">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
				<div class="col-sm-10">
					<input type="password" type="password" class="form-control" id="inputPassword" name="pass"
						placeholder="Password">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" value="Sign in" class="btn btn-default"/>
				</div>
			</div>
		</form>
	</div>

</body>
</html>