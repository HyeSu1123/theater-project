<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>

</head>
<body>

<%@ include file="./includes/top2.jsp" %>

<!-- Wrapper -->


		<!-- Section -->



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
											<li><a href="noticedetail.do?idx=${vo.notice_idx}">${vo.notice_title }</a></li>
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
		<script type="text/javascript">
$.noConflict();
$('.post-wrapper').slick({
	  slidesToShow: 3,
	  slidesToScroll: 1,
	  autoplay: true,
	  autoplaySpeed: 3000,
	  nextArrow:$('.next'),
	  prevArrow:$('.prev'),
	});
</script>	

</body>
</html>