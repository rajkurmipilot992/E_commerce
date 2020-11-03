package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*; 
import models.User;
import java.sql.Date;


public class ProfileServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        if(user!=null){
            request.getRequestDispatcher("profile.jsp").forward(request, response);
		}else{
            request.getRequestDispatcher("signin.jsp").forward(request, response);
        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String firstName = request.getParameter("firstName");
        String middleName = request.getParameter("middleName");
        String lastName = request.getParameter("lastName");
        String dob = request.getParameter("dateOfBirth");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        System.out.println("------- "+dob);
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        if(user!=null){
            user.setFirstName(firstName);
            user.setMiddleName(middleName);
            user.setLastName(lastName);
            if(dob!=""){
                user.setDob(Date.valueOf(dob));
            }
            user.setMobile(mobile);
            boolean flag = user.saveProfile();
            if(flag)
                response.sendRedirect("home.do");
            else
                request.getRequestDispatcher("login.jsp").forward(request, response);

        }else{
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

} 