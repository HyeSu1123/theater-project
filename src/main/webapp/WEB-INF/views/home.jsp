<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<style>
* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  animation-name: fade;
  animation-duration: 1.5s;
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
</style>
<%@ include file="./includes/top2.jsp" %>

<!-- Wrapper -->
<div class="wrapper">
	<div class="inner">

		<!-- Section -->
			<section class="main">
				<header class="major">
					<h2>Performance TOP 3</h2>
					<p>Best</p>
				</header>
				<div class="features">
					<section>
						<div class="poster">
						<img src="/upload/${vo.poster}" width="175px" height="250px" style="object-fit:contain">
						</div>
						<div><h3>${vo.perform_title}</h3></div>
						
						<p>Lorem ipsum dolor sit amet nullam feugiat tempus</p>
					</section>
					<section>
						<span class="icon solid fa-paper-plane major accent3"></span>
						<h3>Lorem sed nullam</h3>
						<p>Lorem ipsum dolor sit amet nullam feugiat tempus</p>
					</section>
					<section>
						<span class="icon solid fa-envelope major accent4"></span>
						<h3>Aliquam feugiat</h3>
						<p>Lorem ipsum dolor sit amet nullam feugiat tempus</p>
					</section>
				</div>
				
			</section>

		<!-- Section -->
			<h2>Automatic Slideshow</h2>
<p>Change image every 2 seconds:</p>

<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
<img src="${pageContext.request.contextPath}/resources/image/pic05.jpg" style="width:100%">  
<div class="text">Caption Three</div>
  <div class="text">Caption Text</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="${pageContext.request.contextPath}/resources/image/pic04.jpg" style="width:100%">
  <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
<img src="${pageContext.request.contextPath}/resources/image/pic05.jpg" style="width:100%">  <div class="text">Caption Three</div>
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>




		<!-- Three -->
			<section id="three" class="wrapper style1">
				<div class="inner">
					<div class="spotlights">
						<section>
							<div class="content">
								<h2>NOTICE</h2>
								<div class="row">
									<div class="col-6 col-12-medium">
									 <c:forEach items="${listN}" var="vo">
										<ul class="alt">
											<li>${vo.notice_content }</li>
										</ul>
									</c:forEach>
									</div>
								</div>
							</div>
						</section>
						
					</div>
				</div>
			</section>

			</div>
			</div>
<%@ include file="./includes/footer.jsp" %>
			
<script>
let slideIndex = 0;
showSlides();

function showSlides() {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 4000); // Change image every 2 seconds
}
</script>
</body>
</html>