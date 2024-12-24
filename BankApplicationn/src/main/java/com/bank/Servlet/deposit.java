package com.bank.Servlet;

import java.io.IOException;

import com.bank.dao.CustomerDAO;
import com.bank.dao.CustomerDAOImpl;
import com.bank.dao.TransactionDAO;
import com.bank.dao.TransactionDAOImpl;
import com.bank.dto.Customer;
import com.bank.dto.Transaction;
import com.bank.dto.TransactionID;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deposit")
public class deposit extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String amountt = req.getParameter("amount");
		String accnoo = req.getParameter("accno");
		String pinn = req.getParameter("pin");

		HttpSession session = req.getSession(false);

		double amount = Double.parseDouble(amountt);
		long accno = Long.parseLong(accnoo);
		int pin = Integer.parseInt(pinn);

		Customer c = (Customer) session.getAttribute("customer");
		CustomerDAO cdao = new CustomerDAOImpl();

		TransactionDAO tdao = new TransactionDAOImpl();
		if (accno == c.getAccno()&&pin == c.getPin()&&amount > 0) 
		{
			c.setBal(c.getBal() + amount);
			boolean res = cdao.updateCustomer(c);

			if (res == true) 
			{

				req.setAttribute("deposit","Amount of Rs. " + amount + "Deposited Successfully..");
				req.setAttribute("success", "Your Current Balance is: "+c.getBal());
				RequestDispatcher rd = req.getRequestDispatcher("deposit.jsp");
				rd.forward(req, resp);

				Transaction t = new Transaction();
				t.setTransactionId(TransactionID.generateTransactionID());
				t.setUser(c.getAccno());
				t.setTransaction("CREDITED");
				t.setRec_acc(c.getAccno());
				t.setAmount(amount);
				t.setBalance(c.getBal());
				
				boolean result = tdao.insertTransaction(t);
				if (result == true) 
				{
					session.setAttribute("transaction", t);
					req.setAttribute("success", "Transaction successfully");
					RequestDispatcher rd1 = req.getRequestDispatcher("deposit.jsp");
					rd1.forward(req, resp);

				} else 
				{
					req.setAttribute("fail", "Transaction Failed");
					RequestDispatcher rd1 = req.getRequestDispatcher("deposit.jsp");
					rd.forward(req, resp);
				}
			}
			else {
				req.setAttribute("fail", "failed to deposit..");
				RequestDispatcher rd = req.getRequestDispatcher("deposit.jsp");
				rd.forward(req, resp);
			}
			
		} else {
			req.setAttribute("fail", "Invalid Credentials..");
			RequestDispatcher rd = req.getRequestDispatcher("deposit.jsp");
			rd.forward(req, resp);
		}

	}
}
