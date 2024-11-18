<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	try {
		// Step1: Load JDBC Driver
		Class.forName("org.postgresql.Driver");

		// Step 2: Define Connection URL
		String connURL = "jdbc:postgresql://ep-jolly-cherry-a19x4h8o.ap-southeast-1.aws.neon.tech/ShinShin?user=neondb_owner&password=omcrC2xOqNn6&sslmode=require";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);

		// Step 4 : Create PreparedStatement
		String sql = "select * from services";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		// Step 5 : Execute the query
		ResultSet rs = pstmt.executeQuery();

		out.println("<table border='1'>");
		while (rs.next()) {
			out.println("<tr>");

			out.println("<td>");
			out.println(rs.getString("service_name"));
			out.println("</td>");

			out.println("<td>");
			out.println(rs.getString("service_description"));
			out.println("</td>");

			out.println("</tr>");
		}
		out.println("</table>");
		conn.close();

	} catch (Exception e) {
		out.println("Exception occurred");
		System.out.print(e);

	}
	%>
</body>
</html>