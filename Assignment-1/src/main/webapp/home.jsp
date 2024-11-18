<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cleaning Service</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<%@ include file="header.html"%>
	<!--  Introduction Section -->
	<div class="container-fluid py-5" style="background-color: #b3d7f1;">
		<div class="row justify-content-center py-5 px-5 mx-5">
			<div
				class="col-md-6 d-flex flex-column align-items-center bg-white p-4 rounded shadow-sm">
				<h3 class="text-center">REVIEWS STATS</h3>
				<div class="d-flex justify-content-around w-100 mt-3">
					<div class="border-left" style="height: 50px; width: 1px;"></div>
					<div class="border-left" style="height: 50px; width: 1px;"></div>
				</div>
			</div>

			<div class="col-md-6 py-3 px-5 text-center">
				<h2 class="font-weight-bold">Shin Shin</h2>
				<p style="font-size: 1.2rem;">Book reliable cleaning services
					effortlessly! From home to office cleaning, our platform
					streamlines appointments and feedback to enhance your experience.
					Enjoy quick, efficient service tailored to your needs.</p>
				<a href="bookService.jsp"
					class="btn btn-primary font-weight-bold d-block mx-auto"
					style="width: fit-content;">BOOK A SERVICE</a>
			</div>
		</div>
	</div>
	<!-- Our Services Section -->
	<div class="container text-center my-5">
		<h2 class="font-weight-bold">Our Services</h2>

		<div class="my-4">
			<h4>Residential</h4>
			<hr class="mx-auto" style="width: 50%; border-top: 2px solid #000;">
			<div class="row justify-content-center">
				<div class="col-md-2">
					<img src="cleaning.webp" alt="Service" class="img-fluid"
						style="width: 150px; height: 150px; object-fit: cover;">
				</div>
				<div class="col-md-2">
					<img src="cleaning.webp" alt="Service" class="img-fluid"
						style="width: 150px; height: 150px; object-fit: cover;">
				</div>
				<div class="col-md-2">
					<img src="cleaning.webp" alt="Service" class="img-fluid"
						style="width: 150px; height: 150px; object-fit: cover;">
				</div>
			</div>
		</div>

		<div class="my-4">
			<h4>Commercial</h4>
			<hr class="mx-auto" style="width: 50%; border-top: 2px solid #000;">
			<div class="row justify-content-center">
				<div class="col-md-2">
					<img src="cleaning.webp" alt="Service" class="img-fluid"
						style="width: 150px; height: 150px; object-fit: cover;">
				</div>
				<div class="col-md-2">
					<img src="cleaning.webp" alt="Service" class="img-fluid"
						style="width: 150px; height: 150px; object-fit: cover;">
				</div>
				<div class="col-md-2">
					<img src="cleaning.webp" alt="Service" class="img-fluid"
						style="width: 150px; height: 150px; object-fit: cover;">
				</div>
			</div>
		</div>

		<div class="my-4">
			<h4>Others</h4>
			<hr class="mx-auto" style="width: 50%; border-top: 2px solid #000;">
			<div class="row justify-content-center">
				<div class="col-md-2">
					<img src="cleaning.webp" alt="Service" class="img-fluid"
						style="width: 150px; height: 150px; object-fit: cover;">
				</div>
				<div class="col-md-2">
					<img src="cleaning.webp" alt="Service" class="img-fluid"
						style="width: 150px; height: 150px; object-fit: cover;">
				</div>
				<div class="col-md-2">
					<img src="cleaning.webp" alt="Service" class="img-fluid"
						style="width: 150px; height: 150px; object-fit: cover;">
				</div>
			</div>
		</div>
	</div>
	<hr class="mx-auto" style="width: 75%; border-top: 2px solid #000;">
	<!-- Our Clients' Feedbacks Section -->
	<div class="container my-5 pt-3">
		<h2 class="text-center font-weight-bold">Our Clients' Feedbacks</h2>

		<div class="position-relative d-flex justify-content-center">
			<!-- Carousel for feedbacks -->
			<div id="feedbackCarousel" class="carousel slide"
				data-ride="carousel" style="max-width: 600px; position: relative;">
				<div class="carousel-inner">
					<!-- First feedback item (active) -->
					<div class="carousel-item active">
						<div class="p-4 rounded"
							style="background-color: #b3d7f1; color: black;">
							<div class="d-flex align-items-center mb-3">
								<div class="mr-3">
									<img src="cleaning.webp" alt="Client" class="rounded-circle"
										width="50" height="50">
								</div>
								<div>
									<h5 class="mb-0">Nandar</h5>
									<p class="text-warning mb-0">&#9733; &#9733; &#9733;
										&#9733; &#9733;</p>
								</div>
							</div>
							<!-- Feedback Text in Separate White Background Container -->
							<div class="bg-white text-center p-3 rounded mb-3">
								<p class="mb-0">"The home cleaning service was fantastic!
									The team was punctual, thorough, and left my house spotless.
									Highly recommend!"</p>
							</div>
							<div
								class="bg-white d-flex justify-content-between align-items-center text-center p-2 rounded py-3">
								<p class="mb-0">
									Service Used:<strong> Home Cleaning</strong>
								</p>
								<a href="#" class="btn btn-link text-dark p-0">Go to
									&gt;&gt;</a>
							</div>
						</div>
					</div>

					<!-- Second feedback item -->
					<div class="carousel-item">
						<div class="p-4 rounded"
							style="background-color: #b3d7f1; color: black;">
							<div class="d-flex align-items-center mb-3">
								<div class="mr-3">
									<img src="cleaning.webp" alt="Client" class="rounded-circle"
										width="50" height="50">
								</div>
								<div>
									<h5 class="mb-0">John Doe</h5>
									<p class="text-warning mb-0">&#9733; &#9733; &#9733;
										&#9733; &#9733;</p>
								</div>
							</div>
							<!-- Feedback Text in Separate White Background Container -->
							<div class="bg-white text-center p-3 rounded mb-3">
								<p class="mb-0">"I am impressed with the thoroughness of the
									cleaning! The team was professional and friendly."</p>
							</div>
							<div
								class="bg-white d-flex justify-content-between align-items-center text-center p-2 rounded py-3">
								<p class="mb-0">
									Service Used:<strong> Office Cleaning </strong>
								</p>
								<a href="#" class="btn btn-link text-dark p-0">Go to
									&gt;&gt;</a>
							</div>
						</div>
					</div>

					<!-- Third feedback item -->
					<div class="carousel-item">
						<div class="p-4 rounded feedback-card"
							style="background-color: #b3d7f1; color: black;">
							<div class="d-flex align-items-center mb-3">
								<div class="mr-3">
									<img src="cleaning.webp" alt="Client Sarah Lee"
										class="rounded-circle" width="50" height="50">
								</div>
								<div>
									<h5 class="mb-0">Sarah Lee</h5>
									<p class="text-warning mb-0">
										<span class="star">&#9733;</span> <span class="star">&#9733;</span>
										<span class="star">&#9733;</span> <span class="star">&#9733;</span>
										<span class="star">&#9733;</span>
									</p>
								</div>
							</div>
							<!-- Feedback Text in Separate White Background Container -->
							<figure class="bg-white text-center p-3 rounded mb-3">
								<blockquote class="blockquote mb-0">
									<p>"Amazing service! My apartment has never looked better.
										I will definitely book again!"</p>
								</blockquote>
							</figure>
							<div
								class="bg-white d-flex justify-content-between align-items-center text-center p-2 rounded py-3">
								<p class="mb-0">
									Service Used: <strong>Apartment Cleaning</strong>
								</p>
								<a href="#" class="btn btn-link text-dark p-0">Go to
									&gt;&gt;</a>
							</div>
						</div>
					</div>

					<!-- Carousel Controls, positioned with absolute positioning and z-index -->
					<a class="carousel-control-prev" href="#feedbackCarousel"
						role="button" data-slide="prev"
						style="position: absolute; top: 50%; left: 10px; transform: translateY(-50%); z-index: 10;">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#feedbackCarousel"
						role="button" data-slide="next"
						style="position: absolute; top: 50%; right: 10px; transform: translateY(-50%); z-index: 10;">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- FAQ Section -->
	<div class="container-fluid py-5" style="background-color: #b3d7f1;">
		<div class="row justify-content-center py-5 px-5 mx-5">
			<!-- Left Column: FAQ Header -->
			<div
				class="col-12 d-flex flex-column align-items-center p-4 rounded shadow-sm mb-5">
				<h3 class="text-center">Frequently Asked Questions</h3>
			</div>

			<!-- FAQ Questions in 3x3 Matrix -->
			<div class="col-12">
				<div class="row">
					<!-- Question 1 -->
					<div class="col-md-4 mb-4">
						<button
							class="btn btn-light w-100 text-left d-flex align-items-center justify-content-between"
							type="button" data-toggle="collapse" data-target="#faq1"
							aria-expanded="false" aria-controls="faq1">+ Question 1
						</button>
						<div id="faq1" class="collapse mt-2">
							<p>Answer to question 1 goes here.</p>
						</div>
					</div>
					<!-- Question 2 -->
					<div class="col-md-4 mb-4">
						<button
							class="btn btn-light w-100 text-left d-flex align-items-center justify-content-between"
							type="button" data-toggle="collapse" data-target="#faq2"
							aria-expanded="false" aria-controls="faq2">+ Question 2
						</button>
						<div id="faq2" class="collapse mt-2">
							<p>Answer to question 2 goes here.</p>
						</div>
					</div>
					<!-- Question 3 -->
					<div class="col-md-4 mb-4">
						<button
							class="btn btn-light w-100 text-left d-flex align-items-center justify-content-between"
							type="button" data-toggle="collapse" data-target="#faq3"
							aria-expanded="false" aria-controls="faq3">+ Question 3
						</button>
						<div id="faq3" class="collapse mt-2">
							<p>Answer to question 3 goes here.</p>
						</div>
					</div>

					<!-- Question 4 -->
					<div class="col-md-4 mb-4">
						<button
							class="btn btn-light w-100 text-left d-flex align-items-center justify-content-between"
							type="button" data-toggle="collapse" data-target="#faq4"
							aria-expanded="false" aria-controls="faq4">+ Question 4
						</button>
						<div id="faq4" class="collapse mt-2">
							<p>Answer to question 4 goes here.</p>
						</div>
					</div>
					<!-- Question 5 -->
					<div class="col-md-4 mb-4">
						<button
							class="btn btn-light w-100 text-left d-flex align-items-center justify-content-between"
							type="button" data-toggle="collapse" data-target="#faq5"
							aria-expanded="false" aria-controls="faq5">+ Question 5
						</button>
						<div id="faq5" class="collapse mt-2">
							<p>Answer to question 5 goes here.</p>
						</div>
					</div>
					<!-- Question 6 -->
					<div class="col-md-4 mb-4">
						<button
							class="btn btn-light w-100 text-left d-flex align-items-center justify-content-between"
							type="button" data-toggle="collapse" data-target="#faq6"
							aria-expanded="false" aria-controls="faq6">+ Question 6
						</button>
						<div id="faq6" class="collapse mt-2">
							<p>Answer to question 6 goes here.</p>
						</div>
					</div>

					<!-- Question 7 -->
					<div class="col-md-4 mb-4">
						<button
							class="btn btn-light w-100 text-left d-flex align-items-center justify-content-between"
							type="button" data-toggle="collapse" data-target="#faq7"
							aria-expanded="false" aria-controls="faq7">+ Question 7
						</button>
						<div id="faq7" class="collapse mt-2">
							<p>Answer to question 7 goes here.</p>
						</div>
					</div>
					<!-- Question 8 -->
					<div class="col-md-4 mb-4">
						<button
							class="btn btn-light w-100 text-left d-flex align-items-center justify-content-between"
							type="button" data-toggle="collapse" data-target="#faq8"
							aria-expanded="false" aria-controls="faq8">+ Question 8
						</button>
						<div id="faq8" class="collapse mt-2">
							<p>Answer to question 8 goes here.</p>
						</div>
					</div>
					<!-- Question 9 -->
					<div class="col-md-4 mb-4">
						<button
							class="btn btn-light w-100 text-left d-flex align-items-center justify-content-between"
							type="button" data-toggle="collapse" data-target="#faq9"
							aria-expanded="false" aria-controls="faq9">+ Question 9
						</button>
						<div id="faq9" class="collapse mt-2">
							<p>Answer to question 9 goes here.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- Bootstrap JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>