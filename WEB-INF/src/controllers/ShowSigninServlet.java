package controllers;

import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;

public class ShowSigninServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        System.out.println("######");
        
        request.getRequestDispatcher("signin.jsp").forward(request, response);
    }
}