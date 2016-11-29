<%@include file="common/header.jsp"%>
<%@include file="common/navbar.jsp"%>
<%@include file="common/database.jsp"%>

    <% 
        PreparedStatement prepstmt = connection.prepareStatement("SELECT * FROM Users WHERE username=?");
		prepstmt.setString(1, username);
	
		ResultSet result = prepstmt.executeQuery();
	
		String firstname = null; 
		String lastname = null;
		String email = null;
		String datecreated = null;
     %>

    <!-- Page Content -->
    <div class="container">
    <h1 class="bg-primary"><%=messages.getString("myaccount") %></h1>
        <div class="row">
        	<div class="col-xs-5">
				<p>(<a id="editButton" href="#"><%=messages.getString("edit") %></a>)</p>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col-xs-5">	
            
            <%while(result.next()){ %>
            <div id="info">
	            <p class="lead"><%=messages.getString("accountinformation") %></p>
	            <p><strong><%=messages.getString("firstname") %>:</strong></p>
	            <p><%= firstname = result.getString("firstname") %></p>
	            <p><strong><%=messages.getString("lastname") %>:</strong></p>
	            <p><%= lastname = result.getString("lastname") %></p>
	            <p><strong>Email:</strong></p>
	            <p><%= email = result.getString("email") %></p>
	            <p><strong><%=messages.getString("username") %>:</strong></p>
	            <p><%= result.getString("username") %></p>
	            <p><strong><%=messages.getString("membersince") %>:</strong></p>
	            <p><%= datecreated = result.getString("datecreated") %></p>
        	</div>
       		<%} %>
        <div id="edit" style="display:none">
		        	<form action="updateServlet" method="post">
			            <p class="lead"><%=messages.getString("accountupdate") %></p>
			            <p><a href="changepassword.jsp"><%=messages.getString("changepassword") %></a>
			            <div class="update-field">
			            	<p><span class="req">*</span><strong><%=messages.getString("firstname") %>: </strong></p>
							<input onClick="this.select();" type="text" name="updateFirstname" value="<%= firstname %>" required="required" autocomplete="off" />
						</div>
						<div class="update-field">
							<p style="margin-top:20px;"><strong><span class="req">*</span><%=messages.getString("lastname") %>: </strong></p>
							<input onClick="this.select();" type="text" name="updateLastname" value="<%= lastname %>" required="required" autocomplete="off" />
						</div>
						<div class="update-field">
							<p style="margin-top:20px;"><strong><span class="req">*</span>Email: </strong></p>
							<input onClick="this.select();" type="email" name="updateEmail" value="<%= email %>" required="required" autocomplete="off">
						</div>
						<div class="update-field">
							<p style="margin-top:20px;"><strong><span class="req">*</span><%=messages.getString("username") %>:</strong></p>
							<input onClick="this.select();" type="text" name="updateUsername" value="<%= username %>" required="required" autocomplete="off" />
			         	</div>
			         	<div class="updatebuttons">
			         		<button type="button" id="updateCancelButton" class="button button-block" value="cancel">Cancel</button>
			         		<button type="submit" class="button button-block" value="cancel"><%=messages.getString("submit") %></button>
			         	</div>
			         </form>
			         </div>
		     </div>
        </div>
    </div>

<%@include file="common/footer.jsp"%>