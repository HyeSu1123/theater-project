<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>

</head>
<body>

<%@ include file="./includes/top2.jsp" %>

			<section id="three" class="wrapper style1">
				<div class="inner">
					<div class="spotlights">
						<section>
							<span class="image"><img src="${pageContext.request.contextPath }/resources/image/notice.png" alt="공지사항" /></span>
							<div class="content">
								<h2><a href="${pageContext.request.contextPath }/admin/noticelist.do">NOTICE</a></h2>
								<div class="row">
									<div class="col-6 col-12-medium">
									 <c:forEach items="${listN}" var="vo">
										<ul>
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
			<section id="two" class="wrapper style2">
				<div style="font:bold;" class="inner">
						<ul class="actions special" >
							<li> <a href="#" class="button primary major">카카오톡 1:1 상담</a></li>
							<li><a href="#" class="button primary major">전화 상담 신청</a></li>
						</ul>
				</div>
			</section>

<%@ include file="./includes/footer.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	$.noConflict();
	$('.post-wrapper').slick({
		slidesPerRow: 1, 
		  rows:1,
		  slidesToShow: 3,
		  slidesToScroll: 1,
		  autoplay: true,
		  autoplaySpeed: 5000,
		  nextArrow:$('.next'),
		  prevArrow:$('.prev'),
		});
});

</script>	

</body>
</html>