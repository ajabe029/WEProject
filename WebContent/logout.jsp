<% 
	session.setAttribute("loggedOn", false);
	session.setAttribute("username", null);
	session.setAttribute("user_id", null);
	session.setAttribute("logoutMessage", "You have logged out successfully");
	session = null;
	response.sendRedirect("index.jsp");
%>