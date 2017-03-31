package it.polito.ai.es1.listeners;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import it.polito.ai.es1.implementation.CartService;
import it.polito.ai.es1.implementation.LoginService;
import it.polito.ai.es1.implementation.PaymentService;
import it.polito.ai.es1.interfaces.CartServiceInterface;
import it.polito.ai.es1.interfaces.LoginServiceInterface;
import it.polito.ai.es1.interfaces.PaymentServiceInterface;
import it.polito.ai.es1.models.Ticket;

/**
 * Application Lifecycle Listener implementation class SessionListener
 *
 */
@WebListener
public class SessionListener implements ServletContextListener, HttpSessionListener {

	Map<String, Ticket> map = new HashMap<String, Ticket>();
	public CartServiceInterface cartService;
	public LoginServiceInterface loginService;
	public PaymentServiceInterface paymentService;

	private int numberOfSessions;

	/**
	 * Default constructor.
	 */
	public SessionListener() {
		numberOfSessions = 0;
	}

	public int getNumberOfSessions() {
		return numberOfSessions;
	}

	public void sessionCreated(HttpSessionEvent arg0) {
		
		HttpSession session = arg0.getSession();
//		session.setMaxInactiveInterval(260);
		
		cartService = new CartService();
		loginService = new LoginService();
		paymentService = new PaymentService();
		session.setAttribute("cartService", cartService);
		session.setAttribute("loginService", loginService);
		session.setAttribute("paymentService", paymentService);
		
		synchronized (this) {
			numberOfSessions++;
		}
		System.out.println("Session created, current count: " + numberOfSessions);
	}

	public void sessionDestroyed(HttpSessionEvent arg0) {
		HttpSession session = arg0.getSession();
		synchronized (this) {
			numberOfSessions--;
		}
		System.out.println("Session destroyed, current count: " + numberOfSessions);
		System.out.println("The attribute value: " + session.getAttribute(("testAttr")));
	}

	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("Servlet startup. . .");
		System.out.println(arg0.getServletContext().getServerInfo());
		System.out.println(System.currentTimeMillis());
		
		map.put("001", new Ticket("Corsa singola urbana", "001", 1.50));
		map.put("002", new Ticket("Corsa singola suburbana", "002", 1.80));
		map.put("003", new Ticket("Biglietto giornaliero", "003", 4.90));
		map.put("004", new Ticket("Abbonamento settimanale", "004", 12.0));
		map.put("005", new Ticket("Abbonamento mensile", "005", 33.5));

		ServletContext servletContext = arg0.getServletContext();
		servletContext.setAttribute("map", map);
		
	}

	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("Servlet shutdown. . .");
		System.out.println(arg0.getServletContext().getServerInfo());
		System.out.println(System.currentTimeMillis());
	}
}
