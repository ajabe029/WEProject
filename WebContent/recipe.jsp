<%@include file="common/header.jsp"%>
<%@include file="common/navbar.jsp"%>
<%@ page import="com.user.*" %>

<div class="container-fluid">
<table class="table table-condensed" style="border-collapse:collapse;">
    <thead>
        <tr>
            <th>Recipe #</th>
            <th>Recipe Name</th>
            <th>Description</th>
            <th>Preparation Time</th>
            <th>Cooking Time</th>
            <th>Date Submitted</th>
            <th>Date Updated</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${recipeDetails}" var="recipe">
            <tr>
            	<td>${recipe.recipeID}</td>
            	<td>${recipe.name}</td>
            	<td>${recipe.description}</td>
            	<td>${recipe.preptime}</td>
            	<td>${recipe.cooktime}</td>
            	<td>${recipe.datecreated}</td>
            	<td>${recipe.dateupdated}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>    
</div>

<section class="container-fluid">

<div class="row">
	<div class="col-xs-6">
		<p>Prep. Time: <strong><c:out value="${recipeDetails[0].preptime}"/></strong></p>
		<p>Cook Time: <strong><c:out value="${recipeDetails[0].cooktime}"/></strong></p>
	</div>
</div>

<div class="row">
	<div class="col-xs-6">
		<ul class="bullets">
		<c:forEach items="${recipeIngredients}" var="ingredients">
			<li>${ingredients.ingredientName} ${ingredients.amountRequired} ${ingredients.units}</li>
		</c:forEach>
		</ul>
	</div>
</div>

<div class="row">
	<div class="col-xs-6">
	<c:forEach items="${recipeSteps}" var="steps" varStatus="loop">
		${loop.count}. ${steps.steptext} <br>
	</c:forEach>
	</div>
</div>
</section>

<%@include file="common/footer.jsp"%>