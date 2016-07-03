/**
 * 
 */


function getPersonalInfo(pData) {
	$.each(pData,function(i,personalData){
		
		var spData = "";
		var chData = "";
		var fData = "";
		if(personalData.spouseName != ""){
			spData  = '<div class="spouseDetailSpace col-md-12" id="spousedetails-xs">'+
			'	<div class="panel panel-voilet">'+
			'		<div class="panel-heading panelHead-voilet">Spouse Details</div>'+
			'		<div class="panel-body" id="spousepanelbody-xs">'+
			'			<img class="col-md-4 col-xs-12" src='+personalData.spousePhoto+' />'+
			'			<div class="col-md-8 col-xs-12">'+
			'				<div class="col-md-12"></div>'+
			'				<div class="clear-fix"></div>'+
			'				<div class="col-md-12 col-xs-12" id="spousedesc-xs">'+
			'					<span class="font-style-heading1">'+personalData.spouseName+'</span><br>'+
			'					<br>'+
			'					<p>'+personalData.aboutSouse+'</p>'+
			'				</div>'+
			'			</div>'+
			'		</div>'+
			'	</div>'+
			'</div>';
		}
		if(personalData.childName != ""){
		chData = '<div class="childrenDetailSpace col-md-12" id="childdetails-xs">'+
		'	<div class="panel panel-green">'+
		'		<div class="panel-heading panelHead-green">Children Details</div>'+
		'		<div class="panel-body" id="childrenpanelbody-xs">'+
		'			<img class="col-md-4 col-xs-12" src="images/bird.jpg" />'+
		'			<div class="col-md-8 col-xs-12">'+
		'				<div class="col-md-6"></div>'+
		'				<div class="col-md-6"></div>'+
		'				<div class="clear-fix"></div>'+
		'				<div class="col-md-12 col-xs-12" id="childrendesc-xs">'+
		'					<span class="font-style-heading1">Gujjala Anjaneya vara'+
		'						prasad</span><br>'+
		'					<br>'+
		'					<p>data</p>'+
		'				</div>'+
		'			</div>'+
		'		</div>'+
		'	</div>'+
		'</div>';
		}
		if(personalData.childName != ""){
			fData = '<div class="familygallerySpace col-md-12" id="familydetails-xs">'+
			'	<div class="panel panel-darkBlue">'+
			'		<div class="panel-heading panelHead-darkBlue">Family gallery</div>'+
			'		<div class="panel-body" id="familyid">'+
			'			<div class="carousel slide row" data-ride="carousel"'+
			'				data-type="multi" data-interval="2000" id="fruitscarousel">'+
			'				<div class="carousel-inner">'+
			'					<div class="item active">'+
			'						<div class="col-md-3 col-sm-4 col-xs-12 familygalleryxs">'+
			'							<a href="#"><img src="images/students.jpg"'+
			'								class="img-responsive"></a>'+
			'						</div>'+
			'					</div>'+
			'					<div class="item">'+
			'						<div class="col-md-3 col-sm-4 col-xs-12 familygalleryxs">'+
			'							<a href="#"><img src="images/students.jpg"'+
			'								class="img-responsive"></a>'+
			'						</div>'+
			'					</div>'+
			'					<div class="item">'+
			'						<div class="col-md-3 col-sm-4 col-xs-12 familygalleryxs">'+
			'							<a href="#"><img src="images/two.jpg"'+
			'								class="img-responsive"></a>'+
			'						</div>'+
			'					</div>'+
			'					<div class="item">'+
			'						<div class="col-md-3 col-sm-4 col-xs-12 familygalleryxs">'+
			'							<a href="#"><img src="images/two.jpg"'+
			'								class="img-responsive"></a>'+
			'						</div>'+
			'					</div>'+
			'					<div class="item active">'+
			'						<div class="col-md-3 col-sm-4 col-xs-12 familygalleryxs">'+
			'							<a href="#"><img src="images/students.jpg"'+
			'								class="img-responsive"></a>'+
			'						</div>'+
			'					</div>'+
			'				</div>'+
			'				<a class="left carousel-control" href="#fruitscarousel"'+
			'					data-slide="prev"><i'+
			'					class="glyphicon glyphicon-chevron-left"></i></a> <a'+
			'					class="right carousel-control" id="rightcor"'+
			'					href="#fruitscarousel" data-slide="next"><i'+
			'					class="glyphicon glyphicon-chevron-right"></i></a>'+
			'			</div>'+
			'		</div>'+
			'	</div>'+
			'</div>';
		}
	var htm = '<div class="panel panel-sky " id="marginbtm"><div class="panel-heading panelHead-sky scrollToMyContent" data-parent="#accordion" data-toggle="collapse" href="#collapse1"> <div class="col-md-3 col-xs-12" id="grid-rollnoxs">'
			+ '<img src='+personalData.oldPhotoPath+' class="imageSpace col-md-6 col-xs-6 gridimage" />'
			+ '<img src='+personalData.newPhotoPath+' class="imageSpace col-md-6 col-xs-6 gridimage" /> </div>'
			+ '<div class="col-md-1 userrollno" id="grid-rollnoxs">'+personalData.rollNo+'</div>'
			+ '<div class="col-md-3 usernamegrid" id="grid-namexs">'+personalData.name+'</div>'
			+ '<div class="col-md-1 usercontact" id="grid-contactxs">'+personalData.contactNo+'</div>'
			+ '<div class="col-md-2 useremail" id="grid-emailxs">'+personalData.email+'</div>'
			+ '<div class="col-md-2 userlivs" id="grid-livesinxs">'+personalData.city+' '+personalData.country+'</div></div>';
	
	
	var data = '<div class="panel-body collapse panel-collapse collapse" id="collapse1">'+
	'<div class="userDetailSpace col-md-12" id="userdetails-panelxs">'+
	'	<div class="panel panel-orange">'+
	'		<div class="panel-heading panelHead-orange">'+personalData.rollNo+' - '+personalData.name+'</div>'+
	'		<div class="panel-body">'+
	'			<img class="col-md-4 col-xs-6" src='+personalData.oldPhotoPath+'></img>'+ 
	'<img class="col-md-4 col-xs-6" src='+personalData.newPhotoPath+' />'+
	'		<div class="col-md-4 col-xs-12 userdetailsclass"'+
		'			id="userdetails-id">'+
	'				<p class="font-style-heading1">'+personalData.name+'</p>'+
	'				<p class="font-style-heading2">'+personalData.email+'</p>'+
	'				<p class="font-style-heading3">'+personalData.contactNo+'</p>'+
	'				<p class="font-style-heading4">'+personalData.dateOfBirth+'</p>'+
	'			</div>'+
	'			<div class="col-md-12 col-xs-12" id="userdescription">'+
	'				<p>'+personalData.aboutYou+'</p>'+
	'			</div>'+
	'		</div>'+
	'	</div>'+
	'</div>'+
	'<div class="clear-fix"></div>'+spData+'<div class="clear-fix"></div>'+chData+'<div class="clear-fix"></div>'+fData+'</div>'+
'</div></div><div class="clear-fix"></div>';
	$("#accordion").append(htm).append(data);
	});
}
