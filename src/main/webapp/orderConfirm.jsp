<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.util.List"%>
<%@page import="it.polito.ai.es1.models.Ticket"%>
<%@page import="it.polito.ai.es1.models.Item"%>
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
	
	<script src="js/GeneralFunctions.js" type="text/javascript"></script>
	
	<script type="text/javascript">
		$(function(){	
			$('#modalModify, #modalDelete').on('show.bs.modal', function(event) {
				var button = $(event.relatedTarget) // Button that triggered the modal
				var id = button.data('id') // Extract info from data-* attributes
				var type = button.data('type')
				var modal = $(this)
				modal.find('.modal-title').text(type)
				modal.find($("#id1")).val(id)
				modal.find($("#id2")).val(id)
			});
		});
	</script>
	
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
					<a type="button"
						class="btn btn-default navbar-btn navbar-right" href="/Es1_BigliettiTrasporto/home.jsp">
						<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
						Home
					</a>
				</div>
			</nav>
		</div>
		
		<!-- Table -->
		<div>
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>Biglietto</th>
						<th>Quantità</th>
						<th>Prezzo unitario</th>
						<th>Prezzo totale</th>
						
					</tr>
				</thead>
				<tbody>
					<%
						for (Item i : cartService.getItems().values()) {
							Ticket t = i.getTicket();
					%>
					<tr>
						<th scope="row"><%=t.getId()%></th>
						<td><%=t.getType()%></td>
						<td><%=i.getQty()%></td>
						<td><%=t.getPrice()%></td>
						<td><%=t.getPrice()*i.getQty()%></td>
					</tr>
					<%
						}
					%>
					<tr>
						<th scope="row"></th>
						<td></td>
						<td></td>
						<td></td>
						<td class="info"><%= request.getSession().getAttribute("total") %></td>
					</tr>
				</tbody>
			</table>
		</div>

		<form action="OrderConfirmServlet" method="post">
			<input type="submit" value="Pagare" class="btn btn-success navbar-btn navbar-right"/>
			<a type="button" class="btn btn-danger navbar-btn navbar-right"
				href="/Es1_BigliettiTrasporto/ShoppingCartServlet"> <span
				class="glyphicon glyphicon-remove" aria-hidden="true"></span> Anullare
			</a>
		</form>
	</div>	

</body>
</html>