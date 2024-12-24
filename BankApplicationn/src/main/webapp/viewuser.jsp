<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Account</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>

.tabl{
	margin-left:260px;
}
.tabl h3{
	text-align:center;
	margin:10px;
}
.tab{
	margin-top:100px;
	margin-left:350px;
	
}
.tab th{
	padding:10px 30px;
	background-color:wheat;
	padding-bottom:20px;
	
}
.tab td{
	padding:10px 30px;
	padding-bottom:20px;
	background-color:silver;
}
.delete{
	
	margin-top:30px;
	margin-left:400px;
}

.btnn a{
	margin-top:30px;
	margin-left:380px;
}

.success{
        	margin-top:20px;
        	text-align:center;
        	color:green;
        }
        .fail{
        	text-align:center;
        	margin-top:20px;
        	color:red;
        }
</style>
</head>
<body>
<%@include file="admin.jsp" %>
<div class="tabl">
<h3>View this account..?</h3>

<%String view=(String)request.getAttribute("view"); 
	if(view!=null) {%>
	<h4 class="success"><%=view %></h4>
	<%}%>
	
	<%String fail=(String)request.getAttribute("fail");
	if(fail!=null) {%>
	<h4 class="fail"><%=fail %></h4>
	<%}%>
<table class="tab">
  <thead>
    <tr>
      <th>Account Number:</th>
      <td><%=c.getAccno() %></td>
    </tr>
    <tr>
      <th scope="col">Account Holder Name:</th>
      <td><%=c.getName() %></td>
    </tr>
    <tr>
      <th scope="col">Phone Number:</th>
      <td><%=c.getPhone() %></td>
    </tr>
    <tr>
      <th scope="col">Mail Id:</th>
      <td><%=c.getMail() %></td>
    </tr>
    <tr>
      <th scope="col">Account Type:</th>
      <td>Savings Account</td>
    </tr>
    <tr>
      <th scope="col">Your Balance:</th>
      <td><%=c.getBal() %></td>
    </tr>
  </thead>
</table>
	<a href="admindashboard.jsp" class="btn btn-primary">Back</a>
	
</div>
</body>
</html>