<%@include file="common/header.jsp"%>
<%@include file="common/navbar.jsp"%>
<%@ page import="com.user.*" %>

<div class="container-fluid">
<% 
System.out.println(request.getHeader("Referer")); %>
	<div class="box">
	    <ol class="breadcrumb color-change-recipe">
  			<li class="breadcrumb-item"><a href="welcome.jsp"><%=messages.getString("welcomeTitle")%></a></li>
  			<%if(!request.getHeader("Referer").equals("http://localhost:8080/WebEnterpriseProject/welcome.jsp")){ %>
  			<%if(request.getHeader("Referer").equals("http://localhost:8080/WebEnterpriseProject/myinventory")){ %>
 			<li class="breadcrumb-item"><a href="myinventory"><%=messages.getString("myinventory") %></a></li>
 			<%}else{ %>
 			<li class="breadcrumb-item"><a href="myrecipes"><%=messages.getString("mysavedrecipes") %></a></li>
 			<%}} %>
 			<li class="breadcrumb-item active"><%=messages.getString("recipe")%>: ${recipeDetails[0].name}</li>
		</ol>
		<div class="text-center">
			<h1 class="recipe-title">${recipeDetails[0].name}</h1>
			<p><strong><%=messages.getString("by")%>:</strong> <%out.print(username);%> - ${recipeDetails[0].datecreated}</p>
			<p><strong><%=messages.getString("timeprep")%>:</strong>${recipeDetails[0].preptime} - <strong><%=messages.getString("timecook")%>:</strong>${recipeDetails[0].cooktime}</p>
		</div>	

		<!-- carosel slide show -->
	     
		<!-- description goes here -->
		<h3><%=messages.getString("description") %></h3>
		<div class="row">
			<div class="col-xs-8">
				<p style="margin-left: 25px;">${recipeDetails[0].description}</p>
			</div>
		</div>
		
		<h3><%=messages.getString("ingredients") %></h3>
		<ul class="bullets">
			<c:forEach items="${recipeIngredients}" var="ingredients">
				<li>${ingredients.ingredientName} - ${ingredients.amountRequired} ${ingredients.units}</li>
			</c:forEach>
		</ul>
	
		<h3><%=messages.getString("directions") %></h3>
		<br>
		<ol class="direction">
			<c:forEach items="${recipeSteps}" var="steps" varStatus="loop">
				<li>
				${steps.steptext}
				</li>
			</c:forEach>
		</ol>
	</div>
</div><!-- /.container -->

<%@include file="common/footer.jsp"%>