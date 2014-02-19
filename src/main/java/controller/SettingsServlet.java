package controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.io.IOException;

import util.Validators;
import model.UserManager;
import model.User;

import java.sql.SQLException;

public class SettingsServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
		throws ServletException, IOException{

		try{
			if((String)req.getSession().getAttribute("username") != null){
				User user = UserManager.getUser((String)req.getSession().getAttribute("username"));
				req.setAttribute("user", user);
				req.getRequestDispatcher("WEB-INF/settings.jsp").forward(req, resp);
			}else{
				resp.sendRedirect("/signin?next="+req.getRequestURI());
			}    
		}catch(SQLException sql){
			req.getRequestDispatcher("WEB-INF/404.jsp").forward(req,resp);
			return;
		}  	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
		throws ServletException, IOException{

		String password = req.getParameter("password");
		String confirmPassword = req.getParameter("confirmPassword");
		boolean validationError = false;

		if(!Validators.isValidPassword(password)){
			req.setAttribute("passwordError", "The password must be at least 8 characters "+
			"long and contain at least one number and one letter.");
			validationError = true;
		}

		if(!Validators.isIdenticalPassword(password,confirmPassword)){
			req.setAttribute("confirmPasswordError", "Passwords do not match.");
			validationError = true;			
		}

		if(validationError){
			req.getRequestDispatcher("WEB-INF/settings.jsp").forward(req,resp);
		}else{
			try{
				if(req.getSession().getAttribute("username") != null){
					User user = UserManager.getUser((String)req.getSession().getAttribute("username"));
					user.setPassword(password);
					UserManager.updatePassword(user);
					req.setAttribute("confirmation","Password successfully changed.");
					req.setAttribute("user",user);
					req.getRequestDispatcher("WEB-INF/settings.jsp").forward(req,resp);
				}else{
					req.getRequestDispatcher("WEB-INF/404.jsp").forward(req,resp);
					return;
				}

			}catch(SQLException sql){
				req.getRequestDispatcher("WEB-INF/404.jsp").forward(req,resp);
				return;
			}			
		}
	}
}