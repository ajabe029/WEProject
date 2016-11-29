<%@include file="common/header.jsp"%>
<%@include file="common/navbar.jsp"%>

<div class="container-fluid">
<h1 class="text-center bg-primary"> <%=messages.getString("reportanissue") %></h1>
<hr />
	<div class="row">
		<div class="col-xs-5">
			<div class="panel color-change">
				<div class="panel-body">
					<% if(request.getAttribute("bugErrorMessage")!=null){ %>
						    <div class="alert alert-danger">
						    	<% out.println(request.getAttribute("bugErrorMessage"));%>
						    </div>
						    <% } else if(request.getAttribute("bugSuccessMessage") != null) { %>
						    <div class="alert alert-success">
						    	<% out.println(request.getAttribute("bugSuccessMessage"));%>
						    </div>
						    <% } %>
					<form action="report-issue" method="post">
						<div class="update-field">
							<label for="bugName"><%=messages.getString("name") %>: <span class="req">*</span></label>
							<input type="text" name="bugName" placeholder="<%=messages.getString("name") %>" required="required" autocomplete="off" />
						</div>
						<div class="update-field">
							<label for="bugCategory"> <%=messages.getString("category") %>: </label>
							<select style="display:block;" name="bugCategory">
								<option value="Account"> <%=messages.getString("accountloginissue") %> </option>
								<option value="Recipe"> <%=messages.getString("issueswithrecipe") %> </option>
								<option value="Food"> <%=messages.getString("issueswithfoodinventory") %> </option>
								<option value="Other"> <%=messages.getString("other") %> </option>
							</select>
						</div>
						<div class="update-field">
							<label for="bugDescription"><%=messages.getString("description") %>: <span class="req">*</span></label>
							<textarea id="bugDescription" style="margin-bottom: 10px;" cols="25" placeholder="<%=messages.getString("enteradescription") %>..." name="bugDescription" maxlength="250"></textarea>
						</div>
						<div class="col-xs-4">
							<button type="submit" class="button button-block" value="cancel"><%=messages.getString("submit") %></button>
						</div>
						<p id="characters" style="float: right;"><%=messages.getString("charactersleft") %>: 250 </p>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="common/footer.jsp"%>