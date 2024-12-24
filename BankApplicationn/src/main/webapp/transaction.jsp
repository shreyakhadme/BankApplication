<%@page import="com.bank.dto.Customer"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bank.dto.Transaction"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bank.dao.TransactionDAOImpl"%>
<%@page import="com.bank.dao.TransactionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <title>Transaction</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .Trans{
          margin: 60px 0px;
        }
        .Trans h3{
          margin: 10px;
        }
        .Trans a{
          float: right;
          margin-right: 80px;
          margin-bottom: 10px;
          text-align: center;
          text-decoration: none;
          color: white;
          font-size: 20px;
          background-color: blue;
          width: auto;
          padding: 7px;
          border-radius: 5px;

        }
        .table{
          width: 90%;
          margin: 10px 60px;

        }
        body{
          background-color: darkcyan;

        } 
         .trans{
        margin: 60px 0px;

       }

       .trans h3{
        margin: 10px;
       }

       .trans a {
	float: right;
	margin-right: 80px;
	margin-bottom: 10px;
	text-align: center;
	text-decoration: none;
	color: white;
	font-size: 20px;
	background-color: blue;
	width: auto;
	padding: 7px;
	border-radius: 5px;
}


.table {
	width: 90%;
	margin: 10px 60px;
}

    </style>
</head>
<%Customer c1=(Customer)session.getAttribute("customer"); %>
<body  class="body">
<%@include file="header.jsp" %>

    <div class="trans">
        <h3>Transaction Details</h3>
      <table class="table">
        
        <thead>
       <th>slno <%int count=1; %></th>
       <th>TRAN_ID</th>
       <th>USER_ACC</th>
       <th>REC_ACC</th>
       <th>TRAN_DATE</th>
       <th>AMOUNT</th>
       <th>BALANCE</th>
       <th>TRAN_TYPE</th>
        </thead>
        <tbody>
        <%TransactionDAO tdao=new TransactionDAOImpl();
        ArrayList <Transaction> list=(ArrayList <Transaction>)tdao.getTransaction(c.getAccno());
        Iterator<Transaction> it=(list.iterator());%>
        <%while(it.hasNext()) {
        Transaction t=it.next();%>
       
        
          <tr class="table-active">
            <td><%=count++ %></td>
           <td><%=t.getTransactionId() %></td>
					<td><%=t.getUser() %></td>
					<td><%=t.getRec_acc() %></td>
					<td><%=t.getDate() %></td>
					<td><%=t.getAmount() %></td>
					<td><%=t.getBalance() %></td>
					<td><%=t.getTransaction() %></td>
          </tr>
        <%} %>
        </tbody>
      </table>
    </div>
</body>
</html>