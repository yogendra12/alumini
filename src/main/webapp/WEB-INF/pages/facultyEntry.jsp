<div class="col-md-12">
   
   <div class=" marTop10 panel panel-primary" style="border-radius: 0;margin-bottom: 0 !important;">
   <div class="panel-heading minHeight50" style="font-size:20px;align:center;text-align: center;background-color:#8B008B">
			Faculty Details
		</div>
   <div class="panel-body">
		<div class="panel panel-sky">
				
				
<div class="table-responsive">
  <table class="table" id="myTable">
    <thead class="tablehead" style="border: 1px solid orange;">
      <tr>
        <th class="year">Year</th>
        <th class="subject">Subject</th>
        <th class="faculty">Faculty</th>
        <th class="contact">Contact</th>
        <th class="email">Email</th>
        <th class="photo">Photo</th>
		<th class="about">About</th>
    </tr></thead>
    <tbody id="itemContainer" >
    
    </tbody>
  </table>
  </div>
		
   </div>
	<div class="col-sm-12" id="nextbutton">
        <!-- <button class="btn btn-primary nextBtn btn-md pull-right marLeft7" type="button">Next</button> -->
        <!-- <button class="btn btn-primary btn-md pull-right" type="button" onclick="saveFaculty()">Save</button>   -->  
    </div>
   </div>
   </div>
   </div>
   <script src="js/ajax.js"></script>
   <script type="text/javascript">
   $(document).ready(function(){
var listOrders1 =${facultyOrders};
display(listOrders1);
   });

function display(listOrders1){
	if (listOrders1 != null){
		$("#itemContainer tr").remove();
		$("#itemContainer tr td").remove();
		$.each(listOrders1, function(i, orderObj) {
			var displayImage='';
			 if(orderObj.facultyName == null){
				 orderObj.facultyName = "";
			 }
			 if(orderObj.contact == null){
				 orderObj.contact = "";
			 }
			 if(orderObj.email == null){
				 orderObj.email = "";
			 }
			 if(orderObj.aboutFaculty == null){
				 orderObj.aboutFaculty = "";
			 }
			 if(orderObj.facultyPhotoPath != null){
				 displayImage ="<img src='"+orderObj.facultyPhotoPath+"' name='image' class='imageSpace'>"; 
			 }
			 
			var tblRow ="<tr>"
				/* +"<td><input  type='checkbox' class='check_class'  value='"+orderObj.facultyId+"' ></td>" */
		       +" <td>"+orderObj.year+"</td>"
		       +" <td>"+orderObj.subject+"</td>"
		       +"<td><input id='"+orderObj.facultyId+"fname' value='"+orderObj.facultyName+"' name='faculty_name' type='text' placeholder='Name' class='form-control input-md'></td>"
		        +"<td><input id='"+orderObj.facultyId+"contact' value='"+orderObj.contact+"' name='faculty_contact' type='text' placeholder='Contact' class='form-control input-md'></td>"
		        +"<td><input id='"+orderObj.facultyId+"email' value='"+orderObj.email+"' name='faculty_email' type='text' placeholder='Email' class='form-control input-md'></td>"
		        +"<td>"
		        +displayImage
		        	+"<input id='"+orderObj.facultyId+"fimage' type='file' class='input-file'>"
		        +"</td>"
				+"<td><textarea id='"+orderObj.facultyId+"aboutFaculty' placeholder='About Faculty'  name='faculty_about' type='textarea' rows='2' cols='30' class='form-control input-md' >"+orderObj.aboutFaculty+"</textarea></td>"
				+"<td><input id="+orderObj.facultyId+" type='button' class='check_class'  value='Save' onclick ='saveFaculty(this.id)'  ></td>"
		      +"</tr>";	      
		      tblRow=  tblRow.replace(/\"/g, "");
					$("#itemContainer").append(tblRow);
		});
					}
	
}

/* $(".check_class").click(function() {
	  $(".check_class").attr("checked", false); //uncheck all checkboxes
	  $(this).attr("checked", true);  //check the clicked one
	}); */
	
	
	
	

function saveFaculty(id){
	//var id = $('input:checkbox:checked').val();
	var fname=$("#"+id+"fname").val();
	var contact=$("#"+id+"contact").val();
	var email=$("#"+id+"email").val();
	var aboutFaculty=$("#"+id+"aboutFaculty").val();
	var fimage = $("#"+id+"fimage")[0].files[0];
	var formData = new FormData();
    
    formData.append('file', fimage);
    formData.append('id',id);
    formData.append('fname',fname);
    formData.append('contact',contact);
    formData.append('email',email);
    formData.append('aboutFaculty',aboutFaculty);
    jQuery.fn.makeMultipartRequest('POST', "facultyUpdate", false, formData, false, 'json', function(data){
        console.log(data);
        display(data); 
});
	/* $.ajax({
		type : "POST",
		url : "facultyUpdate",
		data : {
			formData:formData,
		},
				success : function(responce) {
					if(responce != null){
						
					//	display(responce); 
						//alert(responce);
					}
					
				}
	}); */

}
	 
</script>
   
