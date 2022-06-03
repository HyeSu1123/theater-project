<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../includes/banner.jsp" %>
		<!-- 컨테이너시작 -->
<section id="main" class="wrapper">
	<header>
		<h2>FREDDO</h2>
			<p class="location">
			Reservation List <span class="path">/</span> 예매 내역
			</p>
	</header>
	<div class="inner">
<div class="clearp">
	<h3>예매 내역</h3>
	<form action="./ticket.do" method="post">
		<input type="hidden" name="id" value="${member.id}">
		<table>
	<tr>
		<th width="5%">No</th>
		<th width="15%">예매번호</th>
		<th width="15%">공연</th>
		<th width="15%">극장</th>
		<th width="15%">공연일자</th>
		<th width="10%">공연시간</th>
		<th width="15%">좌석</th>
		<th width="10%">인원</th>
	</tr>
	<c:forEach var="vo" items="${list}" varStatus="status">
	<tr class="list">
		<td>${status.count}</td> 	
 		<td>${vo.ticket_no}</td>
 		<td>${vo.perform}</td>
 		<td>${vo.theater}</td>
 		<td>
 		<fmt:formatDate value="${vo.perform_date }" pattern="yyyy-MM-dd"/>  <!-- 출력패턴 -->
 		</td>
 		<td>${vo.start_time}</td>
 		<td>${vo.seat}</td>
 		<td>${vo.num}명</td>
 	</tr>
	 	</c:forEach>
	<c:if test="${fn:length(list)==0 }">
		<tr>
			<td colspan="7" style="text-align:center;"><br>조회 결과가 없습니다.</td>
		</tr>
	</c:if>
</table>
</form>
</div>
</div>
</section>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>