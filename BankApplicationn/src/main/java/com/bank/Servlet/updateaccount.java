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
@WebServlet("/Update")
public class updateaccount extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	 String name=req.getParameter("name");
	 long phone =Long.parseLong(req.getParameter("phone"));
	 String mail=req.getParameter("mail");	 
	 
	 HttpSession session=req.getSession(false);
	 CustomerDAO cdao=new CustomerDAOImpl();
	 Customer c=(Customer)session.getAttribute("customer");
	 c.setName(name);
	 c.setPhone(phone);
	 c.setMail(mail);
	 
		 boolean res=cdao.updateCustomer(c);
		 if(res==true)
		 {
			
			 req.setAttribute("success", "successfully updated the account");
			 RequestDispatcher rd=req.getRequestDispatcher("update.jsp");
			 rd.forward(req, resp);
		 }
		 else {
			 req.setAttribute("failure", "unable to update account");
			 RequestDispatcher rd=req.getRequestDispatcher("update.jsp");
			 rd.forward(req, resp);
		 }
	 }
	

}
