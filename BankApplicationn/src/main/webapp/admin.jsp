<%@page import="com.bank.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    
  <link rel="stylesheet"rel=" https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css
">
    <style>
        *{
            margin: 0;
            padding: 0;
            list-style: none;
            text-decoration: none;

        }

        .sidebar{
            position: absolute;
            left: 0;
            width: 250px;
            height: 100%;
            background:#042331;
        }

        .sidebar header{
            font-size: 22px;
            color: white;
            text-align: center;
            line-height: 70px;
            background: #063146;
            user-select: none;
        }

        .sidebar ul a{
        text-decoration:none;
            display: block;
            height: 100%;
            width: 100%;
            line-height: 65px;
            font-size: 20px;
            color: white;
            padding-left: 40px;
            box-sizing: border-box;
            border-top: 1px solid rgba(255,255,255,.1);
            border-bottom: 1px solid black;
            transition: .4s;
        }
        
        .sidebar ul li a:hover{
        background-color:#495057;
        }
        
        .nav{
          
            width:100%;
            height: 80px;
          background-color: #042331;
            display: flex;
            align-items: center;
            justify-content: space-between;
          
        }
      .nav .logo{
        color: whitesmoke;
        margin:10px;
      }
        
        
        .main{
            text-align: right;
          
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
        	margin-right:20px;
        	
        }
       
      
	.btn{
	position:relative;
	top:-5px;
	
	}
	.btn input{
	border:none;
	background-color:transparent;
	color:white;
	width:100px;
	font-size:20px;
	
	
	}
    </style>
</head>
<body>
<%Customer c=(Customer)session.getAttribute("customer"); %>
<div class="nav">
<h1 class="logo">SBIBank</h1>
    <div class="main">
<a href="#" class="user">Welcome, <%=c.getName() %></a>
</div>

       
    </div>
    <div class="sidebar">
        <header>My App</header>
        <ul>
            <li><a href="admindashboard.jsp">Dashboard</a></li>
            <li><a href="viewaccount.jsp">View Accounts</a></li>
            <li><a href="viewtransaction.jsp">view Transaction</a></li>
            <li><a href="dashboard.jsp">View Profile</i></a></li>
            <li><a>
        <form action="logout" method="post" class="btn">
            <input type="submit" value="Logout" name="logout" >
        </form>
        </a>
        </li>
        </ul>
    </div>
</body>
</html>