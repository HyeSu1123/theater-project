<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
ul{
	list-style:none;
	padding-left:1px;]
}
.poster{
	margin:20px;
}

.clearp{
	display:flex;
	justify-content:center;
}
.perform_info{
	margin:20px;
	align-items:center;
	width:380px;
}
.perform_button{
	align-items:center;
	margin-top:117px;
	margin-left:10px;
}
.perform_button > button{
	margin:5px;
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
				PERFORM <span class="path"></span>
				</p>
		</header>
		<div class="inner">
<div style="margin:auto;">
	<div class="clear2">
		<div class="clearp">
				<div class="poster">
				<img src="/upload/${detail.poster}" width="175px" height="250px" style="object-fit:contain">
				</div>
				<div class="perform_info">
					<h3>${detail.perform_title}</h3>
					<hr>
					<ul>
						<li><span>공연 일정 : </span>
							<fmt:formatDate value="${detail.start_date}" pattern="yyyy년 MM월 dd일"/> ~ 
							<fmt:formatDate value="${detail.end_date}" pattern="yyyy년 MM월 dd일"/>
						</li>
						<li><span>공연 장소 : </span>${detail.theater_name}</li>
						<li><span>입 장 료  : </span>${detail.theater_fee}</li>
						<li><span>관람 등급 : </span>${detail.grade} 관람가</li>
					</ul>
				</div>
		</div>
		<div class="clearp">
			<div id="detail">${detail.detail}</div>
		</div>
		<div class="clearp">
		
		<button type="button" onclick="location.href='${pageContext.request.contextPath}/ticket/choice.do?idx=${detail.perform_idx}&tidx=${detail.theater_idx}'">예매하기</button>
		<button type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</div>
</div>
</section>
<%@ include file="../includes/footer.jsp" %>

</body>
</html>