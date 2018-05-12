package com.iblog.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iblog.DAO.FollowDAO;
import com.iblog.model.User;

public class GotoMyfanAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		FollowDAO fDAO = FollowDAO.getInstance();
		ArrayList<User> fans = fDAO.viewFan(user.getUserID(),"1");
		int count = fDAO.countFan(user.getUserID());
		int maxPage;
		if(count%10==0){
			maxPage = count/10;
		}else{
			maxPage = count/10+1;
		}
		request.setAttribute("fans", fans);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("pagenum", 1);
		return "fansList.jsp";
	}

}
