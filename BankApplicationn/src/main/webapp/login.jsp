<%@page import="com.bank.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Times New Roman', Times, serif;
        }
        body{
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
          background-color: #042331;
          background-size: cover;
        }
        .wrapper{
            width:420px;
            background:transparent;
            border: 2px solid rgba(255,255,255,.2);
            box-shadow: 0 0 10px rgba(0,0,0,.2);
            backdrop-filter: blur(20px);
            color: #ffff;
            border-radius: 10px;
            padding: 30px 40px;
        }
        .wrapper h1{
            font-size: 36px;
            text-align: center;

        }
        .wrapper .input-box{
            position: relative;
            width: 100%;
            height: 50px;
            background: rgb(101, 90, 98);
            margin: 30px 0;
        }
        .input-box input{
            width:100%;
            height: 100%;
            background: transparent;
            border: none;
            outline: none;
            border: 2px solid rga(255,255,255,.2);
            border-radius: 40px;
            font-size: 16px;
            color: #ffff;
            padding: 20px 45px 20px 20px;
        }

        .input-box input::placeholder{
            color: #fff;
        
        }
        .input-box i{
            position: absolute;
             right: 20px;
           top: 50%;
            transform:translateY(-50%);
            font-size: 20px;
        }

        .wrapper .remember-forgot{
            display: flex;
            justify-content: space-between;
            font-size: 14.5px;
            margin: -15px 0 15px;

        }

        .remember-forgot label input{
            accent-color: #ffff;
            margin-right: 3px;
        }

       .forgot{
        color: #fff;
        text-decoration: none;
        position: relative;
        left: 110px;
       }

        .remember-forgot a:hover{
            text-decoration: underline;
            
        }

        .wrapper .btn{
            width: 100%;
            height: 45px;
            background:#fff;
            border: none;
            outline: none;
            border-radius: 40px;
            box-shadow: 0 0 10px rgba(0,0,0.1);
            cursor: pointer;
            font-size: 16px;
            color: #333;
            font-weight: 600;
        }

            .wrapper .register-link{
                font-size: 14.5px;
                text-align: center;
                margin: 20px 0 15px;
            }
        .register-link p a{
            color: #fff;
            text-decoration: none;
            font-weight: 600;
        }
        .register-link p a:hover{
            text-decoration: underline;
        }
        .success{
        color:green;
	    padding:5px;
	    margin-bottom:10px;
	    text-align:center;
        }
        
      .failure{
       color:red;
	    padding:5px;
	    margin-bottom:10px;
	    text-align:center;
      }  
        
    </style>
</head>
<body>
    
        <div class="wrapper">
            <form action="login" method="post">
            <%Customer c=(Customer)session.getAttribute("customer"); %>
            <h1>LOGIN</h1>
            	<%String success=(String)request.getAttribute("success");
        	 if(success!=null){%>
         	<h3 class="success"><%=success %></h3>
        	 <%}%>
            
              
        	<%String failure=(String)request.getAttribute("failure");
        	 if(failure!=null){%>
         	<h3 class="failure"><%=failure %></h3>
        	 <%}%>
            <div class="input-box">
            <input type="text" placeholder="Enter accno" name="accno" required>
            <i class='bx bxs-user'></i>
           
        </div>
        <div class="input-box">
            <input type="password" name="pin" placeholder="Enter your pin" required>
            <i class='bx bxs-lock-alt' ></i>
            
        </div>
        <br>
        <div class="remeber-forgot">
           <label><input type="checkbox">Remember me</label>
            <a href="forgotpassword.jsp" class="forgot">forgot password?</a>
        </div>
        <br>
        <button type="submit" class="btn">Login</button>
        <div class="register-link">
            <p>Don't have an account?
            <br>
            <a href="signup.jsp" title="click here" target="_blank">SignUp</a></p>
            
        </div>
    </form>
</div>
    
       
</body>
</html>