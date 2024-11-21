<%-- 
    Document   : index
    Created on : 03-Jan-2024, 12:04:24 pm
    Author     : manik
--%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <!--my css files-->
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <!--bootstrap's css including-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--font ossum css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                /*clip-path: circle(70.4% at 51% 2%);*/
                clip-path: polygon(50% 0%, 83% 0, 100% 0, 100% 96%, 71% 93%, 45% 100%, 20% 96%, 0 100%, 0 0, 16% 0);
            }
        </style>
    </head>
    <body>
        <!--navbar including this in another page normal_navbar.jsp-->
        <%@include file="normal_navbar.jsp" %>

        <!--banner-->
        <div class="container-fluid p-0 m-0 banner-background" >

            <div class="jumbotron background-primery text-white">
                <div class="container">
                    <h3 class="display-3">Welcome to TechBlog</h3>
                    <p>A programming language is a system of notation for writing computer programs.</p>

                    <p>
                        The source code for a simple computer program written in the C programming language. The gray lines are comments that help explain the program to humans in a natural language. When compiled and run, it will give the output "Hello, world!".
                        A programming language is usually described in terms of its syntax (form) and semantics (meaning). These are usually defined by a formal language.
                    </p> 

                    <p>
                        A language usually has at least one implementation in the form of a compiler or interpreter, allowing programs written in the language to be executed.
                    </P> 
                    <p>
                        Programming language theory is the subfield of computer science that studies the design, implementation, analysis, characterization, and classification of programming languages.
                    </p>

                    <a href="register_page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-plus"></span> Start! it's free</a>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle fa-spin"></span> Login</a>
                </div>
            </div>
        </div>

        <!--cards-->
        <div class="container">
            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn background-primery text-white">Read more</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Rust Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn background-primery text-white">Read more</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">C++ Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn background-primery text-white">Read more</a>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">C Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn background-primery text-white">Read more</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">JavaScript Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn background-primery text-white">Read more</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Python Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn background-primery text-white">Read more</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!--bootstrap java-script including-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <!--j-query's java-script's library including-->
        <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
        <!--my java-script file-->
        <script src="js/myjs.js" type="text/javascript"></script>

        <script>

        </script>
    </body>
</html>
