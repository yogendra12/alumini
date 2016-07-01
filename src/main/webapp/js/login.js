$(document).ready(function(){
    $("#clickHerebtn").click(function(){
		$("#clickHerebtn").hide();
        $("#loginformid").fadeIn("slow");
    });
	$("#loginBtn, #loginFormCloseBtn").click(function(){
		$("#loginformid").fadeOut("slow");      
		$("#clickHerebtn").show();		
    });
	$("#forgotpwd").click(function(){
		$("#loginformid").hide();
        $("#forgotpwdid").fadeIn("slow");
		
    });
	$("#submitBtn, #forgotFormCloseBtn").click(function(){
		$("#forgotpwdid").fadeOut("slow");      
		$("#clickHerebtn").show();		
    });

});
/* grid accordin event */
$(document).ready(function() {
		$('.scrollToMyContent').click(function(event) {
			
			setTimeout(function() {
				$("html, body").animate({ scrollTop: $(event.currentTarget).offset().top }, 200);
			}, 400);
		
		});
});


	