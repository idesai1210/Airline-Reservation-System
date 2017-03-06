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
		<form class="form-horizontal" action="FlightServlet" method="post">
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
				<label for="chekbox_label"
					class="col-sm-2 col-md-offset-2 control-label">No. of leg</label>
				<div class="col-sm-5 checkbox">
					<label><input type="checkbox" checked value="0" name="leg">0</label>
					<label><input type="checkbox" value="1" name="leg">1</label>
					<label><input type="checkbox" value="2" name="leg">2</label>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-10">
					<button type="submit" class="btn btn-primary">Search</button>
				</div>
			</div>
		</form>



		<div class="col-md-7 col-md-offset-2">
			<%
				if (request.getAttribute("Result") != "Invalid"
						&& request.getAttribute("Result") != null) {
					LinkedHashMap res = (LinkedHashMap) request
							.getAttribute("Result");
					Iterator<Entry<String, List<ResultSet>>> it = res.entrySet()
							.iterator();

					String key = null;
					while (it.hasNext()) {
						Entry<String, List<ResultSet>> entry = it.next();
						key = entry.getKey();
						System.out.println(key);
						if (key.equals("Direct")) {
			%>
			<h4>Direct Flight..</h4>
			<table class="table table-hover">
				<tr>
					<th>Flight Number</th>
					<th>Departure Airport</th>
					<th>Departure Time</th>
					<th>Arrival Airport</th>
					<th>Arrival Time</th>
					<th>Weekdays</th>
				</tr>
				<%
					List<ResultSet> li = entry.getValue();
								ResultSet row = li.get(0);
								row.first();
								row.previous();
								while (row.next()) {
				%>
				<tr>
					<td><%=row.getString(1)%></td>
					<td><%=row.getString(2)%></td>
					<td><%=row.getString(3)%></td>
					<td><%=row.getString(4)%></td>
					<td><%=row.getString(5)%></td>
					<td><%=row.getString(6)%></td>
				</tr>


				<%
					}
				%>
			</table>
			<%
				}
						if (key.equals("Single")) {
			%>
			<h4>Connecting Flight (one leg)</h4>
			<table class="table table-hover">
				<tr>
					<th>1st Flight Number</th>
					<th>2nd Flight Number</th>
					<th>Origin</th>
					<th>Intermediate</th>
					<th>Destination</th>
					<th>1st Weekdays</th>
					<th>2nd Weekdays</th>
				</tr>
				<%
					List<ResultSet> li = entry.getValue();
							
								ResultSet row = li.get(0);
								row.first();
									row.previous();
								while (row.next()) {
				%>
				<tr>
					<td><%=row.getString(1)%></td>
					<td><%=row.getString(2)%></td>
					<td><%=row.getString(3)%></td>
					<td><%=row.getString(4)%></td>
					<td><%=row.getString(5)%></td>
					<td><%=row.getString(6)%></td>
					<td><%=row.getString(7)%></td>
				</tr>
				<%
					}%></table>
					<%
							}
						if (key.equals("Two")) {
							%>
							<h4>Connecting Flight (Two Leg)</h4>
							<table class="table table-hover">
								<tr>
									<th>1st Flight Number</th>
									<th>2nd Flight Number</th>
									<th>3rd Flight Number</th>
									<th>Origin</th>
									<th>Intermediate1</th>
									<th>Intermediate2</th>
									<th>Destination</th>
									<th>1st Weekdays</th>
									<th>2nd Weekdays</th>
									<th>3rd Weekdays</th>
								</tr>
								<%
									List<ResultSet> li = entry.getValue();
										ResultSet row = li.get(0);
												row.first();
													row.previous();
									while (row.next()) {
								%>
								<tr>
									<td><%=row.getString(1)%></td>
									<td><%=row.getString(2)%></td>
									<td><%=row.getString(3)%></td>
									<td><%=row.getString(4)%></td>
									<td><%=row.getString(5)%></td>
									<td><%=row.getString(6)%></td>
									<td><%=row.getString(7)%></td>
									<td><%=row.getString(8)%></td>
									<td><%=row.getString(9)%></td>
									<td><%=row.getString(10)%></td>
								</tr>
								<%
									}%></table>
									<%
											}
						}
					}
				%>

				</div>
				</div>
</body>
</html>