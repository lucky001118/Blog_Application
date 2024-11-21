<%-- 
    Document   : normal_navbar
    Created on : 03-Jan-2024, 12:59:47 pm
    Author     : manik
--%>

<nav class="navbar navbar-expand-lg navbar-dark background-primery">
    <a class="navbar-brand" href="#"> <span class="fa fa-asterisk"></span> TechBlog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp"> <span class="	fa fa-bell"></span> Home <span class="sr-only">(current)</span></a>
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
                <a href="login_page.jsp" class="nav-link"> <span class="fa fa-user-circle"></span> Login</a>
            </li>
            <li class="nav-item">
                <a href="register_page.jsp" class="nav-link"> <span class="fa fa-user-plus"></span> Signup</a>
            </li>

        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>