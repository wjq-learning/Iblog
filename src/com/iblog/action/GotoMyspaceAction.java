package com.iblog.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iblog.DAO.BlogDAO;
import com.iblog.model.Blog;
import com.iblog.model.User;

public class GotoMyspaceAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		BlogDAO bDAO = BlogDAO.getInstance();
		ArrayList<Blog> blogs = bDAO.view(user.getUserID(), "", "", "", "1");
		int count = bDAO.countBlog(user.getUserID(), "", "", "");
		int maxPage;
		if(count%10==0){
			maxPage = count/10;
		}else{
			maxPage = count/10+1;
		}
//		System.out.println(maxPage);
		request.setAttribute("blogs", blogs);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("pagenum", 1);
		return "myinfo.jsp";
	}

}
