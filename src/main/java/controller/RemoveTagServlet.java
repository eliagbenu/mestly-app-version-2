package controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.io.IOException;

import model.UserManager;
import model.User;

import java.sql.SQLException;

public class RemoveTagServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
		throws ServletException, IOException{

		try{
			User user = UserManager.getUser((String)req.getSession().getAttribute("username"));			

			if(user == null){
				req.getRequestDispatcher("WEB-INF/404.jsp").forward(req,resp);
				return;
			}		
			
			if((String)req.getParameter("tag")==null){
				req.getRequestDispatcher("WEB-INF/404.jsp").forward(req, resp);
				return;
			}
			
			if(!user.removeTag((String)req.getParameter("tag"))){
				req.getRequestDispatcher("WEB-INF/404.jsp").forward(req, resp);
				return;
			}

			UserManager.removeTag(user.getUsername(), (String)req.getParameter("tag"));
			resp.sendRedirect("/editUser");

		}catch(SQLException sql){
			req.getRequestDispatcher("WEB-INF/404.jsp").forward(req,resp);
			return;
		}
	}
}