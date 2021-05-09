<%-- 
    Document   : changeStatusOfBlog
    Created on : 9 May, 2021, 2:45:59 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% 
 
  int id =Integer.parseInt( request.getParameter("id"));
    %>
<h2>Change Status</h2>

      

<div class="container">
  
  <form  action="../BlogController?op=action"  method="post" >
    <div class="container">
        <input type="hidden" value="<%= id %>" name="id">
        
         <input type="radio" name="status" value="approve" id="approve"/> Approve <br/>
         <input type="radio" name="status" value="denied" id="denied"/> Deny <br/>
         <input type="radio" name="status" value="pending" id="pending"/> Pending <br/>
                                      
        
      <button type="submit">Submit</button>
     </div>

   
  </form>
</div>

    </body>
</html>
