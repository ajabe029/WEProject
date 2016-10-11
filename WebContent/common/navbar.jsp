<%
	String username = null;
	if(session.getAttribute("username") == null){
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
		dispatcher.forward(request,response);
	}
	else {
		username = session.getAttribute("username").toString();
	}
%>

<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="welcome.jsp">
                <img style="width: 64px;" src="img/anonymous_mask.ico" alt="Incredible Recipes">Incredible Recipes</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#">My Inventory</a>
                    </li>
                    <li>
                        <a href="#">My Saved Recipes</a>
                    </li>
                    <li class="dropdown">
          				<a class="dropdown-toggle" data-toggle="dropdown" href="#"> Welcome <% out.print(username); %> <span class="caret"></span></a>
          				<ul class="dropdown-menu" aria-labelledby="dropdownMenuDivider">
				            <li><a href="myaccount.jsp">My Account</a></li>
				            <li><a href="#">Logout</a></li>
				            <li role="separator" class="divider"></li>
				            <li><a href="#" onclick="changeLanguage('FR');">French</a></li>
          				</ul>
        			</li>
                 </ul>   
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>