<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@page import="assignmentPackages.*"%>
<%@page import="java.sql.*, java.util.ArrayList, java.util.HashMap"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
try {
	Class.forName("org.postgresql.Driver");
	String connURL = "jdbc:postgresql://ep-jolly-cherry-a19x4h8o.ap-southeast-1.aws.neon.tech/ShinShin?user=neondb_owner&password=omcrC2xOqNn6&sslmode=require";

	Connection conn = DriverManager.getConnection(connURL);

	String serviceIdParam = request.getParameter("serviceId"); //actual one
	if (serviceIdParam != null) {
		try {
	int service_id = Integer.parseInt(serviceIdParam);
	// 	int service_id = 1; //dummy service
	String sqlStr = "SELECT * FROM services WHERE service_id = ?";
	PreparedStatement pstmt1 = conn.prepareStatement(sqlStr);
	pstmt1.setInt(1, service_id);
	ResultSet service = pstmt1.executeQuery();

	while (service.next()) {
		String service_name = service.getString("service_name");

		sqlStr = "SELECT * FROM service_categories WHERE service_category_id = ?";
		PreparedStatement pstmt2 = conn.prepareStatement(sqlStr);
		pstmt2.setInt(1, service.getInt("service_category_id"));
		ResultSet s_category = pstmt2.executeQuery();
		String category_name = "";
		while (s_category.next()) {
			category_name = s_category.getString("category_name");
		}
%>

<title><%=service_name%></title>
<!-- Bootstrap CSS -->
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
  crossorigin="anonymous">
</head>
<body>
  <%@ include file="header.jsp"%>
  <div class="d-flex justify-content-end">
    <div class="container text-right">
      <h1><%=service_name%></h1>
      <h3><%=category_name%></h3>
      <!-- placeholdername -->
      <form action="bookingPage.jsp">
        <input type="hidden" name="service"
          value="<%=service.getInt("service_id")%>"> <input
          type="submit" class="bookBtn" value="Book Now">
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
            <h5 class="card-title"><%=service_name%></h5>
            <!-- Description -->
            <p class="card-text"><%=service.getString("service_description")%></p>
          </div>
        </div>
      </div>
      <!-- Image Column -->
      <div class="col-md-4 d-flex align-items-right">
        <img src="./service_images/<%=service_name%>.webp"
          alt="Dynamic Image"
          style="width: 150px; height: 150px; object-fit: cover; border-radius: 50%;">
      </div>
    </div>
  </div>

  <!-- Services Details -->
  <%
  sqlStr = "SELECT * FROM service_pricing WHERE pricing_id = ?";
  PreparedStatement pstmt3 = conn.prepareStatement(sqlStr);
  pstmt3.setInt(1, service_id);
  ResultSet pricing = pstmt3.executeQuery();
  while (pricing.next()) {
  	double base_price = pricing.getDouble("base_price");
  	double base_duration = pricing.getDouble("base_duration");
  %>
  <div
    class="container d-flex justify-content-center align-items-center">
    <div class="card text-center p-4" style="width: 80%;">
      <div class="row">
        <div class="col-lg-6 p-3">
          <h5>Starting from</h5>
          <p><%=String.format("$ %.2f", base_price)%></p>
          <h5>Service Duration</h5>
          <p><%=String.format("%.2f hr(s)", base_duration)%></p>
        </div>
        <%
        }
        %>
        <div class="col-lg-1 d-none d-lg-block border-end"></div>
        <div class="col-lg-5 p-3">
          <h5>What's included:</h5>
          <ul>
            <%
            sqlStr = "SELECT * FROM included_service_items AS isi INNER JOIN service_items AS si ON isi.service_item_id = si.service_item_id WHERE service_id = ?";
            PreparedStatement pstmt4 = conn.prepareStatement(sqlStr);
            pstmt4.setInt(1, service_id);
            ResultSet s_items = pstmt4.executeQuery();
            ArrayList<String> service_items = new ArrayList<String>();
            while (s_items.next()) {
            	service_items.add(s_items.getString("item_name"));
            }
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

  <%-- Customer Service --%>
  <div class="container py-4">
    <div class="row mb-4">
      <div class="col text-center">
        <h3>Customer Reviews</h3>
      </div>
    </div>
    <div class="row">
      <%
      //Get the Reviews
      sqlStr = "SELECT first_name,last_name,rating,feedback FROM feedbacks AS f INNER JOIN bookings AS b ON f.booking_id = b.booking_id INNER JOIN customers AS c ON b.customer_id = c.customer_id INNER JOIN booking_details AS bd ON b.booking_id = bd.booking_id WHERE bd.services_id = ?";
      PreparedStatement pstmt5 = conn.prepareStatement(sqlStr);
      pstmt5.setInt(1, service_id);
      ResultSet feedbacks = pstmt5.executeQuery();
      ArrayList<CustomerReview> reviews = new ArrayList<CustomerReview>();
      while (feedbacks.next()) {
      	String name = feedbacks.getString("first_name") + " " + feedbacks.getString("last_name");
      	int rating = Integer.parseInt(feedbacks.getString("rating"));
      	String feedback = feedbacks.getString("feedback");
      	CustomerReview review = new CustomerReview(name, rating, feedback);
      	reviews.add(review);
      }
      %>
      <%
      if (reviews.size() <= 3) {
      %>
      <div class="col-md-1">
        <button type="button" data-bs-target="#customerReviews"
          data-bs-slide="prev">
          <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
            fill="#615d5d" class="bi bi-caret-left-fill"
            viewBox="0 0 16 16">
  <path
              d="m3.86 8.753 5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z" />
</svg>
          <span class="visually-hidden">Previous</span>
        </button>
      </div>

      <div class="col-md-10">
        <div id="customerReviews" class="carousel slide"
          data-bs-ride="carousel">
          <div class="carousel-inner">
            <div class="row">
            <div class="col-md-4"></div>
              <div class="col-md-4">
                <%
                for (int j = 0; j < reviews.size(); j++) {
                	CustomerReview currentReview = reviews.get(j);
                %>
                <div class="carousel-item <%=(j == 0) ? "active" : ""%>">

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
              <div class="col-md-4"></div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-1">
        <button type="button" data-bs-target="#customerReviews"
          data-bs-slide="next">
          <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
            fill="#615d5d" class="bi bi-caret-right-fill"
            viewBox="0 0 16 16">
              <path
              d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z" />
</svg>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      <%
      } else {
      %>
      <div class="col-md-1">
        <button type="button" data-bs-target="#customerReviews"
          data-bs-slide="prev">
          <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
            fill="#615d5d" class="bi bi-caret-left-fill"
            viewBox="0 0 16 16">
  <path
              d="m3.86 8.753 5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z" />
</svg>
          <span class="visually-hidden">Previous</span>
        </button>
      </div>

      <div class="col">
        <div id="customerReviews"
          class="carousel slide position-relative"
          data-bs-ride="carousel">
          <div class="carousel-inner">
            <%
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

      <%-- Next Button --%>
      <div class="col-md-1">
        <button type="button" data-bs-target="#customerReviews"
          data-bs-slide="next">
          <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
            fill="#615d5d" class="bi bi-caret-right-fill"
            viewBox="0 0 16 16">
              <path
              d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z" />
</svg>
          <span class="visually-hidden">Next</span>
        </button>
      </div>

      <%
      }
      %>
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
      sqlStr = "SELECT * FROM services INNER JOIN service_images ON services.service_img_id = service_images.service_img_id WHERE service_category_id = ? AND service_id != ?";
      PreparedStatement pstmt6 = conn.prepareStatement(sqlStr);
      pstmt6.setInt(1, service.getInt("service_category_id"));
      pstmt6.setInt(2, service_id);
      ResultSet services = pstmt6.executeQuery();
      HashMap<Integer, String> related_services = new HashMap<>();
      HashMap<Integer, String> services_img = new HashMap<>();
      while (services.next()) {
      	related_services.put(services.getInt("service_id"), services.getString("service_name"));
      	services_img.put(services.getInt("service_id"), services.getString("service_img_name"));
      }
      for (Integer i : related_services.keySet()) {
      %>
      <div class="col-md-3">
        <div class="card" style="width: 18rem; height: 22rem;">
          <img class="card-img-top"
            src="./service_images/<%=services_img.get(i)%>.webp"
            alt="Card image cap"
            style="width: 150px; height: 150px; object-fit: cover; margin: auto;">
          <div
            class="card-body d-flex flex-column justify-content-between">
            <h5 class="card-title"><%=related_services.get(i)%></h5>
            <a href="servicePage.jsp?serviceId=<%=i%>"
              class="btn btn-primary mt-auto">See More</a>
          </div>
        </div>
      </div>

      <%
      }
      %>
    </div>
  </div>
  <%
  conn.close();
  }
  } catch (Exception e) {
  out.println("Error" + e);
  }
  }
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