<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
</head>
<body>

<script type="text/javascript">
	if(${message != null}) alert('${message}');
</script>
		<!-- 헤더 시작 -->
		<header>
			<div class="header_area box_inner clear">
				<h1><a href="${pageContext.request.contextPath }/">Freddo</a></h1>
				<p class="opengnb">
					<a href="#">
					<b class="hdd">메뉴열기</b>
					<span></span><span></span>
					</a>
				</p>
				<div class="header_cont">
					<ul class="util clear">
						<c:if test="${member == null && admin == null}">
							<li><a href="${pageContext.request.contextPath }/login.do">로그인</a></li>
							<li><a href="${pageContext.request.contextPath }/member/join.do">회원가입</a></li>
							
						</c:if>
						<c:if test="${admin != null }">
							<li>${admin.id }님 안녕하세요. <a href="${pageContext.request.contextPath }/logout.do">로그아웃</a></li>
							<li><a href="${pageContext.request.contextPath }/admin/performinsert.do">공연 등록</a></li>
							<li><a href="${pageContext.request.contextPath }/admin/noticeupdate.do">공지사항 등록</a></li>
							<li><a href="${pageContext.request.contextPath }/admin/memberlist.do">회원 목록</a></li>
							
						</c:if>
						<c:if test="${member != null}">
							<li>${member.id }님 환영합니다.<a href="${pageContext.request.contextPath }/logout.do">로그아웃</a></li>
							<li><a href="${pageContext.request.contextPath }/member/mypage.do">MyPage</a></li>
						</c:if>
					</ul>
					<nav>
						<ul class="gnb clear">
							<li>
								<a href="" class="openAll1">공연 전시</a>
								<div class="gnb_depth gnb_depth2_1">
									<ul class="submenu_list">
										<li><a href="">공연 전시</a></li>
									</ul>
								</div>
							</li>
							<li>
								<a href="" class="openAll2">커뮤니티</a>
								<div class="gnb_depth gnb_depth2_2">
									<ul class="submenu_list">
										<li><a href="${pageContext.request.contextPath }/admin/noticelist.do">공지사항</a></li>
										<li><a href="">관람 후기</a></li>
									</ul>
								</div>
							</li>
							<li>
								<a href="" class="openAll3">고객센터</a>
								<div class="gnb_depth gnb_depth2_3">
									<ul class="submenu_list">
										<li><a href="${pageContext.request.contextPath }/admin/questionlist.do">1:1문의하기</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</nav>
					<p class="closePop"><a href="">닫기</a></p>
				</div>
			</div>
		</header>
		<!-- 헤더 끝 -->
</body>
<script type="text/javascript">

</script>
</html>