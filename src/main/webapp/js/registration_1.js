$(document).ready(function () {


	  var i=1;
     $("#add_row").click(function(){
		  $('#addr'+i).html("<td><p class='checkboxpadding'><input  name='select"+i+"' type='checkbox' value='select' placeholder='select'  class='form-control input-md checkboxfieldwidth'></p></td><td><img src='../images/bird1.png' name='image' class='imageSpace photofieldwidth'/></td><td><p class='columnpadding'><input  name='name"+i+"' type='text' placeholder='Name'  class='form-control input-md'></p></td><td><p class='columnpadding'><input  name='about"+i+"' type='text' placeholder='About'  class='form-control input-md'></p></td><td><p class='columnpadding'><input  name='photo"+i+"' type='file' placeholder='photo'  class='form-control input-md'></p></td> ");

		  $('#tab_logic').append('<tr id="addr'+(i+1)+'"></tr>');
		  i++; 
	});
    $("#delete_row").click(function(){
    	 if(i>1){
		 $("#addr"+(i-1)).html('');
		 i--;
		 }
	 });

	 var z=1;
     $(".container #add_row_family_photos").click(function(){			
		  $('#family_photos'+z).html("<td><p class='checkboxpadding'><input  name='select"+i+"' type='checkbox' value='select' placeholder='select'  class='form-control input-md checkboxfieldwidth'></p></td><td><img src='../images/bird1.png' name='image' class='imageSpace photofieldwidth'/></td><td><p class='columnpadding'><input name='photo"+z+"' type='file' placeholder='Photo' class='form-control input-md photouploadfieldwidth'/></p></td><td><p class='columnpadding'><input  name='description"+z+"' type='text' placeholder='Description'  class='form-control input-md'></p></td><td><p class='privacypadding'><input  name='privacy"+z+"' type='checkbox' placeholder='privacy'  class='form-control input-md privacy-field-width'></p></td>");
		  $('#tab_logic_family_photos').append('<tr id="family_photos'+(z+1)+'"></tr>');
		  z++; 
	});
     $("#delete_row_family_photos").click(function(){
    	 if(z>1){
		 $("#family_photos"+(z-1)).html('');
		 z--;
		 }
	 });
	 
	 

    var navListItems = $('div.setup-panel div a'),
            allWells = $('.setup-content'),
            allNextBtn = $('.nextBtn');

    allWells.hide();

    navListItems.click(function (e) {
        e.preventDefault();
        var $target = $($(this).attr('href')),
                $item = $(this);

        if (!$item.hasClass('disabled')) {
            navListItems.removeClass('btn-primary').addClass('btn-default');
            $item.addClass('btn-primary');
            allWells.hide();
            $target.show();
            $target.find('input:eq(0)').focus();
        }
    });

    allNextBtn.click(function(){
        var curStep = $(this).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
            curInputs = curStep.find("input[type='text'],input[type='url']"),
            isValid = true;

        $(".form-group").removeClass("has-error");
        for(var i=0; i<curInputs.length; i++){
            if (!curInputs[i].validity.valid){
                isValid = false;
                $(curInputs[i]).closest(".form-group").addClass("has-error");
            }
        }

        if (isValid)
            nextStepWizard.removeAttr('disabled').trigger('click');
    });

    $('div.setup-panel div a.btn-primary').trigger('click');
    
    
    //custom code by @naresh for file input sep
    
        var fileInput = document.getElementById('sep_json');
		var fileDisplayArea = document.getElementById('sep_jsondisplay');
var fileInput1 = document.getElementById('action_json');
    	var fileDisplayArea1 = document.getElementById('action_jsondisplay');
        

		    	fileInput.addEventListener('change', function(e) {
			var file = fileInput.files[0];
			var textType = /text.*/;

			if (file.type.match(textType)) {
				var reader = new FileReader();

				reader.onload = function(e) {
          var res= reader.result;
          function isJSON (something) {
    if (typeof something != 'string')
        something = JSON.stringify(something);

    try {
        JSON.parse(something);
        return true;
    } catch (e) {
        return false;
    }
}
          if(isJSON(res)){
					fileDisplayArea.innerText = JSON.stringify(res);
          }else{
            fileDisplayArea.innerText = "File content is not JSON"
          }
				}

				reader.readAsText(file);	
			} else {
				fileDisplayArea.innerText = "File not supported!"
			}
		});
    fileInput1.addEventListener('change', function(e) {
    		var file = fileInput1.files[0];
			var textType = /text.*/;

			if (file.type.match(textType)) {
				var reader = new FileReader();

				reader.onload = function(e) {
          var res= reader.result;
          function isJSON (something) {
    if (typeof something != 'string')
        something = JSON.stringify(something);

    try {
        JSON.parse(something);
        return true;
    } catch (e) {
        return false;
    }
}
          if(isJSON(res)){
					fileDisplayArea1.innerText = JSON.stringify(res);
          }else{
            fileDisplayArea1.innerText = "File content is not JSON"
          }
				}

				reader.readAsText(file);	
			} else {
				fileDisplayArea1.innerText = "File not supported!"
			}
		});
    
    //@naresh action dynamic childs
    var next = 0;
    $("#add-more").click(function(e){
        e.preventDefault();
        var addto = "#field" + next;
        var addRemove = "#field" + (next);
        next = next + 1;
        var newIn = ' <div id="field'+ next +'" name="field'+ next +'"><!-- Text input--><div class="form-group"> <label class="col-md-4 control-label" for="action_id">Action Id</label> <div class="col-md-5"> <input id="action_id" name="action_id" type="text" placeholder="" class="form-control input-md"> </div></div><br><br><!-- Text input--><div class="form-group"> <label class="col-md-4 control-label" for="action_name">Action Name</label> <div class="col-md-5"> <input id="action_name" name="action_name" type="text" placeholder="" class="form-control input-md"> </div></div><br><br><!-- File Button --> <div class="form-group"> <label class="col-md-4 control-label" for="action_json">Action JSON File</label> <div class="col-md-4"> <input id="action_json" name="action_json" class="input-file" type="file"> </div></div></div>';
        var newInput = $(newIn);
        var removeBtn = '<button id="remove' + (next - 1) + '" class="btn btn-danger remove-me" >Remove</button></div></div><div id="field">';
        var removeButton = $(removeBtn);
        $(addto).after(newInput);
        $(addRemove).after(removeButton);
        $("#field" + next).attr('data-source',$(addto).attr('data-source'));
        $("#count").val(next);  
        
            $('.remove-me').click(function(e){
                e.preventDefault();
                var fieldNum = this.id.charAt(this.id.length-1);
                var fieldID = "#field" + fieldNum;
                $(this).remove();
                $(fieldID).remove();
            });
    });
    
});
function eventsRegistration() {
	var eventName = $('#reg_rollno').val();
	var eventDate = $('#reg_pass').val();
	var eventDesc = $('#reg_name').val();
	var eventDesc = $('#reg_email').val();
	var eventDesc = $('#reg_contactno').val();
	var eventDesc = $('#reg_name').val();
	var eventDesc = $('#reg_name').val();
	var eventDesc = $('#reg_name').val();
	var eventDesc = $('#reg_name').val();
	var eventDesc = $('#reg_name').val();

	/*
	 * var json ={}; json["eventName"] = eventName; json["eventDate"] =
	 * eventDate; json["eventPhotosPath"] = eventPhoto; json["eventDescription"] =
	 * eventDesc;
	 */
	var formData = new FormData();

	formData.append('file', $('input[type=file]')[0].files[0]);
	// formData.append('file', $('input[type=file]')[1].files[0]);
	formData.append('eventName', eventName);
	formData.append('eventDate', eventDate);
	formData.append('eventDescription', eventDesc);

	/*
	 * jQuery.fn.makeRequest("POST","eventRegisterUser",json,function(response){
	 * alert(response); });
	 */
	jQuery.fn.makeMultipartRequest('POST', "eventRegisterUser", false,
			formData, false, 'json', function(data) {
				console.log(data);
			});
	return false;
}

 
   



	