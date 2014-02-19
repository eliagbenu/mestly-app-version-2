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

public class AddTagServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
		throws ServletException, IOException{

		try{
			User user = UserManager.getUser((String)req.getSession().getAttribute("username"));
			
			if(user == null){
				req.getRequestDispatcher("WEB-INF/404.jsp").forward(req,resp);
				return;
			}		

			if(!Validators.isValidName((String)req.getParameter("tag"))){
				resp.sendRedirect("/settings?tagError=true");
				return;
			}		
			
			if(!user.addTag((String)req.getParameter("tag"))){
				resp.sendRedirect("/settings");
				return;
			}

			UserManager.addTag(user.getUsername(), (String)req.getParameter("tag"));
			resp.sendRedirect("/settings");
			
		}catch(SQLException sql){
			req.getRequestDispatcher("WEB-INF/404.jsp").forward(req,resp);
			return;
		}				
	}
}