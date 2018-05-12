package com.iblog.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iblog.DAO.BlogDAO;
import com.iblog.DAO.FollowDAO;
import com.iblog.DAO.UserDAO;
import com.iblog.model.Blog;
import com.iblog.model.User;

public class FollowAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		int followed = Integer.parseInt(request.getParameter("followed"));
		String followID = request.getParameter("followUserID");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		FollowDAO fDAO = FollowDAO.getInstance();
		if(followed==1){
			fDAO.deleteFollow(user.getUserID(), followID);
		}else{
			fDAO.addFollow(user.getUserID(), followID);
		}
		UserDAO uDAO = UserDAO.getInstance();
		User other = uDAO.view(followID);
		BlogDAO bDAO = BlogDAO.getInstance();
		ArrayList<Blog> blogs = bDAO.view(followID, "", "", "", "1");
		followed = uDAO.isFollowed(user.getUserID(), followID);
		int count = bDAO.countBlog(other.getUserID(), "", "", "");
		int maxPage;
		if(count%10==0){
			maxPage = count/10;
		}else{
			maxPage = count/10+1;
		}
		request.setAttribute("blogs", blogs);
		request.setAttribute("other", other);
		request.setAttribute("followed", followed);
		request.setAttribute("pagenum", 1);
		request.setAttribute("maxPage", maxPage);
		return "otherinfo.jsp";
	}

}
