<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Database Comparison Tool</title>
<!-- Bootstrap CSS -->
<link href="<c:url value="/resources/css/ServerConnect_style.css" />"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- Your JS -->
<script src="<c:url value="resources/js/ServerConnect_script.js" />"></script>
</head>
<body>
<p>Your connection details:</p>
<br>  
	Server url: ${form.serverUrl}
<br>   
 	database 1: ${form.database1}
<br>   
 	database 2: ${form.database2}
<br>   
 	username : ${form.username}
<br>   
 	password : ${form.password}
<br>   
	table : ${form.tableName}
</body>
</html>