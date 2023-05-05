<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Database Comparison Tool</title>
    <!-- Bootstrap CSS -->
  <link href="<c:url value="/resources/css/ServerConnect_style.css" />" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<!-- Your JS -->
  <script src="<c:url value="resources/js/ServerConnect_script.js" />"></script>
</head>


<body>
  <nav class="navbar navbar-expand-md navbar-dark bg-secondary">
    <a class="navbar-brand" href="#">Database Comparison Tool</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="/DatabaseProject/home">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/DatabaseProject/connect">Connect</a>
        </li>
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
              <form id="server-form-1" method="POST" :form action="submitForm" modelAttribute="formdata">
                <div class="form-group">
                  <label for="serverName">Server Name:</label>
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <label class="input-group-text" for="inputGroupSelect01">Options</label>
                    </div>
                    <select class="custom-select" id="serverName1" required>
                      <option selected disabled hidden>Choose...</option>
                      <option value="Oracle">OracleDB</option>
                    </select>
                  </div>

                </div>
                <div class="form-group">
                  <label for="databaseName">Hostname:</label>
                  <input type="text" class="form-control" id="databaseName1" placeholder="ex: jon_host.dot.com" name="databaseName1" required>
                </div>
                <div class="form-group">
                  <label for="databaseName">Enter Port Number:</label>
                  <input type="number" class="form-control" id="portNumber1" placeholder="ex: 8080" name="portNumber1" required>
                </div>
                <div class="form-group">
                  <label for="userName" required>Username:</label>
                  <input type="text" class="form-control" id="username1" placeholder="Enter Username" name="username1" required>
                </div>
                <div class="form-group">
                  <label for="password">Password:</label>
                  <input type="password" class="form-control" id="password1" placeholder="Enter password" name="password1" required>

                </div>
                <!--
                <div class="form-group">
                  <label for="database1">Database Name</label>
                  <input type="text" class="form-control" id="database1" placeholder="Enter DB name to use" required>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" id="database2" placeholder="Enter second DB name (optional)">
                </div>
                -->
                <button id="btn1" type="submit" class="btn btn-primary">Connect</button>
              </form>
            </div>
            <div class="col">
              <form id="server-form-2" method="POST" action="/submitForm">
                <div class="form-group">
                  <label for="serverName">Server Name:</label>
                  <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <label class="input-group-text" for="inputGroupSelect01">Options</label>
                    </div>
                    <select class="custom-select" id="serverName2" required>
                      <option selected disabled hidden>Choose...</option>
                      <option value="Oracle">OracleDB</option>
                    </select>
                  </div>

                </div>
                <div class="form-group">
                  <label for="databaseName">Hostname:</label>
                  <input type="text" class="form-control" id="databaseName2" placeholder="ex: don_host.dot.com" name="databaseName2" required>
                </div>
                <div class="form-group">
                  <label for="databaseName">Enter Port Number:</label>
                  <input type="number" class="form-control" id="portNumber2" placeholder="ex: 8081" name="portNumber2" required>
                </div>
                <div class="form-group">
                  <label for="userName" required>Username:</label>
                  <input type="text" class="form-control" id="username2" placeholder="Enter Username" name="username2" required>
                </div>
                <div class="form-group">
                  <label for="password">Password:</label>
                  <input type="password" class="form-control" id="password2" placeholder="Enter password" name="password2" required>

                </div>
                <!--
                <div class="form-group">
                  <label for="database1">Database Name</label>
                  <input type="text" class="form-control" id="database1" placeholder="Enter DB name to use" required>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" id="database2" placeholder="Enter second DB name (optional)">
                </div>
            -->
                <button id="btn2" type="submit" class="btn btn-primary">Connect</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <footer class="footer mt-auto py-3 bg-secondary">
    <div class="container text-center ">
      <span id="foottext" class="text-white">© 2023 Database Comparison Tool</span>
    </div>
  </footer>

  <!-- jQuery and Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNVQ8bc" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  </body>

</html>