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
	
	<link href="jumbotron-narrow.css" rel="stylesheet">
</head>

<body>
	<div class="container">
		<div class="header clearfix">
			<!-- <nav class="navbar navbar-default navbar-fixed-top"> -->
			<nav class="nav nav-pills pull-right">
				<div class="container">
					<%
						String username = (String)request.getSession().getAttribute("user");
						if (username == null) {
					%>
					<a type="button"
						class="btn btn-default navbar-btn navbar-right" href="/Es1_BigliettiTrasporto/LoginServlet">
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						Sign in
					</a>
					<% } else {
					%>
					<div class="dropdown navbar-btn navbar-right">
						<button class="btn btn-default dropdown-toggle" type="button"
							id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="true">
							<%=username %> <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
							<li><a href="/Es1_BigliettiTrasporto/private/HomeServlet">Log out</a></li>
						</ul>
					</div>
					<% } %>
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
		<div class="jumbotron">

			<h1>Biglietti Trasporto Urbano</h1>
			<p>...</p>
			<p>
				<a class="btn btn-primary btn-lg"
					href="/Es1_BigliettiTrasporto/TicketServlet" role="button">Acquista
					Adesso!</a>
			</p>
		</div>

	</div>

</body>
</html>