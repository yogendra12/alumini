<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Alumin Apps</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylsheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/homepage.css">
        <link rel="stylesheet" href="css/footer.css">		
        <link rel="stylesheet" href="css/commonStyles.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/familycarosel.js"></script>
        <script src="js/login.js"></script></head>
<nav class="navbar navbar-default" id="header">
	<div class="container col-xs-12 zero-padding">
		<div class="header">
			<a class="navbar-brand" href="#" id="logoid"><img
				src="images/KlceLogo6.png" class="img-responsive"
				alt="logo logo logo logo"></a>
		</div>
		<div class="zero-padding pull-left" id="textdiv">
			<span id="textid">KLCE 87 ECE</span>
		</div>
		<c:if test="${empty LoginBean}">
		<a href="#" id="clickHerebtn" style="display: none;">click here to
			login</a><br>
		<br>
		<div class="col-sm-8" id="loginformid" style="display: block;">
			<div class="pull-left" id="loginFormClosebuttondiv">
				<a href="#" class="close pull-left" id="loginFormCloseBtn"
					data-dismiss="modal"><img src="images/windowclose.png"
					width="18px" alt="Logo name"></a>
			</div>
			
			<form id="signin" onsubmit="return false;" class="navbar-form navbar-right zero-padding"
				role="form">
				<div class="col-xs-12 zero-padding" id="logindivid">
					<div class="col-xs-5 input-group pull-left" id="username">
						<span class="input-group-addon" id="username-glyphiconwidth"><i
							class="glyphicon glyphicon-user"></i></span>
							
							 <select id="loginSelect" name="rollNo" class="form-control" placeholder="Roll No">
                            <option value="">Select Roll No</option>
                        </select> 
					</div>
					<div class="col-xs-5 input-group pull-left" id="password">
						<span class="input-group-addon" id="password-glyphiconwidth"><i
							class="glyphicon glyphicon-lock"></i></span> <input id="password_login"
							type="password" class="form-control" name="password" value=""
							placeholder="Password">
					</div>
					<div class="col-xs-2 zero-padding" id="loginbuttonid">
						<button type="button" class="btn btn-primary" id="loginBtn">Login</button>
					</div>
					<div class="col-xs-3 zero-padding" id="forgotpwddiv">
						<a href="#" id="forgotpwd">forgot password</a>
					</div>
				</div>
			</form>
			
		</div>
		</c:if>
		<c:if test="${not empty LoginBean}">
		<a href="logout" id="Logout" style="display: block;">Logout</a>
		</c:if>
		<!-- forgot pwd -->
		<div class="col-sm-8" id="forgotpwdid">
			<div class="pull-left" id="forgotpwdformCloseBtndiv">
				<a href="#" class="close pull-left" id="forgotFormCloseBtn"
					data-dismiss="modal"><img src="images/windowclose.png"
					width="18px" alt="Logo name"></a>
			</div>
			<form id="signin" class="navbar-form navbar-right zero-padding"
				role="form">
				<div class="col-xs-12 zero-padding" id="forgot-div">
					<div class="col-xs-5 input-group pull-left" id="username">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> <input id="user_name"
							type="text" class="form-control" name="user name" value=""
							placeholder="user name">
					</div>
					<div class="col-xs-5" id="passwordforgotid">
						<span>please, Enter your email to get password</span>
					</div>
					<div class="col-xs-2 zero-padding" id="submit-div">
						<button type="submit" class="btn btn-primary" id="submitBtn">Submit</button>
					</div>
				</div>
			</form>
		</div>
		<!-- forgot pwd -->
	</div>
</nav>
<!-- menus -->
<nav class="navbar navbar-default" id="subnavbar"
	style="border-radius: 0 !important;">
	<ul class="nav navbar-nav">
		<li><a href="aluminiHome">Home</a></li>
		<!-- <li><a href="galleryHome">Gallery</a></li> -->
		<li><a href="eventHome">Events</a></li>
		<li><a href="facultyHome">Faculty</a></li>
		
		<c:if test="${not empty LoginBean}">
			<li><a href="regHome">Registration</a></li>
			<li><a href="eventsregHome">New Event</a></li>
			<li><a href="facultyentry">Update Faculty</a></li>
		</c:if>
		
		
		<!-- <li><a href="aboutHome">Aboutus</a></li> -->
	</ul>

</nav>

<script>
    $(document).ready(function () {
    	$("#clickHerebtn").click(function () {
            $("#clickHerebtn").hide();
            $("#loginformid").fadeIn("slow");
        });
    	
        $("#loginFormCloseBtn").click(function () {
            $("#loginformid").fadeOut("slow");
            $("#clickHerebtn").show();
        });
        $("#forgotpwd").click(function () {
            $("#loginformid").hide();
            $("#forgotpwdid").fadeIn("slow");

        });
        $("#submitBtn, #forgotFormCloseBtn").click(function () {
            $("#forgotpwdid").fadeOut("slow");
            $("#clickHerebtn").show();
        });

    });
</script>	
 <script>
 var rollNos = "";
      $(document).ready(function () {
    	  rollNos = '${rollNos}';
    	  var rollArray = JSON.parse(rollNos);
    	  $.each(rollArray, function(key, value) {
    		     $('#loginSelect')
    		         .append($("<option></option>")
    		         .attr("value",key)
    		         .text(value));
    		});
          
		$(document).on('click', '#loginBtn', function(){
			var rollId = $('#loginSelect').val();
			var pass = $('#password_login').val();
			if(rollId == "" ){
				return false;
			}else if(pass == ""){
				return false;
			}else {
				$.ajax({
					method: 'POST',
					url : "validateLogin",
					data : "rollNo="+rollId + "&pass="+pass,
					success : function(response){
						/* //alert(response); */
						if(response == ""){
							alert('Invalid Login');
						}else if (response == 'Succ'){
							window.location.href = 'regHome';
						}
					}
				})
			}
			
		});        
      });
        </script>
</html>