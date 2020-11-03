package controllers;

import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import utils.*;
import models.*;

public class ShowSigninServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{   
        request.getRequestDispatcher("signin.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        HttpSession session = request.getSession();
        String captchaResponse = request.getParameter("g-recaptcha-response");
        boolean flag = GoogleCaptcha.checkRecaptcha(captchaResponse);

        if(flag){
            String unmEml = request.getParameter("usernameOrEmail");
            String pwd = request.getParameter("password");
            User user = User.loginUser(unmEml, pwd);
            if(user!=null){
                session.setAttribute("user", user);
                response.sendRedirect("index.jsp");
            }else{
				request.setAttribute("error","Either Username/Email or Password is incorrect...");
				request.getRequestDispatcher("signin.jsp").forward(request,response);	
			}
        }
        else{
            request.setAttribute("error","Captcha Test Failed");
            request.getRequestDispatcher("signin.jsp").forward(request, response);
        }
    }
}