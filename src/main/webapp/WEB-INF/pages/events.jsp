<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<script src="js/eventsReg.js"></script>
<div class="col-md-12 zeropaddingxs">
	<div class=" marTop10 panel panel-primary" id="padding-top-xs"
		style="border-radius: 0; margin-bottom: 0 !important;">
		<div class="panel-heading minHeight50"
			style="font-size: 20px; align: center; text-align: center; background-color: #b733ad; border-color: #b733ad">
			Events</div>
		<div class="panel-body">
			<div class="panel panel-voilet">
				<div class="panel panel-body" id='panelBodyId' style="padding: 0px;">
										<div class="col-md-12" style="padding: 5px;">
						<div class="col-md-3">
							<img class="img-responsive" src="images/three.jpg" />
						</div>
						<div class="col-md-9">
							<span class="events-list-date">14.06.2016</span>
							<h4>
								<a href="#" title="Insert event title here"> Insert event
									title here </a>
							</h4>
							<p>EMA organizes various events/projects/conferences in
								different countries ranging from those focused on developing
								additional soft skills of our membership to those focused on
								raising awareness of various issues affecting our societies. Two
								examples of conferences organized through EMA are Geomundus and
								Humanities.</p>
						</div>
					</div>
					<div class="col-md-12" style="padding: 5px;">
						<div class="col-md-3">
							<img class="img-responsive" src="images/neww.jpg" />
						</div>
						<div class="col-md-9">
							<span class="events-list-date">14.06.2016</span>
							<h4>
								<a href="#" title="Insert event title here"> Insert event
									title here </a>
							</h4>
							<p>EMA organizes various events/projects/conferences in
								different countries ranging from those focused on developing
								additional soft skills of our membership to those focused on
								raising awareness of various issues affecting our societies. Two
								examples of conferences organized through EMA are Geomundus and
								Humanities.</p>
						</div>
					</div>
					<div class="col-md-12" style="padding: 5px;">
						<div class="col-md-3">
							<img class="img-responsive" src="images/neww.jpg" />
						</div>
						<div class="col-md-9">
							<span class="events-list-date">14.06.2016</span>
							<h4>
								<a href="#" title="Insert event title here"> Insert event
									title here </a>
							</h4>
							<p>EMA organizes various events/projects/conferences in
								different countries ranging from those focused on developing
								additional soft skills of our membership to those focused on
								raising awareness of various issues affecting our societies. Two
								examples of conferences organized through EMA are Geomundus and
								Humanities.</p>
						</div>
					</div>
					<div class="col-md-12" style="padding: 5px;">
						<div class="col-md-3">
							<img class="img-responsive" src="images/neww.jpg" />
						</div>
						<div class="col-md-9">
							<span class="events-list-date">14.06.2016</span>
							<h4>
								<a href="#" title="Insert event title here"> Insert event
									title here </a>
							</h4>
							<p>EMA organizes various events/projects/conferences in
								different countries ranging from those focused on developing
								additional soft skills of our membership to those focused on
								raising awareness of various issues affecting our societies. Two
								examples of conferences organized through EMA are Geomundus and
								Humanities.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

$(document).ready(function(){
	var eventList ='${eventsList}';
	var html = "";
	if(eventList != ""){
		var obj = JSON.parse(eventList);
		$('#panelBodyId').html('');
		$.each(obj, function(key,val){
			 html = '<div class="col-md-12" style="padding: 5px;"><div class="col-md-3">'+
			'<img class="img-responsive" src='+val.eventPhotosPath+'></div><div class="col-md-9">'+
			'<span class="events-list-date">'+val.eventDate+'</span><h4>'+
			'<a href="#" title="Insert event title here" id='+val.id+' onclick="openEventReg(this.id);"> '+val.eventName+' </a></h4><p>'+val.eventDescription+'</p></div></div>';
			 $('#panelBodyId').append(html);	
		});
	}
});
</script>