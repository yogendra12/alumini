<html>
<head>
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
function importCsv(){
	var ext = $("#import_csv").val().split(".").pop().toLowerCase();
	if($.inArray(ext, ["csv"]) == -1) {
	/* 	$('#smsnchat_error  > p').text(SELECT_CSV_FILE);
		$('#smsnchat_error').css("display","block");
		setInterval(function(){$("#smsnchat_error").fadeOut();}, 5000); */
		alert('choose csv file only..');
		return false;
	}
	
	var csvval= "";
	var reader = new FileReader();
	reader.readAsText($("#import_csv")[0].files[0]);
	
	reader.onload = function(event) {
		var size = $("#import_csv")[0].files[0].size/(1024*1024);
		//console.log("csv file size   "+size);
		if(parseFloat(size) > 0.5){
			/* $('#smsnchat_error  > p').text(BIG_CSV);
			$('#smsnchat_error').css("display","block");
			setInterval(function(){$("#smsnchat_error").fadeOut();}, 5000); */
			alert('chose small csv files..');
			return false;
		}
		var toPhones = [];
		csvval=event.target.result.split("\n");
		for(var i=1;i<csvval.length;i++) {
			var csvvalue=csvval[i].split(",");
			var csvvalue = csvval[i].split(",");
			var phone = $.trim(csvvalue[0]);
			var name = $.trim(csvvalue[1]);
			toPhones.push({"rollNo":phone,"name":name});
			}
		if (toPhones.length > 0){
			$.ajax({   
				method: 'POST',			
				   url: 'importRollCSV.htm',
				   data: "jso="+JSON.stringify(toPhones), 
				   success: function(data) {
			/* jQuery.fn.makeRequestWithContent('POST', 'application/json',  "rest/twilio/add/number",
					JSON.stringify( {"username":sessionContactObj.userName, "password":sessionContactObj.password,"ToPhones":toPhones}), function (data) { */
				if (data != null && data != ""){
					
					}
				}
			});
		}else{
			//no valid contacts.
		}
	};
}
	
function importFacCsv(){
	
	var ext = $("#import_fac_csv").val().split(".").pop().toLowerCase();

	if($.inArray(ext, ["csv"]) == -1) {
	/* 	$('#smsnchat_error  > p').text(SELECT_CSV_FILE);
		$('#smsnchat_error').css("display","block");
		setInterval(function(){$("#smsnchat_error").fadeOut();}, 5000); */
		alert('choose csv file only..');
		return false;
	}
	
	var csvval= "";
	var reader = new FileReader();
	reader.readAsText($("#import_fac_csv")[0].files[0]);
	
	reader.onload = function(event) {
		var size = $("#import_fac_csv")[0].files[0].size/(1024*1024);
		//console.log("csv file size   "+size);
		if(parseFloat(size) > 0.5){
			/* $('#smsnchat_error  > p').text(BIG_CSV);
			$('#smsnchat_error').css("display","block");
			setInterval(function(){$("#smsnchat_error").fadeOut();}, 5000); */
			alert('chose small csv files..');
			return false;
		}
		var toPhones = [];
		csvval=event.target.result.split("\n");
		for(var i=1;i<csvval.length;i++) {
			var csvvalue=csvval[i].split(",");
			var csvvalue = csvval[i].split(",");
			var fId = $.trim(csvvalue[0]);
			var year = $.trim(csvvalue[1]);
			var sub = $.trim(csvvalue[2]);
			var fName = $.trim(csvvalue[3]);
				toPhones.push({"fId":fId,"year":year, "subject":sub, "name":fName});
			}
		if (toPhones.length > 0){
			$.ajax({   
				method: 'POST',			
				   url: 'importFacCsv',
				   data: "jso="+JSON.stringify(toPhones), 
				   success: function(data) {
			/* jQuery.fn.makeRequestWithContent('POST', 'application/json',  "rest/twilio/add/number",
					JSON.stringify( {"username":sessionContactObj.userName, "password":sessionContactObj.password,"ToPhones":toPhones}), function (data) { */
				if (data != null && data != ""){
					
					}
				}
			});
		}else{
			//no valid contacts.
		}
	};
}
</script>
</head>
<body>
	<!--  -->
 	<b>Import Roll CSV: </b>
	<input type='file' id='import_csv' name='csv' onchange='importCsv();'>
	 	<b>Import Fac CSV: </b> 
	<input type='file' id='import_fac_csv' name='csv' onchange='importFacCsv();'> 
	
	
	<!-- <div class="col-md-12 paddingzeroxs">
            <div class=" marTop10 panel panel-primary" id="margintop-xs" style="border-radius: 0;margin-bottom: 0 !important;">
                <div class="panel-heading minHeight50" style="font-size:20px;align:center;text-align: center;background-color:#8B008B">
                    Faculty Details
                </div>
                <div class="panel-body">
                    <div class="panel panel-sky">
                        <div class="table-responsive">
                            <table class="table">
                                <thead class="tablehead" style="border: 1px solid orange;">
                                    <tr>
                                        <th class="year">Select</th>
                                        <th class="year">Year</th>
                                        <th class="subject">Subject</th>
                                        <th class="faculty">Faculty</th>
                                        <th class="contact">Contact</th>
                                        <th class="email">Email</th>
                                        <th class="photo">Photo</th>
                                        <th class="about">About</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                    <td><input type="checkbox" name="number" value="select"/></td>      
                                      <td>1st year</td>
                                      <td>Mathematics-I</td>
                                      <td><input id="faculty_name" name="faculty_name" type="text" placeholder="Name" class="form-control input-md"></td>
                                      <td><input id="faculty_contact" name="faculty_contact" type="text" placeholder="Contact" class="form-control input-md"></td>
                                      <td><input id="faculty_email" name="faculty_email" type="text" placeholder="Email" class="form-control input-md"></td>
                                      <td>
                                              <img src="images/bird.jpg" name="image" class="imageSpace"/>
                                              <input type="file"  class="input-file">
                                      </td>
                                              <td><textarea id="faculty_about" name="faculty_about" type="textarea" rows="2" cols="30" placeholder="About Faculty" class="form-control input-md"></textarea></td>
                                    </tr>
                                    <tr>
                                    <td><input type="checkbox" name="number" value="select"/></td>      
                                      <td>1st year</td>
                                      <td>Mathematics-II</td>
                                      <td><input id="faculty_name" name="faculty_name" type="text" placeholder="Name" class="form-control input-md"></td>
                                      <td><input id="faculty_contact" name="faculty_contact" type="text" placeholder="Contact" class="form-control input-md"></td>
                                      <td><input id="faculty_email" name="faculty_email" type="text" placeholder="Email" class="form-control input-md"></td>
                                      <td>
                                              <img src="images/bird.jpg" name="image" class="imageSpace"/>
                                              <input type="file"  class="input-file">
                                      </td>
                                              <td><textarea id="faculty_about" name="faculty_about" type="textarea" rows="2" cols="30" placeholder="About Faculty" class="form-control input-md"></textarea></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
</body>
</html>