<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css"> -->
</head>
<body>
<%@ include file="../home.jsp" %>
<form class = "content" action="./pw_auth.do" method="post">
	<div class="textbox">
  		<label for="text">ID</label>
  		<input id="id" name="id" required="" type="text" />
   		<div class="error">아이디를 입력하세요  </div>
 	</div>
	<div class="textbox">
  		<label for="email">이메일</label>
  		<input id="email" name="email" required="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)?$/i" type="text" />
  	<div class="error">유효하지 않은 이메일주소 입니다  </div>
	</div><br><br>
   	<input type="submit" id="check" value="비밀번호찾기">
</form>
</body>
</html>