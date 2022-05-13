<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%-- 	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
 </head>--%>

<body>
	<!-- wrap시작 -->
	<div id="wrap">
<%@ include file="../includes/top.jsp" %>
		<!-- 컨테이너시작 -->
		<div id="container">
			<div class="location_area member">
				<div class="box_inner">
					<h2 class="tit_page">Freddo</h2>
					<p class="location">
						ADMIN <span class="path">/</span> 로그인
					</p>
					
				</div>
			</div>
			<div>
				<ul>
					<li><a href="./login.do">회원 로그인</a></li>
					<li><a href="./admin.do">관리자 로그인</a></li>
				</ul>
			</div>
			<!-- 본문 -->
			<form name="adminLogin" method="post" action="./admin.do">
			<label for="id">ID</label><br>
			<input type="text" name="id" id="id" placeholder="ID를 입력해주세요"><br><br>
			<label for="password">password</label><br>
			<input type="password" name="password" id="password" placeholder="password를 입력해주세요"><br><br>
			<input type="hidden" name="authority" id="authority" value="0"> 
			<input type="submit" value="로그인"><br>
			<div>
			<span>아직 ID가 없으신가요?</span><a href="admin/adminjoin.do">회원가입</a>
			</div>
			</form>
		</div>
	</div>
</body>
</html>