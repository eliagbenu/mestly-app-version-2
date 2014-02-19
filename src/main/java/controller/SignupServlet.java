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

public class SignupServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
		throws ServletException, IOException{
      	req.getRequestDispatcher("WEB-INF/signup.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
		throws ServletException, IOException{

		// read in parameters from request and do validation
		String username = req.getParameter("username");
		String firstname = req.getParameter("firstname");
		String lastname = req.getParameter("lastname");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String confirmPassword = req.getParameter("confirmPassword");

		boolean validationError = false;

					

		if(!Validators.isValidUsername(username)){
			req.setAttribute("usernameError", "The username must be at least 4 characters long.");
			validationError = true;

		} 
		if(!Validators.isValidName(firstname)){
			req.setAttribute("firstnameError", "The first name must be at least 2 characters long.");
			validationError = true;
		}

		if(!Validators.isValidName(lastname)){
			req.setAttribute("lastnameError", "The last name must be at least 2 characters long.");
			validationError = true;
		}

		if(!Validators.isValidEmailAddress(email)){
			req.setAttribute("emailError", "This is not a valid email address.");
			validationError = true;
		}

		if(!Validators.isValidPassword(password)){
			req.setAttribute("passwordError", "The password must be at least 8 characters "+
			"long and contain at least one number and one letter.");
			validationError = true;
		}
		
		if(!Validators.isIdenticalPassword(password,confirmPassword)){
			req.setAttribute("confirmPasswordError", "Passwords do not match.");
			validationError = true;			
		}

		try{

			if(UserManager.areCredentialsInUse(username, email)){
				req.setAttribute("credentialsError", "Username or Email are already in user.");

				validationError = true;			
			}

			if(validationError){	
				req.getRequestDispatcher("WEB-INF/signup.jsp").forward(req, resp);
			}else{			
				User user = new User(firstname, lastname, username, email, password);
				UserManager.addUser(user);
				req.getSession().setAttribute("username",username);
				resp.sendRedirect("/dashboard");
			}
		}catch(SQLException sql){

			req.getRequestDispatcher("WEB-INF/404.jsp").forward(req, resp);
			return;
		}
	}
}