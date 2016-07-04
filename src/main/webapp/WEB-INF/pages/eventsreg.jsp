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
<meta charset="utf-8" />
<title>New Event Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/EventReg.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<script src="js/login.js"></script>
<link rel="stylesheet" href="css/commonStyles.css">
<script src="js/eventsReg.js"></script>
<script src="js/datepick.js"></script>
 <script src="js/ajax.js"></script>
<link rel="stylesheet" href="css/datepicker.css">
<script src="js/bootstrap-datepicker.js"></script>
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
</head>
<body>
	<script type="text/javascript">
	var eventId=0;
	$(document).ready(function(){
		var eventList1 =${eventsList1};
		function pad(s, width, character) {
		    return new Array(width - s.toString().length + 1).join(character) + s;
		}

		$("#event_form").attr('action', "eventRegisterUser");
		if (eventList1 != null){
			$.each(eventList1, function(key,val){
				eventId = val.eventId;
				$("#event_name").val(val.eventName);
				var maxDate = new Date(val.eventDate);
				var maxDateFormatted =
				    maxDate.getFullYear() +
				    '/' + pad(maxDate.getMonth() + 1, 2, '0') +
				    '/' + pad(maxDate.getDate(), 2, '0');
				
				$("#event_date").val(maxDateFormatted);
				$("#event_desc").val(val.eventDescription);
				$("#imagePath").attr('src', val.eventPhotosPath);
				$("#event_form").attr('action', "eventUpdateUser");
				
				
			});
		}
	});
		$(document).ready(function() {
			$('#event_date').datepicker({
				format : "yyyy/mm/dd"
			});
		});
		
		
	</script>



	<div class="container" id="registrationbody">
		<!-- <div class="stepwizard">
			<div class="stepwizard-row setup-panel">
				<div class="stepwizard-step">
					<a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
					<p>Your Details</p>
				</div>
				<div class="stepwizard-step">
					<a href="#step-2" type="button" class="btn btn-default btn-circle"
						disabled="disabled">2</a>
					<p>Family Details</p>
				</div>
			</div>
		</div> -->
		<%-- <div class="col-md-12 marLeft7 marginTop15">
			<div class="row setup-content" id="step-1">
				<div class="panel panel-orange">
					<div class="panel-heading panelHead-orange">New Event</div>
					<div class="panel-body"><div id="messageId"></div>
						<form  id="event_form" onsubmit="return false;" enctype="multipart/form-data" method="post" action="">
		<div class="panel panel-orange"> --%>
			<!-- 						<div class="panel-heading panelHead-orange">New Event</div> -->
		<div class="panel-heading minHeight50" style="font-size: 20px; align: center; text-align: center; background-color: cadetblue; border-color: cadetblue">
			New Event</div>
					<div class="panel-body" style='background: beige'>
						<form  onsubmit="return false;" enctype="multipart/form-data" method="post">
							<div class="col-xs-12 col-xs-6" id="your-details-div">
								<div class="col-md-12 paddingleftzeroxs">
									<!-- Select Basic -->
									<div class="form-group">
										<label class="col-md-4 control-label" for="service_name">Event
											Name</label>
										<div class="col-md-5">
											<input id="event_name" name="service_name" type="text"
												placeholder="Event Name" required aria-required="true" class="form-control input-md">
										</div>
									</div>
									<br> <br>
									<!-- Text input-->
									<div class="form-group">
										<label class="col-md-4 control-label" for="ln">Event
											Date</label>
										<div class="col-md-5">
											<input id="event_date" name="ln" type="text"
												placeholder="dd/mm/yyy" class="form-control input-md">
										</div>
									</div>
									<br> <br>
									<div class="form-group">
										<label class="col-md-4 control-label" for="ln">Event
											Photo(s)</label>
										<div class="col-md-5">
										<img id="imagePath" src='' name='image' class='imageSpace'>
											<input id="event_photo" type="file" class="input-file"
												placeholder="Event Photo(s)">
											<div
												style="margin-left: 5px; font-size: 12px; font-weight: bold; text-decoration-color: red;">*To
												upload two or more photo's zip it and select</div>
										</div>
										<br>
									</div>
									<br> <br>
									<div class="form-group">
										<label class="col-md-4 control-label" for="service_name">About
											Event</label>
										<div class="col-md-5">
											<textarea id="event_desc" name="service_name" 
												rows="4" cols="30" placeholder="About Event" 
												class="form-control input-md"></textarea>
										</div>
									</div>
									<br> <br>
								</div>
							</div>
					
					<div class="col-sm-12 col-xs-12" id="nextbutton">
						<button class="btn btn-primary btn-md pull-right" type="button"
							id="eventButton">Save</button>
					</div>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--</div>-->
	<div class="row setup-content" id="step-3"></div>
	<div class="row setup-content" id="step-4"></div>
	<div class="row setup-content" id="step-5"></div>
	<div class="row setup-content" id="step-6"></div>
	

</body>
</html>


