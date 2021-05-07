
package com.controllers;

import com.beans.Blog;
import com.daos.BlogDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BlogController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
  @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         PrintWriter out = response.getWriter();
            response.setContentType("text/html");
    
        String op = request.getParameter("op");
      
        if(op!=null && op.equals("add"))
        {       
            
           String title = request.getParameter("title");
           String content = request.getParameter("content");
           int id = Integer.parseInt( request.getParameter("id") );
           Blog blog = new Blog();
           
           blog.setContents(content);
           blog.setTitle(title);
           blog.setBid(id);
           HttpSession session = request.getSession();
           String categories[] = (String[]) session.getAttribute("categories"); 
           BlogDao bd = new BlogDao();
          
                 if(bd.add(blog, categories))
                 {
                out.println("Blog entered ! <br/> Pending for approval");
                out.println("<br/><a href='login.jsp'> goto Login Page</a>");
                out.println("<br/> <a href='index.jsp'>Back</a>");
                 }
                  else
                out.println("Error in entering blog");
           
            }
            else{
                out.println(" error occured");
            }
        }
        
       
        
    }



