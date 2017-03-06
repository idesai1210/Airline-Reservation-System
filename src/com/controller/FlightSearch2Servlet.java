package com.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.DataConnection;

/**
 * Servlet implementation class FlightSearch2Servlet
 */
@WebServlet("/FlightSearch2Servlet")
public class FlightSearch2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	String dept_code = null;
	String arr_code = null;
	String date=null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		dept_code = request.getParameter("inputDepartureCode");
		arr_code = request.getParameter("inputArrivalCode");
		date = request.getParameter("date");
		String leg_value=null;
		String leg[]=request.getParameterValues("leg");
		
		if(leg.length>1){
		leg_value="both";
		}
		else if(leg[0].equals("0")){
			leg_value="zero";
		}
		else if(leg[0].equals("1")){
			leg_value="one";
		}
		DataConnection dc = new DataConnection();
		LinkedHashMap<String, ArrayList<ArrayList<String>>> rs;
		try {
			rs = dc.fsearchDate(dept_code, arr_code,leg_value,date);
		
		if (!rs.isEmpty()) {
			Iterator<Entry<String, ArrayList<ArrayList<String>>>> it = rs
					.entrySet().iterator();
			Entry<String, ArrayList<ArrayList<String>>> entry = it.next();
			entry.getValue();
			try {
				if (entry.getValue().size() != 0) {
					request.setAttribute("Result", rs);
				} else {
					request.setAttribute("Result", "Invalid");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatch = request
					.getRequestDispatcher("search2.jsp");
			dispatch.forward(request, response);

		}
		else{
			request.setAttribute("Result", "Invalid");
			RequestDispatcher dispatch = request
					.getRequestDispatcher("search2.jsp");
			dispatch.forward(request, response);
			
		}

	}catch (ParseException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	}
}
