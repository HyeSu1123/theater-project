<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE HTML>
<!--
	Prototype by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<title>ADMIN PAGE</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/main.css" />
	</head>
	<body class="is-preload">
<script type="text/javascript">
	if(${message != null}) alert('${message}');
</script>
		<!-- Header -->
			<header id="header" class="alt">
				<h1><a href="${pageContext.request.contextPath }/">FREDDO : 회원페이지로 가기</a></h1>
				<a href="#menu">Menu</a>
			</header>

		<!-- Menu -->
			<nav id="menu">
				<ul class="links">
				<c:if test="${member == null && admin == null || member != null}">
					<li><a href="${pageContext.request.contextPath }/">Home</a></li>
					<li><a href="${pageContext.request.contextPath }/perform/nowlist.do">Performance</a></li>
					<li>
						<a href="">Community</a>
						<ul class="open">
							<li><a href="${pageContext.request.contextPath }/admin/noticelist.do">Notice</a></li>
							<li><a href="${pageContext.request.contextPath }/community/list.do">관람 후기</a></li>
						</ul>
					</li>
					</c:if>
					<c:if test="${member != null}">
					<li><a href="">Service center</a>
						<ul class="open">
							<li><a href="${pageContext.request.contextPath }/member/Board1to1.do">1:1 문의 목록</a></li>
						</ul>
					</li>
					</c:if>
					<c:if test="${admin != null}">
				<li><a href="${pageContext.request.contextPath }/admin/main.do">ADMIN PAGE</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/memberlist.do">Member List</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/memberapprove.do">MemberApprove</a></li>
					<li>
						<a href="">Performance</a>
						<ul class="open">
							<li><a href="${pageContext.request.contextPath }/perform/nowlist.do">Perform List</a></li>
							<li><a href="${pageContext.request.contextPath }/admin/performinsert.do">Perform Insert</a></li>
							<li><a href="${pageContext.request.contextPath }/admin/scheduleinsert.do">Perform Schedule</a></li>
						</ul>
					</li>
					<li>
						<a href="">Community</a>
						<ul class="open">
							<li><a href="${pageContext.request.contextPath }/admin/noticelist.do">Notice List</a></li>
							<li><a href="${pageContext.request.contextPath }/admin/noticeinsert.do">Notice Insert</a></li>
							<li><a href="${pageContext.request.contextPath }/community/list.do">관람후기</a></li>
						</ul>
					</li>
					<li><a href="">Service center</a>
						<ul class="open">
							<li><a href="${pageContext.request.contextPath }/admin/questionlist.do">1:1 문의 답변 등록</a></li>
						</ul>
					</li>
				</c:if>
				</ul>
				<ul class="actions stacked">
					<c:if test="${member == null && admin == null}">
						<li><a href="${pageContext.request.contextPath }/login.do" class="button fit">Log In</a></li>
						<li><a href="${pageContext.request.contextPath }/member/join.do" class="button primary fit">Sign Up</a></li>
					</c:if>
					<c:if test="${admin != null }">
						<li>${admin.id }님 안녕하세요. <a href="${pageContext.request.contextPath }/logout.do" class="button fit">Log Out</a></li>
						<li><a href="${pageContext.request.contextPath }/admin/main.do" class="button primary fit">Admin Page</a></li>
					</c:if>
					<c:if test="${member != null}">
						<li>${member.id }님 환영합니다.<a href="${pageContext.request.contextPath }/logout.do" class="button fit">Log Out</a></li>
						<li><a href="${pageContext.request.contextPath }/member/mypage.do" class="button primary fit">MyPage</a></li>
					</c:if>
				</ul>
			</nav>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<div class="content">
						<h2>FREDDO Administrator Page</h2>
						<p>Various performances are waiting for you. Do you want to go see it with me now?</p>
					</div>
				</div>
			</section>

		<!-- Scripts -->
			<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/jquery.min.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/jquery.scrollex.min.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/browser.min.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/breakpoints.min.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/util.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>
<script type="text/javascript">
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    }
  });
}
var href=window.location.pathname;
if(href.indexOf('member')!=-1 || href.indexOf('adminupdate')!=-1)
	acc[1].classList.add("active");
else if(href.indexOf('perform')!=-1 || href.indexOf('schedule')!=-1){
	acc[2].classList.add("active");
	acc[2].nextElementSibling.style.maxHeight = acc[2].nextElementSibling.scrollHeight + "px";
}
else if(href.indexOf('question')!=-1){
	acc[3].classList.add("active");
	acc[3].nextElementSibling.style.maxHeight = acc[3].nextElementSibling.scrollHeight + "px";
}
else if(href.indexOf('notice')!=-1){
	acc[4].classList.add("active");
	acc[4].nextElementSibling.style.maxHeight = acc[4].nextElementSibling.scrollHeight + "px";
}
</script>

	</body>
</html>