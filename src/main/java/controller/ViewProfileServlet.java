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


public class ViewProfileServlet extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException 
    {
//		ArrayList<User> userList = UserManager.getUserList();
		String username =   req.getPathInfo();	
		username = username.substring(1);
	

		//System.out.println("Username: "+username);
//		User user = UserManager.getUserViaUsername(username);      
/*
		req.setAttribute("user", user);

		//get followers
		HashSet<String> followingList = user.getFollowingList();          
		req.setAttribute("followingList",followingList); 

		ArrayList<String> followersList = UserManager.getFollowersList(username);    
		req.setAttribute("followersList",followersList);         

		ArrayList<String> tagList = user.getTagList();  		
		req.setAttribute("tagList",tagList);      

		HashMap<String,URL> userServiceList = user.getServiceList();
		req.setAttribute("userServiceList",userServiceList.values())  ; 

		String theme= user.getTheme();

		if(theme!=null)
		{
		theme = "/WEB-INF/view/pages/"+theme;
		req.getRequestDispatcher(theme).forward(req, resp);
		}else{
		req.getRequestDispatcher("/WEB-INF/view/pages/userProfile.jsp").forward(req, resp);   			
		}

*/		
		req.getRequestDispatcher("/WEB-INF/userProfile.jsp").forward(req, resp);   

    }

}