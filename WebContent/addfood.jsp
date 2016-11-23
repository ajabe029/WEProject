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
			String txtFilePath = jspPath + "/text/ingredientslist.txt";
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
	            		"<h5>Ingredient "+ x + "</h5><select style=\"display:block;\" name=\"ingredients\">"
	            		<%for(String ingredient : ingredients){
						out.print("+ \"<option value=\\\"" + count + "\\\">" + ingredient + "</option>\" \n");
						count++;
						}count=1;%>
	            		
	            		+ "</select></div><div class=\"col-xs-4\" style=\"padding-right: 0px\"><table>"
	            		+ "<tr><td><div class=\"update-field\"><h5>Quantity</h5>"
						+ "<input type=\"number\" name=\"ingredientQuantities\" required=\"required\" autocomplete=\"off\"/></div></td>"
						+	"<td style=\"padding-bottom: 0px;\"><select style=\"display:block;margin-top:30px;\" name=\"ingredientsQUnits\">"
						+		"<option value=\"teaspoon\">Teaspoon</option>"
						+		"<option value=\"tablespoon\">Tablespoon</option>"
						+		"<option value=\"oz\">Ounce</option>"
						+		"<option value=\"1/2cup\">1/2 Cup</option>"
						+		"<option value=\"cup\">Cup</option>"
						+		"<option value=\"pint\">Pint</option>"
						+		"<option value=\"gallon\">Gallon</option>"
						+		"<option value=\"quart\">Quart</option>"
						+		"<option value=\"ml\">Millilitre</option>"
						+		"<option value=\"l\">Litre</option>"
						+		"<option value=\"dl\">Decilitre</option>"
						+		"<option value=\"lb\">Pound</option>"
						+		"<option value=\"mg\">Milligram</option>"
						+		"<option value=\"g\">Gram</option>"
						+		"<option value=\"kg\">Kilogram</option>"
						+	"</select></td><td><a href=\"#\" style=\"display:block;margin-left:10px;margin-top:30px;\"class=\"remove_field\">Remove</a></td></tr></table></div></div>"); //add input box
	        }
	    });
	    
	    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
	        e.preventDefault(); $(this).parent('td').parent('tr').parent('tbody').parent('table').parent('div').parent('div').remove(); x--;
	    });
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-xs-12">
			<div class="panel">
				<div class="panel-heading">
					<h2> Add Food </h2>
				</div>
				<div class="panel-body">
					<form action="addfood" method="post">
						<div class="ingredient-wrapper" style="margin-bottom: 50px">
							<h3>Ingredients</h3>
							<div class="row">
									<div class="col-xs-3">
									<h5>Ingredient 1</h5>
										<select style="display:block;" name="ingredients">
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
														<h5>Quantity</h5>
														<input type="number" name="ingredientQuantities" required="required" autocomplete="off"/>
													</div>
												</td>
												<td style="padding-bottom: 0px;">
													<select style="display:block;margin-top:30px;" name="ingredientsQUnits">
														<option value="teaspoon">Teaspoon</option>
														<option value="tablespoon">Tablespoon</option>
														<option value="oz">Ounce</option>
														<option value="1/2cup">1/2 Cup</option>
														<option value="cup">Cup</option>
														<option value="pint">Pint</option>
														<option value="gallon">Gallon</option>
														<option value="quart">Quart</option>
														<option value="ml">Millilitre</option>
														<option value="l">Litre</option>
														<option value="dl">Decilitre</option>
														<option value="lb">Pound</option>
														<option value="mg">Milligram</option>
														<option value="g">Gram</option>
														<option value="kg">Kilogram</option>
													</select>
												</td>
											</tr>
										</table>
									</div>
							</div>
							</div>
							<button class="add_field_button">Add another ingredient</button>
	                   		<button type="submit" value="cancel">Submit</button>
	                   </form>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="common/footer.jsp"%>