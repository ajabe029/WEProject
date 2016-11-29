	<%@page import="java.util.ResourceBundle"%>
	<%@page import="java.util.Locale"%>
  	
  	<%
  	Locale currentLocale;
  	ResourceBundle messages;
  	if(session!= null && session.getAttribute("language") != null){
  		String language = session.getAttribute("language").toString();
		String country = "CA";
		currentLocale = new Locale(language, country);
		messages = ResourceBundle.getBundle("MessagesBundle", currentLocale);
  	} else {
  		session.setAttribute("language", "EN");
  		currentLocale = new Locale("EN", "CA");
		messages = ResourceBundle.getBundle("MessagesBundle", currentLocale);
  	}

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
                        <a href="myinventory"><%=messages.getString("myinventory") %></a>
                    </li>
                    <li>
                        <a href="myrecipes"><%=messages.getString("mysavedrecipes") %></a>
                    </li>
                    <li class="dropdown">
          				<a class="dropdown-toggle" data-toggle="dropdown" href="#"> <%=messages.getString("welcome") %> <% out.print(username); %> <span class="caret"></span></a>
          				<ul class="dropdown-menu" aria-labelledby="dropdownMenuDivider">
				            <li><a href="myaccount.jsp"><%=messages.getString("myaccount") %></a></li>
				            <li><a href="reportbug.jsp"><%=messages.getString("reportbug") %></a></li>
				            <li><a href="logout.jsp"><%=messages.getString("logout") %></a></li>
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