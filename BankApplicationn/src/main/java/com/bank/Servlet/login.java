package com.bank.Servlet;

import java.io.IOException;

import com.bank.dao.CustomerDAO;
import com.bank.dao.CustomerDAOImpl;
import com.bank.dto.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/login")
public class login extends  HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	HttpSession session=req.getSession(false);
	int accno=Integer.parseInt(req.getParameter("accno"));
	int pin=Integer.parseInt(req.getParameter("pin"));
	
	CustomerDAO cdao=new CustomerDAOImpl();
	Customer c=(Customer)cdao.getCustomer(accno, pin);
	if(c!=null)
	{
		if(c.getAccno()==1100110011)
		{
			session.setAttribute("customer",c);
			RequestDispatcher rd=req.getRequestDispatcher("admindashboard.jsp");
			rd.forward(req, resp);	
		}
		else
		{
			
		
		session.setAttribute("customer",c);
		RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
		rd.forward(req, resp);
		
	}
	}
	else {
		req.setAttribute("failure", "invalid data ,unsuccessful");
		RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
		rd.forward(req, resp);
	}
}
}
