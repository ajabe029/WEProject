<%@include file="common/header.jsp"%>
<%@include file="common/navbar.jsp"%>
<%@ page import="com.user.*" %>

<script type="text/javascript">
	document.title = "Recipes";
</script>

<div class="container-fluid">
<h1 class="bg-primary text-center">Recipes</h1>
	<div class="row">
		<div class="col-xs-12">
			<div class="panel color-change">
				<div class="panel-body">
					<p> No recipes. </p>
				</div>
				<a href="addrecipe.jsp"> Add Recipe </a>
				<br>
			</div>
		</div>
	</div>
</div>

<form method="post" action="">
<div class="container">
<table class="table table-condensed" style="border-collapse:collapse;">
    <thead>
        <tr>
            <th>Recipe #</th>
            <th>Recipe Name</th>
            <th>Description</th>
            <th>Preparation Time</th>
            <th>Cooking Time</th>
            <th>Instructions</th>
            <th>Date Submitted</th>
            <th>Date Updated</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${recipes}" var="recipe">
            <tr>
            	<td>${recipe.recipeID}</td>
            	<td>${recipe.name}</td>
            	<td>${recipe.description}</td>
            	<td>${recipe.preptime}</td>
            	<td>${recipe.cooktime}</td>
            	<td>${recipe.instructions}</td>
            	<td>${recipe.datecreated}</td>
            	<td>${recipe.dateupdated}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>    
</div>
</form>