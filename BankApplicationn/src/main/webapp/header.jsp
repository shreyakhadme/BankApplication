<%@page import="com.bank.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<body>
<%Customer c=(Customer)session.getAttribute("customer"); %>
    <div class="nav">
      <a href="dashboard.jsp" class="logo">SBI  Bank</a>
       
        <ul>
        <%if(c.getAccno()==1100110011) { %>
         <li class="active"><a href="admindashboard.jsp" class="Home">Admin</a></li>
        <%} %>
            <li class="active"><a href="#" class="Home">Home</a></li>
            <li class="active"><a href="#" class="About us">About us</a></li>
            <li class="active"><a href="update.jsp" class="UpdateAccount">UpdateAccount</a></li>
            <li class="active"><a href="#" class="Passbook">Passbook</a></li>
            <li class="active"><a href="reset.jsp" class="Reset pin">Reset pin</a></li>
       <li>
        <form action="logout" method="post">
            <input type="submit" value="Logout" name="logout" class="btn1">
        </form>
        </li>
    </ul>
    </div>
    <div class="main">
<a href="#" class="user">Welcome, <%=c.getName() %></a>

<a href="#" class="userr">Account number:<%=c.getAccno() %></a>
</div>
</body>
</html>