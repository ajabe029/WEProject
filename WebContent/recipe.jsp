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
            <th>Instructions</th>
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
            	<td>${recipe.instructions}</td>
            	<td>${recipe.datecreated}</td>
            	<td>${recipe.dateupdated}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>    
</div>

<%@include file="common/footer.jsp"%>