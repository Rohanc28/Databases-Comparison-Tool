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
					href="/DatabaseProject/home">Home</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/DatabaseProject/connect">Connect</a></li>
			</ul>
		</div>
	</nav>

	<!-- MAIN BODY STARTS HERE -->
	<div class="container my-6">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<!-- HEADING FOR DIV> -->
				<h2 class="text-center mb-4">Database Comparison User Tool</h2>
				<div class="container my-5">

					<div class="row">
						<div class="col">
							<form id="server-form-1" method="POST" :form action="submitForm"
								modelAttribute="formdata">
								<div class="row">
									<div class="col">
										<div class="form-group p-1">
											<label for="username" required>Username:</label> <input
												type="text" class="form-control" id="username"
												placeholder="Enter Username" name="username" required>
										</div>
										<div class="form-group p-1">
											<label for="password">Password:</label> <input
												type="password" class="form-control" id="password"
												placeholder="Enter password" name="password" required>
										</div>
										<div class="form-group p-1">
											<label for="serverUrl">Database URL:</label> <input
												type="text" class="form-control" id="serverUrl"
												placeholder="Enter URL" name="serverUrl" required>
										</div>
									</div>
									<div class="col">
										<div class="form-group p-1">
											<label for="database1">Database 1:</label> <input type="text"
												class="form-control" id="database1"
												placeholder="Enter db name" name="database1" required>
										</div>
										<div class="form-group p-1">
											<label for="database2">Database 2:</label> <input type="text"
												class="form-control" id="database2"
												placeholder="Enter db name" name="database2" required>
										</div>
										<div class="form-group p-1">
											<label for="tableName" required>Table Name:</label> <input
												type="text" class="form-control" id="tableName"
												placeholder="Enter table name" name="tableName" required>
										</div>
									</div>

								</div>
								<div class="row my-3">
									<div class="col-md-12 d-flex justify-content-center">
										<button id="btn2" type="submit" class="btn btn-primary mx-2">Connect</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ALERT MESSAGE MODAL -->
		<div class="modal fade" id="errorModal" tabindex="-1" role="dialog"
			aria-labelledby="errorModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="errorModalLabel">Error!</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p id="errorMsg">${errorMsg}</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Success alert modal -->
		<!--  
		<div class="modal fade" id="successModal" tabindex="-1" role="dialog"
			aria-labelledby="successModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="successModalLabel">Success!</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>${successMsg}</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		-->
	</div>

	<footer class="footer mt-auto py-3 bg-secondary">
		<div class="container text-center ">
			<span id="foottext" class="text-white">© 2023 Database
				Comparison Tool</span>
		</div>
	</footer>

	<!-- jQuery and Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNVQ8bc"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js">
		
	</script>

	<script>
		$(document).ready(function() {
			var errorMsg = "${sessionScope.errorMsg}";
			console.log(errorMsg);
			if (errorMsg) {
				$('#errorModal').modal('show');
			}
		});
	</script>

	<%
	session.removeAttribute("errorMsg");
	%>


</body>

</html>