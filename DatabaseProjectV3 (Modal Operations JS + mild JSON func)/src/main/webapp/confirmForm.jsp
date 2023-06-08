<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Database Comparison Tool</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNVQ8bc"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.5/xlsx.min.js"></script>

<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="<c:url value="/resources/css/tableSelect_style.css" />"
	rel="stylesheet">

<!-- Your JS -->
<!--  <script src="<c:url value="resources/js/ServerConnect_script.js" />"></script>-->

<style>
.table-striped td {
	white-space: normal !important;
	word-break: break-word;
}
</style>

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
	<!-- TOOLBAR-->
	<div class="container">
		<div id="toolbar" class="row justify-content-center ">

			<div class="column mx-5">
				<div class="label">Compare</div>
				<div class="btn-group btn-group-fill">
					<!-- Button trigger modal -->
					<button id="openModalButton" type="button" class="btn btn-primary"
						data-toggle="modal" data-target="#dataModal">Match</button>
					<button id="openModalUnique" type="button" class="btn btn-primary"
						data-toggle="modal" data-target="#uniqueModal">Unique</button>
				</div>
			</div>

			<div class="column mx-3">
				<div class="label">Save</div>
				<div class="btn-group btn-group-fill">
					<button href="" class="btn btn-primary">History</button>
					<button href="" class="btn btn-primary">Disconnect</button>
				</div>
			</div>

		</div>
	</div>
	<!--  -->
	<!-- Modal 1 -->
	<div class="modal fade" id="dataModal" tabindex="-1" role="dialog"
		aria-labelledby="dataModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="dataModalLabel">Matching Rows</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table table-striped table-hover">
						<thead>
							<!-- Add table headers as needed -->
						</thead>
						<tbody id="modalBody">
							<!-- Table body content will be dynamically generated using JavaScript -->
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button href="#" class="btn btn-success btn-download">Download</button>
					<!-- Download button -->
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal 1 -->

	<!-- Modal 2-->
	<div class="modal fade" id="uniqueModal" tabindex="-1" role="dialog"
		aria-labelledby="uniqueModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="dataModalLabel">Unique Rows</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					
				</div>
				<div class="modal-body">
					<table class="table table-striped table-hover">
						<thead>

						</thead>
						<tbody id="tableBody">
							<!-- Table body content will be dynamically generated using JavaScript -->
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button href="#" class="btn btn-success btn-download">Download</button>
					<!-- Download button -->
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal 2-->

	<!--  -->
	<div class="container my-4" >
		<div class="row">
			<%
			List<List<List<String>>> tables = (List<List<List<String>>>) request.getAttribute("tables");
			int tableCount = 1;
			if (tables != null && !tables.isEmpty() ) {
				for (List<List<String>> table : tables) {
					
			%>
			<div class="col">
				<fieldset>
					<label id="tableNum"
						style="border-radius: 7px 7px 0px 0px; background-color: rgb(0, 191, 255); color: white; margin-bottom: 0px; padding: 10px 15px 0px 15px; font-size: 18px;">Table
						<%=tableCount%></label>
					<table
						class="table table-sm table-striped table-hover table-bordered text-dark bg-light"
						style="table-layout: fixed;">
						<thead class="thead thead-dark">
							<tr>
								<%-- Assuming the first row of the table contains column names --%>
								<%
								for (int j = 0; j < table.get(0).size(); j++) {
									String column = table.get(0).get(j);
								%>
								<th style="word-wrap: break-word;" class="th-lg"><%=column%></th>
								<%
								}
								%>
							</tr>
						</thead>
						<tbody>
							<%-- Start from the second row to skip column names --%>
							<%
							
							if (table.size() ==1) {
							%>
							<tr>
								<td colspan="<%=table.get(0).size()%>" style="word-wrap:break-word; text-align:center;">No rows exist</td>
							</tr>
							<%
							} else {
							%>
							<%
							for (int i = 1; i < table.size(); i++) {
								List<String> row = table.get(i);
							%>
							<tr>
								<%
								for (String cell : row) {
								%>
								<td style="word-wrap: break-word;"><%=cell%></td>
								<%
								}
								%>
							</tr>
							<%
							}
							}
							%>
						</tbody>
					</table>
				</fieldset>
			</div>

			<%
			tableCount++;
				
			}
			} else {
			%>
			<div class="col">
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#noDataModal">Null Table</button>

				<!-- Modal -->
				<div class="modal fade" id="noDataModal" tabindex="-1" role="dialog"
					aria-labelledby="noDataModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="noDataModalLabel">No Data
									Received</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">Data was not received. Please try
								again.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		</div>

		<!-- jQuery and Bootstrap JS -->
		<!-- Your JS -->
</body>
<script>
  // Get the tablesData from JSP
  var tablesData = JSON.parse('${json}');
  // Parse the JSON string to convert it into a JavaScript object
  
  // Generate the table rows dynamically
  var tableBody = document.getElementById("tableBody");
  tableBody.innerHTML = ""; // Clear the existing content

  tablesData.forEach(function (table) {
    table.forEach(function (row) {
      var newRow = document.createElement("tr");

      row.forEach(function (cellData) {
        var newCell = document.createElement("td");
        newCell.textContent = cellData;
        newRow.appendChild(newCell);
      });

      tableBody.appendChild(newRow);
    });
  });

  //Show the modal when the button is clicked
  var modalButton = document.getElementById("openModalButton");
  modalButton.addEventListener("click", function() {
    // Perform the operation to filter matching rows
    var table1 = tablesData[0];
    var table2 = tablesData[1];
    var matchingRows = filterMatchingRows(table1, table2);

    // Convert the matching rows to JSON string
    var matchingRowsJson = JSON.stringify(matchingRows);

    // Pass the matching rows JSON to the modal for rendering
    var modalBody = document.getElementById("modalBody");
    modalBody.innerHTML = ""; // Clear the existing content

    matchingRows.forEach(function(row) {
      var newRow = document.createElement("tr");

      row.forEach(function(cellData) {
        var newCell = document.createElement("td");
        newCell.textContent = cellData;
        newRow.appendChild(newCell);
      });

      modalBody.appendChild(newRow);
    });

    $('#dataModal').modal('show');
  });
	
  
  // Apply styles to the table columns and rows
  var tableColumns = document.querySelectorAll(".table th");
  tableColumns.forEach(function (column) {
    column.classList.add("bg-dark");
  });

  var tableCells = document.querySelectorAll(".table td");
  tableCells.forEach(function (cell) {
    cell.style.wordBreak = "break-word";
  });

  // Increase the size of the modal
  var modalContent = document.querySelector(".modal-content");
  modalContent.style.width = "900px";
  modalContent.style.maxWidth = "100%";

  //Function to filter matching rows from two tables
  function filterMatchingRows(table1, table2) {
    var matchingRows = [];
    
    
    // Create a map to store unique rows from table2
    var uniqueRowsMap = new Map();
    table2.forEach(function(row) {
      var rowString = JSON.stringify(row);
      uniqueRowsMap.set(rowString, row);
    });

    // Loop through the rows of table1
    for (var i = 0; i < table1.length; i++) {
      var row1 = table1[i];
      var row1String = JSON.stringify(row1);

      // Check if the row exists in table2
      if (uniqueRowsMap.has(row1String)) {
        matchingRows.push(row1);
        uniqueRowsMap.delete(row1String); // Remove the row from the map to keep only a single instance
      }
    }

    return matchingRows;
  }
  
  //Function to filter unique rows from two tables
  function filterUniqueRows(table1, table2) {
  var uniqueRows = [];

  // Create a map to store unique rows from both tables
  var rowsMap = new Map();
	
  //Add the first row from each table as the initial rows in uniqueRows
  if (table1.length > 0) {
    uniqueRows.push(table1[0]);
  }

  // Loop through the rows of table1 starting from the second row
  for (var i = 1; i < table1.length; i++) {
    var row1 = table1[i];
    var row1String = JSON.stringify(row1);
    rowsMap.set(row1String, {
      row: row1,
      count: 1 // Set count to 1 for rows from table1
    });
  }

  // Loop through the rows of table2 starting from the second row
  for (var j = 1; j < table2.length; j++) {
    var row2 = table2[j];
    var row2String = JSON.stringify(row2);
    if (rowsMap.has(row2String)) {
      // If the row exists in table1, increment the count
      rowsMap.get(row2String).count++;
    } else {
      // If the row is unique to table2, add it to the map
      rowsMap.set(row2String, {
        row: row2,
        count: 1 // Set count to 1 for rows from table2
      });
    }
  }

  // Retrieve only the rows with count equal to 1
  rowsMap.forEach(function (value) {
    if (value.count === 1) {
      uniqueRows.push(value.row);
    }
  });
  return uniqueRows;
}

  
  var uniqueModalButton = document.getElementById("openModalUnique");
  uniqueModalButton.addEventListener("click", function () {
    // Perform the operation to filter unique rows
    var table1 = tablesData[0];
    var table2 = tablesData[1];
    var uniqueRows = filterUniqueRows(table1, table2);

    // Convert the unique rows to JSON string
    var uniqueRowsJson = JSON.stringify(uniqueRows);

    // Pass the unique rows JSON to the modal for rendering
    var uniqueModalBody = document.getElementById("tableBody");
    uniqueModalBody.innerHTML = ""; // Clear the existing content

    uniqueRows.forEach(function (row) {
      var newRow = document.createElement("tr");

      row.forEach(function (cellData) {
        var newCell = document.createElement("td");
        newCell.textContent = cellData;
        newRow.appendChild(newCell);
      });

      uniqueModalBody.appendChild(newRow);
    });

    $('#uniqueModal').modal('show');
  });
  
 

</script>




</html>