package it.polito.ai.es1.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.polito.ai.es1.implementation.CartService;
import it.polito.ai.es1.implementation.PaymentService;
import it.polito.ai.es1.interfaces.CartServiceInterface;
import it.polito.ai.es1.interfaces.PaymentServiceInterface;

/**
 * Servlet implementation class OrderConfirmServlet
 */
public class OrderConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private CartServiceInterface cartService;
	private PaymentServiceInterface paymentService;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderConfirmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		cartService = (CartService) request.getSession().getAttribute("cartService");
		System.out.println("get = "+cartService.getTotal());
		request.getSession().setAttribute("total", cartService.getTotal());
		request.getRequestDispatcher("/orderConfirm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post");
		cartService = (CartService) request.getSession().getAttribute("cartService");
		cartService.clearCart();

		paymentService = (PaymentService) request.getSession().getAttribute("paymentService");
		request.setAttribute("messageOrder", "Ordine numero:" + paymentService.numOrder() + " effettuata");
		request.getRequestDispatcher("/home.jsp").forward(request, response);
	}

}
