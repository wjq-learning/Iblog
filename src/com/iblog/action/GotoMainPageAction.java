package com.iblog.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iblog.DAO.BlogDAO;
import com.iblog.model.Blog;

public class GotoMainPageAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		BlogDAO bDAO = BlogDAO.getInstance();
		ArrayList<Blog> blogs = bDAO.view();
		int count = bDAO.countBlog();
		int maxPage;
//		System.out.println(count);
		if(count%10==0){
			maxPage = count/10;
		}else{
			maxPage = count/10+1;
		}
		request.setAttribute("blogs", blogs);
		request.setAttribute("pagenum", 1);
		request.setAttribute("maxPage", maxPage);
		return "main.jsp";
	}

}
