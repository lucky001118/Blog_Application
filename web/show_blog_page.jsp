<%-- 
    Document   : show_blog_page
    Created on : 06-Jan-2024, 7:26:44 pm
    Author     : manik
--%>

<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<!--validating the user if user is login then it will show else goto the login page and do loginn-->
<%

    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }

%>

<%    int postId = Integer.parseInt(request.getParameter("post_id"));

    PostDao dao = new PostDao(ConnectionProvider.getConnection());
    Post post = dao.getPostByPostId(postId);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=post.getPtitle()%></title>
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
            .rounded-image {
                width: 150px; /* adjust to your image width */
                height: 150px; /* adjust to your image height */
                border-radius: 50%;
                background-size: cover; /* scale the image to fit the element */
            }
            
            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 22px;
            }
            
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info{
                font-size: 17px;
                font-weight: 200;
            }
        </style>
    </head>
    <body>
        <!--start of navbar-->

        <nav class="navbar navbar-expand-lg navbar-dark background-primery">
            <a class="navbar-brand" href="#"> <span class="fa fa-asterisk"></span> TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp"> <span class="	fa fa-bell"></span> Goto Profile <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#"> <span class="fa fa-address-book"></span> Contect</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-model"> <span class="fa fa-pencil-square"></span> Do Post</a>
                    </li>

                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a href="#!" data-toggle="modal" data-target="#Profile-Modal" class="nav-link"> <span class="fa fa-user-circle"></span> <%= user.getName()%></a>
                    </li>

                    <li class="nav-item">
                        <a href="Logout" class="nav-link"> <span class="fa fa-share-square-o"></span> Logout</a>
                    </li>
                </ul>

            </div>
        </nav>

        <!--end of navbar-->

        <!--start of profile model-->
        <!-- Modal -->
        <div class="modal fade" id="Profile-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header background-primery text-white text-center">
                        <h3 class="modal-title" id="exampleModalLabel">TechBlog</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <% String imagName = (String) user.getProfile();%>
                            <img src="picks/<%=imagName%>" class="img-fluid rounded-image" >
                            <h3 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h3>

                            <!--details-->
                            <div id="profile-details"> 

                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID </th>
                                            <td><%=user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email </th>
                                            <td><%=user.getEmail()%></td>                                        
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender </th>
                                            <td><%=user.getGender()%></td>                                       
                                        </tr>
                                        <tr>
                                            <th scope="row">Status </th>
                                            <td><%=user.getAbout()%></td>                                        
                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on </th>
                                            <td><%=user.getDateTime().toString()%></td>                                        
                                        </tr>
                                    </tbody>
                                </table>

                            </div>   

                            <!--profile edit-->
                            <div id="profile-edit" style="display: none;">
                                <h5 class="mt-2 text-danger">Please edit carefully</h5>
                                <form action="EditServlet" method="POST" enctype="multipart/form-data">  
                                    <!--the attribute "multipart/form-data" tells the form has containing the multivalue data-->
                                    <table class="table">
                                        <tr>
                                            <th>ID </th>
                                            <td><%=user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <th>Email </th>
                                            <td><input type="email" name="user_email" value="<%=user.getEmail()%>" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <th>Name </th>
                                            <td><input type="text" name="user_name" value="<%=user.getName()%>" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <th>Password </th>
                                            <td><input type="password" name="user_password" value="<%=user.getPassword()%>" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <th>Gender </th>
                                            <td><%=user.getGender().toUpperCase()%></td>
                                        </tr>
                                        <tr>
                                            <th>About </th>
                                            <td>
                                                <textarea class="form-control" rows="4" name="user_about"><%=user.getAbout()%>
                                                </textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Update Profile </th>
                                            <td>
                                                <input type="file" name="user_profile_pick" class="form-control">
                                            </td>
                                        </tr>

                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end of profile model-->


        <!--post model start-->

        <!-- Modal -->
        <div class="modal fade" id="add-post-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="add-post-form" action="AddPostServlet" method='POST' > 
                            <div class="form-group"> 
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>

                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();

                                        for (Category c : list) {
                                    %>
                                    <option value="<%=c.getCid()%>"><%=c.getName()%></option>
                                    <%
                                        } //ending of for loop
                                    %>
                                </select>
                            </div>
                            <div class="form-group"> 
                                <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control"/>
                            </div>
                            <div class="form-group"> 
                                <textarea name="pContent" class="form-control" placeholder="Enter Your Content" style="height: 150px;"></textarea>
                            </div>
                            <div class="form-group"> 
                                <textarea name="pCode" class="form-control" placeholder="Enter Your Code (if any)" style="height: 150px;"></textarea>
                            </div>
                            <div class="form-group">
                                <label>select your picture</label> <br>
                                <input type="file" name="pic"/>
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>

                        </form>

                    </div>

                </div>
            </div>
        </div>

        <!--end of post model--> 

        <!--main content of the body start-->

        <div class="container">
            <div class="row my-4">

                <div class="col-md-8 offset-md-2">

                    <div class="card">

                        <div class="card-header text-center">
                            <h4 class="post-title"><%=post.getPtitle()%></h4>
                        </div>
                        <div class="card-body">
                            <img class="card-img-top my-2" src="blog_pics/<%=post.getPpick()%>" alt="Card image cap"> 
                           
                            <div class="row my-3">
                                <div class='col-md-8'>
                                    
                                    <%
                                    UserDao userDao = new UserDao(ConnectionProvider.getConnection());
                                    User userDe = userDao.getUserByUserId(post.getUserId());
                                    %>
                                    
                                    <p class="post-user-info"><a href="#!"><%=userDe.getName()%></a> has posted</p>
                                </div>
                                <div class='col-md-4'>
                                    <%
                                    DateFormat DFormat = DateFormat.getDateTimeInstance();
                                    String strDate = DFormat.format(post.getPdate());
                                    //DateFormat.getDateTimeInstance().format(post.getPdate())
                                    %>
                                    <p class="post-date"><%=strDate%></p>
                                </div>
                            </div>
                            
                            <p class="post-content"><%=post.getPcontent()%></p>
                            <br> 
                            <br>
                            <div class="post-code">
                            <code><%=post.getPcode()%></code>
                            </div>
                        </div>
                        <div class="card-footer">
                            
                            <%
                            LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                            %>
                            <%
                    boolean ansOflike = ld.isLikedByUser(post.getPid(), user.getId());
                    String upThm = "";
                    String downThm = "";
                    if(ansOflike==true){
                    upThm = "line";
                    downThm = "none";
                    }else{
                    upThm = "none";
                    downThm = "line";
                    }
                %>
                            
                            <a href="#!" onclick="doLike(<%=post.getPid()%>,<%=user.getId()%>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-up up-thm" style="display: <%=upThm%>"></i> <i class="fa fa-thumbs-o-up dowm-thm" style="display: <%=downThm%>"></i><span class="like-counter"><%=ld.countLikeOnPost(post.getPid())%></span></a>
                            <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-comment"></i><span>19</span></a>

                        </div>
                    </div>

                </div>

            </div>

        </div>

        <!--end main content of the body-->

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
        <!--sweet alert javascript file-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>


        <script>
            $(document).ready(function () {
                let editStatus = false;

                $("#edit-profile-button").click(function () {

                    if (editStatus == false) {
                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        editStatus = true;
                        //changing the button name to back button after chicking the edit button
                        $(this).text("Back");
                    } else {
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        editStatus = false;
                        //if button is back and clicked it then changing button name into Edit
                        $(this).text("Edit");
                    }

                });
            });

        </script>

        <!--now add post javascript-->
        <script>

            $(document).ready(function (e) {
                console.log("loded.....");

                $("#add-post-form").on('submit', function (event) {

                    //this code gets call when form is submited
                    event.preventDefault();

                    console.log("you have submited the post");
                    let form = new FormData(this);

                    console.log(form);
                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success

                            if (data.trim() == 'done') {
                                swal("Good job!", "Saved success fully!", "success");
                            } else {
                                swal("Error!", "Something went wrong try again.", "error");
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error
                            swal("Error!", "Something went wrong try again.", "error");
                        },
                        processData: false,
                        contentType: false
                    });

                });

            });

        </script>


    </body>
</html>
