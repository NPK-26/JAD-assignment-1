<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Practical 1</title>
<script>
/*
Author: Nandar Phyo Khaing (P2336035)
Date: 14/10/2024
Description: ST0510/JAD week 1 submission
 */
</script>
</head>
<body>
<h1>Hello World</h1>
<script>
let student_id = prompt("Enter your Student ID: ");
let student_name = prompt("Enter your Name: ");
alert("Good Morning! " + student_name + " (P" + student_id + ")");
</script>
<%
for (int i = 0; i <= 20; i++){
	out.println("Hello</br>");
}
%>
</body>
</html>