package controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.io.IOException;

import model.UserManager;
import model.User;

import java.util.ArrayList;

import java.sql.SQLException;

public class UserDirectoryServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
		throws ServletException, IOException{

   	try
   	{
		ArrayList<String> allUsers = UserManager.getAllUsers();
		req.setAttribute("allUsers",allUsers);

      	req.getRequestDispatcher("WEB-INF/userDirectory.jsp").forward(req, resp);

      		}catch(SQLException sql){
			req.getRequestDispatcher("WEB-INF/404.jsp").forward(req,resp);
			return;
		}
	}
}