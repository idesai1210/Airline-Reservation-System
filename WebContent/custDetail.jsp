<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Details</title>
<script type="text/javascript">
	function showLabel() {
		if (document.getElementById('radio1').checked) {
			document.getElementById('inputFlightCode').innerHTML = "Enter Flight Number";
			document.getElementById('inputFlightCode2').placeholder = "E.g. E1215";
			document.getElementById('date').style.display = 'block';
			document.getElementById('ans').style.display = 'none';
		} else {
			document.getElementById('inputFlightCode').innerHTML = "Enter Passenger Name";
			document.getElementById('inputFlightCode2').placeholder = "E.g. Heet Vachhani";
			document.getElementById('date').style.display = 'none';
			document.getElementById('ans').style.display = 'none';
		}

	}
</script>

</head>
<body>
	<jsp:include page="index.jsp" />
	<div class="menuHead col-md-offset-3">Get Customer Details</div>

	<div class="subBody">
		<form class="form-horizontal" action="CustDetailServlet" method="post">
			<div class="col-sm-offset-3">
				<div class="radio">
					<label> <input type="radio" onclick="showLabel()"
						name="optionsRadios" id="radio1" value="flightId" checked>Find
						List of passenger on given Flight
					</label>
				</div>
				<div class="radio">
					<label> <input type="radio" onclick="showLabel()"
						name="optionsRadios" id="radio2" value="passengerName">Find
						List of Flight for Passenger
					</label>
				</div>
			</div>
			<br>
			<div class="form-group">
				<label for="inputFlighCode" id="inputFlightCode" name="inputFlightCode"
					class="col-sm-2 col-md-offset-2 control-label">Enter Flight
					Number</label>

				<div class="col-sm-3">
					<input type="text" required class="form-control" name="inputFlightCode2" id="inputFlightCode2"
						placeholder="E.g. E1215">
				</div>
			</div>
			
			<div class="form-group" id="date">
				<label for="inputFlighCode" id="inputFlightDate" name="inputFlightDate"
					class="col-sm-2 col-md-offset-2 control-label">Enter Flight
					date</label>

				<div class="col-sm-3">
					<input type="date" class="form-control" id="flightDate" name="flightDate"
						placeholder="E.g. E1215">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-10">
					<button type="submit" class="btn btn-primary">Search</button>
				</div>
			</div>
		</form>
		<div class="col-md-6 col-md-offset-2" id="ans">
			<%
				if (request.getAttribute("passInfo") != "Invalid"
						&& request.getAttribute("passInfo") != null) {
					ResultSet rs = (ResultSet) request.getAttribute("passInfo");
			%>

			<h4>Passenger detail for given Flight</h4>
			<table class="table table-hover">

				<tr>
					<th>Flight Number</th>
					<th>Customer Name</th>
					<th>Seat Number</th>
					<th>Date</th>
				</tr>
				<%
					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
				</tr>

				<%
					}
				%>
			</table>
			<%
				} else if (request.getAttribute("flightList") != "Invalid"
						&& request.getAttribute("flightList") != null) {
					ResultSet rs = (ResultSet) request.getAttribute("flightList");
			%>

			<h4>List of Flight for given passenger</h4>
			<table class="table table-hover">

				<tr>
					<th>Flight Number</th>
					<th>Customer Name</th>
					<th>Seat Number</th>
					<th>Date</th>
				</tr>
				<%
					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
				</tr>

				<%
					}
				%>
			</table>
			<%
				} else if (request.getAttribute("flightList") == "Invalid" || request.getAttribute("passInfo") == "Invalid"  ) {
			%>
			<h4>Sorry no result found for your request..!!</h4>
			<%
				}
			%>

		</div>

	</div>
</body>
</html>