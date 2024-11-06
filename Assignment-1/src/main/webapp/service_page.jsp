<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
/*
try{
	   Class.forName("com.mysql.jdbc.Driver");  

	   String connURL = "jdbc:postgresql://ep-jolly-cherry-a19x4h8o.ap-southeast-1.aws.neon.tech/ShinShin?user=neondb_owner&password=omcrC2xOqNn6&sslmode=require";

	   Connection conn = DriverManager.getConnection(connURL); 
	   
*/
//String service = request.getParameter("service");
String service = "House Cleaning";//placeholder
%>

<title><%=service %></title>
<!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<% %>
<div class="d-flex justify-content-end">
    <div class="container text-right">
        <h1><%= service %></h1>
        <h3>Categories</h3>
        <form action="bookingPage.jsp"> <!-- placeholdername -->
            <input type="hidden" name="service" value="<%= service %>">
            <input type="submit" class="bookBtn" value="Book Now">
        </form>
    </div>
</div>
<div class="container d-flex justify-content-center align-items-center">
    <!-- Side-by-Side Layout -->
    <div class="d-flex align-items-center">
        
        <!-- Card to the Right of the Image -->
        <div class="card text-center" style="width: 18rem;">
            <div class="card-body">
                <!-- Dynamic Title -->
                <h5 class="card-title"><%=service %></h5>
                <!-- Dynamic Description -->
                <p class="card-text">placeholder text</p>
            </div>
        </div>
        
        <!-- Dynamic Image to the Left -->
        <img src="./placeholderimg.jpeg" alt="Dynamic Image" style="width: 150px; height: 150px; object-fit: cover; border-radius: 50%; margin-right: 20px;">
    </div>
</div>
<div class="container d-flex justify-content-center align-items-center">

</div>
<%--
conn.close();
} catch (Exception e){
	out.println("Error" + e);
}
--%>

<!-- Bootstrap JS, Popper.js, and jQuery (required for some Bootstrap components) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>