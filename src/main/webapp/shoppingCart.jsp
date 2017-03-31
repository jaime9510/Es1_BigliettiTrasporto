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
						<td>
							<button type="button" class="btn btn-warning" data-toggle="modal" data-type="<%=t.getType()%>" data-id="<%=t.getId()%>" data-target="#modalModify">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							</button>
							<button type="button" class="btn btn-danger" data-toggle="modal" data-type="<%=t.getType()%>" data-id="<%=t.getId()%>" data-target="#modalDelete">
								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
							</button>
						</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		<a type="button" class="btn btn-success navbar-btn navbar-right"
			href="/Es1_BigliettiTrasporto/private/OrderConfirmServlet"> <span
			class="glyphicon glyphicon-ok" aria-hidden="true"></span> Confermare Ordine
		</a>
	</div>	
	
	<!-- Modal Delete -->
	<div id="modalDelete" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<form action="ShoppingCartServlet" method="post">
				<div class="modal-content">
					<div class="modal-header form-group">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body form-group">
						<p>Vuole cancellare dell'ordine questi bilietti?</p>
						<p></p>
						<input type="hidden" class="text" value="" class="form-control" name="id" id="id1">
					</div>
					<p></p>
					<div class="modal-footer form-group">
						<input type="submit" value="Confermare" class="btn btn-danger"/>
					</div>
				</div>
			</form>

		</div>
	</div>	
	
	<!-- Modal Modify -->
	<div id="modalModify" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<form action="ShoppingCartServlet" method="post">
				<div class="modal-content">
					<div class="modal-header form-group">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body form-group">
	
						<p>Quanti biglietti ne vuole adesso?</p>
						<p></p>
						<input type="number" min="1" value="1" class="form-control" name="qty">
						<input type="hidden" class="text" value="" class="form-control" name="id" id="id2">
					</div>
					<p></p>
					<div class="modal-footer form-group">
						<input type="submit" value="Modifica" class="btn btn-warning"/>
					</div>
				</div>
			</form>

		</div>
	</div>
</body>
</html>