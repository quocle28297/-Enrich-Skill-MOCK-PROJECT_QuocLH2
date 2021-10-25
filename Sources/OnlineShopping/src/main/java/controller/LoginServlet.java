package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;
import model.bean.Account;
import model.bo.AccountBO;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		AccountBO accountBO = new AccountBO();
		HttpSession session = request.getSession();
		String path = "/login.jsp";

		if ("Login".equalsIgnoreCase(request.getParameter("Login"))) {
			String username = request.getParameter("username");
			String pass = request.getParameter("pass");

			Account account = accountBO.checkLogin(username, pass);

			if (account != null) {
				session.setAttribute("account", account);
				path = "/HomeServlet";
			}
		}else if("Register".equalsIgnoreCase("Register")) {
			String userName  =request.getParameter("Username");
			String pass  =request.getParameter("Password");
			String email  =request.getParameter("Email");
			String name  =request.getParameter("Name");
			String phone  =request.getParameter("Phone");
			Account acc = new Account(userName, pass, email, phone, name);
			
			boolean result = new AccountBO().insertAccountBO(acc);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
