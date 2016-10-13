<%@include file="common/header.jsp"%>
<%@include file="common/navbar.jsp"%>

<h1 class="text-center"> Report an Issue</h1>
<hr />
<div class="container-fluid">
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
							<label for="bugName">Name: <span class="req">*</span></label>
							<input type="text" name="bugName" placeholder="Name" required="required" autocomplete="off" />
						</div>
						<div class="update-field">
							<label for="bugCategory"> Category: </label>
							<select style="display:block;" name="bugCategory">
								<option value="Account"> Account/Login Issue </option>
								<option value="Recipe"> Issue with Recipes </option>
								<option value="Food"> Issue with Food Inventory </option>
								<option value="Other"> Other </option>
							</select>
						</div>
						<div class="update-field">
							<label for="bugDescription">Description: <span class="req">*</span></label>
							<textarea id="bugDescription" style="margin-bottom: 10px;" cols="25" placeholder="Enter a description..." name="bugDescription" maxlength="250"></textarea>
						</div>
						<div class="col-xs-4">
							<button type="submit" class="button button-block" value="cancel">Submit</button>
						</div>
						<p id="characters" style="float: right;">Characters Left: 250 </p>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="common/footer.jsp"%>