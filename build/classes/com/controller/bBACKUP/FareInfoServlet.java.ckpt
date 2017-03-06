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
 * Servlet implementation class FareInfoServlet
 */
@WebServlet("/FareInfoServlet")
public class FareInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String f_number = request.getParameter("inputFlightCode");

		DataConnection dc = new DataConnection();
		ResultSet rs = dc.fareInfo(f_number);
		try {
			if (rs.next()) {
				rs.previous();
				request.setAttribute("Result", rs);
			} else {
				request.setAttribute("Result", "Invalid");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher dispatch = request.getRequestDispatcher("fare.jsp");
		dispatch.forward(request, response);
	}

}
