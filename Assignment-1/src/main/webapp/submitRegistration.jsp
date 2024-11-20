<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registering...</title>
<link rel="stylesheet" href="css/loadingScreenStyle.css">

</head>
<body>
  <%
  try {
  	Class.forName("org.postgresql.Driver");
  	String connURL = "jdbc:postgresql://ep-jolly-cherry-a19x4h8o.ap-southeast-1.aws.neon.tech/ShinShin?user=neondb_owner&password=omcrC2xOqNn6&sslmode=require";
  	Connection conn = DriverManager.getConnection(connURL);

  	String firstName = request.getParameter("firstName");
  	String lastName = request.getParameter("lastName");
  	String gender = request.getParameter("gender");
  	String dob = request.getParameter("dob");
  	String phoneNo = request.getParameter("phone");
  	String email = request.getParameter("email");
  	String password = request.getParameter("password");

  	if (firstName != null && lastName != null && email != null && password != null) {
  		try {
  	//Check user exists in database via email
  	String sqlStr = "SELECT * FROM customers WHERE email = ?";
  	PreparedStatement pstmt1 = conn.prepareStatement(sqlStr);
  	pstmt1.setString(1, email);
  	ResultSet existing_user = pstmt1.executeQuery();
  	if (existing_user.next()) {
  		response.sendRedirect("loginPage.jsp?errCode=userExists");
      return;
  	}

  	//Insert User into Database
  	sqlStr = "INSERT INTO customers (first_name, last_name, email, password,ph_number,gender,dob) VALUES (?,?,?,?,?,?,?)";
  	PreparedStatement pstmt2 = conn.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
  	pstmt2.setString(1, firstName);
  	pstmt2.setString(2, lastName);
  	pstmt2.setString(3, email);
  	pstmt2.setString(4, password);
  	pstmt2.setString(5, phoneNo);
  	pstmt2.setString(6, gender);
  	if (dob == null || dob.trim().isEmpty()) {
  		// Set dob as NULL if the input is empty
  		pstmt2.setNull(7, java.sql.Types.TIMESTAMP);
  	} else {
  		// Parse the input to a java.sql.Timestamp if a date is provided
  		java.sql.Timestamp DOB = java.sql.Timestamp.valueOf(dob + " 00:00:00");
  		pstmt2.setTimestamp(7, DOB);
  	}
  	int rowsInserted = pstmt2.executeUpdate();

  	if (rowsInserted > 0) {
  		//get the customer_id after insert
  		ResultSet generatedKeys = pstmt2.getGeneratedKeys();
  		if (generatedKeys.next()) {
  			int customerId = generatedKeys.getInt(1);

  			// Step 7: Store customerId in session
  			session.setAttribute("memId", customerId);
  			response.sendRedirect("home.jsp");
  		}
  	} else {
  		response.sendRedirect("registrationPage.jsp?errCode=invalidInput");
  	}

  		} catch (Exception e) {
  	out.print(e);
  		}
  	} else {
  		response.sendRedirect("registrationPage.jsp?errCode=invalidInput");
  	}
  	conn.close();
  } catch (Exception e) {
  	response.sendRedirect("registrationPage.jsp?errCode=invalidInput");
  }
  %>
  <div id="loadingScreen" class="loading-overlay">
    <div class="spinner"></div>
  </div>
</body>
</html>