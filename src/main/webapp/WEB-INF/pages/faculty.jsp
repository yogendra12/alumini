<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<div class="col-md-12 paddingzeroxs">
	<div class=" marTop10 panel panel-primary" id="margintop-xs"
		style="border-radius: 0; margin-bottom: 0 !important;">
		<div class="panel-heading minHeight50"
			style="font-size: 20px; align: center; text-align: center; background-color: #8B008B">
			Faculty Details</div>
		<div class="panel-body">
			<div class="panel panel-sky">
				<div class="table-responsive">
					<table class="table">
						<thead class="tablehead" style="border: 1px solid orange;">
							<tr>
								<th class="year">Year</th>
								<th class="subject">Subject</th>
								<th class="faculty">Faculty</th>
								<th class="contact">Contact</th>
								<th class="email">Email</th>
								<th class="photo">Photo</th>
								<th class="about">About</th>
							</tr>
						</thead>
						<tbody id="itemContainer">
						
						</tbody>
						
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
var listOrders1 =${facultyDetails};
display(listOrders1);

function display(listOrders1){
	if (listOrders1 != null){
		$.each(listOrders1, function(i, orderObj) {
			if(orderObj.facultyName == null || orderObj.facultyName ==''){
				 orderObj.facultyName = "---";
			 }
			 if(orderObj.contact == null){
				 orderObj.contact = "---";
			 }
			 if(orderObj.email == null){
				 orderObj.email = "---";
			 }
			 if(orderObj.aboutFaculty == null){
				 orderObj.aboutFaculty = "---";
			 }
			var tblRow= "<tr>"
						+"<td>"+orderObj.year+"</td>"
						+"<td>"+orderObj.subject+"</td>"
						+"<td>"+orderObj.facultyName+"</td>"
						+"<td>"+orderObj.contact+"</td>"
						+"<td style='word-wrap: break-word;'>"+orderObj.email+"</td>"
						+"<td><img src='"+orderObj.facultyPhotoPath+"' name='image' class='imageSpace' /></td>"
						+"<td>"+orderObj.aboutFaculty+" </td>"
					+"</tr>"
			 
			  tblRow=  tblRow.replace(/\"/g, "");
					$("#itemContainer").append(tblRow);
		});
					}
	
}
</script>
