<%@include file="common/header.jsp"%>
<%@include file="common/navbar.jsp"%>

<script type="text/javascript">
	document.title = "Inventory";
</script>

<div class="container-fluid">
	<div class="box">
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
					  			<br>
	  							<div class="row col-xs-12 text-center">
									<a href="addfood.jsp" class="btn btn-info" role="button"><%=messages.getString("AddNewItem")%></a>
								</div>
								<br>
					  		</div>	
					  	</c:otherwise>
				</c:choose>
				</div>
			</div><!-- End of column -->
			<div class="col-xs-8">
				<div class="panel color-change">
				<h2 class="text-center"><%=messages.getString("myrecipes") %></h2>	
				</div>
			</div>
		</div>
			<br>
	</div><!-- End of box -->		
</div>

<%@include file="common/footer.jsp"%>