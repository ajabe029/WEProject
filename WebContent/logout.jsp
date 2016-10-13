<% 
	session.setAttribute("loggedOn", false);
	session.setAttribute("username", null);
	session.setAttribute("logoutMessage", "You have logged out successfully");
	response.sendRedirect("index.jsp");
%>