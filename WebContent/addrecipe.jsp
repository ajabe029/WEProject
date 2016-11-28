<%@include file="common/header.jsp"%>
<%@include file="common/navbar.jsp"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>

<%
			int count = 1;
			String jspPath = session.getServletContext().getRealPath("/");
			String txtFilePath = jspPath + "/text/" + messages.getString("ingredientsfile");
            BufferedReader reader = new BufferedReader(new FileReader(txtFilePath));
            //BufferedReader br = new InputStreamReader(new FileInputStream(txtFilePath));
            StringBuilder sb = new StringBuilder();
            String line;

            while((line = reader.readLine())!= null){
                sb.append(line+"\n");
            }
            
            String ingredients[] = sb.toString().split("\n");
         	
            reader.close();
%>

<script type="text/javascript">
	document.title = "Add Recipe";
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	    var max_fields      = 20; //maximum input boxes allowed
	    var wrapper         = $(".ingredient-wrapper"); //Fields wrapper
	    var add_button      = $(".add_field_button"); //Add button ID
	    
	    var x = 1; //initlal text box count
	    $(".add_field_button").on("click", function(e){ //on add input button click
	        e.preventDefault();
	        if(x < max_fields){ //max input box allowed
	            x++; //text box increment
	            $(".ingredient-wrapper").append("<div class=\"row\"><div class=\"col-xs-3\">" +
	            		"<h5><%=messages.getString("ingredient")%> "+ x + "</h5><select style=\"display:block;width:90%;\" name=\"ingredients\">"
	            		<%for(String ingredient : ingredients){
						out.print("+ \"<option value=\\\"" + count + "\\\">" + ingredient + "</option>\" \n");
						count++;
						}count=1;%>
	            		
	            		+ "</select></div><div class=\"col-xs-4\" style=\"padding-right: 0px\"><table>"
	            		+ "<tr><td><div class=\"update-field\"><h5><%=messages.getString("quantity")%></h5>"
						+ "<input type=\"number\" name=\"ingredientQuantities\" required=\"required\" autocomplete=\"off\"/></div></td>"
						+	"<td style=\"padding-bottom: 0px;\"><select style=\"display:block;margin-top:30px;\" name=\"ingredientsQUnits\">"
						+    "<option value=\"tsp(s)\"><%=messages.getString("teaspoon") %>(s)</option>"
						+	 "<option value=\"tbsp(s)\"><%=messages.getString("tablespoon") %>(s)</option>"
						+	 "<option value=\"oz(s)\"><%=messages.getString("ounce") %>(s)</option>"
						+	 "<option value=\"1/2 cup(s)\">1/2 <%=messages.getString("cup") %>(s)</option>"
						+	 "<option value=\"cup(s)\"><%=messages.getString("cup") %>(s)</option>"
						+	 "<option value=\"pint(s)\"><%=messages.getString("pint") %>(s)</option>"
						+	 "<option value=\"gallon(s)\"><%=messages.getString("gallon") %>(s)</option>"
						+	 "<option value=\"quart(s)\"><%=messages.getString("quart") %>(s)</option>"
						+	 "<option value=\"mL(s)\"><%=messages.getString("millilitre") %>(s)</option>"
						+	 "<option value=\"L(s)\"><%=messages.getString("litre") %>(s)</option>"
						+	 "<option value=\"dL(s)\"><%=messages.getString("decilitre") %>(s)</option>"
						+	 "<option value=\"lb(s)\"><%=messages.getString("pound") %>(s)</option>"
						+	 "<option value=\"mg(s)\"><%=messages.getString("milligram") %>(s)</option>"
						+	 "<option value=\"g(s)\"><%=messages.getString("gram") %>(s)</option>"
						+	 "<option value=\"kg(s)\"><%=messages.getString("kilogram") %>(s)</option>"
						+	 "<option value=\"pc(s)\"><%=messages.getString("piece") %>(s)</option>"
						+	"</select></td><td><a href=\"#\" style=\"display:block;margin-left:10px;margin-top:30px;\"class=\"remove_field\"><%=messages.getString("remove")%></a></td></tr></table></div></div>"); //add input box
	        }
	    });
	    
	    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
	        e.preventDefault(); $(this).parent('td').parent('tr').parent('tbody').parent('table').parent('div').parent('div').remove(); x--;
	    });
});
</script>

<div class="container-fluid">
	 <h1 class="bg-primary text-center"><%=messages.getString("recipes")%></h1>
      	<div class="row">
   			<div class="col-xs-12">
               		<div class="panel color-change">
	                   <div class="panel-body">
	                   <form action="myrecipes" method="post">
	                   		<div class="update-field">
								<label for="recName"><%=messages.getString("name")%><span class="req">*</span></label>
							 	<input type="text" name="recName" required="required" autocomplete="off"/>
							</div>
							<div class="update-field">
								<label for="recDescription"><%=messages.getString("description") %></label>
								<input type="text" name="recDescription" autocomplete="off"/>
							</div>
							<div class="row">
								<div class="col-xs-2">
									<div class="update-field">
										<label for="recPreptime"><%=messages.getString("preparationtime") %><span class="req">*</span></label>
										<input type="text" name="recPreptime" required="required" autocomplete="off"/>
									</div>
								</div>
								<div class="col-xs-2">
									<div class="update-field">
										<label for="recCooktime"><%=messages.getString("cooktime") %><span class="req">*</span></label>
										<input type="text" name="recCooktime" required="required" autocomplete="off"/>
									</div>
								</div>
							</div>
							<div class="step-wrapper" style="margin-bottom: 20px;">
								<div class="update-field">
									<label for="steps"><%=messages.getString("step") %> 1<span class="req">*</span></label>
									<input type="text" name="steps" required="required" autocomplete="off" />
								</div>
							</div>
							<button class="add_step_button"><%=messages.getString("addanotherstep") %></button>
							<div class="ingredient-wrapper" style="margin-bottom: 50px">
							<h3><%=messages.getString("ingredients") %></h3>
							<div class="row">
									<div class="col-xs-3">
									<h5><%=messages.getString("ingredient") %>1</h5>
										<select style="display:block; width:90%;" name="ingredients">
											<%for(String ingredient : ingredients){%>
											<option value="<%=count %>"><%=ingredient%></option>
											<%
											count++;
											}count=1;%>
										</select>
									</div>
									<div class="col-xs-4" style="padding-right: 0px">
										<table>
											<tr>
												<td>
													<div class="update-field">	
														<h5><%=messages.getString("quantity") %></h5>
														<input type="number" name="ingredientQuantities" required="required" autocomplete="off"/>
													</div>
												</td>
												<td style="padding-bottom: 0px;">
													<select style="display:block;margin-top:30px;" name="ingredientsQUnits">
														<option value="tsp(s)"><%=messages.getString("teaspoon") %>(s)</option>
														<option value="tbsp(s)"><%=messages.getString("tablespoon") %>(s)</option>
														<option value="oz(s)"><%=messages.getString("ounce") %>(s)</option>
														<option value="1/2 cup(s)">1/2 <%=messages.getString("cup") %>(s)</option>
														<option value="cup(s)"><%=messages.getString("cup") %>(s)</option>
														<option value="pint(s)"><%=messages.getString("pint") %>(s)</option>
														<option value="gallon(s)"><%=messages.getString("gallon") %>(s)</option>
														<option value="quart(s)"><%=messages.getString("quart") %>(s)</option>
														<option value="mL(s)"><%=messages.getString("millilitre") %>(s)</option>
														<option value="L(s)"><%=messages.getString("litre") %>(s)</option>
														<option value="dL(s)"><%=messages.getString("decilitre") %>(s)</option>
														<option value="lb(s)"><%=messages.getString("pound") %>(s)</option>
														<option value="mg(s)"><%=messages.getString("milligram") %>(s)</option>
														<option value="g(s)"><%=messages.getString("gram") %>(s)</option>
														<option value="kg(s)"><%=messages.getString("kilogram") %>(s)</option>
														<option value="pc(s)"><%=messages.getString("piece") %>(s)</option>
													</select>
												</td>
											</tr>
										</table>
									</div>
							</div>
							</div>
							<button class="add_field_button"><%=messages.getString("addanotheringredient") %></button>
	                   		<button type="submit" value="cancel"><%=messages.getString("submit") %></button>
	                   </form>
	                   </div>
	               </div>
	         </div>
	     </div>
</div>

<%@include file="common/footer.jsp"%>