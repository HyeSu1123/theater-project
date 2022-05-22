<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
<!DOCTYPE HTML>
<!--
	Prototype by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
<head>
	<title>Freddo Theater</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<!-- 제이쿼리 불러오기 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
 
	<!-- Slick 불러오기 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
		
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/main.css" />

</head>

<style>
/*post slider*/
.post{
margin: 20px;
padding: 20px;
}

.silder-title ,.post-subject{
font:bold;
color: white;
}

.post-slider{
  width:90%;
  margin:0px auto;
  position:relative;
  
}
.post-slider .silder-title{
  text-align:center;
  margin:50px auto;
  
}
.post-slider .next{
  position:absolute;
  top:50%;
  right:30px;
  font-size:2em;
  color:gray;
  cursor: pointer;
}
.post-slider .prev{
  position:absolute;
  top:50%;
  left:30px;
  font-size:2em;
  color:gray;
    cursor: pointer;
}
.post-slider .post-wrapper{
  width:84%;
  height:450px;
  margin:30px auto;
  overflow: hidden;
  padding:10px 0px 10px 0px;
}
.post-slider .post-wrapper .post{
  width:300px;
  height:380px;
  margin:0px 10px 10px;
  display:inline-block;
  background:#303639;
  border-radius: 5px;
}
.post-slider .post-wrapper .post .post-info{
  font-size:15px;
  height:30%;
  padding-left:10px;
}
.post-slider .post-wrapper .post .slider-image{
  width:100%;
  height:280px;
  border-top-left-radius:5px;
  border-top-right-radius:5px;
  
}
.banner{
font: bold;
	background-color: #303639;
		color: #ffffff;
		padding: 10.5em 0 4em 0 ;
		display: -moz-flex;
		display: -webkit-flex;
		display: -ms-flex;
		display: flex;
		-moz-align-items: center;
		-webkit-align-items: center;
		-ms-align-items: center;
		align-items: center;
		-moz-justify-content: center;
		-webkit-justify-content: center;
		-ms-justify-content: center;
		justify-content: center;
		background-image: -moz-linear-gradient(to top, rgba(48, 54, 57, 0.2), rgba(48, 54, 57, 0.2)), url("../../images/banner.jpg");
		background-image: -webkit-linear-gradient(to top, rgba(48, 54, 57, 0.2), rgba(48, 54, 57, 0.2)), url("../../images/banner.jpg");
		background-image: -ms-linear-gradient(to top, rgba(48, 54, 57, 0.2), rgba(48, 54, 57, 0.2)), url("../../images/banner.jpg");
		background-image: linear-gradient(to top, rgba(48, 54, 57, 0.2), rgba(48, 54, 57, 0.2)), url("../../images/banner.jpg");
		background-attachment: fixed;
		background-position: center;
		background-size: cover;
		height: 75vh;
		min-height: 30em;
		position: relative;
		margin-top: -3.125em;
}

</style>
	

<script type="text/javascript">
	if(${message != null}) alert('${message}');
</script>
	<body class="is-preload">
		<!-- Header -->
			<header id="header" class="alt">
				<h1>
				<a href="${pageContext.request.contextPath }/">FREDDO</a></h1>
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
<section class="banner">
	<div class="wrapper">
	<div class="inner">

 <div class="page-wrapper" style="position:relative;">
      <!--page slider -->
      <div class="post-slider">
        <h1 class="silder-title">today's performance</h1>
        <i class="fas fa-chevron-left prev"></i>  <!-- 왼쪽 방향 버튼 -->
        <i class="fas fa-chevron-right next"></i>   <!-- 오른쪽 방향 버튼 -->
        <div class="post-wrapper">
        
  <c:forEach var="vo" items="${nowlistN}" >
          <div class="post">
            <a href="detailnow.do?idx=${vo.perform_idx}" ><img src="/upload/${vo.poster}" class="slider-image"></a>
            <div class="post-info">
              <h4><a href="detailnow.do?idx=${vo.perform_idx}" class="post-subject">${vo.perform_title}</a></h4>
              <ul>
	              <li><span>공연 일정 : </span>
	                 <fmt:formatDate value="${vo.start_date}" pattern="yyyy년 MM월 dd일"/> ~ 
	                 <fmt:formatDate value="${vo.end_date}" pattern="yyyy년 MM월 dd일"/>
	              </li>
              </ul>
            </div>
          </div>
          </c:forEach>
      </div>
      </div>
      </div>
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

	</body>
</html>