<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공연 후기 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/freeboard.css">
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Hahmlet:wght@200&family=IBM+Plex+Sans+KR:wght@300&display=swap');
*{
	font-family: 'Hahmlet', serif;
	font-family: 'IBM Plex Sans KR', sans-serif;	
}
</style>
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
		<div class="inner"><h3>공연 후기 목록</h3>

<hr>

<div style="margin:auto;">
 <table>
 	<tr><th width="10%">번호</th>
 		<th width="45%">제목</th>
 		<th width="15%">공연제목</th>
 		<th width="10%">조회수</th>
 		<th width="20%">작성일</th>
 	</tr>
 	<c:forEach var="vo" items="${list }"> 
	<tr>
		<td>${vo.idx }</td> 	
 		<td><a href="detail?idx=${vo.idx}&pageNo=${page.pageNo}" class="title">${vo.subject }</a>
 		...<span style="color:orange;font-size: 80%;">(${vo.commentCount})
 		</span></td>
 		<td>${vo.title }</td>	
 		<td>${vo.readCount }</td>
 		<td>
 			<fmt:formatDate value="${vo.wdate }" pattern="yyyy-MM-dd"/>  <!-- 출력패턴 -->
 		</td>
 	</tr>
 	</c:forEach>
 	<tr><td colspan="4">Go!
 	<!-- a태그 url요청 get 메소드 -->
 	<a class="button" href="insert?pageNo=${page.pageNo }">글쓰기</a>
 	<a class="button" href="${pageContext.request.contextPath }">홈</a></td>
 	<td>작성글 총 개수 : ${page.totalCount}</td>
 	</tr>
 </table>
</div>
 <!-- 페이지 이동 :전체보기 -->
 
 <div style="text-align: center;">
 	<!-- 가장 첫페이지로 이동 -->
	<a class="pagenum" href="?pageNo=1">&lt;&lt;</a>   <!-- 요청url은 동일하고 파라미터만 변경됩니다. -->
	<a class="${page.startPage>1? 'pagenum':'none'}" 
	href="?pageNo=${page.startPage-1 }">&lt;</a>  
	
	<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">  <!-- 페이지목록의 범위  -->
		<a class="pagenum" href="?pageNo=${i}">${i}</a>     <!-- 현재페이지 i값으로 변경  -->
	</c:forEach>
	
	<a class="${page.endPage!=page.totalPage? 'pagenum':'none'}" href="?pageNo=${page.endPage+1 }">&gt;</a> 
	<a class="pagenum" href="?pageNo=${page.totalPage }">&gt;&gt;</a><!--맨 마지막페이지  -->
</div>
</div>
</section>
</body>
</html>
