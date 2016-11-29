<%@include file="common/header.jsp"%>
<%@include file="common/navbar.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-xs-4">
			<div class="panel">
				<div class="panel-heading">
					<h2><%=messages.getString("changepassword") %></h2>
				</div>
				<div class="panel-body">
					<% if(request.getAttribute("errorMessage")!=null){ %>
						    <div class="alert alert-danger">
						    	<% out.println(request.getAttribute("errorMessage"));%>
						    </div>
						    <% } %>
					<form action="changepassword" onsubmit="return confirmPassword()" method="post">
						<div class="update-field">
							<label for="currentPassword"><%=messages.getString("currentpassword") %>:<span class="req">*</span></label>
							<input type="password" name="currentPassword" required="required" autocomplete="off"/>
						</div>
						<div class="update-field">
							<label for="newPassword"><%=messages.getString("newpassword") %>:<span class="req">*</span></label>
							<input id="passwordField" type="password" name="newPassword" required="required" autocomplete="off"/>
						</div>
						<div class="update-field" style="margin-bottom: 20px">
							<label for="confirmNewPassword"><%=messages.getString("confirmnewpassword") %>:<span class="req">*</span></label>
							<input id="confirmPasswordField" type="password" name="confirmNewPassword" required="required" autocomplete="off"/>
						</div>
						<button type="submit" value="Submit"><%=messages.getString("changepassword") %></button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="common/footer.jsp"%>