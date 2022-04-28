<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- 헤더 시작 -->
		<header>
			<div class="header_area box_inner clear">
				<h1><a href="./home.jsp">Freddo</a></h1>
				<p class="opengnb">
					<a href="#">
					<b class="hdd">메뉴열기</b>
					<span></span><span></span>
					</a>
				</p>
				<div class="header_cont">
					<ul class="util clear">
						<li>
						<c:if test="${member != null }">${member.id }님 안녕하세요.<a href="#">로그아웃</a></c:if>
						<c:if test="${member == null }"><a href="/">로그인</a></c:if>
						</li>
						<li><c:if test="${member != null }"><a href="#">마이페이지</a></c:if>
						<li><c:if test="${member == null }"><a href="member/join.do">회원가입</a></c:if>
						</li>
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