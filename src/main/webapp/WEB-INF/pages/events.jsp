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
			style="font-size: 20px; align: center; text-align: center; background-color: #b733ad; border-color: #b733ad">Events</div>
		<div class="panel-body" style="background:beige;">
			<div class="panel panel-voilet">
				<div class="panel panel-body"  id='panelBodyId' style="padding: 0px;background:beige;">
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

$(document).ready(function(){
	function pad(s, width, character) {
	    return new Array(width - s.toString().length + 1).join(character) + s;
	}
	
	var eventList =${eventsList};
	var html = "";
	if(eventList != ""){
		$('#panelBodyId').html('');
		$.each(eventList, function(key,val){
			var maxDate = new Date(val.eventDate);
			var maxDateFormatted =
			    maxDate.getFullYear() +
			    '/' + pad(maxDate.getMonth() + 1, 2, '0') +
			    '/' + pad(maxDate.getDate(), 2, '0');
			 html = '<div class="col-md-12" style="padding: 5px;"><div class="col-md-3">'+
			'<img class="img-responsive" src='+val.eventPhotosPath+'></div><div class="col-md-9">'+
			'<span class="events-list-date">'+maxDateFormatted+'</span><h4>'+
			'<a href="#" title="Insert event title here" id='+val.eventId+' onclick="openEventReg(this.id);"> '+val.eventName+' </a></h4><p>'+val.eventDescription+'</p></div>'+
			'<input type="button" id='+val.eventId+' value="Update" onclick="openEventReg(this.id);"></div>';
			 $('#panelBodyId').append(html);	
		});
	}
});
function  openEventReg(id){
	var res = null;
	var href = $(location).attr("href");
	var dummy = href.substr(href.lastIndexOf('/') +1);
	res = href.replace(dummy, "eventsregHome?eventId="+id);
	window.location.replace(res);
}
</script>