<%@page import="com.bank.dto.Customer"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Account</title>
    <style>
        .Form{
            border: 3px solid black;
            width: 20%;
            margin-top: 150px;
            margin-left: 550px;
            padding: 50px;
            background-color: white;
            border-radius: 20px;
            box-shadow: 0px 5px 15px #9a9a9c;
            font-weight: bolder;
            position: absolute;
            
        }
         .h1{
            margin-left: 20px;
            margin-top: 30px;
            position: relative;
        }
        .input1{
             width: 100%;
             box-shadow: 0px 5px 15px grey;
             border: none;

        }
        .input{
            border-color: black;
        }
        .btn{
            text-decoration: none;
            color: white;
            background-color: blue;
            padding: 5px;
            width: 30%;
            height: 30px;
            position: relative;
           
            margin-left:30px;
        }
        .btnn{
        text-decoration: none;
            color: white;
            background-color: blue;
            padding: 5px;
            width: 30%;
            height: 30px;
            position: relative;
           margin-left:70px;
           font-weight:bold;
           
        
        }
         .success{
        	text-align:center;
        	margin-top:20px;
        }
        .failure{
        	text-align:center;
        	margin-top:20px;
        }
        body{
        background-color:#042331;
        }
        
        

    </style>
</head>
<body>
<%Customer c=(Customer)session.getAttribute("customer"); %>
<%String success=(String)request.getAttribute("success");
        	 if(success!=null){%>
         	<h3 class="success"><%=success %></h3>
        	 <%}%> 
        	 
        	 <%String failure=(String)request.getAttribute("failure");
        	 if(failure!=null){%>
        	 <h3 class="failure"><%=failure %></h3>
        	 <%} %>
    <form class="Form" action="Update" method="post" >
        <h1 class="h1"> Update Account</h1>
        <div class="input">
            <label>Enter your name</label>
            <br>
            <input type="text" class="input1" name="name" placeholder="Enter your name" value="<%=c.getName()%>" >
            <br>
            <br>

            <label>Enter your phone</label>
            <br>
            <input type="text" class="input1" name="phone" placeholder="Enter phone number" value="<%=c.getPhone()%>">
            <br>
            <br>
            <label>Enter your mail</label>
            <br>
            <input type="email" class="input1" name="mail" placeholder="Enter your mail" value="<%=c.getMail()%>">
            
        </div>
        <br>
         <input type="submit"  class="btnn" value="Update" >
        
        <a href="dashboard.jsp" class="btn btn-primary" > Back</a>
    </form>
</body>