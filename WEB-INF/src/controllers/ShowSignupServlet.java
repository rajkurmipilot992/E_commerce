package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*; 
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import models.*;
import utils.*;

public class ShowSignupServlet extends HttpServlet{
    // GET REQUEST HANDLING
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        request.getRequestDispatcher("signup.jsp").forward(request, response);    
    }

    // POST REQUEST HANDLING
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("repassword");
        String captchaResponse = request.getParameter("g-recaptcha-response");

        // VALIDATION
        Pattern p = null;
        Matcher m = null;
        boolean flag = true;
        String error_msg = "<ul>";
        flag = GoogleCaptcha.checkRecaptcha(captchaResponse);
        System.out.println("#####################google recaptcha:"+flag);
        if(flag){
            p = Pattern.compile("^[a-zA-Z][a-zA-Z0-9]{4,29}$");
            m = p.matcher(username);
            if(!m.matches()){
                flag = false;
                error_msg += "<li>Only alphabet and numeric characters allowed !</li>";
            }
            p = Pattern.compile("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$");
            m = p.matcher(email);
            if(!m.matches()){
                flag = false;
                error_msg += "<li>Invalid email !</li>"; 
            }

            int passwordLength = password.length();
            if(passwordLength<6||passwordLength>12){
                flag = false;
                error_msg += "<li>Password must be of at least 6 and at max 12 characters</li>"; 
            }

            if(!password.equals(rePassword)){
                flag = false;
                error_msg += "</li>password and repassword must match!!</p></li>";
            }
            System.out.println("#####################flag:"+flag);

            if(flag){
                User user = new User(username, email, password);
                if(user.saveUser()){
                    ServletContext context = getServletContext();
					String senderEmail = context.getInitParameter("sender_gmail");
					String senderEmailPassword = context.getInitParameter("sender_gmail_password");
					long activationCode = ActivationCode.generateActivationCode();
					// String msg = EmailMessages.getAccountActivationMail(userName,activationCode);
					// EmailSender.sendEmail(email,"eCart Account Activation Mail",msg,senderEmail,senderEmailPassword);
                    response.sendRedirect("signin.jsp");
                    
                }else{
                    flag = false;
                    error_msg += "<li>Duplicate Useranme or Email</li>";
                }
            }
        }else{
            error_msg+="<li>Captcha failed</li>";
        }
        error_msg += "</ul>";
        if(!flag){
            request.setAttribute("error",error_msg);
			request.getRequestDispatcher("signup.jsp").forward(request,response);
        }
        // request.getRequestDispatcher("index.jsp").forward(request, response);       
    }
}