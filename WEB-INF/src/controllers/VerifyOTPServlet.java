package controllers;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import models.User;
import utils.*;

public class VerifyOTPServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        
		if(user!=null){
            String otp1 = request.getParameter("otp");
            String firstName = request.getParameter("firstName");
			String otp2 = (String)session.getAttribute("otp");
            if(otp1.equals(otp2)){
                response.getWriter().write("{\"resp\":\"success\"}");
            }else{
                System.out.println("not matched    &&&&&&&&&&&&&&&&");
                response.getWriter().write("{\"resp\":\"notSuccess\"}");
            }

		}else{
			System.out.println("expired    &&&&&&&&&&&&&&&&");
			response.getWriter().write("{\"resp\":-1}");
		}
	}
}
