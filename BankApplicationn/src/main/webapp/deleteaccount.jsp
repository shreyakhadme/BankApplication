<%@page import="com.bank.dao.CustomerDAOImpl"%>
<%@page import="com.bank.dao.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String accno=request.getParameter("accno");
    CustomerDAO cdao=new CustomerDAOImpl();
    Customer customer =null;
    
    if(accno!=null && !accno.isEmpty()){
    long accnon=Long.parseLong(accno);
    customer =cdao.getCustomer(accnon);
    }
    %>
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
	margin-left:180px;
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
<h3>Are you sure want to delete this account..?</h3>

<%String delete=(String)session.getAttribute("delete"); 
	if(delete!=null) {%>
	<h4 class="success"><%=delete %></h4>
	<%}%>
	
	<%String fail=(String)session.getAttribute("fail");
	if(fail!=null) {%>
	<h4 class="fail"><%=fail %></h4>
	<%}%>
	
	<%if(customer!=null){ %>
<table class="tab">
  <thead>
    <tr>
      <th>Account Number:</th>
      <td><%=customer.getAccno() %></td>
    </tr>
    <tr>
      <th scope="col">Account Holder Name:</th>
      <td><%=customer.getName() %></td>
    </tr>
    <tr>
      <th scope="col">Phone Number:</th>
      <td><%=customer.getPhone() %></td>
    </tr>
    <tr>
      <th scope="col">Mail Id:</th>
      <td><%=customer.getMail() %></td>
    </tr>
    <tr>
      <th scope="col">Account Type:</th>
      <td>Savings Account</td>
    </tr>
    <tr>
      <th scope="col">Your Balance:</th>
      <td><%=customer.getBal() %></td>
    </tr>
  </thead>
</table>
	<form action="delete" method="post" class="btnn">
	<input type="hidden" name="accno" value="<%=customer.getAccno()%>">
	<input type="submit" name="delete" value="Delete" class="delete btn btn-primary">
	<a href="viewaccount.jsp" class="btn btn-primary">Cancel</a>
	<%} %>
	</form>
</div>
</body>
</html>