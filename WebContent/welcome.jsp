<%@include file="common/header.jsp"%>
<%@include file="common/navbar.jsp"%>

   <!-- Page Content -->
      
    <div class="container-fluid">
    <h1 class="bg-primary text-center"><%=messages.getString("test")%></h1>
      	<div class="row">
   			<div class="col-xs-4">
               		<div class="panel color-change">
	                   <h2 class="panel-heading">Friends</h2>
	                   <div class="panel-body">
	                       <p> content </p>
	                   </div>
	                   <button class="btn btn-primary center-block">Add friends</button>
	                   <br>
	               </div>
          	</div>
          	<div class="col-xs-8">
          	<div class="row">
      		<div class="col-xs-12">
      			<div class="panel color-change">
                   <h2 class="panel-heading">Recipes</h2>
                   <div class="panel-body">
                       <p> content </p>
                   </div>
                   <button class="btn btn-primary center-block">Add Recipes</button>
                   <br>
            	</div>
      		</div>
      	</div>
      	<div class="row">
      		<div class="col-xs-12">
				<div class="panel color-change">
                   <h2 class="panel-heading">Inventory</h2>
                   <div class="panel-body">
                       <p> content </p>
                   </div>
                   <button class="btn btn-primary center-block">Manage Inventory</button>
                   <br>
               </div>
      		</div>
      	</div>
          	</div>
      	</div>
	</div>

    
<%@include file="common/footer.jsp"%>