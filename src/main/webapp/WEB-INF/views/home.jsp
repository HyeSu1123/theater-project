<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

	<title>Home</title>

</head>
<body>

<%@ include file="./includes/top2.jsp" %>
<section id="one" class="wrapper style1 split">
				<div class="inner">
					<div class="content">
						<h2>배우와 관객이 일체감을 느낄 수 있는 소극장<br />
						대단위 공연과 다목적 기능을 원활하게 소화할 수 있는 대극장</h2>
						<p>중ㆍ소형 공연에 알맞게 아담하고 무대에 몰입할 수 있도록 설계된 소극장과 주 무대와 측면무대로 구성된 무대부로 만들어져 있는 대극장<br></p>
					
					</div>
					<div class="image-circles" style="object-fit: cover;">
						<div class="images">
							<span class="image"><img src="${pageContext.request.contextPath }/resources/image/sml.jpg" alt="소극장" /></span>
							<span class="image"><img src="${pageContext.request.contextPath }/resources/image/small.jpg" alt="소극장2" /></span>
						</div>
						<div class="images">
							<span class="image"><img src="${pageContext.request.contextPath }/resources/image/big.jpg" alt="대극장" /></span>
							<span class="image"><img src="${pageContext.request.contextPath }/resources/image/big2.jpg" alt="대극장2" /></span>
						</div>
					</div>
					
				</div>
			</section>

			<section id="three" class="wrapper style1">
				<div class="inner">
					<div class="spotlights">
						<section>
							<span class="image"><img src="${pageContext.request.contextPath }/resources/image/notice.png" alt="공지사항" /></span>
							<div class="content">
								<h2><a href="${pageContext.request.contextPath }/admin/noticelist.do">NOTICE</a></h2>
								<div class="row">
									<div class="col-6 col-12-medium" style="font: bold;">
									 <c:forEach items="${listN}" var="vo">
										<ul>
											<li><a href="noticedetail.do?idx=${vo.notice_idx}" style="text-decoration: none">${vo.notice_title }</a></li>
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
</body>
</html>