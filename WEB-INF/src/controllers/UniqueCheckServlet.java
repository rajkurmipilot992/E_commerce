package controllers;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

import models.User;


public class UniqueCheckServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String str = request.getParameter("key");
        boolean flag = User.checkUniqueKey(str);
        response.getWriter().write(Boolean.toString(flag));
    }
}