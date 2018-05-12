package com.iblog.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iblog.DAO.BlogDAO;
import com.iblog.DAO.UserDAO;
import com.iblog.model.Blog;
import com.iblog.model.User;

public class LoginAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		String userID = request.getParameter("userID");
		String password = request.getParameter("password");
//		System.out.println(userID);
//		System.out.println(password);
		try{
			PrintWriter out = reponse.getWriter();
			UserDAO uDAO = UserDAO.getInstance();
			User user = uDAO.login(userID, password);
			HttpSession session = request.getSession();
			if(user!=null){
				session.setAttribute("user", user);
				out.write("success");
			}else{
				out.write("fail");
			}
			out.flush();
			out.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

}
