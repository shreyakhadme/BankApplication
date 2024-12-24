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

@WebServlet("/checkbalance")
public class checkbalance extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     HttpSession session=req.getSession(false);
     int pin=Integer.parseInt(req.getParameter("pin"));
     CustomerDAO cdao=new CustomerDAOImpl();
     Customer c=(Customer)session.getAttribute("customer");
     
     if(c!=null && pin==c.getPin())
     {
    	 req.setAttribute("success", "your balance is:"+c.getBal());
    	RequestDispatcher rd=req.getRequestDispatcher("checkbalance.jsp");
    	rd.forward(req, resp);
     }
     else {
    	 req.setAttribute("failure", "invalid credential");
     	RequestDispatcher rd=req.getRequestDispatcher("checkbalance.jsp");
     	rd.forward(req, resp);
    	 
     }
	}

}
