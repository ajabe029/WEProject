<%@include file="common/header.jsp"%>
<%@include file="common/navbar.jsp"%>

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
                       <p> content </p>
                   </div>
                   <button class="btn btn-primary center-block"><%=messages.getString("add")%> <%=messages.getString("recipes")%></button>
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
