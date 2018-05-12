package com.iblog.servlet;

import java.io.IOException;
import com.iblog.action.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 4660044561652707132L;  
    
    @Override  
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)  
            throws ServletException, IOException {  
        doPost(req, resp);  
    }
      
    @Override  
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)  
            throws ServletException, IOException {
    	try{
			req.setCharacterEncoding("utf-8");
		}catch(Exception ex){
			ex.printStackTrace();
		}
        String pathName = req.getServletPath();  
        System.out.println("pathName:" + pathName);  
        
        int index = pathName.indexOf(".");  
        String actionName = pathName.substring(1,index);  
        System.out.println("actionName:" + actionName);  
          
        String actionClass = getInitParameter(actionName);  
        System.out.println("actionClass:" + actionClass);  
        
        Action action = ActionFactory.getAction(actionClass);  
        String viewUrl = action.execute(req, resp);
        if (viewUrl == null) {
        	//do nothing
        } else {
            req.getRequestDispatcher(viewUrl).forward(req, resp);  
        }  
    }  
}
