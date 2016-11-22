$('.login-form').find('input, textarea').on('keyup blur focus', function (e) {
  
  var $this = $(this),
      label = $this.prev('label');

	  if (e.type === 'keyup') {
			if ($this.val() === '') {
          label.removeClass('active highlight');
        } else {
          label.addClass('active highlight');
        }
    } else if (e.type === 'blur') {
    	if( $this.val() === '' ) {
    		label.removeClass('active highlight'); 
			} else {
		    label.removeClass('highlight');   
			}   
    } else if (e.type === 'focus') {
      
      if( $this.val() === '' ) {
    		label.removeClass('highlight'); 
			} 
      else if( $this.val() !== '' ) {
		    label.addClass('highlight');
			}
    }

});

$('.tab a').on('click', function (e) {
  
  e.preventDefault();
  
  $(this).parent().addClass('active');
  $(this).parent().siblings().removeClass('active');
  
  target = $(this).attr('href');

  $('.tab-content > div').not(target).hide();
  
  $(target).fadeIn(600);
  
});

$('#editButton').on('click', function() {
	$('#info').attr('style', 'display:none');
	$('#edit').attr('style', '');
});

$('#updateCancelButton').on('click', function() {
	$('#info').attr('style', '');
	$('#edit').attr('style', 'display:none');
});

var max = 250;
$("#bugDescription").keyup(function(e){
		$("#characters").text("Characters Left: " + (max - $(this).val().length));
	});


var max_step_fields      = 20; //maximum input boxes allowed
var step_wrapper         = $(".step-wrapper"); //Fields wrapper
var add_step_button      = $(".add_step_button"); //Add button ID

var stepCount = 1; //initial text box count
$(".add_step_button").on("click", function(e){ //on add input button click
    e.preventDefault();
    if(stepCount < max_step_fields){ //max input box allowed
        stepCount++; //text box increment
        $(".step-wrapper").append("<div class=\"update-field\">" +
        		"<label for=\"steps\">Step "+ stepCount + "<span class=\"req\">*</span></label>" +
        		"<input type=\"text\" name=\"steps\" required=\"required\" autocomplete=\"off\" />" +
        		"<a href=\"#\" class=\"remove_step_field\">Remove</a></div>"); //add input box
    }
});

$(step_wrapper).on("click",".remove_step_field", function(e){ //user click on remove text
    e.preventDefault(); $(this).parent('div').remove(); stepCount--;
});
