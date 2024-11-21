<%-- 
    Document   : error_page
    Created on : 04-Jan-2024, 12:46:44 pm
    Author     : manik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage='true' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
        <!--my css files-->
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <!--bootstrap's css including-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--font ossum css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .bottom-design{
                clip-path: polygon(50% 0%, 83% 0, 100% 0, 100% 96%, 71% 93%, 45% 100%, 20% 96%, 0 100%, 0 0, 16% 0);
            }
            img{
                height: 400px;
                width: 400px;
            }
        </style>
    </head>
    <body>
        <div class="background-primery text-white bottom-design">
            
            <div class="container text-center background-primery text-white" style="padding-bottom: 50px;">
            <img src="img/computerError.png" alt="ComputerErrorImage" class="img-fluid"/>
            <h3 class="display-3">Sorry, something went wrong!</h3>
            <br>
            <%= exception %>
            <br>
            <a href="index.jsp" class="btn background-primery btn-lg text-white mt-3 btn-outline-light">Go to home</a>
        </div>
            
        </div>
        
    </body>
</html>
