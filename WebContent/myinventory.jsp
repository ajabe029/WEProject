<%@include file="common/header.jsp"%>
<%@include file="common/navbar.jsp"%>

<script type="text/javascript">
	document.title = "Inventory";
</script>



<div class="container-fluid">
	<div class="box">
	    <ol class="breadcrumb color-change-recipe">
  			<li class="breadcrumb-item"><a href="welcome.jsp"><%=messages.getString("welcomeTitle")%></a></li>
 			<li class="breadcrumb-item active"><%=messages.getString("myinventory")%></li>
		</ol>	
	<h1 class="text-center"><%=messages.getString("myinventory") %></h1>
	<br>
		<div class="row">
			<div class="col-xs-4">
				<div class="panel color-change">
				<h2 class="text-center"><%=messages.getString("myfood") %></h2>
				<c:choose>
						<c:when test="${inventory.isEmpty()}">
							<p> No items in inventory. </p>
						</c:when>
						<c:otherwise>
							<div class="panel-group" id="accordion">
								<c:forEach items="${inventory}" var="inventory" varStatus="loop">
					  				<div class="panel panel-default">
					    				<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" data-target="#collapse${loop.count}">
						      				<h2 class="panel-title">
						        				<a class="accordion-toggle">${loop.count}. ${inventory.ingredient}</a>
						      				</h2>
					    				</div>
						    			<div id="collapse${loop.count}" class="panel-collapse collapse">
						      				<div class="panel-body">
						      					<div class="row">
							      					<div class="col-xs-12">
							      						${inventory.quantity} ${inventory.units}
							      					</div>
						      					</div>
						      				</div>
						    			</div>
					  				</div>
					  			</c:forEach>
					  		</div>	
					  	</c:otherwise>
				</c:choose>
				<br>
	  							<div class="text-center">
									<a href="addfood.jsp" class="btn btn-info" role="button"><%=messages.getString("AddNewItem")%></a>
								</div>
								<br>
				</div>
			</div><!-- End of column -->
			<div class="col-xs-8">
				<div class="panel color-change">
				<h2 class="text-center"><%=messages.getString("myrecipes") %></h2>
				<c:choose>
						<c:when test="${matchedRecipes.isEmpty()}">
							<p> No suggestions. </p>
						</c:when>
						<c:otherwise>
							<div class="panel-group" id="accordion2">
								<c:forEach items="${matchedRecipes}" var="matchedRecipes" varStatus="loop">
					  				<div class="panel panel-default">
					    				<div class="panel-heading" data-toggle="collapse" data-parent="#accordion2" data-target="#collapsemr${loop.count}">
						      				<h2 class="panel-title">
						        				<a class="accordion-toggle">${loop.count}. ${matchedRecipes.name}</a>
						      				</h2>
					    				</div>
						    			<div id="collapsemr${loop.count}" class="panel-collapse collapse">
						      				<div class="panel-body">
						      					<div class="row">
							      					<div class="col-xs-12">
							      						${matchedRecipes.description}
							      						<br><br>
		      											<a href="recipe?recipe_id=${matchedRecipes.recipeID}">For full recipe click here...</a>
							      					</div>
						      					</div>
						      				</div>
						    			</div>
					  				</div>
					  			</c:forEach>
					  		</div>	
					  	</c:otherwise>
				</c:choose>	
				</div>
			</div>
		</div>
			<br>
	</div><!-- End of box -->		
</div>

<%@include file="common/footer.jsp"%>