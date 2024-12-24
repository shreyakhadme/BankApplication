<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit</title>
    <style>
        .Form{
            border: 3px solid black;
            width: 25%;
            margin-top: 100px;
            margin-left: 600px;
            padding: 30px;
            background-color: white;
            border-radius: 20px;
            box-shadow: 0px 5px 15px #9a9a9c;
            font-weight: bolder;
            position: absolute;
            
        }
         .h1{
            margin-left: 20px;
            margin-top: 10px;
            position: relative;
            text-align:center;
            margin-bottom: 20px;
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
            padding: 6px;
            width: 30%;
            height: 30px;
            margin-right: 20px;
            
            
        }
        .btnn{
        	border:none;
        	margin-left: 80px;
        	margin-right: 60px;
        	 
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
<%@include file="header.jsp" %>

			<%String deposit=(String)request.getAttribute("deposit");
        	 if(deposit!=null){%>
         	<h3 class="success"><%=deposit %></h3>
        	 <%}%>
            
             <%String success=(String)request.getAttribute("success");
        	 if(success!=null){%>
         	<h3 class="success"><%=success %></h3>
        	 <%}%> 
        	<%String fail=(String)request.getAttribute("fail");
        	 if(fail!=null){%>
         	<h3 class="failure"><%=fail %></h3>
        	 <%}%>
    <form class="Form" action="deposit" method="post" >
        <h1 class="h1">Deposit Here</h1>
        <div class="input">
            <label>Enter your amount</label>
            <br>
            <input type="text" class="input1" name="amount" placeholder="Enter amount" required>
            <br>
            <br>

            <label>Enter your account number</label>
            <br>
            <input type="text" class="input1" name="accno" placeholder="Enter account number" required>
            <br>
            <br>
            <label>Enter your Pin</label>
            <br>
            <input type="password" class="input1" name="pin" placeholder="Enter pin" required>
            
        </div>
        <br>
       <input type="submit" value="Deposit" class="btnn btn btn-primary">
      		 <a href="dashboard.jsp" class="btn btn-primary">Back</a>
    </form>
</body>
</html>