<%@include file="common/header.jsp"%>
<%@include file="common/navbar.jsp"%>
<%@ page import="com.user.*" %>
<%@ page import="java.util.*" %>

<%
RecipesDAO recipesDao = new RecipesDAO();
InventoryDAO inventoryDao = new InventoryDAO();
List<Inventory> inventoryList = new ArrayList<Inventory>();
List<Recipes> recipeList = new ArrayList<Recipes>();
if(session.getAttribute("user_id")!=null){
	int userId = (int)session.getAttribute("user_id");
	recipeList = recipesDao.getRecipes(userId);
	inventoryList = inventoryDao.getUserInventory(userId);
} else {
	recipeList = recipesDao.getRecipes(0);
}

%>

<script type="text/javascript">
	document.title = "Welcome Page";
</script>

   <!-- Page Content -->
      
<div class="container-fluid">
    <div class="box">
	    <h1 class="text-center"><%=messages.getString("welcome")%> <%out.print(username);%>!</h1>
	    <br>
	   	<div class="row">
	  		<div class="col-xs-12">
	     		<div class="panel color-change">
	           	<h2 class="panel-heading"><%=messages.getString("mysavedrecipes")%></h2>
	            	<div class="panel-body">
	               	<%if (recipeList.isEmpty()){ %>
	               		<p> no recipes </p>
	               	<%}else{ %>
						<div class="panel-group" id="accordion">
							<% for(int i = 0; i < recipeList.size(); i++){%>
					  			<div class="panel panel-default">
					    			<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" data-target="#collapse<%=i%>">
						      		<h2 class="panel-title">
						        		<a class="accordion-toggle"><%=i+1 %>. <%=recipeList.get(i).getName()%></a>
						      		</h2>
					    			</div>
						    		<div id="collapse<%=i%>" class="panel-collapse collapse">
							      		<div class="panel-body">
							      			<div class="row">
								      			<div class="col-xs-3">
								      				<img class="media-object" src="http://www.placehold.it/150.png" alt="Placeholder" class="img-responsive">
								      			</div>
								      			<div class="col-xs-9">
								      				<div class="panel panel-info">
														<div class="panel-heading">Description:</div>
															<div class="panel-body">
																<%if(recipeList.get(i).getDescription().isEmpty()){ %>
								      								<%=messages.getString("noDescription")%>
								      							<%}else{ %>
								      								<%=recipeList.get(i).getDescription()%>
								      							<%} %>	
								      						</div>
								      				</div>		
								      			</div>
							      			</div>
							      			<br><br>
							      			<a href="recipe?recipe_id=<%=recipeList.get(i).getRecipeID()%>"><%=messages.getString("FullRecipe") %></a>
							      		</div>
						    		</div>
					  			</div>
					  			<%}} %>	
					  	</div><!-- End of Panel -->	
	                  	<div class="text-center">
							<a href="myrecipes" class="btn btn-info" role="button"><%=messages.getString("add")%> <%=messages.getString("recipes")%></a>
	                  	</div>
	                  	<br>
	           		</div><!-- end of body -->
	     		</div>
	     	</div>
	     </div><!-- End of Row -->
	     <div class="row">
	     	<div class="col-xs-12">
				<div class="panel color-change">
	            <h2 class="panel-heading"><%=messages.getString("myinventory")%></h2>
	            <div class="panel-body">
      	        <%if (inventoryList.isEmpty()){ %>
	            	<p> no items in inventory </p>
	            <%}else{ %>
	            <div class="panel-group" id="invaccordion">
					<%for(int i=0; i < inventoryList.size(); i++){ %>
		  				<div class="panel panel-default">
		    				<div class="panel-heading" data-toggle="collapse" data-parent="#invaccordion" data-target="#invcollapse<%=i%>">
			      				<h2 class="panel-title">
			        				<a class="accordion-toggle"><%=i+1%>. <%=inventoryList.get(i).getIngredient()%></a>
			      				</h2>
		    				</div>
			    			<div id="invcollapse<%=i%>" class="panel-collapse collapse">
			      				<div class="panel-body">
			      					<div class="row">
				      					<div class="col-xs-12">
				      						<%=inventoryList.get(i).getQuantity()%> <%=inventoryList.get(i).getUnits()%>
				      					</div>
			      					</div>
			      				</div>
			    			</div>
		  				</div>
		  			<%}} %>	
		  		</div>
				</div><!-- end of body -->
	                <div class="text-center">
	                	<a href="myinventory" class="btn btn-info" role="button"><%=messages.getString("manage")%> <%=messages.getString("inventory")%></a>
	                </div>
	                <br>
	            </div>
	      	</div>
	    </div>
    </div><!-- End of box -->
</div><!-- End of container --> 
<%@include file="common/footer.jsp"%>
