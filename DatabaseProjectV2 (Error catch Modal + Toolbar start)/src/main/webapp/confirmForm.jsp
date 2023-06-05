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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"	crossorigin="anonymous"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNVQ8bc" crossorigin="anonymous"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.5/xlsx.min.js"></script>
	
<!-- Bootstrap CSS -->

<link rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"crossorigin="anonymous">
<link href="<c:url value="/resources/css/tableSelect_style.css" />"	rel="stylesheet">

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
	<!-- TOOLBAR-->
	<div class="container">
    	<div id="toolbar" class="row justify-content-center " >
    
    	<div class="column mx-5">
    	<div class="label">Compare</div>
      		<div class="btn-group btn-group-fill">
        	<button onclick="redirectToMatch()" class="btn btn-primary">Match</button>
        	<button onclick="redirectToUnique()" class="btn btn-primary">Unique</button>
      	</div>
      	</div>
      
      	<div class="column mx-3">
      	<div class="label">Save</div>
      		<div class="btn-group btn-group-fill">
        	<button href="" class="btn btn-primary">History</button>
        	<button href="" class="btn btn-primary">Download</button>
      	</div>
      	</div>
      
    </div>
  </div>
	
	<div class="container my-4" id="">
		<div class="row">
    		<%
    		List<List<List<String>>> tables = (List<List<List<String>>>) request.getAttribute("tables");
    		int tableCount = 1;
    		if (tables != null && !tables.isEmpty()) {
    			for (List<List<String>> table : tables) {
    		%>
    		<div class="col">
    <fieldset>
        <label id="tableNum" style="border-radius:7px 7px 0px 0px; background-color:rgb(0, 191, 255); color:white; margin-bottom:0px; padding:10px 15px 0px 15px; font-size:18px;">Table <%= tableCount %></label>
        <table class="table table-sm table-striped table-hover table-bordered text-dark bg-light" style="table-layout: fixed;">
            <thead class="thead thead-dark">
                <tr>
                    <%-- Assuming the first row of the table contains column names --%>
                    <% for (int j = 0; j < table.get(0).size(); j++) {
                        String column = table.get(0).get(j);
                    %>
                        <th style="word-wrap: break-word;" class="th-sm"><%= column %></th>
                    <% } %>
                </tr>
            </thead>
            			<tbody>
                			<%-- Start from the second row to skip column names --%>
                			<% if (table.size() == 1 && table.get(0).isEmpty()) { %>
                    			<tr>
                        			<td colspan="<%= table.get(0).size() %>">No rows exist</td>
                    			</tr>
                			<% 	} else { %>
                    			<% for (int i = 1; i < table.size(); i++) {
                        			List<String> row = table.get(i);
                    			%>
                        		<tr>
                            			<% for (String cell : row) { %>
                                			<td style="word-wrap: break-word;"><%= cell %></td>
                            			<% } %>
                        			</tr>
                    			<% }
                    			}
                			%>
            			</tbody>
        			</table>
    			</fieldset>
			</div>

    		<%	
    		tableCount++;
   	 		  }
    		} 
    		else {
    		    %>
    		    <div class="col">
    		        <!-- Button trigger modal -->
    		        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#noDataModal">
    		            Null Table
    		        </button>

    		        <!-- Modal -->
    		        <div class="modal fade" id="noDataModal" tabindex="-1" role="dialog" aria-labelledby="noDataModalLabel" aria-hidden="true">
    		            <div class="modal-dialog" role="document">
    		                <div class="modal-content">
    		                    <div class="modal-header">
    		                        <h5 class="modal-title" id="noDataModalLabel">No Data Received</h5>
    		                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
    		                            <span aria-hidden="true">&times;</span>
    		                        </button>
    		                    </div>
    		                    <div class="modal-body">
    		                        Data was not received. Please try again.
    		                    </div>
    		                    <div class="modal-footer">
    		                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
    		                    </div>
    		                </div>
    		            </div>
    		        </div>
    		    </div>
    		    <%  }   %>
	</div>


	<!-- jQuery and Bootstrap JS -->
	<!-- Your JS -->
</body>
	<script>
        function redirectToMatch() {
            var baseUrl = '${pageContext.request.contextPath}';
            var compareUrl = baseUrl + '/Compare/Match';
            window.location.href = compareUrl;
        }
        function redirectToUnique(){
        	var baseUrl = '${pageContext.request.contextPath}';
            var compareUrl = baseUrl + '/Compare/Unique';
            window.location.href = compareUrl;
        }
    </script>
</html>