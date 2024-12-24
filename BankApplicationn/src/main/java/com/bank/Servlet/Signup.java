package com.bank.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.bank.dao.CustomerDAO;
import com.bank.dao.CustomerDAOImpl;
import com.bank.dto.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/Signup")
public class Signup extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String phne=req.getParameter("phone");
		String mail=req.getParameter("mail");
		String mpin=req.getParameter("pin");
		String confirmm=req.getParameter("confirm");
		
		int pin=Integer.parseInt(mpin);
		int confirm=Integer.parseInt(confirmm);
		
		long phone=Long.parseLong(phne);
		PrintWriter out=resp.getWriter();
		
		Customer c=new Customer();
		CustomerDAO cdao =new CustomerDAOImpl();
		
		if(pin==confirm)
		{
			c.setName(name);
			c.setPhone(phone);
			c.setMail(mail);
			c.setPin(pin);
			
			boolean result =cdao.insertCustomer(c);
			if(result==true)
			{
				req.setAttribute("success","Signup successful");
			RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
			rd.forward(req, resp);
			//				s=sdao.getStudent(mail, password);
//			out.println("<h1>Account Created Successfully... Your Student Id is: "+s.getId()+"</h1>");
		}
		else
		{
			req.setAttribute("fail","Signup failed");
			RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
			rd.forward(req, resp);
			
//			out.println("Failed to create the Account");
		}
	}
	else {
		req.setAttribute("mismatch","password mismatch");
		RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
		rd.forward(req, resp);
	}
}
					
	
	}