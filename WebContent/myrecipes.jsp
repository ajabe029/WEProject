<%@include file="common/header.jsp"%>
<%@include file="common/navbar.jsp"%>
<%@ page import="com.user.*" %>

<script type="text/javascript">
	document.title = "Recipes";
</script>

<div class="container-fluid">
<h1 class="bg-primary text-center">My Recipes</h1>
	<div class="row">
		<div class="col-xs-12">
			<div class="panel color-change">
				<div class="panel-body">
				    <c:choose>
				        <c:when test="${recipes.isEmpty()}">
							<p> No recipes. </p>
				        </c:when>
				        <c:otherwise>
				            <table class="table table-condensed" style="border-collapse:collapse;">
				            	<thead>
				            		<tr>
				            			<th>Recipe #</th>
				            			<th>Recipe Name</th>
				            			<th>Description</th>
				            		</tr>
				            	</thead>
				            	<tbody>
	            	        	<c:forEach items="${recipes}" var="recipe">
				            		<tr>
				            			<td><a href="recipe?recipe_id=${recipe.recipeID}">${recipe.recipeID}</a></td>
				            			<td>${recipe.name}</td>
				            			<td>${recipe.description}</td>
				            		</tr>
				            	</c:forEach>		
				            	</tbody>
				            </table>	
				        </c:otherwise>
				    </c:choose>
				</div>
				<a href="addrecipe.jsp"> Add Recipe </a>
				<br>
			</div>
		</div>
	</div>
</div>
<%@include file="common/footer.jsp"%>