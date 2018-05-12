package com.iblog.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iblog.DAO.BlogDAO;
import com.iblog.DAO.ReplyDAO;
import com.iblog.model.Blog;
import com.iblog.model.Reply;

public class RefreshBlogDetailAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		String pagenumber = request.getParameter("pagenumber");
		int blogID = Integer.parseInt(request.getParameter("blogID"));
		BlogDAO bDAO = BlogDAO.getInstance();
		ReplyDAO rDAO = ReplyDAO.getInstance();
		Blog blog = bDAO.viewByID(blogID);
		ArrayList<Reply> replys = rDAO.view(blogID, pagenumber);
		int count = rDAO.countReply(blogID);
		System.out.println(count);
		int maxPage;
		if(count%10==0){
			maxPage = count/10;
		}else{
			maxPage = count/10+1;
		}
		request.setAttribute("blog", blog);
		request.setAttribute("replys", replys);
		request.setAttribute("pagenum", pagenumber);
		request.setAttribute("maxPage", maxPage);
		return "bloginfo.jsp";
	}

}
