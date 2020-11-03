package controllers;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import models.User;
import utils.*;

public class OTPServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user!=null){
			String mobile = request.getParameter("mobile");
			String otp = OTPGenerator.getOTP();
			System.out.println(otp+"generated otp        &&&&&&&&&&&&&&&&");
			String message = "Your one time otp: "+otp;
			//TextLocal.sendSms(mobile,message);
			session.setAttribute("otp",otp);
			//save otp to database code
			response.getWriter().write("success");

		}else{
			System.out.println("Expired    &&&&&&&&&&&&&&&&");
			response.getWriter().write("expired");
		}
	}
}
