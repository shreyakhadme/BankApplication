<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Balance</title>
    <style>
        .Form{
            border: 3px solid black;
            width: 25%;
            margin-top: 150px;
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
            text-align:center;
            position: relative;
        }
        .input1{
             width: 100%;
             height:20px;
             box-shadow: 0px 5px 15px grey;
             border: none;
             margin-top:10px;

        }
        .input{
            border-color: none;
              margin-top:10px;
        }
        .btn{
            text-decoration: none;
            color: white;
            background-color: blue;
            padding: 5px;
            width: 30%;
            height: 30px;
            position: relative;
            margin-right: 50px;
            margin-top:20px;
            /* display: flex;
            justify-content: space-between; */
        }
        .btnn{
        	border:none;
        	width:100px;
        	margin-left:60px;
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
        background-color: #042331;
        }

    </style>
</head>
<body>
<%@include file="header.jsp" %>
<%String success=(String)request.getAttribute("success");
        	 if(success!=null){%>
         	<h3 class="success"><%=success %></h3>
        	 <%}%>
            
              
        	<%String failure=(String)request.getAttribute("failure");
        	 if(failure!=null){%>
         	<h3 class="failure"><%=failure %></h3>
        	 <%}%>
    <form class="Form" action="checkbalance" method="post" >
        <h1 class="h1">Check Balance </h1>
        <div class="input">
           
            <label>Enter your Pin</label>
            <br>
            <input type="password" class="input1" name="pin" placeholder="Enter pin" required>
            
        </div>
        <br>
       <input type="submit" value="Check Balance" class="btnn btn btn-primary">
        
        <a href="dashboard.jsp" class="btn btn-primary" > Back</a>
    </form>
</body>
</html>