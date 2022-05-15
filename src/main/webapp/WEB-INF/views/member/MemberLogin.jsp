<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
 </head>
<body>
<%@ include file="../includes/banner.jsp" %>
		<!-- 컨테이너시작 -->
	<section id="main" class="wrapper">
		<header>
			<h2>FREDDO</h2>
				<p class="location">
				MEMBER <span class="path">/</span> 회원 로그인
				</p>
		</header>
		<div class="inner">
			<ul class="actions">
				<li><a href="./login.do" class="button primary">MEMBER LOGIN</a></li>
				<li><a href="./admin.do" class="button">ADMIN LOGIN</a></li>
			</ul>
		
			<!-- 본문 -->
			<form name="appLogin" method="post" action="./login.do">
			<label for="id">ID</label><br>
			<input type="text" name="id" id="id" placeholder="ID를 입력해주세요"><br>
			<label for="password">password</label><br>
			<input type="password" name="password" id="password" placeholder="password를 입력해주세요"><br>
			<input type="submit" value="Login" class="primary" />
			<div>
				<br><span>아직 ID가 없으신가요?</span><a href="member/join.do">회원가입</a>
				<a href="member/pw_auth.do">비밀번호 찾기</a>
			</div>
			</form>
			</div>
		</section>
		<%@ include file="../includes/footer.jsp" %>
</body>
</html>