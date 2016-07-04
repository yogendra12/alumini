<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
  
      
        <style>
            .carousel-inner > .item > img,
            .carousel-inner > .item > a > img {
                width:100%;    
            }
        </style>

<div class="container" id="carosel">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
		</ol>
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="https://s3-us-west-2.amazonaws.com/alumini-public-images/ema_whd_2016.jpg" alt="Chania"
					class="img-responsive">
			</div>
			<div class="item">
				<img src="https://s3-us-west-2.amazonaws.com/alumini-public-images/startseite_jenni.JPG" alt="Chania">
			</div>
		</div>
		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev" style="width: 43px;"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next" style="width: 43px;"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
</div>
<div class="col-md-12">
	<div class=" marTop10 panel panel-primary"
		style="border-radius: 0; margin-bottom: 0 !important;">
		<div class="panel-heading minHeight50">
			<div class="col-md-3 homeimages-heading">Images</div>
			<div class="col-md-1 rollno">Roll No</div>
			<div class="col-md-2 name">Name</div>
			<div class="col-md-2 contact">Contact</div>
			<div class="col-md-2 email">Email</div>
			<div class="col-md-2 livesin">Lives in</div>
		</div>
		<div class="panel-body panel-group" id="accordion">
			<!-- first div -->
			<!-- <div class="panel panel-sky" id="marginbtm">
				<div class="panel-heading panelHead-sky scrollToMyContent"
					data-parent="#accordion" data-toggle="collapse" href="#collapse1">
					<div class="col-md-3 col-xs-12" id="grid-rollnoxs">
						<img src="images/bird1.png"
							class="imageSpace col-md-6 col-xs-6 gridimage" /> <img
							src="images/bird.jpg"
							class="imageSpace col-md-6 col-xs-6 gridimage" />
					</div>
					<div class="col-md-1 userrollno" id="grid-rollnoxs">87EC101</div>
					<div class="col-md-3 usernamegrid" id="grid-namexs">Gujjala
						Anjaneya vara prasad</div>
					<div class="col-md-1 usercontact" id="grid-contactxs">
						91+9878675687</div>
					<div class="col-md-2 useremail" id="grid-emailxs">
						GujjalaAnjaneyavaraprasad@gmail.com</div>
					<div class="col-md-2 userlivs" id="grid-livesinxs">Bangalore
					</div>
				</div>
				<div class="panel-body collapse panel-collapse collapse"
					id="collapse1">
					<div class="userDetailSpace col-md-12" id="userdetails-panelxs">
						<div class="panel panel-orange">
							<div class="panel-heading panelHead-orange">User Details</div>
							<div class="panel-body">
								<img class="col-md-4 col-xs-6" src="images/bird1.png" /> <img
									class="col-md-4 col-xs-6" src="images/bird.jpg" />
								<div class="col-md-4 col-xs-12 userdetailsclass"
									id="userdetails-id">
									<p class="font-style-heading1">Gujjala Anjaneya vara prasad</p>
									<p class="font-style-heading2">userone@gmail.com</p>
									<p class="font-style-heading3">9979889798</p>
									<p class="font-style-heading4">mm-dd-yyyy</p>
								</div>
								<div class="col-md-12 col-xs-12" id="userdescription">
									<p>EMA organizes various events/projects/conferences in
										different countries ranging from those focused on developing
										additional soft skills of our membership to those focused on
										raising awareness of various issues affecting our societies.
										Two examples of conferences organized through EMA are
										Geomundus and Humanities. By opting to become an EMA Learning
										Partner, your company or institution can take part in those
										leadership development conferences by doing a presentation,
										inspiring and empowering youth through training. EMA organizes
										various events/projects/conferences in different countries
										ranging from those focused on developing additional soft
										skills of our membership to those focused on raising awareness
										of various issues affecting our societies. Two examples of
										conferences organized through EMA are Geomundus and
										Humanities. By opting to become an EMA Learning Partner, your
										company or institution can take part in those leadership
										development conferences by doing a presentation, inspiring and
										empowering youth through training. EMA organizes various
										events/projects/conferences in different countries ranging
										from those focused on developing additional soft skills of our
										membership to those focused on raising awareness of various
										issues affecting our societies. Two examples of conferences
										organized through EMA are Geomundus and Humanities. By opting
										to become an EMA Learning Partner, your company or institution
										can take part in those leadership development conferences by
										doing a presentation, inspiring and empowering youth through
										training. EMA organizes various events/projects/conferences in
										different countries ranging from those focused on developing
										additional soft skills of our membership to those focused on
										raising awareness of various issues affecting our societies.
										Two examples of conferences organized through EMA are
										Geomundus and Humanities. By opting to become an EMA Learning
										Partner, your company or institution can take part in those
										leadership development conferences by doing a presentation,
										inspiring and empowering youth through training.</p>
								</div>
							</div>
						</div>
					</div>
					<div class="clear-fix"></div>
					<div class="spouseDetailSpace col-md-12" id="spousedetails-xs">
						<div class="panel panel-voilet">
							<div class="panel-heading panelHead-voilet">Spouse Details</div>
							<div class="panel-body" id="spousepanelbody-xs">
								<img class="col-md-4 col-xs-12" src="images/bird.jpg" />
								<div class="col-md-8 col-xs-12">
									<div class="col-md-12"></div>
									<div class="clear-fix"></div>
									<div class="col-md-12 col-xs-12" id="spousedesc-xs">
										<span class="font-style-heading1">Gujjala Anjaneya vara
											prasad</span><br>
										<br>
										<p>EMA organizes various events/projects/conferences in
											different countries ranging from those focused on developing
											additional soft skills of our membership to those focused on
											raising awareness of various issues affecting our societies.
											Two examples of conferences organized through EMA are
											Geomundus and Humanities. By opting to become an EMA Learning
											Partner, your company or institution can take part in those
											leadership development conferences by doing a presentation,
											inspiring and empowering youth through training.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="clear-fix"></div>
					<div class="childrenDetailSpace col-md-12" id="childdetails-xs">
						<div class="panel panel-green">
							<div class="panel-heading panelHead-green">Children Details</div>
							<div class="panel-body" id="childrenpanelbody-xs">
								<img class="col-md-4 col-xs-12" src="images/bird.jpg" />
								<div class="col-md-8 col-xs-12">
									<div class="col-md-6"></div>
									<div class="col-md-6"></div>
									<div class="clear-fix"></div>
									<div class="col-md-12 col-xs-12" id="childrendesc-xs">
										<span class="font-style-heading1">Gujjala Anjaneya vara
											prasad</span><br>
										<br>
										<p>EMA organizes various events/projects/conferences in
											different countries ranging from those focused on developing
											additional soft skills of our membership to those focused on
											raising awareness of various issues affecting our societies.
											Two examples of conferences organized through EMA are
											Geomundus and Humanities. By opting to become an EMA Learning
											Partner, your company or institution can take part in those
											leadership development conferences by doing a presentation,
											inspiring and empowering youth through training.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="clear-fix"></div>
					<div class="familygallerySpace col-md-12" id="familydetails-xs">
						<div class="panel panel-darkBlue">
							<div class="panel-heading panelHead-darkBlue">Family
								gallery</div>
							<div class="panel-body" id="familyid">
								The main div for carousel
								<div class="carousel slide row" data-ride="carousel"
									data-type="multi" data-interval="2000" id="fruitscarousel">
									<div class="carousel-inner">
										<div class="item active">
											<div class="col-md-3 col-sm-4 col-xs-12 familygalleryxs">
												<a href="#"><img src="images/students.jpg"
													class="img-responsive"></a>
											</div>
										</div>
										<div class="item">
											<div class="col-md-3 col-sm-4 col-xs-12 familygalleryxs">
												<a href="#"><img src="images/students.jpg"
													class="img-responsive"></a>
											</div>
										</div>
										<div class="item">
											<div class="col-md-3 col-sm-4 col-xs-12 familygalleryxs">
												<a href="#"><img src="images/two.jpg"
													class="img-responsive"></a>
											</div>
										</div>
										<div class="item">
											<div class="col-md-3 col-sm-4 col-xs-12 familygalleryxs">
												<a href="#"><img src="images/two.jpg"
													class="img-responsive"></a>
											</div>
										</div>
										<div class="item active">
											<div class="col-md-3 col-sm-4 col-xs-12 familygalleryxs">
												<a href="#"><img src="images/students.jpg"
													class="img-responsive"></a>
											</div>
										</div>
									</div>
									<a class="left carousel-control" href="#fruitscarousel"
										data-slide="prev"><i
										class="glyphicon glyphicon-chevron-left"></i></a> <a
										class="right carousel-control" id="rightcor"
										href="#fruitscarousel" data-slide="next"><i
										class="glyphicon glyphicon-chevron-right"></i></a>
								</div>
								The main div for carousel
							</div>
						</div>
					</div>
				</div>
			</div> -->
			<!-- first div grid div ends-->
			 
			<!--second div grid ends -->
			<!-- third grid div ends -->
			<!-- fourth grid div ends -->
		</div>
	</div>
</div>
<script >
var lRollNo;
$(document).ready(function(){
	 var personalData = ${listPersonal};
	 lRollNo = '${LoginBean.rollNo}'; 
	getPersonalInfo(personalData);
});
</script>
<script src='js/home.js'></script>