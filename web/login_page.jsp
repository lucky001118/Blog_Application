<%-- 
    Document   : newjsp
    Created on : 03-Jan-2024, 5:35:38 pm
    Author     : manik
--%>

<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--my css files-->
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <!--bootstrap's css including-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--font ossum css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            main{
                /*clip-path: circle(70.4% at 51% 2%);*/
                clip-path: polygon(50% 0%, 83% 0, 100% 0, 100% 96%, 71% 93%, 45% 100%, 20% 96%, 0 100%, 0 0, 16% 0);
            }
        </style>
    </head>
    <body>
        <!--navbar content which is on the normal_navbar.jsp page-->
        <%@include file="normal_navbar.jsp" %>

        <main class="d-flex align-items-center background-primery" style="height: 80vh">
            <div class="container" style="padding-bottom: 8px;">
                <div class="row">
                    <div class="col-md-4 offset-md-4">

                        <div class="card">
                            <div class="card-header background-primery text-white text-center">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <br>
                                <p>Login here</p> 
                            </div>
                            <%
                                Message m = (Message) session.getAttribute("msg");

                                if (m != null) {
                            %>
                            <div class="alert <%=m.getCssClass()%>" role="alert">
                                <%= m.getType()%>: <a href="#" class="alert-link"><%= m.getContent()%></a>. 
                            </div>
                            <%
                                session.removeAttribute("msg");
                                }
                            %>


                            <div class="card-body">
                                <form action="Login" method="POST">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="user_email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="user_password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>

                                    <div class="container text-center"> 
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>

                                </form>
                            </div>
                        </div>

                    </div>
                </div>
        </main>

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
