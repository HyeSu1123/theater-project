<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
<!--  	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css"> -->

</head>
<body>
<%@ include file="./includes/top2.jsp" %>
<script type="text/javascript">

let slideIndex = 1;

Array.from(document.getElementsByClassName("slideshow-container")).forEach(
    function(element, index) {
    	console.log(index);
        showSlides(index+1,slideIndex)
    }
);

// Next/previous controls
function plusSlides(a,n) {
  showSlides(a,slideIndex += n);
}

// Thumbnail image controls
function currentSlide(a,n) {
  showSlides(a,slideIndex = n);
}
function showSlides(a,n) {
  let i;
  let slides = document.querySelectorAll("#item" + a + " > .mySlides");
  let dots = document.querySelectorAll("#item" + a + "  .dot");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
} 
</script>
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
						<span class="icon solid fa-camera major accent2"></span>
						<h3>Ultrices aliquam</h3>
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
			<section class="carousel accent4">
				<c:forEach items="${list }" var="vo" varStatus="main">
					<div class="slideshow-container">
					<div id="item${main.count }">
						<c:forEach items="${vo.filenames }" var="pic" varStatus="stat">
						<!-- 업로드한 3개의 파일명을 리스트로 애트리뷰트에서 가져오기 -->
							<div class="mySlides fade">
								<div class="numbertext">${vo.title }</div>
								<%-- <div class="numbertext">${stat.count} / </div> --%>
								<img src="/upload/${pic}" width="400px" height="400px" style="object-fit:cover">
								<div class="text">${pic}</div>
							</div>
						</c:forEach>
				<!-- Next and previous buttons -->
			
						<div style="text-align:center;">
							<c:forEach items="${vo.filenames }" var="no" varStatus="stat">
							  <span class="dot" onclick="currentSlide(${main.count },${stat.count})"></span>
							</c:forEach>
					</div>	
					<nav>
					<a href="#" class="previous"><span class="label">Previous</span></a>
					<a href="#" class="next"><span class="label">Next</span></a>
				</nav>

	</c:forEach>
				
			</section>



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
						<section>
							<span class="image"><img src="images/pic06.jpg" alt="" /></span>
							<div class="content">
								<h2>Ultrices augue faucibus</h2>
								<p>Donec elementum odio ut suscipit congue. Fusce magna mattis vel fermentum, ultricies et velit. Suspendisse viverra, ante in eleifend vulputate, lacus lorem pretium ligula, tincidunt posuere sapien neque a augue. Pellentesque habitant morbi tristique senectus et netus et malesuada.</p>
							</div>
						</section>
						<section>
							<span class="image"><img src="images/pic07.jpg" alt="" /></span>
							<div class="content">
								<h2>Integer sed sodales</h2>
								<p>Donec elementum odio ut suscipit congue. Fusce magna mattis vel fermentum, ultricies et velit. Suspendisse viverra, ante in eleifend vulputate, lacus lorem pretium ligula, tincidunt posuere sapien neque a augue. Pellentesque habitant morbi tristique senectus et netus et malesuada.</p>
							</div>
						</section>
					</div>
				</div>
			</section>

			</div>
			</div>
<%@ include file="./includes/footer.jsp" %>
			
</body>
</html>