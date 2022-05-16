<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>문의</title>
	<style type="text/css">
	.btn{
	margin: 10px;
	width: 80px;
	height: 40px;
    color:#444;
	font-family: 'CookieRun-Regular';
	border: 0;
	outline: 0;
	cursor: pointer;
	
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
				NOTICE <span class="path">/</span> 문의내용
				</p>
		</header>
		<div class="inner">
	<!-- 상담 및 공지사항 시작 -->
	<c:choose>
	<c:when test="${member != null }">
	<!--작업편의상 !=로 설정 깃합친후에는 == 이 맞음 -->
	<!--로그인 안하고 1:1 눌렀을 때  -->
	
	<script>
	alert("로그인이 필요합니다")
	location.href="MemberLogin"<!-- href로그인창 띄우는걸로 바꿔야되요 -->
	
	</script>
	
	</c:when>
	
	<c:otherwise>
                       <h1 >1:1문의하기</h1>
                       <hr style="width: 70%; border:solid 1px; margin: 5px" >
                    
<form  method="post" action="./Qinsert" >  <!--insert 는 post   -->
<table style="width: 70%">
	<tr>
	<td>
	<input type="hidden" name="id" value="${member.id }">
	<!--value값 ${member.id}로 바꿔야함  -->
    </tr>
	
	
	<tr style="padding: 10px"><td >문의 제목</td>
		<td><input type="text" name="question_title" placeholder="제목을 입력해주세요" required="required"></td>
		
	</tr>
	<tr><td class="">내용</td>  <!-- textarea 의 크기 : rows="20" cols="80" -->
 		<td class=""><textarea  rows="30" cols="80" name="question_content" class="" 
 			required="required" placeholder="문의내용을 입력해주세요"></textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="문의" class="btn" >
		<input type="reset"  value="다시쓰기" class="btn">
		<input type="button" value="목록" 
 		onclick="location.href='Board1to1'" class="btn">
		
		
	</tr>
	
	
</table>
</form>
                   
       </c:otherwise>
       </c:choose>
        </div>
            <!-- 상담 및 공지사항 끝 -->
</section>
</body>
</html>