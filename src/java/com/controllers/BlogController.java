
package com.controllers;

import com.beans.Blog;
import com.beans.Blogger;
import com.daos.BlogDao;
import com.daos.BloggerDao;
import com.utility.imageUtility;
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
                 System.out.println("blog controller me aa gya");
       
            
           HttpSession session = request.getSession();
           Blog blog = (Blog)session.getAttribute("blog");
           String categories[] = (String[]) session.getAttribute("categories"); 
           String imagePath = imageUtility.uploadImage(request, getServletConfig(),"blog");      
           BlogDao bd = new BlogDao();
          
//           int id = Integer.parseInt( request.getParameter("id"));
//           blog.setBid(id); 
           
            System.out.println("id is :" + blog.getId());
           
            if(imagePath!=null)
            {
                blog.setPosterImage(imagePath);
               
                 if(bd.add(blog, categories))
                 {
                out.println("Blog entered ! <br/> Pending for approval");
                out.println("<br/><a href='blogger/dashboard.jsp'> goto Dashboard</a>");
                
                 }
                  else
                out.println("Error in entering blog");
           
            }
            else{
                out.println(" error occured");
            }
        }
        else if( op.equals("action") )
        {
            
           String id = request.getParameter("id");
           String statusValue = request.getParameter("status");
            
            System.out.println("id received :"+id);
           
            System.out.println("status value received :"+statusValue);
             
            BlogDao bd = new BlogDao();
            
            if(bd.setStatus( statusValue,id))
            {
             out.println("<h1>Status changed!</h1>");
               out.println("<a href='admin/pendingBlogs.jsp' >Back to pending list</a>");
           
             out.println("<a href='admin/dashboard.jsp' >Dashboard</a>");
            }
            else out.println("<h1>status changing error</h1>");
            
        }
    
        
        
        
        
        
        
        }
        
       
        
    }



