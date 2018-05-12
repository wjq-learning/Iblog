package com.iblog.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iblog.DAO.BlogDAO;
import com.iblog.model.Blog;
import com.iblog.model.User;

public class RefreshMyspaceAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String pagenumber = request.getParameter("pagenumber");
		BlogDAO bDAO = BlogDAO.getInstance();
		ArrayList<Blog> blogs = bDAO.view(user.getUserID(), "", "", "", pagenumber);
		int count = bDAO.countBlog(user.getUserID(), "", "", "");
		int maxPage;
		if(count%10==0){
			maxPage = count/10;
		}else{
			maxPage = count/10+1;
		}
		request.setAttribute("blogs", blogs);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("pagenum", pagenumber);
		return "myinfo.jsp";
	}

}
