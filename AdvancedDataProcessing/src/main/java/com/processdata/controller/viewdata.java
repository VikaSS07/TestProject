package com.processdata.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.processdata.entity.Transaction;
import com.processdata.modal.TransactionModal;

public class viewdata extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public viewdata() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		TransactionModal transactionmodal = new TransactionModal();
		ArrayList<Transaction> transactions = transactionmodal.getAllTransactions(request.getParameter("offset"));
		int count = transactionmodal.getCount();
		request.setAttribute("transactions", transactions);
		request.setAttribute("count", count);
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}

}
