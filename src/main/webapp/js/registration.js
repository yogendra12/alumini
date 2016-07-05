$(document).ready(function () {
	
	//document.getElementById("reg_pass").oninvalid = validatePassword(document.getElementById("reg_pass"));
	
	/*$('#reg_pass').on('blur',function(){
		var pF = document.getElementById("reg_pass");
		validatePassword(pF);
	});*/

	var i=1;
	  
		/*if(typeof data.password != 'undefined'){
			 $('#password').focus().select();
			 showError(".pw_span" ,data.password,"pw_span red");
			 err = true;
		}*/
     $("#add_row").click(function(){
    	 $('#tab_logic').append('<tr class="addedRows" id="addr'+(i)+'"></tr>');
		  $('#addr'+i).html(/*"<td><p class='checkboxpadding'><input  name='select"+i+"' type='checkbox' value='select' placeholder='select'  class='form-control input-md checkboxfieldwidth'></p></td><td><img src='../images/bird1.png' name='image' class='imageSpace photofieldwidth'/></td>*/"<td><p class='columnpadding'><input  name='name"+i+"' id='childNameId"+i+"' type='text' placeholder='Name'  class='form-control input-md'></p></td><td><p class='columnpadding'><input  name='about"+i+"' id='childAboutId"+i+"' type='text' placeholder='About'  class='form-control input-md'></p></td><td><p class='columnpadding'><input  name='photo"+i+"' id='childFileId"+i+"' type='file' placeholder='photo'  class='form-control input-md'></p></td><td><p class='columnpadding'><input type='button' value='Save' id='child_save"+i+"' placeholder='' class='ChildSave'/></p></td>");

		  /*$('#tab_logic').append('<tr id="addr'+(i+1)+'"></tr>');*/
		  i++; 
	});
    $("#delete_row").click(function(){
    	 if(i>1){
		 $("#addr"+(i-1)).html('');
		 $("#addr"+(i-1)).remove();
		 i--;
		 }
	 });

	 var z=1;
     $(".container #add_row_family_photos").click(function(){			
    	 $('#tab_logic_family_photos').append('<tr id="family_photos'+(z+1)+'"></tr>');
    	 $('#family_photos'+z).html("<td><p class='columnpadding'><input name='familyPhoto"+z+"' type='file' placeholder='Photo' class='form-control input-md photouploadfieldwidth'/></p></td><td><p class='columnpadding'><input  name='familyPhotoDesc"+z+"' type='text' placeholder='Description'  class='form-control input-md'></p></td><td><p class='privacypadding'><input  name='familyPhotoPublic"+z+"' type='checkbox' placeholder='privacy'  class='form-control input-md privacy-field-width'></p></td><td><p class='privacypadding'><input type='button' name='' placeholder='' value='Save' id='photoSaveId0' class='SaveFamilyImage' /></p></td>");
		 
		  z++; 
	});
     $("#delete_row_family_photos").click(function(){
    	 if(z>1){
		 $("#family_photos"+(z-1)).html('');
		 $("#family_photos"+(z-1)).remove();
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
        
if(fileInput != null ){
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
}
    
if(fileInput1 != null)
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



$(document).on('click', '#form1_save', function(){
	registration();
});
$(document).on('click', '#spouseSaveId', function(){
	updateSpouseDetails();
});
$(document).on('click', '.ChildSave', function(){
	insertChildDetails(this.id);
});
$(document).on('click', '.SaveFamilyImage', function(){
	insertFamilyPhotos(this.id);
});


function updateSpouseDetails(){
	var spouseName=$('#spouse_Name').val();
	var spouseAbout=$('#spouse_desc').val();
	
	var formData = new FormData();
	formData.append('file', $('#spouse_photo')[0].files[0]);
	formData.append("spouseName", spouseName);
	formData.append("aboutSouse", spouseAbout);
	
	jQuery.fn.makeMultipartRequest('POST', "updateSpouseDetails", false, formData, false, 'json', function(data){
		console.log(data);
		if(data[200] != null){
			$("#spouseImgUrl").attr("src", data[200]);
			alert("spouse saved succesfully");
		}else{
			
		}
	});
}
/*function insertChildDetails(id){
	if($('#tab_logic tr.addedRows').length > 0){
		var formData = new FormData();
		$.each($('#tab_logic tr.addedRows'), function(i, row){
			var trId = $(row).attr('id');
			 var childName = $("#"+trId).find("#childNameId"+i).val();
			 var aboutChild = $("#"+trId).find("#childAboutId"+i).val();
			 var aboutChild = $("#"+trId).find("#childFileId1")[0].files[0];
			 formData.append('file', childPhoto);
			 formData.append("childName", childName);
			 formData.append("aboutChild", aboutChild);
		});
	
	
	jQuery.fn.makeMultipartRequest('POST', "insertChildData", false, formData, false, 'json', function(data){
		console.log(data);
		if(data){
			
		}else{
			
		}
	});
	}
}*/
function insertChildDetails(id){
		var formData = new FormData();
var sid = id.replace('child_save','');		
			var trId = "addr"+sid;
			 var childName = $("#"+trId).find("#childNameId"+sid).val();
			 var aboutChild = $("#"+trId).find("#childAboutId"+sid).val();
			 var childPhoto = $("#"+trId).find("#childFileId"+sid)[0].files[0];
			 formData.append('file', childPhoto);
			 formData.append("childName", childName);
			 formData.append("aboutChild", aboutChild);
	
	
	jQuery.fn.makeMultipartRequest('POST', "insertChildData", false, formData, false, 'json', function(data){
		console.log(data);
		dispalyUserData(data);
			$("#"+trId).find("#childNameId"+sid).val("");
		    $("#"+trId).find("#childAboutId"+sid).val("");
		    $("#"+trId).find("#childFileId"+sid).val('');
//		dispalyUserData(data);
		/*if(data[200] != null){
			alert(data[200]);
			dispalyUserData(data[200]);
		}else if(data[500] != null){
			alert(data[500]);
		}else{
			alert(data[400]);
		}*/
	});
}

	


function insertFamilyPhotos(id){
	var formData = new FormData();
var sid = id.replace('photoSaveId','');		
		var trId = "family_photos"+sid;
		 var familyPublic = $("#"+trId).find("#familyPhotoPublic"+sid).val();
		 if(familyPublic == "on"){
			 familyPublic = 1;
		 }else{
			 familyPublic = 0;
		 }
		 var aboutImage = $("#"+trId).find("#familyPhotoDesc"+sid).val();
		 var familyPhoto = $("#"+trId).find("#familyPhoto"+sid)[0].files[0];
		 formData.append('file', familyPhoto);
		 formData.append("description", aboutImage);
		 formData.append("isPublic", familyPublic);


jQuery.fn.makeMultipartRequest('POST', "insertFamilyData", false, formData, false, 'json', function(data){
	console.log(data);
	displayFamilyData(data);
		$("#"+trId).find("#familyPhotoDesc"+sid).val('');
		$("#"+trId).find("#familyPhoto"+sid).val('');
		$("#"+trId).find("#familyPhotoPublic"+sid).attr('checked', false);;	
});
}



function registration(){
	var name =$('#reg_name').val();
	var rollNo = $('#reg_rollno').val();
	var password = $('#reg_pass').val();
	var email = $('#reg_email').val();
	var no = $('#reg_contactno').val();
	var dob = $('#reg_dob').val();
	var cityTown = $('#reg_city').val();
	var country = $('input[name="country"]:checked').val();
	var oldPhoto = $('#reg_old').val();
	var newPhoto = $('#reg_new').val();
	var aboutUser = $('#reg_desc').val();
	
	
	var formData = new FormData();
	
	formData.append('file', $('input[type=file]')[0].files[0]);
	formData.append('file', $('input[type=file]')[1].files[0]);
    
	formData.append('name', name);
	formData.append('rollNo', rollNo);
	formData.append('password', password);
	formData.append('email', email);
	formData.append('contactNo', no);
	formData.append('dateOfBirth', dob);
	formData.append('city', cityTown);
	formData.append('country', country);
	formData.append('aboutYou', aboutUser);
	formData.append('country', country);
	
	jQuery.fn.makeMultipartRequest('POST', "registerUser", false, formData, false, 'json', function(data){
		//console.log(data);
		if(data[200] == "200"){
			alert(data[200]);
			$('#oldImgPath').attr('src', data[oldImg]);
			$('#newImgPath').attr('src', data[newImg]);
		}
	});
	return false;
}

function forDelete(id) {
	var count = 0;
		var deleteId = id;
		$("#itemContainer tr").remove();
		$("#itemContainer tr td").remove();
		$.ajax({
					type : "POST",
					url : "deleteChildData",
					data : "childId=" + deleteId,
					dataType : "json",
					success : function(response) {
						//alert(CatList);
						dispalyUserData(response);
					}
			 });
}
function forDeleteFamilyImg(id) {
	var count = 0;
		var deleteId = id;
		$("#itemContainer1 tr").remove();
		$("#itemContainer1 tr td").remove();
		$.ajax({
					type : "POST",
					url : "deleteFamilyData",
					data : "id=" + deleteId,
					dataType : "json",
					success : function(response) {
						//alert(CatList);
						displayFamilyData(response);
					}
			 });
}


function dispalyUserData(data){
	if(data != ""){
		$("#itemContainer tr").remove();
		$("#itemContainer tr td").remove();
	$.each(data,
			function(i, obj) {
				var tblRow = "<tr class='text-center namewidth'>"
					 + "<td>"+ obj.childName+ "</td>"
						+ "<td > <img class='imageSpace photofieldwidth photofieldwidthxs' src="+obj.childPhotoPath+" ></td>"
						+ "<td>"+ obj.aboutChild +"</td>"
						+ "<td >"
						+ "<a href='javascript:void(0)' id='"
						+ obj.childId
						+ "' onclick='forDelete(this.id)' class='ico del'>Delete</a>"
						+ '</td>'
						 + '</tr>';
				$(tblRow).appendTo("#itemContainer");

				
			});
	}
}

function displayFamilyData(data){
	if(data != ""){
		$("#itemContainer1 tr").remove();
		$("#itemContainer1 tr td").remove();
	$.each(data,
			function(i, obj) {
				var tblRow = "<tr class='text-center namewidth'>"
						+ "<td > <img class='imageSpace photofieldwidth photofieldwidthxs' src="+obj.imagePath+" ></td>"
						+ "<td>"+ obj.description +"</td>"
						+ "<td >"
						+ "<a href='javascript:void(0)' id='"
						+ obj.id
						+ "' onclick='forDeleteFamilyImg(this.id)' class='ico del'>Delete</a>"
						+ '</td>'
						 + '</tr>';
				$(tblRow).appendTo("#itemContainer1");

				
			});
	}
}
/*function validatePassword(input){
	
	var value = input.value;
	var reg = /[:\s\\]/;
     if(value == "" || value.length < 6 || value.length > 20){
		input.setCustomValidity("Be Tricky! Should be between 6 - 20 characters");
	}
	else if(reg.test(value)){
		input.setCustomValidity('Can contain A-Z, a-z, 0-9 and ~`!@#$%^&*()-_+={}|[];\'"<>,.?/');
    }else{
    	input.setCustomValidity('');
    }
    
}*/
