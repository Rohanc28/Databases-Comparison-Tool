<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Database Comparison Tool</title>
  <!-- Bootstrap CSS -->
  <link href="<c:url value="/resources/css/tableview_style.css" />" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Your JS -->
  <script src="<c:url value="resources/js/TableView_script.js" />"></script>

</head>


<body>
  <nav class="navbar navbar-expand-md navbar-dark bg-secondary">
    <a class="navbar-brand" href="#">Database Comparison Tool</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
      aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="/home">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/connect">Connect</a>
        </li>
      </ul>
    </div>
  </nav>
  
<!-- MAIN BODY STARTS HERE -->
  <div class="container my-5">
    <div class="col">
      <div class="col-md-6 offset-md-3">
        <!-- HEADING FOR DIV> -->
        <h2 class="text-center mb-4">Database Comparison User Tool</h2>
      </div>
        
<div class="container">
  <div class="row">
    <!-- First form and table -->
    <div class="col">
<!-- FORM TO UPLOAD CSV FILE -->
        <form >
          <div class="form-group">
            <label for="csvFileInput">Select file:</label>
            <input type="file" class="form-control-file" id="file-input1">
          </div>
          <button type="button" class="btn btn-primary" onclick="loadCSV1()">Load CSV</button>
        </form>
    </div>
      <div class="col">
      <!---->
      <form >
          <div class="form-group">
            <label for="csvFileInput">Select file:</label>
            <input type="file" class="form-control-file" id="file-input2">
          </div>
          <button type="button" class="btn btn-primary" onclick="loadCSV2()">Load CSV</button>
        </form>
    </div>
    
    
  </div>
  <div class="row">
    
    <div class="col">
       <!-- TABLE TO DISPLAY CSV DATA -->
        <table id="content1" class="table table-bordered mt-4 d-none text-light">
        </table>
    </div>
    <div class="col">
      <!-- TABLE TO DISPLAY CSV DATA -->
        <table id="content2" class="table table-bordered mt-4 d-none text-light">
        </table>
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
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNVQ8bc"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.5/xlsx.min.js"></script>
 <!-- Your JS -->
  <script src="C:\Users\rchaturvedi\eclipse-workspace\DatabaseProject\src\main\resources\js\TableView_script.js"></script>
</body>
  

</html>

