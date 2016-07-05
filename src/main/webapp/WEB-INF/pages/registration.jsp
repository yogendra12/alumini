<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
        <title>Registration form </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/Registration.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <script src="js/login.js"></script>
        <link rel="stylesheet" href="css/commonStyles.css">
        <script src="js/datepick.js"></script>
        <script src="js/registration.js"></script>
        <script src="js/ajax.js"></script>
        <link rel="stylesheet" href="css/datepicker.css">
        <script src="js/bootstrap-datepicker.js"></script>
<script>
	$(document).ready(function() {
		$('#example1').datepicker({
			format : "dd/mm/yyyy"
		});

		
		$("#clickHerebtn").click(function() {
			$("#clickHerebtn").hide();
			$("#loginformid").fadeIn("slow");
		});
		$("#loginBtn, #loginFormCloseBtn").click(function() {
			$("#loginformid").fadeOut("slow");
			$("#clickHerebtn").show();
		});
		$("#forgotpwd").click(function() {
			$("#loginformid").hide();
			$("#forgotpwdid").fadeIn("slow");

		});
		$("#submitBtn, #forgotFormCloseBtn").click(function() {
			$("#forgotpwdid").fadeOut("slow");
			$("#clickHerebtn").show();
		});
	
	});
</script>
<style>
.stepwizard-step p {
	margin-top: 10px;
}

.stepwizard-row {
	display: table-row;
}

.stepwizard {
	display: table;
	width: 100%;
	position: relative;
}

.stepwizard-step button[disabled] {
	opacity: 1 !important;
	filter: alpha(opacity = 100) !important;
}

.stepwizard-row:before {
	top: 14px;
	bottom: 0;
	position: absolute;
	content: " ";
	width: 100%;
	height: 1px;
	background-color: #ccc;
	z-order: 0;
}

.stepwizard-step {
	display: table-cell;
	text-align: center;
	position: relative;
}

.btn-circle {
	width: 30px;
	height: 30px;
	text-align: center;
	padding: 6px 0;
	font-size: 12px;
	line-height: 1.428571429;
	border-radius: 15px;
}
</style>


<!--	<script>
		$(document).ready(function(){
      var date_input=$('input[name="date"]'); //our date input has the name "date"
      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
      var options={
        format: 'mm/dd/yyyy',
        container: container,
        todayHighlight: true,
        autoclose: true,
      };
      date_input.datepicker(options);
    })
	</script>-->
<script>
	$(document)
			.ready(
					function() {

						var i = 1;
						$("#add_row")
								.click(
										function() {
											$('#addr' + i)
													.html(
															"<td><p class='checkboxpadding'><input  name='select"+i+"' type='checkbox' value='select' placeholder='select'  class='form-control input-md checkboxfieldwidth'></p></td><td><img src='images/bird1.png' name='image' class='imageSpace photofieldwidth'/></td><td><p class='columnpadding'><input  name='name"+i+"' type='text' placeholder='Name'  class='form-control input-md'></p></td><td><p class='columnpadding'><input  name='about"+i+"' type='text' placeholder='About'  class='form-control input-md'></p></td><td><p class='columnpadding'><input  name='photo"+i+"' type='file' placeholder='photo'  class='form-control input-md'></p></td> ");

											$('#tab_logic').append(
													'<tr id="addr' + (i + 1)
															+ '"></tr>');
											i++;
										});
						$("#delete_row").click(function() {
							if (i > 1) {
								$("#addr" + (i - 1)).html('');
								i--;
							}
						});

						var z = 1;
						$(".container #add_row_family_photos")
								.click(
										function() {
											$('#family_photos' + z)
													.html(
															"<td><p class='checkboxpadding'><input  name='select"+i+"' type='checkbox' value='select' placeholder='select'  class='form-control input-md checkboxfieldwidth'></p></td><td><img src='images/bird1.png' name='image' class='imageSpace photofieldwidth'/></td><td><p class='columnpadding'><input name='photo"+z+"' type='file' placeholder='Photo' class='form-control input-md photouploadfieldwidth'/></p></td><td><p class='columnpadding'><input  name='description"+z+"' type='text' placeholder='Description'  class='form-control input-md'></p></td><td><p class='privacypadding'><input  name='privacy"+z+"' type='checkbox' placeholder='privacy'  class='form-control input-md privacy-field-width'></p></td>");
											$('#tab_logic_family_photos')
													.append(
															'<tr id="family_photos'
																	+ (z + 1)
																	+ '"></tr>');
											z++;
										});
						$("#delete_row_family_photos").click(function() {
							if (z > 1) {
								$("#family_photos" + (z - 1)).html('');
								z--;
							}
						});

						var navListItems = $('div.setup-panel div a'), allWells = $('.setup-content'), allNextBtn = $('.nextBtn');

						allWells.hide();

						navListItems
								.click(function(e) {
									e.preventDefault();
									var $target = $($(this).attr('href')), $item = $(this);

									if (!$item.hasClass('disabled')) {
										navListItems.removeClass('btn-primary')
												.addClass('btn-default');
										$item.addClass('btn-primary');
										allWells.hide();
										$target.show();
										$target.find('input:eq(0)').focus();
									}
								});

						allNextBtn.click(function() {
									var curStep = $(this).closest(
											".setup-content"), curStepBtn = curStep
											.attr("id"), nextStepWizard = $(
											'div.setup-panel div a[href="#'
													+ curStepBtn + '"]')
											.parent().next().children("a"), curInputs = curStep
											.find("input[type='text'],input[type='url']"), isValid = true;

									$(".form-group").removeClass("has-error");
									for (var i = 0; i < curInputs.length; i++) {
										if (!curInputs[i].validity.valid) {
											isValid = false;
											$(curInputs[i]).closest(
													".form-group").addClass(
													"has-error");
										}
									}

									if (isValid)
										nextStepWizard.removeAttr('disabled')
												.trigger('click');
								});

						$('div.setup-panel div a.btn-primary').trigger('click');

						//custom code by @naresh for file input sep

						var fileInput = document.getElementById('sep_json');
						var fileDisplayArea = document
								.getElementById('sep_jsondisplay');
						var fileInput1 = document.getElementById('action_json');
						var fileDisplayArea1 = document
								.getElementById('action_jsondisplay');
					if(fileInput != null){
						fileInput.addEventListener(
										'change',
										function(e) {
											var file = fileInput.files[0];
											var textType = /text.*/;

											if (file.type.match(textType)) {
												var reader = new FileReader();

												reader.onload = function(e) {
													var res = reader.result;
													function isJSON(something) {
														if (typeof something != 'string')
															something = JSON
																	.stringify(something);

														try {
															JSON
																	.parse(something);
															return true;
														} catch (e) {
															return false;
														}
													}
													if (isJSON(res)) {
														fileDisplayArea.innerText = JSON
																.stringify(res);
													} else {
														fileDisplayArea.innerText = "File content is not JSON"
													}
												}

												reader.readAsText(file);
											} else {
												fileDisplayArea.innerText = "File not supported!"
											}
										});
					}
					if(fileInput1 != null){
						fileInput1
								.addEventListener(
										'change',
										function(e) {
											var file = fileInput1.files[0];
											var textType = /text.*/;

											if (file.type.match(textType)) {
												var reader = new FileReader();

												reader.onload = function(e) {
													var res = reader.result;
													function isJSON(something) {
														if (typeof something != 'string')
															something = JSON
																	.stringify(something);

														try {
															JSON
																	.parse(something);
															return true;
														} catch (e) {
															return false;
														}
													}
													if (isJSON(res)) {
														fileDisplayArea1.innerText = JSON
																.stringify(res);
													} else {
														fileDisplayArea1.innerText = "File content is not JSON"
													}
												}

												reader.readAsText(file);
											} else {
												fileDisplayArea1.innerText = "File not supported!"
											}
										});
					}
						//@naresh action dynamic childs
						var next = 0;
						$("#add-more")
								.click(
										function(e) {
											e.preventDefault();
											var addto = "#field" + next;
											var addRemove = "#field" + (next);
											next = next + 1;
											var newIn = ' <div id="field'+ next +'" name="field'+ next +'"><!-- Text input--><div class="form-group"> <label class="col-md-4 control-label" for="action_id">Action Id</label> <div class="col-md-5"> <input id="action_id" name="action_id" type="text" placeholder="" class="form-control input-md"> </div></div><br><br><!-- Text input--><div class="form-group"> <label class="col-md-4 control-label" for="action_name">Action Name</label> <div class="col-md-5"> <input id="action_name" name="action_name" type="text" placeholder="" class="form-control input-md"> </div></div><br><br><!-- File Button --> <div class="form-group"> <label class="col-md-4 control-label" for="action_json">Action JSON File</label> <div class="col-md-4"> <input id="action_json" name="action_json" class="input-file" type="file"> </div></div></div>';
											var newInput = $(newIn);
											var removeBtn = '<button id="remove'
													+ (next - 1)
													+ '" class="btn btn-danger remove-me" >Remove</button></div></div><div id="field">';
											var removeButton = $(removeBtn);
											$(addto).after(newInput);
											$(addRemove).after(removeButton);
											$("#field" + next)
													.attr(
															'data-source',
															$(addto)
																	.attr(
																			'data-source'));
											$("#count").val(next);

											$('.remove-me')
													.click(
															function(e) {
																e
																		.preventDefault();
																var fieldNum = this.id
																		.charAt(this.id.length - 1);
																var fieldID = "#field"
																		+ fieldNum;
																$(this)
																		.remove();
																$(fieldID)
																		.remove();
															});
										});

					});
</script>

</head>
<body>
        <div class="container" id = "registrationbody">
            <div class="stepwizard">
                <div class="stepwizard-row setup-panel">
                    <div class="stepwizard-step">
                        <a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
                        <p>Your Details</p>
                    </div>
                    <div class="stepwizard-step">
                        <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
                        <p>Family Details</p>
                    </div>
                </div>
            </div>
            <div class="col-md-12 marLeft7 marginTop15">
                <div class="row setup-content" id="step-1" >
                    <div class="panel panel-orange">
                        <div class="panel-heading panelHead-orange">
                            Your Details
                        </div>
                        <form role="form" id="regForm" onsubmit="return false;" enctype="multipart/form-data" method="post" name="fileinfo">
                        <div class="panel-body">
                                <div class="col-xs-12 col-xs-6" id = "your-details-div">
                                    <div class="col-md-12 paddingleftzeroxs">
                              <!--           <p class="text-left" id="yourdetails"> Your Details</p> -->
                                        <!-- Select Basic -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="stack_id">Roll No</label>
                                            <div class="col-md-5">
                                                <input id="reg_rollno" name="rollno" type="text" value='${LoginBean.rollNo}'  disabled placeholder="Roll No" class="form-control input-md">
                                            </div> 
                                        </div>
                                        <br>
                                        <br>
                                        <!-- Text input-->
                                        <c:if test="${LoginBean.isVerified eq 1}">
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="cmpny">Password</label>  
                                            <div class="col-md-5">
                                            	<%-- <c:out value='${LoginBean.isVerified}'></c:out> --%>
                                                <input id="reg_pass" name="password"  type="text" value='${LoginBean.password}' placeholder="Password" oninvalid="validatePassword(this);" oninput="validatePassword(this);" required aria-required="true" class="form-control input-md">
                                                <span class="red pw_span"></span>    
                                            </div>
                                        </div>
                                        <br>
                                        <br>
                                        </c:if>    
                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="service_name">Name</label>  
                                            <div class="col-md-5">
                                                <input id="reg_name" name="reg_name"  value='${pBean.name}' type="text" placeholder="Please Enter Name" pattern="[a-zA-Z0-9\s]+" oninvalid="InvalidName(this);" oninput="InvalidName(this);" required aria-required="true" class="form-control input-md">    
                                            </div>
                                        </div>
                                        <br>
                                        <br>
                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="service_architecture">Email</label>  
                                            <div class="col-md-5">
                                                <input id="reg_email" name="service_architecture" value='${pBean.email}' type="text" oninvalid="InvalidMsg(this);" oninput="InvalidMsg(this);" required aria-required="true" pattern="[^ @]*@[^ @]*" placeholder="Enter your email" class="form-control input-md">    
                                            </div>
                                        </div>
                                        <br>
                                        <br>
                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="fn">Contact Number</label>  
                                            <div class="col-md-5">
                                                <input id="reg_contactno" name="contactno" type="text"  value='${pBean.contactNo}' pattern="^\d{10}$" required aria-required="true" placeholder="Contact Number" class="form-control input-md">
                                            </div>
                                        </div>
                                        <br>
                                        <br>
                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="ln">Date of Birth</label>
                                            <div class="col-md-5">
                                                <input id="reg_dob" name="ln" type="text" required aria-required="true"  value='${pBean.dateOfBirth}' placeholder="dd/mm/yyy" class="form-control input-md">
                                            </div>
                                        </div>
                                        <br>
                                        <br>
                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="city">City / Town</label>  
                                            <div class="col-md-5">
                                                <input id="reg_city" name="city" type="text" placeholder="City / Town" required aria-required="true"  value='${pBean.city}' class="form-control input-md">
                                            </div>
                                        </div>
                                        <br>
                                        <br>
                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="zip">Country</label>  
                                            <div class="col-md-5">
                                                <input id="reg_ind" name="country" type="radio" value="India" required aria-required="true"> India <br>
                                                <input id="reg_usa" name="country" type="radio" value="USA"> USA <br>
                                                <input id="reg_oth" name="country" type="radio" value="Other"> Other <input id="reg_countryOther" name="countryOther" type="text" placeholder="Other Country"><br><br>
                                            </div>
                                        </div>
                                        <br>
                                        <br>
                                        <br>
                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="ln">Photo in KLCE</label>  
                                            <div class="col-md-5">
                                                <input type="file" id='reg_old' required aria-required="true" class="input-file">
                                            </div>
                                        </div>
                                        <br>
                                        <br>
                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="ln">Latest Photo</label>  
                                            <div class="col-md-5">
                                                <input type="file" id='reg_new' required aria-required="true" class="input-file" >
                                            </div>
                                        </div>       
                                        <br>
                                        <br>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="service_name">About You</label>  
                                            <div class="col-md-5">
                                                <textarea id="reg_desc" name="service_name" type="textarea" required aria-required="true" rows="4" cols="30" placeholder="About You" class="form-control input-md"></textarea>
                                            </div>
                                        </div>
                                        <br>
                                        <br>
                                    </div>
                                </div>
                                <!----- photos div starts -->
                                <div class="col-sm-3" style="background-color:white;" id="gallery">
                                
                                <div class="col-sm-12" style="background-color:white;" id="galleryimages"><h3><br></h3>
                                <c:choose>
                                <c:when test="${not empty pBean.oldPhotoPath}">
                                <img id='oldImgPath' class="col-md-12" src="${pBean.oldPhotoPath}"/>
                                </c:when>
                                 <c:otherwise>
                                <img id='oldImgPath' class="col-md-12" src="https://s3-us-west-2.amazonaws.com/alumini-public-images/blankMale.jpeg"/>
                                </c:otherwise>
                                </c:choose>
                                    </div>
                                    <div class="col-sm-12" style="background-color:white;" id="galleryimages"><h3><br></h3>
								<c:choose>
                                <c:when test="${not empty pBean.newPhotoPath}">
                                <img id='newImgPath' class="col-md-12" src="${pBean.newPhotoPath}"/>
                                </c:when>
                                 <c:otherwise>
                                <img id='newImgPath' class="col-md-12" src="https://s3-us-west-2.amazonaws.com/alumini-public-images/blankMale.jpeg"/>
                                </c:otherwise>
                                </c:choose>
	                                    </div>
                                </div>
                                
                                <!----- photos div end -->
                        </div>
                        <div class="col-sm-12 col-xs-12" id="nextbutton">
                            <button class="btn btn-primary nextBtn btn-md pull-right marLeft7"  type="button">Next</button>
                            <button class="btn btn-primary btn-md pull-right" id='form1_save'  type="submit" id="savebutton">Save</button>
                        </div>
                        </form>
                    </div>			
                </div>
                <div class="row setup-content" id="step-2">
                    <!-- <div class="col-xs-12 spousemargin">-->
                    <div class="col-md-12 spousemargin paddingleftzeroxs">
                        <div class="panel panel-voilet">
                            <div class="panel-heading panelHead-voilet">
                                Spouse Details
                            </div>
                            <div class="panel-body">
                                <div class="col-md-12 ">
                                    <div class="col-md-8">
                                        <div class="form-group col-md-12">
                                            <label class="col-md-4 control-label" for="service_name">Name</label>  
                                            <div class="col-md-5">
                                                <input id="spouse_Name" value='${pBean.spouseName}' name="service_name" type="text" placeholder="Name" oninvalid="InvalidName(this);" oninput="InvalidName(this);" required aria-required="true" class="form-control input-md">
                                            </div>
                                        </div>
                                        <div class="clear-fix"></div>
                                        <div class="form-group col-md-12">
                                            <label class="col-md-4 control-label" for="service_name">About</label>  
                                            <div class="col-md-5">
                                                <textarea id="spouse_desc"   name="service_name" type="textarea" rows="3" cols="30" placeholder="About Spouse"required aria-required="true" class="form-control input-md">${pBean.aboutSouse}</textarea>
                                            </div>
                                        </div>
                                        <div class="clear-fix"></div>
                                        <div class="form-group col-md-12">
                                            <label class="col-md-4 control-label" for="sep_json">Photo</label>
                                            <div class="col-md-4">
                                                <input type="file" id='spouse_photo' class="input-file" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-xs-12">
                                    <c:choose>
                                    <c:when test="${not empty pBean.spousePhoto}">
                                        <img class="col-md-12 col-xs-12 paddingzeroxs" id='spouseImgUrl' src="${pBean.spousePhoto}"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img class="col-md-12 col-xs-12 paddingzeroxs" id='spouseImgUrl' src="https://s3-us-west-2.amazonaws.com/alumini-public-images/blankFemale.jpeg"/>
                                    </c:otherwise>
                                    </c:choose>
                                    
                                    </div>
                                </div>
                                <div  style="float:right; padding-right: 120px; padding-top: 5px;" ><input type='button' value='Save' id='spouseSaveId'></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 childmargin paddingleftzeroxs">
                        <div class="panel panel-green">
                            <div class="panel-heading panelHead-green">
                                Child Details
                            </div>
                            
                            <div id='userdata'>
                            <table class="table table-bordered table-hover" id='itemContainer'>
                                    </table>
							</div>
                            <div class="panel-body">
                                <table class="table table-bordered table-hover" id="tab_logic">
                                    <thead>
                                        <tr >
                                            <!-- <th class="text-center checkboxfieldwidth" id="select-font-xs">
                                                Select
                                            </th>
                                            <th class="text-center photofieldwidth">
                                                Photo
                                            </th> -->
                                            <th class="text-center namewidth">
                                                Name
                                            </th>
                                            <th class="text-center aboutfieldwidth">
                                                About
                                            </th>
                                            <th class="text-center uploadphotofieldwidth">
                                                UploadPhoto
                                            </th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    
                                        <tr class='addedRows' id='addr0'>
                                            <!-- <td>
                                                <p class="checkboxpadding"><input type="checkbox" id="child_select" required aria-required="true" name="number" value="select"/></p>
                                            </td>
                                            <td>
                                                <img src="images/bird1.png" name="image" class="imageSpace photofieldwidth photofieldwidthxs"/>
                                            </td> -->
                                            <td>
                                                <p class="columnpadding"><input type="text"id="childNameId0" name='name0'  placeholder='Name' class="form-control"/></p>
                                            </td>
                                            <td>
                                                <p class="columnpadding"><input type="text" id="childAboutId0" name='about' placeholder='About' class="form-control"/></p>
                                            </td>
                                            <td>
                                                <p class="columnpadding"><input type="file" name='photo' id="childFileId0" placeholder='Uploadphoto' class="form-control"/></p>
                                            </td>
                                            <td>
                                                <p class="columnpadding"><input type="button" name='' value='Save' id="child_save0" placeholder='' class="ChildSave"/></p>
                                            </td>
                                        </tr>
                                        <!-- <tr id='addr1'></tr> -->
                                    </tbody>
                                </table>
                                <a id="add_row" class="btn btn-default pull-left">Add Row</a><a id='delete_row' class="pull-right btn btn-default">Delete Row</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 childmargin paddingleftzeroxs">
                        <div class="panel panel-darkBlue">
                            <div class="panel-heading panelHead-darkBlue">
                                Upload family Photos
                            </div>
                               <div id='userdata1'>
                            <table class="table table-bordered table-hover" id='itemContainer1'>
                                    </table>
							</div>
                            <div class="panel-body" id="paddingright-xs">
                                <div class="col-md-12 paddingzeroxs">
                                    <table class="table table-bordered table-hover" id="tab_logic_family_photos">
                                        <thead>
                                            <tr >
                                                <!-- <th class="text-center checkboxfieldwidth">
                                                    Select
                                                </th>
                                                <th class="text-center photofieldwidth"  >
                                                    Photo
                                                </th> -->
                                                <th class="text-center photouploadfieldwidth" id="uploadphotofont-xs">
                                                    Upload Photo
                                                </th>
                                                <th class="text-center" id="description">
                                                    Description
                                                </th>
                                                <th class="text-center privacy-field-width">
                                                    Public
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr id='family_photos0'>
                                                <!-- <td>
                                                    <p class="checkboxpadding"><input type="checkbox" name="number" value="select"/></p>
                                                </td>
                                                <td>
                                                    <img src="images/bird1.png" name="image" class="imageSpace photofieldwidth"/>
                                                </td> -->
                                                <td>
                                                    <p class="columnpadding"><input type="file"  name='photo'  placeholder='photo' id='familyPhoto0' class="form-control photouploadfieldwidth" /></p>
                                                </td>
                                                <td>
                                                    <p class="columnpadding"><input type="text" name='description' placeholder='Description' id='familyPhotoDesc0' class="form-control"/></p>
                                                </td>
                                                <td>
                                                    <p class="privacypadding"><input type="checkbox" name='privacy' placeholder='privacy' id='familyPhotoPublic0' class="form-control privacy-field-width" /></p>
                                                </td>
                                                <td>
                                                    <p class="privacypadding"><input type="button" value='Save' placeholder='' id='photoSaveId0'  class="SaveFamilyImage" /></p>
                                                </td>
                                           </tr>
                                            <tr id='family_photos1'></tr>
                                        </tbody>
                                    </table>
                                </div>
                                <a id="add_row_family_photos" class="btn btn-default pull-left">Add Row</a><a id='delete_row_family_photos' class="pull-right btn btn-default">Delete Row</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="col-md-12">
                            <!--<h3> Preview & Submit</h3>-->
                            <!-- <button class="btn btn-primary btn-md pull-right" id='form2_save' type="submit">Save</button> -->
                        </div>
                    </div>
                    <!--  <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Next</button> -->
                </div>
            </div>
        </div>
        <!--</div>-->
        <div class="row setup-content" id="step-3">
        </div>
        <div class="row setup-content" id="step-4">
        </div>
        <div class="row setup-content" id="step-5">
        </div>
        <div class="row setup-content" id="step-6">
        </div>
        
</div>


</body>
<script type="text/javascript">
$(document).ready(function(){
	//var rollNo1 = ${LoginBean.rollNo};
	//$("#reg_rollno").val(rollNo1);	
	//$("#reg_rollno").css('disabled', 'disabled');
	var childData = ${cList};
	if(childData != null){
		dispalyUserData(childData);	
	}
	var familyList = ${fList};
	if(familyList != null){
		displayFamilyData(familyList);
	}
})


</script>
</html>