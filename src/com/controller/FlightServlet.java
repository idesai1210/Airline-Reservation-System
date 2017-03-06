package com.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.DataConnection;

/**
 * Servlet implementation class FlightServlet
 */
@WebServlet("/FlightServlet")
public class FlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	String dept_code = null;
	String arr_code = null;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		dept_code = request.getParameter("inputDepartureCode");
		arr_code = request.getParameter("inputArrivalCode");
		String leg_value = null;
		String leg[] = request.getParameterValues("leg");

		if (leg.length > 2) {
			leg_value = "all";
		} else {
			if (leg.length == 1) {
				if (leg[0].equals("0")) {
					leg_value = "zero";
				} else if (leg[0].equals("1")) {
					leg_value = "one";
				} else if (leg[0].equals("2")) {
					leg_value = "two";
				}
			} else if (leg.length == 2) {
				if(leg[0].equals("0") && leg[1].equals("1")){
					leg_value="01";
				}
				else if(leg[0].equals("1") && leg[1].equals("2")){
					leg_value="12";
				}
				else if(leg[0].equals("0") && leg[1].equals("2")){
					leg_value="02";
				}
			}
		}
		System.out.println(leg_value);
		
		DataConnection dc = new DataConnection();
		LinkedHashMap<String,List<ResultSet>> rs = dc
				.flightSearch(dept_code, arr_code, leg_value);
		if (!rs.isEmpty()) {
					request.setAttribute("Result", rs);
				}	
		else {
			request.setAttribute("Result", "Invalid");
		}

		RequestDispatcher dispatch = request
				.getRequestDispatcher("search.jsp");
		dispatch.forward(request, response);
	}
}