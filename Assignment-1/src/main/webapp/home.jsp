<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	try {

		String name = request.getParameter("name");
		String course = request.getParameter("course");
		String studClass = request.getParameter("class");
		String adminNum = request.getParameter("admin");
		int age = Integer.parseInt(request.getParameter("age"));

		// Step1: Load JDBC Driver
		Class.forName("org.postgresql.Driver");

		// Step 2: Define Connection URL
		String connURL = "jdbc:postgresql://ep-jolly-cherry-a19x4h8o.ap-southeast-1.aws.neon.tech/ShinShin?user=neondb_owner&password=omcrC2xOqNn6&sslmode=require";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);

		// Step 4 : Create PreparedStatement
		String sql = "insert into student(name, course, class, adminNumber, age) values(?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, name);
		pstmt.setString(2, course);
		pstmt.setString(3, studClass);
		pstmt.setString(4, adminNum);
		pstmt.setInt(5, age);

		// Use Stored Procedure
		// String sql = "Call insertStudent(?,?,?,?,?)";
		// CallableStatement cstmt= conn.prepareCall(sql);
		// cstmt.setString(1, name);
		// cstmt.setString(2, course);
		// cstmt.setString(3, studClass);
		// cstmt.setString(4, adminNum);
		// cstmt.setInt(5, age);

		// Step 5 : Execute the update
		int count = pstmt.executeUpdate();
		out.println(count + " record(s) inserted!");

		// Use Stored Procedure
		// cstmt.execute();
		// ResultSet rs = cstmt.getResultSet();
		// while(rs.next()){
		//	out.println(rs.getString(1));
		// }
		// cstmt.getMoreResults();
		// rs = cstmt.getResultSet();
		// while(rs.next()){
		//	out.println("<br>"+ rs.getString(1));
		// }

		conn.close();

	} catch (Exception e) {
		out.println("Exception occurred");
		System.out.print(e);

	}
	%>

</body>
</html>