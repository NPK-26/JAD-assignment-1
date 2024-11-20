<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logging In...</title>
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
  crossorigin="anonymous">
</head>
<body>
  <%
  String email = request.getParameter("email");
  String password = request.getParameter("password");

  if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
  	session.setAttribute("emailInput", email);
  	response.sendRedirect("loginPage.jsp?errCode=invalidLogin");
  	return;
  }

  try {
  	Class.forName("org.postgresql.Driver");
  	String connURL = "jdbc:postgresql://ep-jolly-cherry-a19x4h8o.ap-southeast-1.aws.neon.tech/ShinShin?user=neondb_owner&password=omcrC2xOqNn6&sslmode=require";
  	Connection conn = DriverManager.getConnection(connURL);
  	try {
  		String sqlStr = "SELECT * FROM customers WHERE email = ?";
  		PreparedStatement pstmt1 = conn.prepareStatement(sqlStr);
  		pstmt1.setString(1, email);
  		try (ResultSet user = pstmt1.executeQuery()) {
  	if (user.next()) {
  		String userPassword = user.getString("password");

  		if (!password.equals(userPassword)) {
  			session.setAttribute("emailInput", email);
  			response.sendRedirect("loginPage.jsp?errCode=invalidPassword");
  		} else {
  			int customerId = user.getInt("customer_id");
  			session.setAttribute("memId", customerId);
  			response.sendRedirect("home.jsp");
  		}
  	} else {
  		session.setAttribute("emailInput", email);
  		response.sendRedirect("loginPage.jsp?errCode=userNotFound");
  	}
  		}

  	} catch (Exception e) {
  		session.setAttribute("emailInput", email);
  		response.sendRedirect("loginPage.jsp?errCode=invalidLogin");
  	}
  	conn.close();
  } catch (Exception e) {
  	session.setAttribute("emailInput", request.getParameter("email"));
  	response.sendRedirect("loginPage.jsp?errCode=invalidLogin");
  }
  %>
  <div class="d-flex justify-content-center align-items-center"
    style="height: 100vh;">
    <div class="spinner-border text-primary"
      style="width: 5rem; height: 5rem;" role="status">
      <span class="visually-hidden">Loading...</span>
    </div>
  </div>
  <script
    src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
    integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
    crossorigin="anonymous"></script>
  <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
    integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
    crossorigin="anonymous"></script>
</body>
</html>