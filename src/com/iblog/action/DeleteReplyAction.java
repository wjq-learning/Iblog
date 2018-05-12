package com.iblog.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iblog.DAO.BlogDAO;
import com.iblog.DAO.ReplyDAO;
import com.iblog.model.Blog;
import com.iblog.model.Reply;
import com.iblog.model.User;

public class DeleteReplyAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		int replyID = Integer.parseInt(request.getParameter("deleteReplyID"));
		int blogID = Integer.parseInt(request.getParameter("thisBlogID"));
		System.out.println(replyID);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		BlogDAO bDAO = BlogDAO.getInstance();
		ReplyDAO rDAO = ReplyDAO.getInstance();
		rDAO.deleteReply(replyID);
		Blog blog = bDAO.viewByID(blogID);
		ArrayList<Reply> replys = rDAO.view(blogID, "1");
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
		request.setAttribute("pagenum", 1);
		request.setAttribute("maxPage", maxPage);
		return "bloginfo.jsp";
	}

}
