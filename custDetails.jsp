<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Customer Login</title>
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
        background-color: #abcd;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        overflow: hidden;
      }

      .left-side {
        grid-column: 1 / 2;
        background-image: url(employee_image.jpg);
        background-size: cover;
        background-position: center;
        height: 300px;
        margin-left: 50px;
        margin-top: 75px;
        padding-right: 20px;
      }
      .left-side img {
        width: 250px;
      }

      .right-side {
        grid-column: 2 / 3;
        padding: 20px;
      }

      .customer-details {
        background-color: #feba8d;
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
      
      p {
      	font-size: 20px;
    	margin: 20px;
    	padding: 10px;
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
	 button {
   		width: 50%;
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

int c_id=0;
String c_name="";
int acc_no=0;
String br_name="";
int ph_no=0;
int acc_balance=0;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaExpl", "root", "system");
	
	n=request.getParameter("username");
	st = conn.prepareStatement("Select * from customers where c_id=?");
	st.setString(1, n);
	rs = st.executeQuery("Select * from customers where c_id='" + n + "'");
	if (rs.next()){
		c_id=rs.getInt(1);
		c_name=rs.getString(2);
		acc_no=rs.getInt(3);
		br_name=rs.getString(4);
		ph_no=rs.getInt(5);
		acc_balance=rs.getInt(6);
	}

}
catch(Exception e){
	System.out.print("Error" + e.getMessage());
}
%>
   
    <div class="container">
    <p>Welcome, <b><u><%= c_name%></u></b></p>
      <div class="left-side">
        <img src="cust.jpg" alt="profile photo"/>
      </div>
      <div class="right-side">
        <h1>Customer Details</h1>
        <div class="customer-details">
          <div class="form-group">
            <label>Customer Id:</label>
            <span><%= c_id%></span>
          </div>
          <div class="form-group">
            <label>Account No:</label>
            <span><%= acc_no%></span>
          </div>
          <div class="form-group">
            <label>Branch Name:</label>
            <span><%= br_name%></span>
          </div>
          <div class="form-group">
            <label>Phone No:</label>
            <span><%= ph_no%></span>
          </div>
          <div class="form-group">
            <label>Account Balance:</label>
            <span>Rs.<%= acc_balance%></span>
          </div>          
        </div>
        <div>
          <br><a href="sendmoney.html"><button>Send Money</button></a>
        </div>
      </div>
 	  <div class="links">
      	<a href="index.html">Back To Home</a>
      	<a href="custDetails.jsp">Change Password</a>
      </div>
     </div>
  </body>
</html>
