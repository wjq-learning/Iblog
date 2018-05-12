package com.iblog.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.iblog.DAO.UserDAO;

public class RegisterAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		String userID = request.getParameter("userID");
		String nickname = request.getParameter("nickname");
		String password = request.getParameter("password");
//		System.out.println(userID);
//		System.out.println(nickname);
//		System.out.println(password1);
//		System.out.println(password2);
		try{
			PrintWriter out = reponse.getWriter();
			UserDAO uDAO = UserDAO.getInstance();
			boolean result = uDAO.register(userID, nickname, password);
			if(result){
				out.write("success");
			}else{
				out.write("fail");
			}
			out.flush();
			out.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

}
