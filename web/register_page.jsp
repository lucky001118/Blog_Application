<%-- 
    Document   : register_page.jsp
    Created on : 03-Jan-2024, 8:41:40 pm
    Author     : manik
--%>

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
        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>

        <main class="background-primery p-5">
            <div class="container" style="padding-bottom: 50px;">
                <div class="col-md-6 offset-md-3">
                    <div class="card">

                        <div class="card-header text-center background-primery text-white">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br> 
                            Register here
                        </div>
                        <div class="card-body">

                            <form action="Register" method="POST" id="reg-form">

                                <div class="form-group">
                                    <label for="user_name">User name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="form-group">
                                    <label for="gender">Gender</label>
                                    <br>
                                    <input type="radio" id="gender"name="gender" value="Male"> Male
                                    <input type="radio" id="gender"name="gender" value="Female"> Female
                                </div>

                                <div class="form-group">
                                    <textarea class="form-control" name="about" id="" rows="5" placeholder="Enter something about you"></textarea>
                                </div>

                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree, terms and conditions</label>
                                </div>
                                <br>

                                <div class="container text-center" id="loader" style="display:none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please wait..</h4>
                                </div>

                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                            </form>

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
            crossorigin="anonymous">
        </script>
        <!--my java-script file-->
        <script src="js/myjs.js" type="text/javascript"></script>
        <!--sweet alret cdn librery for showing beautiful alerts-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
                $(document).ready(function () {
                    console.log("loded...........");
                    $('#reg-form').on('submit', function (event) {
                        //stop data to show the server page..
                        event.preventDefault();

                        let form = new FormData(this);
                        //send this form into register servlet

                        //showing the loder theam and hiding the button
                        $('#submit-btn').hide();
                        $('#loader').show();

                        $.ajax({
                            url: "Register",
                            type: 'POST',
                            data: form,
                            success: function (data, textStatus, jqXHR) {
                                console.log(data);
                                $('#submit-btn').show();
                                $('#loader').hide();

                                if (data.trim() === 'done') {
                                    swal("registration successfully.. we redirecting you to login page.")
                                            .then((value) => {
                                                window.location = "login_page.jsp";
                                            });
                                } else {
                                    swal(data);
                                    $('#submit-btn').show();
                                    $('#loader').hide();
                                }

                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log(jqXHR);
                                $('#submit-btn').show();
                                $('#loader').hide();
                                swal("something went wrong...try again!");
                            },
                            processData: false,
                            contentType: false
                        });
                    });
                });

        </script>
    </body>
</html>
