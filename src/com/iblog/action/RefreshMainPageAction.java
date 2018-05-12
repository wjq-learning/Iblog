package com.iblog.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iblog.DAO.BlogDAO;
import com.iblog.model.Blog;

public class RefreshMainPageAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		String searchName = request.getParameter("searchName");
		String beginTime = request.getParameter("beginTime");
		String endTime = request.getParameter("endTime");
		String pagenumber = request.getParameter("pagenumber");
		BlogDAO bDAO = BlogDAO.getInstance();
		ArrayList<Blog> blogs = bDAO.view("", searchName, beginTime, endTime, pagenumber);
		int count = bDAO.countBlog("", searchName, beginTime, endTime);
		int maxPage;
		if(count%10==0){
			maxPage = count/10;
		}else{
			maxPage = count/10+1;
		}
		request.setAttribute("blogs", blogs);
		request.setAttribute("pagenum", pagenumber);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("searchname", searchName);
		request.setAttribute("searchBeginTime", beginTime);
		request.setAttribute("searchEndTime", endTime);
		return "main.jsp";
	}

}
