<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import=" java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Flight</title>
</head>
<body>
	<jsp:include page="index.jsp" />
	<div class="menuHead col-md-offset-3">Search Flight</div>

	<div class="subBody">
		<form class="form-horizontal" action="FlightSearch2Servlet"
			method="post">
			<div class="form-group">
				<label for="inputDepartureCode"
					class="col-sm-2 col-md-offset-2 control-label">Departure
					Airport Code</label>
				<div class="col-sm-3">
					<input type="text" required class="form-control"
						id="inputDepartureCode" name="inputDepartureCode"
						placeholder="Enter Departure Airport Code Here..">
				</div>
			</div>

			<div class="form-group">
				<label for="inputArrivalCode"
					class="col-sm-2 col-md-offset-2 control-label">Arrival
					Airport Code</label>
				<div class="col-sm-3">
					<input type="text" required class="form-control"
						id="inputArrivalCode" name="inputArrivalCode"
						placeholder="Enter Arrival Airport Code Here..">
				</div>
			</div>

			<div class="form-group">
				<label for="date_label"
					class="col-sm-2 col-md-offset-2 control-label">Enter Date</label>
				<div class="col-sm-3">
					<input type="date" required class="form-control" id="date"
						name="date">
				</div>
			</div>

			<div class="form-group">
				<label for="chekbox_label"
					class="col-sm-2 col-md-offset-2 control-label">No. of leg</label>
				<div class="col-sm-5 checkbox">
					<label><input type="checkbox" checked value="0" name="leg">0</label>
					<label><input type="checkbox" value="1" name="leg">1</label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-10">
					<button type="submit" class="btn btn-primary">Search</button>
				</div>
			</div>
		</form>
		<div class="col-md-10 col-sm-offset-1">
			<%
				if (request.getAttribute("Result") != "Invalid"
						&& request.getAttribute("Result") != null) {
					LinkedHashMap res = (LinkedHashMap) request
							.getAttribute("Result");
					Iterator<Entry<String, ArrayList<ArrayList<String>>>> it = res
							.entrySet().iterator();

					
			%>
			<h4>Flights(Direct as well as Connecting) that matched your
				criteria..</h4>

			<table class="table table-hover">
				<tr>
					<th>Flight Number</th>
					<th>Date</th>
					<th>Departure Airport</th>
					<th>Departure Time</th>
					<th>Arrival Airport</th>
					<th>Arrival Time</th>
					<th>Airline</th>
					<th>Weekdays</th>
				</tr>
				<%
					Entry<String, ArrayList<ArrayList<String>>> entry = it.next();
						ArrayList<ArrayList<String>> li = entry.getValue();
						ArrayList<String> row;
						
						for (int i = 0; i < li.size(); i++) {
							String s = entry.getKey();
							if (s.equals("Direct")) {
								row = li.get(i);
								if (it.hasNext()) {
									entry = it.next();
								}
				%>
				<tr>
					<td><%=row.get(0)%></td>
					<td><%=row.get(1)%></td>
					<td><%=row.get(2)%></td>
					<td><%=row.get(3)%></td>
					<td><%=row.get(4)%></td>
					<td><%=row.get(5)%></td>
					<td><%=row.get(6)%></td>
					<td><%=row.get(7)%></td>
				</tr>
				<%
					} else {
								row = li.get(i);
								if (it.hasNext()) {
									entry = it.next();
								}
				%>

				<tr>
					<td><%=row.get(0)%></td>
					<td><%=row.get(1)%></td>
					<td><%=row.get(2)%></td>
					<td><%=row.get(3)%></td>
					<td><%=row.get(4)%></td>
					<td><%=row.get(5)%></td>
					<td><%=row.get(6)%></td>
					<td><%=row.get(7)%></td>
				</tr>
				<%
					}

						}
				%>
			</table>
			<%
				} else if (request.getAttribute("Result") == "Invalid") {
			%>
			<h4>Sorry no result found for your request..!!</h4>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>