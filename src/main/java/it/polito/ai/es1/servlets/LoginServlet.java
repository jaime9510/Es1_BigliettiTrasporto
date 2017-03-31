package it.polito.ai.es1.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.polito.ai.es1.implementation.CartService;
import it.polito.ai.es1.implementation.LoginService;
import it.polito.ai.es1.interfaces.CartServiceInterface;
import it.polito.ai.es1.interfaces.LoginServiceInterface;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private LoginServiceInterface loginService;
	String username;
	String password;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Login....................- "+request.getParameter("user")+" -........................."+request.getParameter("pass"));
		username = request.getParameter("user");
		password = request.getParameter("pass");
		
		loginService = (LoginService) request.getSession().getAttribute("loginService");
		
		if(loginService.login(username, password)) {
			request.getSession().setAttribute("user", username);
			
			String uri = (String)request.getSession().getAttribute("uri");
			if (uri != null) {
				request.getRequestDispatcher(uri).forward(request, response);
			} else {
				request.getRequestDispatcher("/home.jsp").forward(request, response);
			}
			
		} else {
			response.getWriter().append("User / Password invalido. Prova di nuovo");
			System.out.println("User / Password invalido. Prova di nuovo");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
		
		
	}

}
