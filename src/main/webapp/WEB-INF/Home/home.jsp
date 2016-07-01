<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
	<div>
		<tiles:insertAttribute name="header" />
	</div>
	<table>
		<tr>
			<td align="center" style='width:82%;'>
					<tiles:insertAttribute name="body" />
			</td>
		</tr>
	</table>
	<!--Footer-->
	<div>
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>