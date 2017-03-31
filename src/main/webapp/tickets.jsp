<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="it.polito.ai.es1.models.Ticket"%>
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
			$('#modalTicket').on('show.bs.modal', function(event) {
				var button = $(event.relatedTarget) // Button that triggered the modal
				var id = button.data('id') // Extract info from data-* attributes
				var type = button.data('type')
				var modal = $(this)
				modal.find('.modal-title').text(type)
				modal.find($("#id")).val(id)
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
		
		<!-- Table -->
		<div>
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>Biglietto</th>
						<th>Prezzo</th>
						
					</tr>
				</thead>
				<tbody>
					<%
						Map<String, Ticket> map = (HashMap<String, Ticket>)request.getServletContext().getAttribute("map");
						for (Ticket t : map.values()) {
					%>
					<tr>
						<th scope="row"><%=t.getId()%></th>
						<td><%=t.getType()%></td>
						<td><%=t.getPrice()%></td>
						<td>
							<button type="button" class="btn btn-info" data-toggle="modal" data-type="<%=t.getType()%>" data-id="<%=t.getId()%>" data-target="#modalTicket">
								Aggiungere al carrello
							</button>
						</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</div>	
	
	<!-- Modal -->
	<div id="modalTicket" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<form action="TicketServlet" method="post">
				<div class="modal-content">
					<div class="modal-header form-group">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body form-group">
	
						<p>Quanti ne vuole aggiungere al carrello?</p>
						<p></p>
						<input type="number" min="1" value="1" class="form-control" name="qty">
						<input type="hidden" class="text" value="" class="form-control" name="id" id="id">
					</div>
					<p></p>
					<div class="modal-footer form-group">
						<input type="submit" value="Aggiungi" class="btn btn-info"/>
					</div>
				</div>
			</form>

		</div>
	</div>	
</body>
</html>