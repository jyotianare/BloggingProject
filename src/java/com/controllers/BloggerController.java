
package com.controllers;

import com.beans.Blogger;
import com.beans.Category;
import com.daos.BloggerDao;
import com.utility.imageUtility;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BloggerController extends HttpServlet {


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
            
           HttpSession session = request.getSession();
           Blogger blogger = (Blogger)session.getAttribute("blogger");
           String categories[] = (String[]) session.getAttribute("categories"); 
           String imagePath = imageUtility.uploadImage(request, getServletConfig(),"media");      
           BloggerDao bd = new BloggerDao();
          
            if(imagePath!=null)
            {
               blogger.setPic(imagePath);
                 if(bd.add(blogger, categories))
                 {
                out.println("Blogger registered ! <br/> Pending for approval");
                out.println("<br/><a href='login.jsp'> goto Login Page</a>");
                out.println("<br/> <a href='index.jsp'>Back</a>");
                 }
                  else
                out.println("Error in Registraion");
           
            }
            else{
                out.println(" error occured");
            }
        }
        
        
        
        
        else  if( op.equals("login"))
        {
            
           String email = request.getParameter("userid");
             String pwd = request.getParameter("password");
     
             System.out.println("email:"+email);
             System.out.println("pwd:"+pwd);
             
             Blogger blogger = new Blogger();
             blogger.setUserid(email);
             blogger.setPassword(pwd);
             
            BloggerDao bd = new BloggerDao();
            
            
             if( bd.checkUser(blogger) )
             {
                 System.out.println(" valid user ");
                 
                 if( bd.checkUserStatus(blogger) )
                 {
                    System.out.println("<h1> valid user </h1>");
                    response.sendRedirect("blogger/dashboard.jsp");
                 }
                 else  
                   out.println("<h2><font color='red'>Sorry! User is not approved yet </font></h2>");
            
             }
                 
          else{
                out.println("<h2><font color='red'>Sorry! Userid or password is invalid</font></h2>");
               }
          
              
        }
        
       else if( op.equals("action") )
        {
            
           String userid = request.getParameter("userid");
           String statusValue = request.getParameter("status");
            
            System.out.println("userid received :"+userid);
           
            System.out.println("status value received :"+statusValue);
             
            BloggerDao bd = new BloggerDao();
            
            if(bd.setStatus( statusValue,userid))
            {
             out.println("<h1>Status changed!</h1>");
            }
            else out.println("<h1>status changing error</h1>");
            
        }
    
    }

}
