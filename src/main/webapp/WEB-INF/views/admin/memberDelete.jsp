<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제</title>
<script type="text/javascript">	
	function deleteOk(id){		//삭제할 건지 확인
		var answer = prompt(id+"님의 회원 정보를 삭제하시겠습니까?\n삭제하려면 '회원 삭제'를 입력하세요.","")
		if(answer=='회원 삭제')
			document.forms[0].submit();
		else
			alert('삭제가 취소되었습니다.');
	}
</script>
<script src="https://kit.fontawesome.com/7ebf19920b.js" crossorigin="anonymous"></script>
</head>
<body>
<!-- 메뉴바 include -->
<%@ include file="../includes/banner.jsp" %>
<!-- 컨테이너시작 -->
<section id="main" class="wrapper">
	<header>
		<h2>FREDDO</h2>
			<p class="location">
			MEMBER LIST DELETE<span class="path">/</span> 회원 리스트 삭제
			</p>
	</header>
	<div class="inner">
		<h3>회원 삭제</h3>
		<hr>
		<div style="margin:auto;">
			<table>
				<tr>
				<th width="13%">아이디</th>
				<th width="13%">이름</th>
				<th width="16%">생년월일</th>
				<th width="8%">성별</th>
				<th width="19%">전화번호</th>
				<th width="16%">가입일자</th>
				<th width="10%">구분</th>
				</tr>
				<tr>
			 		<td>${vo.id}</td>
			 		<td>${vo.name }</td>
			 		<td>${vo.birth_date}</td>
			 		<td>${vo.gender}</td>
			 		<td>${vo.phone}</td>
			 		<td>
			 		<fmt:formatDate value="${vo.reg_date }" pattern="yyyy-MM-dd"/>  <!-- 출력패턴 -->
			 		</td>
			 		<td>
			 		<c:if test="${vo.authority==1}">
			 			<span>일반 회원</span>
			 		</c:if>
			 		<c:if test="${vo.authority==0}">
			 			<span style="color:red;font-weight:bolder;">관리자</span>
			 		</c:if>
		
			 		</td>
			 	</tr>
			</table>
			<form action="memberdeletesave.do" method="post">
				<input type="hidden" name="id" value="${vo.id}">
				<div style="text-align:center">
					<button type="button" onclick="deleteOk('${vo.id}');">삭제</button>
					<button type="button" onclick="history.back();">취소</button>
				</div>
			</form>
		</div>
	</div>
</section>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>