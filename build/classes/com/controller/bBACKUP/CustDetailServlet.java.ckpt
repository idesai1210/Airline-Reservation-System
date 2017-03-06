package com.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.DataConnection;

/**
 * Servlet implementation class CustDetailServlet
 */
@WebServlet("/CustDetailServlet")
public class CustDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fnumber=null;
		String date=null;
		String pname=null;
		ResultSet rs= null;
		DataConnection dc = new DataConnection();
		
		if(request.getParameter("optionsRadios").equals("flightId"))
		{
			fnumber=request.getParameter("inputFlightCode2");
			date=request.getParameter("flightDate");
			 rs = dc.passInfo(fnumber,date);
			 try {
					if (rs.next()) {
						rs.previous();
						request.setAttribute("passInfo", rs);
					} else {
						request.setAttribute("passInfo", "Invalid");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		else if(request.getParameter("optionsRadios").equals("passengerName"))
		{
			pname=request.getParameter("inputFlightCode2");
			rs=dc.flightList(pname);
			try {
				if (rs.next()) {
					rs.previous();
					request.setAttribute("flightList", rs);
					
				} else {
					request.setAttribute("flightList", "Invalid");
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		RequestDispatcher dispatch = request.getRequestDispatcher("custDetail.jsp");
		dispatch.forward(request, response);
	}

}
