<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%-- 	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
 --%></head>
<c:if test="${success=='n' }">
	<script type="text/javascript">
		alert("로그인 정보가 올바르지 않습니다.");
		location.href="./login.do"; 
	</script>	
</c:if>
<body>
	<!-- wrap시작 -->
	<div id="wrap">
<%@ include file="../home.jsp" %>
		<!-- 컨테이너시작 -->
		<div id="container">
			<div class="location_area member">
				<div class="box_inner">
					<h2 class="tit_page">Freddo</h2>
					<p class="location">
						MEMBER <span class="path">/</span> 로그인
					</p>
					
				</div>
			</div>
			<!-- 본문 -->
			<form name="appLogin" method="post" action="./login.do">
			<label for="id">ID</label><br>
			<input type="text" name="id" id="id" placeholder="ID를 입력해주세요"><br><br>
			<label for="password">password</label><br>
			<input type="password" name="password" id="password" placeholder="password를 입력해주세요"><br><br>
			<input type="submit" value="로그인"><br>
			<a href="member/join.do">아직 ID가 없으신가요?</a>
			<a href="member/pw_auth.do">비밀번호 찾기</a>
			</form>
		</div>
	</div>
</body>
</html>