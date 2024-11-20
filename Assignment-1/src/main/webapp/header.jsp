<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link
  href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
  rel="stylesheet">
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand text-primary font-weight-bold"
      href="home.jsp"> <span>Shin</span><br> <span>
        &nbsp; Shin</span>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse"
      data-target="#navbarNav" aria-controls="navbarNav"
      aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
        <%
        // Retrieve the session attribute
        Object memId = session.getAttribute("memId");

        if (memId == null) {
        	// Session does not have memId
        %>
        <li class="nav-item"><a class="nav-link" href="loginPage.jsp">Login</a></li>
        <li class="nav-item"><a class="nav-link"
          href="registrationPage.jsp">Sign Up</a></li>
        <%
        } else {
        // Session has memId
        %>
        <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
        <li class="nav-item"><a class="nav-link" href="profile.jsp">My
            Profile</a></li>
        <%
        }
        %>
      </ul>
    </div>
  </nav>

  <!-- Bootstrap JS, Popper.js, and jQuery -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script
    src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>