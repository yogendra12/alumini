function eventsRegistration() {
	var eventName = $('#event_name').val();
	var eventDate = $('#event_date').val();
	var eventDesc = $('#event_desc').val();

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
	/*
	 * $.ajax({ method: "POST", url : "eventRegisterUser", data:
	 * JSON.stringify(json), contentType: 'multipart/form-data', processData:
	 * false, success: function(response){ alert(response); }, cache: false });
	 */
}
$(document).on('click', '#eventButton', function() {
	eventsRegistration();
});


function openEventReg(id){
	jQuery.fn.makeRequest	
}