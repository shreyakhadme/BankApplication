<%@page import="java.util.Iterator"%>
<%@page import="com.bank.dto.Transaction"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bank.dao.TransactionDAOImpl"%>
<%@page import="com.bank.dao.TransactionDAO"%>
<%@page import="com.bank.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        *{
            margin: 0;
            padding:0;
            box-sizing: border-box;
        }
        .body{
            height: 100vh;
            width: 100%;
        background-color: #042331;

        }
        .nav{
          
            width:100%;
            height: 80px;
          background-color: #063146;
            display: flex;
            align-items: center;
            justify-content: space-between;
          
        }
      .nav .logo{
        color: whitesmoke;
        margin:10px;
        text-decoration:none;
        font-size:40px;
      }
        
        .nav ul {
        margin:10px;
            position: relative;
           display: flex;
          gap:20px;
          list-style-type: none;
           /* left: 5px; */
        }
        .active,nav ul li :hover{ 
     border-radius: 3px;
     }
          li a{
            color:whitesmoke;
            text-decoration: none;
            font: bold; 
        }

          li a::after{
            content: '';
            height: 3px;
            width: 0;
            background-color: black;
           display:block;
           margin:auto;
            left: 0;
            bottom: -8px;
            transition: 0.3s;
        }

          li a:hover::after{
            color:green;
            width: 100%;
            background-color:white
        }
       
        
        .btn1{
            border: 1px solid black;
            border-radius: 5px;
            width: 60px;
            height: 30px;
            background-color: aqua;
        }
        .card{
            position: relative;
            display: inline-block;
            margin-top: 80px;
            margin-left: 160px;
            padding-left: 30px;
            background-color:#063146;
        }

        .btn{
            color: black;
            background-color: #fff;
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
		.main{
            text-align: center;
            background-color:#0a5275;
            color:white;
            margin-top: 10px;
            height: 50px;

        }
        .main a{
        text-decoration:none;
        color:white;
        font-size:20px;
        padding-left:400px;
        position:relative;
        top:10px;
        
        }
        .user{
        	position:relative;
        	left:60px;
        	
        }
      
    </style>
</head>
<body class="body">

<%Customer c=(Customer)session.getAttribute("customer"); %>
    <div class="nav">
      <a href="dashboard.jsp" class="logo">SBI Bank</a>
       
        <ul>
        	<%if(c.getAccno()==1100110011) { %>
         <li class="active"><a href="admindashboard.jsp" class="Home">Admin</a></li>
        <%} %>
            <li class="active"><a href="#" class="Home">Home</a></li>
            <li class="active"><a href="about.jsp" class="About us">About us</a></li>
            <li class="active"><a href="viewuser.jsp" class="View User">ViewUSer</a></li>
            <li class="active"><a href="update.jsp" class="UpdateProfile">UpdateProfile</a></li>
          
            <li class="active"><a href="reset.jsp" class="resetpin">Reset pin</a></li>
       <li>
        <form action="logout" method="post">
            <input type="submit" value="Logout" name="logout" class="btn1">
        </form>
        </li>
    </ul>
    </div>
<div class="main">
<a href="#" class="user">Welcome, <%=c.getName()

%></a>

<a href="#" class="userr">Account number:<%=c.getAccno() %></a>
</div>
    
      <div class="card text-bg-secondary mb-3" style="max-width: 18rem;">
        <div class="card-header">Balance</div>
        <div class="card-body">
          <h5 class="card-title">Balance Amount</h5>
          <p class="card-text">Click here to check the balance</p>
		<a href="checkbalance.jsp" class="btn btn-primary">Check Your Balance</a>       
		 </div>
      </div>
      
      <div class="card text-bg-light mb-3" style="max-width: 18rem;">
        <div class="card-header">Deposit</div>
        <div class="card-body">
          <h5 class="card-title">Deposit Amount</h5>
          <p class="card-text">Click here to do the deposit</p>
         <a href="deposit.jsp" class="btn btn-primary">Click here to deposit</a>
        </div>
      </div>

      <div class="card text-bg-secondary mb-3" style="max-width: 18rem;">
        <div class="card-header">Transfer Amount</div>
        <div class="card-body">
          <h5 class="card-title">Transfer Amount</h5>
          <p class="card-text">Click here to Transfer amount</p>
          <a href="transfer.jsp" class="btn btn-primary">Click to transfer amount</a>
        </div>
      </div>
     
      <div class="trans">
        <h3>Transaction Details</h3>
        <a href="transaction.jsp" class="btn btn-primary">View Transaction</a>
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
        Iterator<Transaction> it=(list.iterator());
        int i=1;%>
        <%while(it.hasNext()&& i<=5) {
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
        <%i++; %>
        <%} %>
        </tbody>
      </table>
    </div>
    
</body>
</html>