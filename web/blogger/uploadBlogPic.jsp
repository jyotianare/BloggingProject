<%-- 
    Document   : uploadBlogPic
    Created on : 9 May, 2021, 12:07:48 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="TemplateMo">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">

    <title>upload blog pic</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-stand-blog.css">
    <link rel="stylesheet" href="assets/css/owl.css">
<!--

TemplateMo 551 Stand Blog

https://templatemo.com/tm-551-stand-blog

-->
  </head>

  <body>

    <!-- Header -->
    
    <!-- Page Content -->
    <!-- Banner Starts Here -->
    <div class="main-banner header-text">
      <div class="container-fluid">
        <div class="owl-banner owl-carousel">
         
         </div>
      </div>
    </div>
    <!-- Banner Ends Here -->
  <section class="blog-posts">
      <script type="text/javascript">

            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        preview.src = e.target.result;
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }

        </script>
         <!--<input type="button" value="close window" onclick="window.close();"/> -->
     
        <jsp:useBean id="blog" class="com.beans.Blog" scope="session"></jsp:useBean>
        <jsp:setProperty name="blog" property="*"></jsp:setProperty>
     
         <% 
            String categories[] = request.getParameterValues("category");
            session.setAttribute("categories", categories);
        %>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <center> 
                        <form action="../BlogController?op=add" method="post" class="form_container" onsubmit="return validateForm()" enctype="multipart/form-data"> 
                            <table class ="table">

                                <tr>
                                    <th>
                                        <img src=""  id="preview" class="rounded" style="width: 200px;height: 200px"/>
                                        <br/> <br/>
                                        <input type="button" value="Upload your Pic" class="btn btn-primary" onclick="pic.click();"/><br/>
                                        <input type="file" name="pic" id="pic" onchange="readURL(this)" required="required" style="display: none;"/>
                                
                                    </th>
                                </tr>

                                <tr>
                                    <td><input type="submit" class="btn btn-primary form-control" value="Next" name="submit"/></td>
                                </tr>
                            </table>

                    </center>
                </div> 

                </form> 
            </div>
        </div>

      
        
    </section>

   
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Additional Scripts -->
    <script src="assets/js/custom.js"></script>
    <script src="assets/js/owl.js"></script>
    <script src="assets/js/slick.js"></script>
    <script src="assets/js/isotope.js"></script>
    <script src="assets/js/accordions.js"></script>

    <script language = "text/Javascript"> 
      cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
      function clearField(t){                   //declaring the array outside of the
      if(! cleared[t.id]){                      // function makes it static and global
          cleared[t.id] = 1;  // you could use true and false, but that's more typing
          t.value='';         // with more chance of typos
          t.style.color='#fff';
          }
      }
    </script>

  </body>
</html>
