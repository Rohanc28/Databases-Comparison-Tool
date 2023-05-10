<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
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
	<nav class="navbar navbar-expand-md navbar-dark bg-secondary">
		<a class="navbar-brand" href="#">Database Comparison Tool</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link"
					href="/DatabaseProject/connect">Home</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/DatabaseProject/connect">Connect</a></li>
			</ul>
		</div>
	</nav>
	<div class="container my-4" id="">
		<div class="row" style="inline-block">
			<%
			ArrayList<ArrayList<ArrayList<String>>> tables = (ArrayList<ArrayList<ArrayList<String>>>) request.getAttribute("tables");
			int tableCount = 1;
			for (ArrayList<ArrayList<String>> table : tables) {
			%>
			<div class="col">
				<fieldset>
					<caption>Table<%=tableCount%></caption>
					<table  class="table table-sm table-striped table-hover table-bordered text-dark bg-light" style="table-layout: fixed;">

						<thead class="thead thead-dark">
							<tr class="break-text">
								<th class="th-sm">ID</th>
								<th class="th-sm">First Name</th>
								<th class="th-sm">Last Name</th>
								<th class="th-sm">Email</th>
								<th class="th-sm">HireDate</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (ArrayList<String> row : table) {
							%>
							<tr>
								<td><%=row.get(0)%></td>
								<td><%=row.get(1)%></td>
								<td><%=row.get(2)%></td>
								<td style="word-wrap: break-word;"><%=row.get(3)%></td>
								<td><%=row.get(4)%></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</fieldset>
				</div>
				<%
				tableCount++;
				}%>
			
			
		</div>
	</div>


	<!-- jQuery and Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNVQ8bc" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.5/xlsx.min.js"></script>
  <!-- Your JS -->
</body>

</html>