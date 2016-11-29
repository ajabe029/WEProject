<%@include file="common/header.jsp"%>
<%@include file="common/navbar.jsp"%>
<%@ page import="com.user.*" %>

<div class="container-fluid">
	<div class="box">
		<div class="text-center">
			<h1 class="recipe-title">${recipeDetails[0].name}</h1>
			<p><strong><%=messages.getString("by")%>:</strong> <%out.print(username);%> - ${recipeDetails[0].datecreated}</p>
		</div>	

		<!-- carosel slide show -->
	
		<!-- prepare time, cook time -->
		<div class="text-right">
		 	<div class="time-info"><strong>Time to prepare: </strong> 20 Mins</div>
		 	<div class="time-info"><strong>Time to cook: </strong> 1 Hr</div>
	 	</div> 
	     
		<!-- description goes here -->
		<p>Pair this delicious dish with a risotto and a nice bottle of wine. This Italian favorite is easy to make and sure to impress your guests.</p>
		
		<h3>Ingredients</h3>
		<ul class="bullets">
			<c:forEach items="${recipeIngredients}" var="ingredients">
				<li>${ingredients.ingredientName} - ${ingredients.amountRequired} ${ingredients.units}</li>
			</c:forEach>
		</ul>
	
		<h3>Directions</h3>
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