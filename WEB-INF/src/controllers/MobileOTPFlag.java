package controllers;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import models.User;
import utils.*;

public class MobileOTPFlag extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user!=null){
            String mobile = user.getMobile();
            String formMobile = request.getParameter("mobile");
            if(mobile==null){
                mobile="";
            }
            if(mobile.equals(formMobile)){
                response.getWriter().write("{\"resp\":\"true\"}");
            }else{

	    		response.getWriter().write("{\"resp\":\"false\"}");
            }

		}else{
			System.out.println("Expired    &&&&&&&&&&&&&&&&");
            request.getRequestDispatcher("login.jsp").forward(request, response);            
		}
	}
}
