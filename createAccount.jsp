<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Account Creation</title>
<style>
body {
    font-family: 'Arial', sans-serif;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100vh;
    margin: 0;
	background-image: url('back.jpg');
    background-size: cover;
    background-position: center center;
    background-repeat: no-repeat;
}

.container {
    width: 400px;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 1, 0.5);
    background-color: #97aed0;
    text-align: center;
}

label {
	font-size: 20px;
    display: block;
    margin: 10px;
    color: #555;
}

input {
    width: 70%;
    padding: 7px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}


h1 {
    font-weight: bold;
    color: #333;
}

p {
    margin: 20px 0;
    line-height: 1.6;
}

a {
    margin: 0 10px;
    text-decoration: none;
    color: #ee9120;
    font-weight: bold;
    transition: color 0.3s ease;
}

a:hover {
    color: red;
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

<div class="container">
<h1>Account Creation</h1>
<form action="CreateAccServlet" method="post">

<label for="c_id">Customer ID :</label>
<input type="text" id="c_id" name="c_id" required><br>
<label for="c_name">Customer Name :</label>
<input type="text" id="c_name" name="c_name" required><br>
<label for="acc_no">Account Number :</label>
<input type="text" id="acc_no" name="acc_no" required><br>
<label for="br_name">Branch Name :</label>
<input type="text" id="br_name" name="br_name" required><br>
<label for="ph_no">Phone Number :</label>
<input type="text" id="ph_no" name="ph_no" required>
<label for="password">Password :</label>
<input type="password" id="password" name="password" required><br><br><br>

<button type="submit">Create</button>

</form>

<p><a href="index.html">Back to home</a></p>

</div>
</body>
</html>