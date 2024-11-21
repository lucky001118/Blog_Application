<%-- 
    Document   : load_posts
    Created on : 06-Jan-2024, 12:25:52 pm
    Author     : manik
--%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<!--this is load post page...-->

<div class="row">



    <%
        Thread.sleep(800);
        PostDao d = new PostDao(ConnectionProvider.getConnection());

        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllPosts();
        } else {

            posts = d.getPostByCatId(cid);
        }

        if (posts.size() == 0) {
            out.println("<h3 style='color:red;' class='display-3 text-center'>Sorry! no Posts in this category!</h3>");
            return;
        }
        for (Post p : posts) {

    %>

    <div class="col-md-6 mt-3">
        <div class="card">
            <img class="card-img-top" src="blog_pics/<%=p.getPpick()%>" alt="Card image cap">
            <div class="card-body">
                <b><%=p.getPtitle()%></b>
                <p><%=p.getPcontent()%></p>

            </div>
            <div class="card-footer text-center">
                <%
                    User user = (User) session.getAttribute("currentUser");
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                    int likes = ld.countLikeOnPost(p.getPid());
                %>
                <%
                    boolean ansOflike = ld.isLikedByUser(p.getPid(), user.getId());
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
                <a href="#!" onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-up up-thm" style="display: <%=upThm%>"></i> <i class="fa fa-thumbs-o-up dowm-thm" style="display: <%=downThm%>;" ></i> <span class="like-counter"><%=ld.countLikeOnPost(p.getPid())%></span></a>
                <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-comment"></i><span>19</span></a>
                <!--using the url rewriting to send the post id to the another page-->
                <a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-primary btn-sm">Read more</a>
            </div>
        </div>
    </div>
    <%
        }
    %>
    <script>

//        function doLike(pid, uid) {
//            console.log(pid + "," + uid);
//
//            const d = {
//                uid: uid,
//                pid: pid,
//                operation: 'like'
//            };
//
//            $.ajax({
//                url: "LikeServlet",
//                data: d,
//                success: function (data, textStatus, jqXHR) {
//                    console.log(data);
//                    if (data.trim() == 'true_insert') {
//                        let c = $(".like-counter").html();
//                        c++;
//                        $(".like-counter").html(c);
//                        
////                        $(".up-thm").show();
////                        $(".down-thm").hide();
//                    } else if (data.trim() == 'true_delete') {
//                        let c = $(".like-counter").html();
//                        c--;
//                        $(".like-counter").html(c);
//                        
////                        $(".up-thm").hide();
////                        $(".down-thm").show();
//                    }
//                },
//                error: function (jqXHR, textStatus, errorThrown) {
//                    console.log(data);
//                }
//            });
//        }


    </script>
</div>