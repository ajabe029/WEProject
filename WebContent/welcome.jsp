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
                        <table class="table table-condensed" style="border-collapse:collapse;">
	 						<thead>
	 					        <tr>
	 					            <th>Recipe Name</th>
									<th>Description</th>
	 					        </tr>
	 					    </thead>
					    	<tbody>
	                		<% for(int i = 0; i < recipeList.size(); i++){%>
	                			<tr>
	                				<td><a href="recipe?recipe_id=<%=recipeList.get(i).getRecipeID()%>"><%=recipeList.get(i).getName()%></a></td>
	                				<td><%=recipeList.get(i).getDescription()%></td>
	                			</tr>
	                		<%}%>
					    	</tbody>
						</table>   
	                	<%}%>
 
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
    
<%@include file="common/footer.jsp"%>
