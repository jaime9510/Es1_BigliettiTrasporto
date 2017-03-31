package it.polito.ai.es1.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.polito.ai.es1.implementation.CartService;
import it.polito.ai.es1.interfaces.CartServiceInterface;
import it.polito.ai.es1.models.Ticket;

/**
 * Servlet implementation class ShoppingCartServlet
 */
public class ShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String id;
    private Integer qty;
    private CartServiceInterface cartService;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/shoppingCart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map<String, Ticket> map = (HashMap<String, Ticket>)request.getServletContext().getAttribute("map");
		id = request.getParameter("id");
		String q = request.getParameter("qty");
		
		try {
			cartService = (CartService) request.getSession().getAttribute("cartService");
			if (q != null) {
				qty = Integer.parseInt(q);
				cartService.modifyItem(map.get(id), qty);
			} else {
				cartService.removeItem(id);
			}

		} catch (NumberFormatException e) {
		    response.getWriter().append("La quantità deve essere un numero");
		}
		request.getRequestDispatcher("/shoppingCart.jsp").forward(request, response);
	}
}
