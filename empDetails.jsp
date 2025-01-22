<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('back.jpg');
            background-size: cover;
            background-position: center center;
        }
        
        .container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-gap: 20px;
            width: 800px;
            background-color: #67809e;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .left-side {
            grid-column: 1 / 2;
            background-image: url('employee_image.jpg');
            background-size: cover;
            background-position: center;
            height: 300px;
            margin-left: 70px;
            margin-top: 37px;
        }
        .left-side img{
            width: 200px;
        }
        
        .right-side {
            grid-column: 2 / 3;
            padding: 20px;
        }
        
        .employee-details {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            display: grid;
            grid-template-rows: auto auto auto;
            grid-gap: 10px;
        }
        
        h2 {
            margin-top: 0;
            font-size: 24px;
            color: #333;
            grid-column: 1 / 3;
        }
        
        .form-group {
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-gap: 10px;
        }
        
        .form-group label {
            font-weight: bold;
            align-self: center;
        }
        
        .links a {
        	margin: 10px;
    		text-decoration: none;
    		color: red;
    		font-weight: bold;
		}

		.links a:hover {
    		color: #0056b3;
		}
		
		p {
		font-size: 20px;
    	margin: 20px;
    	padding: 10px;
		}
		
		button {
   		width: 100%;
    	padding: 12px;
    	cursor: pointer;
    	background-color: #007BFF;
    	color: #fff;
    	border: none;
    	border-radius: 5px;
    	font-size: 16px;
    	transition: background-color 0.3s ease, transform 0.3s ease;
		}

		button:hover {
    	background-color: #0056b3;
    	transform: scale(1.05);
		}

    </style>
</head>
<body>
<%
Connection conn=null;
PreparedStatement st=null;
ResultSet rs=null;

String n="";

int emp_id=0;
String emp_name="";
String post="";

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaExpl", "root", "system");
	
	n=request.getParameter("username");
	st = conn.prepareStatement("Select * from users where username=?");
	st.setString(1, n);
	rs = st.executeQuery("Select * from users where username='" + n + "'");
	if (rs.next()){
		emp_id=rs.getInt(1);
		emp_name=rs.getString(4);
		post=rs.getString(5);
	}

}
catch(Exception e){
	System.out.print("Error" + e.getMessage());
}
%>

    <div class="container">
    <p>Welcome, <b><u><%= emp_name%></u></b></p>
        <div class="left-side">
            <img src="emp.jpg" alt="profile photo">
        </div>
        <div class="right-side">
            <h1>Employee Details</h1>
            <div class="employee-details">
                <div class="form-group">
                    <label>Employee Id:</label>
                    <span><%= emp_id%></span>
                </div>
                <div class="form-group">
                    <label>Employee Name:</label>
                    <span><%= emp_name%></span>
                </div>
                <div class="form-group">
                    <label>Designation:</label>
                    <span><%= post%></span>
                </div>
            </div>
            <br><br>
            <div>
				<a href="createAccount.jsp"><button>Create Account for Customer</button></a>
			</div>
        </div>
        <div class="links">
        <a href="index.html">Back To Home</a>
        </div>
    </div>
</body>
</html>
