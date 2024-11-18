<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@page import="assignmentPackages.*"%>
<%@page import="java.sql.*, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
try {
	/*
	Class.forName("com.mysql.jdbc.Driver");  
	
		   String connURL = "jdbc:postgresql://ep-jolly-cherry-a19x4h8o.ap-southeast-1.aws.neon.tech/ShinShin?user=neondb_owner&password=omcrC2xOqNn6&sslmode=require";
	
		   Connection conn = DriverManager.getConnection(connURL); 
		   
	*/
	//String service = request.getParameter("service");
	String service = "House Cleaning";//placeholder
	String dynamic = "XXXXX";
%>

<title><%=service%></title>
<!-- Bootstrap CSS -->
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
  crossorigin="anonymous">
</head>
<body>
  <%

  %>
  <div class="d-flex justify-content-end">
    <div class="container text-right">
      <h1><%=service%></h1>
      <h3><%=dynamic%></h3>
      <!-- placeholdername -->
      <form action="bookingPage.jsp">
        <input type="hidden" name="service" value="<%=service%>">
        <input type="submit" class="bookBtn" value="Book Now">
      </form>
    </div>
  </div>
  <!-- Service -->
  <div
    class="container d-flex justify-content-center align-items-center">
    <!-- Row for Side-by-Side Layout -->
    <div class="row align-items-center" style="width: 100%;">
      <!-- Card Column -->
      <div class="col-md-8">
        <div class="card text-center" style="width: 100%;">
          <div class="card-body">
            <!-- Title -->
            <h5 class="card-title"><%=service%></h5>
            <!-- Description -->
            <p class="card-text"><%=dynamic%></p>
          </div>
        </div>
      </div>
      <!-- Image Column -->
      <div class="col-md-4 d-flex align-items-right">
        <img src="./placeholderimg.jpeg" alt="Dynamic Image"
          style="width: 150px; height: 150px; object-fit: cover; border-radius: 50%;">
      </div>
    </div>
  </div>

  <!-- Services Details -->
  <div
    class="container d-flex justify-content-center align-items-center">
    <div class="card text-center p-4" style="width: 80%;">
      <div class="row">
        <div class="col-lg-6 p-3">
          <h5>Starting from</h5>
          <p><%=dynamic%></p>
          <h5>Service Duration</h5>
          <p><%=dynamic%></p>
        </div>
        <div class="col-lg-1 d-none d-lg-block border-end"></div>
        <div class="col-lg-5 p-3">
          <h5>What's included:</h5>
          <ul>
            <%
            String[] service_items = { "Service X", "Service Y" }; // placeholder
            for (String item : service_items) {
            %>
            <li><%=item%></li>
            <%
            }
            %>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="container py-4">
    <div class="row mb-4">
      <div class="col text-center">
        <h3>Customer Reviews</h3>
      </div>
    </div>
    <div class="row">
      <div class="col-md-1">
        <button type="button" data-bs-target="#customerReviews"
          data-bs-slide="prev">
          <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
            fill="#615d5d" class="bi bi-caret-left-fill"
            viewBox="0 0 16 16">
  <path d="m3.86 8.753 5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z" />
</svg>
          <span class="visually-hidden">Previous</span>
        </button>
      </div>
      
      <div class="col">
        <!-- Customer review -->
        <div id="customerReviews"
          class="carousel slide position-relative"
          data-bs-ride="carousel">
          <div class="carousel-inner">
            <%
              /*
              Statement stmt = conn.createStatement();
              String sqlStr = "SELECT customer_name,  FROM ";
              ResultSet reviews = stmt.executeQuery(sqlStr);
              while (reviews.next()) {
                String customer
                }
              */
              String[] customer = { "James", "Alice", "Wai", "Riley", "Arty" };
              int[] rating = { 3, 2, 4, 4, 5 };

              String[] feedback = { "great", "OK", "Awesome", "<3", "YOU ARE BEST" };
              int reviewsCount = 0;
              int reviewsTotal = customer.length;
              ArrayList<CustomerReview> reviews = new ArrayList<CustomerReview>();
              while (reviewsCount < reviewsTotal) {

              	CustomerReview review = new CustomerReview(customer[reviewsCount], rating[reviewsCount], feedback[reviewsCount]);
              	reviews.add(review);
              	reviewsCount++;
              }

              for (int i = 0; i < (reviews.size() - 2); i++) {
              %>
            <div class="carousel-item <%=(i == 0) ? "active" : ""%>">
              <div class="row">
                <%
                  for (int j = i; j < i + 3 && j < reviews.size(); j++) {
                  	CustomerReview currentReview = reviews.get(j);
                  %>
                <div class="col-md-4">
                  <div class="card text-center">
                    <div class="card-header">
                      <h5 class="card-title"><%=currentReview.getName()%></h5>
                    </div>
                    <div class="card-body">
                      <p class="card-text">
                        Rating:
                        <%=currentReview.getRating()%></p>
                      <p class="card-text"><%=currentReview.getFeedback()%></p>
                    </div>
                  </div>
                </div>
                <%
                  }
                  %>
              </div>
            </div>
            <%
              }
              for (int i = (reviews.size() - 2); i < reviews.size(); i++) {
              %>
            <div class="carousel-item">
              <div class="row">
                <%
                  for (int j = 0; j < 3; j++) {
                  	// Use modular arithmetic to loop back to the start of the reviews array
                  	CustomerReview currentReview = reviews.get((i + j) % reviews.size());
                  %>
                <div class="col-md-4">
                  <div class="card text-center">
                    <div class="card-header">
                      <h5 class="card-title"><%=currentReview.getName()%></h5>
                    </div>
                    <div class="card-body">
                      <p class="card-text">
                        Rating:
                        <%=currentReview.getRating()%></p>
                      <p class="card-text"><%=currentReview.getFeedback()%></p>
                    </div>
                  </div>
                </div>
                <%
                  }
                  %>
              </div>
            </div>
            <%
              }
              %>
          </div>
        </div>
      </div>
      
      <div class="col-md-1">
        <button type="button"
          data-bs-target="#customerReviews" data-bs-slide="next">
          <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
            fill="#615d5d" class="bi bi-caret-right-fill"
            viewBox="0 0 16 16">
  <path
              d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z" />
</svg>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
    </div>
  </div>
  
  <div class="container py-4">
    <div class="row mb-4">
      <div class="col text-center">
        <h3>Related Services</h3>
      </div>
    </div>
    
    <div class="row justify-content-center align-items-center">
      <%
      //get other services from category
      String[] related_services = { "Service X", "Service Y", "Service Z" }; //placeholder
      for (String items : related_services) {
      %>
      <div class="col-md-3">
        <div class="card" style="width: 18rem;">
          <img class="card-img-top" src="./placeholderimg.jpeg" alt="Card image cap">
          <div class="card-body">
            <h5 class="card-title"><%=items %></h5>
            <p class="card-text">Some quick example text to build on
              the card title and make up the bulk of the card's content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
          </div>
        </div>
      </div>
      <%
      }
      %>
    </div>
  </div>
  <%
  /*
  conn.close();
  */
  } catch (Exception e) {
  out.println("Error" + e);
  }
  %>

  <!-- Bootstrap JS, Popper.js, and jQuery (required for some Bootstrap components) -->
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