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

  <body>

    
        
      <form  action="../BlogController?op=add" class="form-control"  method="post" >
        
        Choose Category : 
        <select name="categories">
        <% 
               
             BloggerDao bloggerd = new BloggerDao();
            CategoryDao cd = new CategoryDao();
           BlogDao bd = new BlogDao();
           
           
           ArrayList<Category> clist = cd.getAllCategories();
           for(Category c : clist){%>
          <option> <%=c.getName()%></option>
       <%}%>
        </select>
        <br/><br/>
        <input type="hidden" name="id" value="" />
        Date : <input type="date" name="date">  <br/> <br/>
       Title : <input type="text" name="title"> <br/> <br/>
        Write Content :
        <br>
        <input type="textarea" style="width: 800px; height: 500px;" name="blog" />  <br/> <br/>
                                      
        
      <input type="submit" value="Submit" class="btn btn-primary lg" name="Submit"/>
    
   
  </form>

  </body>
</html>