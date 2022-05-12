<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>1:1</title>
	<!-- <style type="text/css">
	td,th{
    border: 1px dotted gray;
	</style> -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
	
</head>

<body>
<%@ include file="./includes/top.jsp" %>
<main>
<c:choose>
	<c:when test="${member != null }">
	<!--작업편의상 !=로 설정 깃합친후에는 == 이 맞음 -->
	<!--로그인 안하고 1:1 눌렀을 때  -->
	
	<script>
	alert("로그인이 필요합니다")
	location.href="redirect:/home"<!-- 로그인창 뛰워줌 일시적으로 홈화면 -->
	</script>
	
	
	</c:when>
	<c:otherwise>
<h3 style="color: white">@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 헤더가 제대로 작동을 안해서..임시로  칸 채우기
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@</h3>
<h3 >1:1문의하기</h3>
<form  name ="dfdfds"method="post" action="qusetion" >
<table style="width: 70%",center;>
	<tr>
	<td>
	<input type="hidden" name="id" value="${member.email }">
	<!-- id로할지 email로 할지 애매해서 일단 member 에 있는 email로 설정 -->
    </tr>
	
	
	<tr><td>문의 제목</td>
		<td><input type="text" name="question_title" placeholder="제목을 입력해주세요"></td>
		
	</tr>
	<tr><td class="">내용</td>  <!-- textarea 의 크기 : rows="20" cols="80" -->
 		<td class=""><textarea  rows="20" cols="80" name="question_content" class="" 
 			required="required" placeholder="문의내용을 입력해주세요"></textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="문의" class="" >
		<input type="reset"  value="취소하기" class="">
		<a href="./board1to1"></a>
		
	</tr>
	
	
</table>
</form>
	</c:otherwise>
	
		








</c:choose>
</main>
</body>
</html>
