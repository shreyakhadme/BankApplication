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

@WebServlet("/delete")
public class deleteAccount extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sender = req.getParameter("accno");

		long accno = Long.parseLong(sender);

		HttpSession session = req.getSession(false);
		Customer admin = (Customer) session.getAttribute("customer");
		CustomerDAO cdao = new CustomerDAOImpl();
		Customer c = cdao.getCustomer(accno);
		TransactionDAO tdao = new TransactionDAOImpl();
		

	if(admin.getAccno()!=accno) {
				boolean res2 = cdao.deleteCustomer(c);
				c.setAccno(accno);
				double amount=c.getBal();
				admin.setBal(admin.getBal()+c.getBal());
				boolean res=cdao.updateCustomer(admin);;

				if (res == true) {
					Transaction t=new Transaction();
					t.setTransactionId(TransactionID.generateTransactionID());
					t.setUser(c.getAccno());
					t.setRec_acc(admin.getAccno());
					t.setTransaction("CREDITED");
					t.setAmount(amount);
					t.setBalance(admin.getBal());

					boolean result = tdao.insertTransaction(t);
				
				if (res && result) {
					
					req.setAttribute("delete", "Account deleted successfully");
					RequestDispatcher rd = req.getRequestDispatcher("deleteaccount.jsp");
					rd.forward(req, resp);
				} else {
					req.setAttribute("fail", "failed to delete account");
					RequestDispatcher rd = req.getRequestDispatcher("deleteaccount.jsp");
					rd.forward(req, resp);

				}
			}
			else {
				req.setAttribute("fail", "failed to delete account");
				RequestDispatcher rd = req.getRequestDispatcher("deleteaccount.jsp");
				rd.forward(req, resp);

			}

		}
		else {
			req.setAttribute("fail", "Admin account cannot be deleted");
			RequestDispatcher rd = req.getRequestDispatcher("deleteaccount.jsp");
			rd.forward(req, resp);

		}
	}
	
}