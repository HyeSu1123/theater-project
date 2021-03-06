<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연 목록</title>
<style type="text/css">


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
	width:100px;
}
.perform_button > button{
	margin:5px;
}
input[type="radio"] {display:none;}
input[type="radio"] + label {display:inline-block;padding:20px; cursor:pointer;}
input[type="radio"] + label:hover{ color:#2498db; font-weight:bold;}
input[type="radio"]:checked + label {border-bottom:2px solid #3498db; color:#3498db;font-weight:bold;}
input[id="tab01"]:checked~.con1{display:block;}
input[id="tab02"]:checked~.con2{display:block;}
</style>
</head>
<body>
<%@ include file="../includes/banner.jsp" %>
		<!-- 컨테이너시작 -->
	<section id="main" class="wrapper">
		<header>
			<h2>FREDDO</h2>
				<p class="location">
				PERFORM <span class="path">/</span> 공연 목록
				</p>
		</header>
		<div class="inner">
		<div class="tab_content" style="text-align:center">
		<input type="radio" name="tabmenu" id="tab01" checked>
		<label for="tab01">현재/예정 공연</label>
		<input type="radio" name="tabmenu" id="tab02">
		<label for="tab02">지난 공연</label>
	
			<div class="clear2" style="text-align:left">
				<c:forEach var="vo" items="${nowlist}">
				<div class="clearp">
						<div class="poster">
						<img src="/upload/${vo.poster}" width="175px" height="250px" style="object-fit:contain">
						</div>
						<div class="row">
						<div class="perform_info">
						<div class="col-6 col-12-medium">
							<h3>${vo.perform_title}</h3>
							<hr>
							<ul class="alt">
								<li><span>공연 일정 : </span>
									<fmt:formatDate value="${vo.start_date}" pattern="yyyy년 MM월 dd일"/> ~ 
									<fmt:formatDate value="${vo.end_date}" pattern="yyyy년 MM월 dd일"/>
								</li>
								<li><span>공연 장소 : </span>${vo.theater_name}</li>
								<li><span>입 장 료  : </span>${vo.theater_fee}</li>
								<li><span>관람 등급 : </span>${vo.grade} 관람가</li>
							</ul>
							<ul class="alt">
								<li><button type="button" onclick="location.href='detailnow.do?idx=${vo.perform_idx}'">상세정보</button>
								<button type="button" onclick="location.href='../ticket/choice.do?idx=${vo.perform_idx}&tidx=${vo.theater_idx}'">예매하기</button></li>
							</ul>
						</div>
				</div>
				</div>
				</div>
				</c:forEach>
			</div>
	</div>
	<div class="conbox con2" style="text-align:left">
		<div style="margin:auto;">
			<div class="clear2">
				<c:forEach var="vo" items="${lastlist}">
				<div class="clearp">
						<div class="poster">
						<img src="/upload/${vo.poster}" width="175px" height="250px" style="object-fit:contain">
						</div>
						<div class="row">
						<div class="perform_info">
						<div class="col-6 col-12-medium">
							<h3>${vo.perform_title}</h3>
							<hr>
							<ul class="alt">
								<li><span>공연 일정 : </span>
									<fmt:formatDate value="${vo.start_date}" pattern="yyyy년 MM월 dd일"/> ~ 
									<fmt:formatDate value="${vo.end_date}" pattern="yyyy년 MM월 dd일"/>
								</li>
								<li><span>공연 장소 : </span>${vo.theater_name}</li>
								<li><span>입 장 료  : </span>${vo.theater_fee}</li>
								<li><span>관람 등급 : </span>${vo.grade} 관람가</li>
							</ul>
							<ul class="alt">
								<li><button type="button" onclick="location.href='detaillast.do?idx=${vo.perform_idx}'">상세정보</button><br></li>
							</ul>
						</div>
						</div>
						</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
</section>
<%@ include file="../includes/footer.jsp" %>

</body>
</html>