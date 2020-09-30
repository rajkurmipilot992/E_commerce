package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*; 

public class ShowSignupServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        
        request.getRequestDispatcher("signup.jsp").forward(request, response);    
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(email+username); 
        // redirect
        request.getRequestDispatcher("index.jsp").forward(request, response);       
    }
}