package com.processdata.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.processdata.modal.ExcelProcessing;

/**
 * Servlet implementation class DownloadBlankExcel
 */
public class DownloadBlankExcel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean result = new ExcelProcessing().createExcelFile();
		String code = result ? "100" : "300";
		response.sendRedirect("index.jsp");
	}
}
