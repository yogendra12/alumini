<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>contact us</title>
<script src="js/ajax.js"></script>
<script type="text/javascript">
function submitMail(){
	var name = $("#cname").val();
	var email = $("#cemail").val();
	var mobile = $("#cmobile").val();
	var message = $("#messageId").val();
	var formData = new FormData();
    
    /* formData.append('name', name);
    formData.append('email',email);
    formData.append('mobile',mobile);
    formData.append('message',message) */
    var json = {};
    json["email"] = email;
    json["name"] = name;
    json["mobile"] = mobile;
    json["message"] = message;
    
    jQuery.fn.makeRequest('POST', "contactSendMail",  json,  function(data){
        console.log(data);
});
}
</script>
</head>
<body>
	Name:
	<input type="text" id="cname">
	<br> Email:
	<input type="text" id="cemail">
	<br> Mobile Number:
	<input type="text" id="cmobile">
	<br> Message:
	<textarea rows="5" cols="22" id="messageId"></textarea>
	<input type="button" value="submit" onclick="submitMail();">
</body>
</html>