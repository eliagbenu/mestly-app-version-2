package controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.io.IOException;

import model.UserManager;
import model.User;

import util.Validators;

import java.sql.SQLException;

public class SigninServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
		throws ServletException, IOException{
      	req.getRequestDispatcher("WEB-INF/signin.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
		throws ServletException, IOException{

		String username = req.getParameter("username");
		String password = req.getParameter("password");

		try{
			if(UserManager.checkUserCredentials(username, password)){
				req.getSession().setAttribute("username",username);
				if(req.getParameter("next") != null){
					resp.sendRedirect(req.getParameter("next"));
				}else{
					resp.sendRedirect("/dashboard");	
				}			
			}else{
				req.setAttribute("signinError", "Username and Password do not match.");
				req.getRequestDispatcher("WEB-INF/signin.jsp").forward(req, resp);
			}
		}catch(SQLException sql){
			req.getRequestDispatcher("WEB-INF/404.jsp").forward(req,resp);
			return;
		}
	}
}