package com.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.sql.ResultSetMetaData;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DataConnection {
	Connection con;
	Statement stmt, dirstmt,stmt1;

	public DataConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		try {
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/airline_system1", "root",
					"MAVERICK");

		} catch (SQLException e) {
			e.printStackTrace();

		}
	}

	public LinkedHashMap<String, List<ResultSet>> flightSearch(
			String dept_code, String arr_code, String leg) {
		ResultSet rs = null;
		ResultSet rs2=null;
		LinkedHashMap<String, List<ResultSet>> res = new LinkedHashMap<String, List<ResultSet>>();

		try {
			ResultSet dirRes = null;
			stmt = con.createStatement();
			dirstmt = con.createStatement();
			stmt1=con.createStatement();
			String sql;

			if (leg.equals("01") || leg.equals("zero") || leg.equals("all")
					|| leg.equals("02")) {
				List<ResultSet> Rows = new ArrayList<ResultSet>();

				sql = "select flight_number,Departure_airport_code,Scheduled_departure_time,Arrival_airport_code,Scheduled_arrival_time,weekdays from flight f where (f.departure_airport_code)='"
						+ dept_code
						+ "' and (f.arrival_airport_code)='"
						+ arr_code + "';";
				dirRes = dirstmt.executeQuery(sql);
				System.out.println(sql);
				if (dirRes.next()) {
					dirRes.previous();
					while (dirRes.next()) {
						Rows.add(dirRes);
					}
					res.put("Direct", Rows);
				}
			}
			if (leg.equals("one") || leg.equals("01") || leg.equals("12")
					|| leg.equals("all")) {
				List<ResultSet> Rows = new ArrayList<ResultSet>();
				sql = "Select DISTINCT f1.Flight_number, f2.Flight_number , f1.Departure_airport_code ,f1.Arrival_airport_code, f2.Arrival_airport_code , f1.weekdays,f2.weekdays "
						+ "from FLIGHT as f1 join FLIGHT as f2 "
						+ "on (f1.Arrival_airport_code=f2.Departure_airport_code) and timediff(f2.Scheduled_Departure_time,f1.Scheduled_arrival_time)>'01:00:00'"
						+ "where f1.Departure_airport_code='"
						+ dept_code
						+ "' AND f2.Arrival_airport_code='" + arr_code + "' and INSTR(TRIM(f2.Weekdays),f1.Weekdays)>-1;";
				rs = stmt.executeQuery(sql);
				if (rs.first()) {
					rs.previous();
					while (rs.next()) {
						Rows.add(rs);
					}
					res.put("Single", Rows);

				}
			}

			if (leg.equals("two") || leg.equals("12") || leg.equals("02")
					|| leg.equals("all")) {
				List<ResultSet> Rows = new ArrayList<ResultSet>();
				sql = "Select DISTINCT f1.Flight_number , f2.Flight_number , f3.Flight_number, f1.Departure_airport_code,f1.Arrival_airport_code, f2.Arrival_airport_code, f3.Arrival_airport_code,f1.weekdays,f2.weekdays,f3.weekdays  "
						+ "from FLIGHT as f1 join FLIGHT as f2 join FLIGHT as f3 "
						+ "on (f1.Arrival_airport_code=f2.Departure_airport_code AND f2.Arrival_airport_code=f3.Departure_airport_code) "
						+ "and timediff(f2.Scheduled_Departure_time,f1.Scheduled_arrival_time)>'01:00:00' and timediff(f3.Scheduled_Departure_time,f2.Scheduled_arrival_time)>'01:00:00' "
						+ "where f1.Departure_airport_code='"
						+ dept_code
						+ "' AND f3.Arrival_airport_code='"
						+ arr_code
						+ "' and INSTR(TRIM(f2.Weekdays),f1.Weekdays)>-1 and INSTR(TRIM(f3.Weekdays),f2.Weekdays)>-1;";
				rs2 = stmt1.executeQuery(sql);
				System.out.println(sql);
				if (rs2.first()) {
					rs2.previous();
					while (rs2.next()) {
						Rows.add(rs2);
					}
					res.put("Two", Rows);

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return res;
	}

	public LinkedHashMap<String, ArrayList<ArrayList<String>>> fsearchDate(
			String dept_code, String arr_code, String leg, String date)
			throws ParseException {
		ResultSet rs = null;
		LinkedHashMap<String, ArrayList<ArrayList<String>>> res = new LinkedHashMap<String, ArrayList<ArrayList<String>>>();
		ArrayList<ArrayList<String>> Rows = new ArrayList<ArrayList<String>>();
		ResultSetMetaData rsmd;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(format.parse(date));
		cal.add(Calendar.DATE, 1);
		System.out.println(Calendar.DATE);
		String newDate = format.format(cal.getTime());
		System.out.println(newDate);

		try {
			ResultSet dirRes = null;
			stmt = con.createStatement();
			dirstmt = con.createStatement();
			String sql;
			if (leg.equals("both") || leg.equals("zero")) {
				sql = "select distinct f.flight_number,date,f.departure_airport_code,i.departure_time,f.arrival_airport_code,i.arrival_time,f.airline,f.weekdays "
						+ "from flight f,flight_instance i "
						+ "where f.flight_number=i.flight_number and f.departure_airport_code='"
						+ dept_code
						+ "' and f.arrival_airport_code='"
						+ arr_code + "' and i.date='" + date + "'";
				dirRes = dirstmt.executeQuery(sql);
				rsmd = dirRes.getMetaData();

				if (dirRes.first()) {
					dirRes.previous();
					while (dirRes.next()) {
						ArrayList<String> row = new ArrayList<String>();
						for (int i = 1; i <= rsmd.getColumnCount(); i++) {
							row.add(dirRes.getString(i));
						}
						Rows.add(row);
					}
					res.put("Direct", Rows);
				}
			}
			if (leg.equals("one") || leg.equals("both")) {

				sql = "select distinct f.arrival_airport_code,arrival_time from flight f,flight_instance i "
						+ "where f.flight_number=i.flight_number and f.departure_airport_code= '"
						+ dept_code
						+ "' and f.arrival_airport_code in "
						+ "(select Departure_airport_code from flight f,flight_instance i "
						+ "where f.flight_number=i.flight_number and Arrival_airport_code='"
						+ arr_code
						+ "' "
						+ "and (i.date='"
						+ date
						+ "' or i.date='"
						+ newDate
						+ "'))"
						+ "and (i.date='"
						+ date + "' or i.date='" + date + "');";

				System.out.println("1  " + sql);
				rs = stmt.executeQuery(sql);

				while (rs.next()) {
					ResultSet temp1, temp2;
					Statement stmt1, stmt2;
					stmt1 = con.createStatement();
					stmt2 = con.createStatement();

					sql = "select distinct f.flight_number,date,departure_airport_code,departure_time,arrival_airport_code,arrival_time,f.airline,f.weekdays from flight f,flight_instance i "
							+ " where f.flight_number=i.flight_number and departure_airport_code = '"
							+ dept_code
							+ "' and arrival_airport_code = '"
							+ rs.getString(1) + "' and (date='" + date + "');";
					System.out.println("2  " + sql);
					temp1 = stmt1.executeQuery(sql);

					sql = "select distinct f.flight_number,date,f.departure_airport_code,i.departure_time,f.arrival_airport_code,i.arrival_time,f.airline,f.weekdays"
							+ "	from flight f,flight_instance i"
							+ "	where f.flight_number=i.flight_number and f.departure_airport_code = '"
							+ rs.getString(1)
							+ "' and f.arrival_airport_code = '"
							+ arr_code
							+ "' "
							+ "and ((i.date = '"
							+ date
							+ "' and TIME_TO_SEC(i.departure_time) > TIME_TO_SEC('"
							+ rs.getString(2)
							+ "')+3600) or i.date = '"
							+ newDate + "')";
					System.out.println("3  " + sql);
					temp2 = stmt2.executeQuery(sql);
					rsmd = temp1.getMetaData();
					if (temp1.first()) {
						temp1.previous();
						while (temp1.next()) {
							ArrayList<String> row = new ArrayList<String>();
							for (int i = 1; i <= rsmd.getColumnCount(); i++) {
								row.add(temp1.getString(i));
							}
							Rows.add(row);
						}

						rsmd = temp2.getMetaData();

						while (temp2.next()) {
							ArrayList<String> row = new ArrayList<String>();
							for (int i = 1; i <= rsmd.getColumnCount(); i++) {
								row.add(temp2.getString(i));
							}
							Rows.add(row);
						}
						res.put(rs.getString(1), Rows);

					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	public ResultSet seatAvailability(String fnumber, String date) {
		ResultSet rs = null;
		try {
			stmt = con.createStatement();
			String sql = "select number_of_available_seats,flight_number,date from flight_instance where flight_number= '"
					+ fnumber + "' and date='" + date + "';";
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public ResultSet fareInfo(String fnumber) {
		ResultSet rs = null;
		try {
			stmt = con.createStatement();
			String sql = "select flight_number, Fare_code, amount, restrictions from fare where flight_number='"
					+ fnumber + "';";
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public ResultSet passInfo(String fnumber, String date) {
		ResultSet rs = null;
		try {
			stmt = con.createStatement();
			String sql = "select flight_number,customer_name,seat_number,date from seat_reservation where flight_number = '"
					+ fnumber + "' and date ='" + date + "';";
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public ResultSet flightList(String pname) {
		ResultSet rs = null;
		try {
			stmt = con.createStatement();
			String sql = "select flight_number,customer_name,seat_number,date from seat_reservation where customer_name = '"
					+ pname + "';";
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
}
