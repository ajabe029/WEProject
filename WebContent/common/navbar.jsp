<%
		String username = null;
		if(session.getAttribute("username") == null){
			response.sendRedirect("index.jsp");
		} else {
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
                        <a href="myinventory">My Inventory</a>
                    </li>
                    <li>
                        <a href="myrecipes">My Saved Recipes</a>
                    </li>
                    <li class="dropdown">
          				<a class="dropdown-toggle" data-toggle="dropdown" href="#"> Welcome <% out.print(username); %> <span class="caret"></span></a>
          				<ul class="dropdown-menu" aria-labelledby="dropdownMenuDivider">
				            <li><a href="myaccount.jsp">My Account</a></li>
				            <li><a href="reportbug.jsp">Report Bug</a></li>
				            <li><a href="logout.jsp">Logout</a></li>
				            <li role="separator" class="divider"></li>
				            <%if(session.getAttribute("language").toString().equals("EN")){ %>
				            <li><a href="changeLang.jsp">French</a></li>
				            <%}else{ %>
				            <li><a href="changeLang.jsp">English</a></li>
				            <%} %>
          				</ul>
        			</li>
                 </ul>   
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>