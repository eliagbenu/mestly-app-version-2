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

public class UpdateLocationServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
		throws ServletException, IOException{

		try{
			User user = UserManager.getUser((String)req.getSession().getAttribute("username"));
			
			if(user == null){
				req.getRequestDispatcher("WEB-INF/404.jsp").forward(req,resp);
				return;
			}		

			String lat = (String)req.getParameter("latField");
			String lng = (String)req.getParameter("lngField");

			UserManager.updateLocationCo_ordinates(user.getUsername(),lat,lng);
			

			req.getSession().setAttribute("lat",lat);

			resp.sendRedirect("/editUser");
			
		}catch(SQLException sql){
			req.getRequestDispatcher("WEB-INF/404.jsp").forward(req,resp);
			return;
		}				
	}
}