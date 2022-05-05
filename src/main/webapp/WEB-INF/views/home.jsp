<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
<%-- 	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
 --%></head>
<body>

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
						<c:if test="${member == null}">
							<li><a href="${pageContext.request.contextPath }/login.do">로그인</a></li>
							<li><a href="${pageContext.request.contextPath }/member/join.do">회원가입</a></li>
						</c:if>
						<c:if test="${member != null}">
							${member.id }님 환영합니다.<a href="logout.do">로그아웃</a>
							<a href="#">MyPage</a>
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
										<li><a href="">공지사항</a></li>
										<li><a href="">관람 후기</a></li>
									</ul>
								</div>
							</li>
							<li>
								<a href="" class="openAll3">고객센터</a>
								<div class="gnb_depth gnb_depth2_3">
									<ul class="submenu_list">
										<li><a href="">1:1문의하기</a></li>
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
</html>
