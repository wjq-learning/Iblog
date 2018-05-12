package com.iblog.action;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iblog.DAO.BlogDAO;
import com.iblog.model.User;

public class PublishAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String content = request.getParameter("content");
		System.out.println(user.getUserID());
		System.out.println(content);
		BlogDAO bDAO = BlogDAO.getInstance();
		int blogID = bDAO.add(user.getUserID(), content);
		if(blogID == 0){
			request.setAttribute("info", 0);
			return "publish.jsp";
		}
		request.setAttribute("info", 1);
		return "publish.jsp";
	}

}
