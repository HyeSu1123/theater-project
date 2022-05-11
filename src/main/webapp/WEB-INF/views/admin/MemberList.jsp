<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList</title>
<%-- 	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
 </head>--%>
</head>
<body>
<%@ include file="../includes/top.jsp" %>

<table border="1">
	<tr>
		<th>권한	1:일반회원, 0:관리자</th>
		<th>이름</th>
		<th>성별</th>
		<th>아이디</th>
		<th>생일</th>
		<th>번호</th>
		<th>이메일</th>
		<th>가입일자</th>
	</tr>
<c:forEach var="vo" items="${list}">
	<tr>
		<td>${vo.authority }</td>
		<td>${vo.name }</td>
		<td>${vo.gender }</td>
		<td>${vo.id }</td>
		<td>${vo.birth_date }
		<td>${vo.phone }</td>
		<td>${vo.email }</td>
		<td>${vo.reg_date }</td>
	</tr>
</c:forEach>
</table>
<a href="../">홈으로</a>
</body>
</html>