<%-- 
    Document   : CreateBlog
    Created on : 7 May, 2021, 12:24:45 AM
    Author     : hp
--%>

<%@page import="com.daos.BloggerDao"%>
<%@page import="com.beans.Blogger"%>
<%@page import="com.beans.Blog"%>
<%@page import="com.beans.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.daos.BlogDao"%>
<%@page import="com.daos.CategoryDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">

    <title>Stand Blog Posts</title>

    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


  </head>

  <script type="text/javascript">
            function validateForm() {
                h=0;
                
                categories = document.getElementsByName("category");
                for (j = 0; j < categories.length; j++) {
                    // alert('hobbies : '+ hobbies[i].checked);
                    if (categories[j].checked)
                        h++;
                }
                     if (h == 0)
                     {
                    s3.innerHTML = "Please Select atleast one category ";
                    return false;
                     }

                }
  </script>
  
  <body>
   <% 
       Blogger user = (Blogger)session.getAttribute("user");
        //   if(user==null){
        //    RequestDispatcher rd = request.getRequestDispatcher("signup_signin.jsp");
        //   rd.forward(request,response);
        //   }
           System.out.println("user in create blog:"+user);
           System.out.println("user email :" + user.getUserid());
           System.out.println("user id :" + user.getId());
           
         //  BloggerDao bd = new BloggerDao();
           
         
       %>
    
        
      <form  action="uploadBlogPic.jsp" class="form-control"   >
        
        
        Select Categories :<span style="font-weight: bold;color:red" id="s3"></span> <br/>
                                    <% CategoryDao cd = new CategoryDao();
                    BlogDao bd = new BlogDao();
                    
                    ArrayList<Category> clist = cd.getAllCategories();
                    for(Category c : clist){%>
                                 <input type="checkbox" name="category" value="<%=c.getId()%>" /> <%=c.getName()%> <br/>
                           
                     <%}%>
        
        
        
        <br/><br/>
        <input type="hidden" name="bid" value="<%= user.getId() %>" />
        Date : <input type="date" >  <br/> <br/>
       Title : <input type="text" name="title"> <br/> <br/>
        Write Content :
        <br>
        <input type="text" style="width: 800px; height: 500px;" name="blog" />  <br/> <br/>
                                      
        
      <input type="submit" value="Next" class="btn btn-primary lg" name="Submit"/>
    
   
  </form>

  </body>
</html>