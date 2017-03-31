package it.polito.ai.es1.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class PrivateResource
 */
public class PrivateResource implements Filter {

    /**
     * Default constructor. 
     */
    public PrivateResource() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		if (request instanceof HttpServletRequest) {
			HttpSession session = ((HttpServletRequest)request).getSession();
			if (session.getAttribute("user")==null) {
				System.out.println("Filtrado NOOOOOO logueado - "+((HttpServletRequest)request).getAttribute("javax.servlet.forward.request_uri"));
				System.out.println("Alternativa - "+((HttpServletRequest)request).getRequestURI().substring(((HttpServletRequest)request).getContextPath().length()));
				
				String uri = ((HttpServletRequest)request).getRequestURI().substring(((HttpServletRequest)request).getContextPath().length());
				session.setAttribute("uri", uri);
				((HttpServletResponse)response).sendRedirect("/Es1_BigliettiTrasporto/LoginServlet");
			} else {
				System.out.println("Filtrado logueado");
				// pass the request along the filter chain
				chain.doFilter(request, response);
			}
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
