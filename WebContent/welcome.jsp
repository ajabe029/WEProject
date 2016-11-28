<%@include file="common/header.jsp"%>
<%@include file="common/navbar.jsp"%>
<%@ page import="com.user.*" %>
<%@ page import="java.util.*" %>

<%
RecipesDAO recipesDao = new RecipesDAO();
List<Recipes> recipeList = new ArrayList<Recipes>();
int userId = (int)session.getAttribute("user_id");
recipeList = recipesDao.getRecipes(userId);
%>

<script type="text/javascript">
	document.title = "Welcome Page";
</script>

   <!-- Page Content -->
      
    <div class="container-fluid">
    <h1 class="bg-primary text-center"><%=messages.getString("welcome")%></h1>
      	<div class="row">
   			<div class="col-xs-4">
            	<div class="panel color-change">
                <h2 class="panel-heading"><%=messages.getString("friends")%></h2>
                   <div class="panel-body">
                       <p> content </p>
                   </div>
                   <button class="btn btn-primary center-block"><%=messages.getString("add")%> <%=messages.getString("friends")%></button>
                   <br>
               </div>
          	</div>
          	<div class="col-xs-8">
          	<div class="row">
      		<div class="col-xs-12">
      			<div class="panel color-change">
                   <h2 class="panel-heading"><%=messages.getString("recipes")%></h2>
                   <div class="panel-body">
                	<%if (recipeList.isEmpty()){ %>
                		<p> no recipes </p>
                	<%}else{ %>
							<div class="panel-group" id="accordion">
								<% for(int i = 0; i < recipeList.size(); i++){%>
					  				<div class="panel panel-info">
					    				<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" data-target="#collapse<%=i%>">
						      				<h2 class="panel-title">
						        				<a class="accordion-toggle"><%=i %>. <%=recipeList.get(i).getName()%></a>
						      				</h2>
					    				</div>
						    			<div id="collapse<%=i%>" class="panel-collapse collapse">
						      				<div class="panel-body">
						      					<div class="row">
							      					<div class="col-xs-3">
							      						<img class="media-object" src="http://www.placehold.it/150.png" alt="Placeholder">
							      					</div>
							      					<div class="col-xs-9">
							      					<div class="panel panel-success">
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
						      					<a href="recipe?recipe_id=<%=recipeList.get(i).getRecipeID()%>">For full recipe click here...</a>
						      				</div>
						    			</div>
					  				</div>
					  			<%}} %>	
					  		</div>	
                   <div class="text-center">
						<a href="myrecipes" class="btn btn-info" role="button"><%=messages.getString("add")%> <%=messages.getString("recipes")%></a>
                   </div>
                   <br>
            	</div>
      		</div>
      	</div>
      	<div class="row">
      		<div class="col-xs-12">
				<div class="panel color-change">
                   <h2 class="panel-heading"><%=messages.getString("inventory")%></h2>
                   <div class="panel-body">
                       <p> content </p>
                   </div>
                   <button class="btn btn-primary center-block"><%=messages.getString("manage")%> <%=messages.getString("inventory")%></button>
                   <br>
               </div>
      		</div>
      	</div>
          	</div>
      	</div>
	</div>
 </div>   
<%@include file="common/footer.jsp"%>
