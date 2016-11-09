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
	            $(".ingredient-wrapper").append("<div class=\"update-field\">" +
	            		"<h4>Ingredient "+ x + "</h4><select style=\"display:block;\" name=\"ingredients\">"
	            		<%for(String ingredient : ingredients){
						out.print("+ \"<option value=\\\"" + count + "\\\">" + ingredient + "</option>\" \n");
						count++;
						}count=1;%>
	            		
	            		+ "</select><a href=\"#\" class=\"remove_field\">Remove</a><br>"
	            		+ "<label for=\"ingredientQuantities\">Quantity</label>"
						+ "<input type=\"number\" name=\"ingredientQuantities\" required=\"required\" autocomplete=\"off\"/>"
						+	"<select style=\"display:block;\" name=\"ingredientsQUnits\">"
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
						+	"</select></div>"); //add input box
	        }
	    });
	    
	    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
	        e.preventDefault(); $(this).parent('div').remove(); x--;
	    });
});
</script>

<div class="container-fluid">
	 <h1 class="bg-primary text-center">Recipes</h1>
      	<div class="row">
   			<div class="col-xs-12">
               		<div class="panel color-change">
	                   <div class="panel-body">
	                   <form action="recipeServlet" method="post">
	                   		<div class="update-field">
								<label for="recName">Name<span class="req">*</span></label>
							 	<input type="text" name="recName" required="required" autocomplete="off"/>
							</div>
							<div class="update-field">
								<label for="recDescription">Description</label>
								<input type="text" name="recDescription" autocomplete="off"/>
							</div>
							<div class="update-field">
								<label for="recPreptime">Preparation Time<span class="req">*</span></label>
								<input type="number" name="recPreptime" required="required" autocomplete="off"/>
							</div>
							<div class="update-field">
								<label for="recCooktime">Cook Time<span class="req">*</span></label>
								<input type="number" name="recCooktime" required="required" autocomplete="off"/>
							</div>
							<div class="update-field">
								<label for="recInstructions">Instructions<span class="req">*</span></label>
								<textarea style="margin-bottom: 10px;" cols="25" placeholder="Enter instructions..." name="recInstructions" maxlength="499"></textarea>
							</div>
							<div class="ingredient-wrapper">
							<h3>Ingredients</h3>
								<div class="update-field">
									<h5>Ingredient 1</h5>
									<select style="display:block;" name="ingredients">
										<%for(String ingredient : ingredients){%>
										<option value="<%=count %>"><%=ingredient%></option>
										<%
										count++;
										}count=1;%>
									</select>
									<label for="ingredientQuantities">Quantity</label>
									<input type="number" name="ingredientQuantities" required="required" autocomplete="off"/>
									<select style="display:block;" name="ingredientsQUnits">
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
								</div>
							</div>
							<button class="add_field_button button button-block btn-default">Add another ingredient</button>
	                   		<button type="submit" class="button button-block btn-default" value="cancel">Submit</button>
	                   </form>
	                   </div>
	               </div>
	         </div>
	     </div>
</div>