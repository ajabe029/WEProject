<%@include file="common/header.jsp"%>
<%@include file="common/navbar.jsp"%>
<%@ page import="com.user.*" %>

<script type="text/javascript">
	document.title = "Recipes";
</script>

<div class="container-fluid">
	<h1 class="bg-primary text-center">My Recipes</h1>
	<c:choose>
		<c:when test="${recipes.isEmpty()}">
			<p> No recipes. </p>
		</c:when>
		<c:otherwise>
			<div class="panel-group" id="accordion">
				<c:forEach items="${recipes}" var="recipe" varStatus="loop">
	  				<div class="panel panel-info">
	    				<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" data-target="#collapse${loop.count}">
		      				<h2 class="panel-title">
		        				<a class="accordion-toggle">${loop.count}. ${recipe.name}</a>
		      				</h2>
	    				</div>
		    			<div id="collapse${loop.count}" class="panel-collapse collapse">
		      				<div class="panel-body">
		      					<div class="row">
			      					<div class="col-xs-2">
			      						<img class="media-object" src="http://www.placehold.it/150.png" alt="Placeholder">
			      					</div>
			      					<div class="col-xs-8">
			      					<div class="panel panel-success">
										<div class="panel-heading">Description:</div>
										<div class="panel-body">
										<c:if test="${empty recipe.description}">
			      							<%=messages.getString("noDescription")%>
			      						</c:if>
			      							${recipe.description}	
			      						</div>
			      					</div>		
			      					</div>
		      						<div class="col-xs-2"></div>
		      					</div>
		      					<br><br>
		      					<a href="recipe?recipe_id=${recipe.recipeID}">For full recipe click here...</a>
		      				</div>
		    			</div>
	  				</div>
	  			</c:forEach>
	  		</div>	
	  </c:otherwise>
	</c:choose>
	<div class="row col-xs-12 text-center">
		<a href="addrecipe.jsp" class="btn btn-info" role="button"><%=messages.getString("add")%> <%=messages.getString("new")%> <%=messages.getString("recipe")%></a>
		<a href="#" class="btn btn-info" role="button" disabled="disabled"><%=messages.getString("delete")%> <%=messages.getString("recipe")%></a>
	</div>
</div>
  
	
	<br>
<%@include file="common/footer.jsp"%>