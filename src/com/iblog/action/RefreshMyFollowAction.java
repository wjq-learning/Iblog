package com.iblog.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iblog.DAO.FollowDAO;
import com.iblog.model.User;

public class RefreshMyFollowAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String pagenumber = request.getParameter("pagenumber");
		FollowDAO fDAO = FollowDAO.getInstance();
		ArrayList<User> follows = fDAO.viewFollow(user.getUserID(),pagenumber);
		int count = fDAO.countFollow(user.getUserID());
		int maxPage;
		if(count%10==0){
			maxPage = count/10;
		}else{
			maxPage = count/10+1;
		}
		request.setAttribute("follows", follows);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("pagenum", pagenumber);
		return "followsList.jsp";
	}

}
