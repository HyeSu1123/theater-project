<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우리동네 커뮤니티</title>
<!-- contextPath : 현재 프로젝트의 url -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/freeboard.css?v=3">
</head>
<body>
<%@ include file="../includes/banner.jsp" %>
		<!-- 컨테이너시작 -->
	<section id="main" class="wrapper">
		<header>
			<h2>FREDDO</h2>
				<p class="location">
				REVIEW <span class="path">/</span> 후기 작성
				</p>
		</header>
		<div class="inner">
<h3>관람후기 작성</h3>
<hr>

<form name="frm1" method="post" action="./insert.do">
 <input type="hidden" name="ip" value="${pageContext.request.remoteAddr}">  <!-- 클라이언트 ip -->
 <div class="table-wrapper">
 <table>
 	<tr><td width="30%" class="td1">제목</td>
 		<td class="left"><input type="text" name="subject" size="70" class="input1" 
 					required="required"></td>
 	</tr>
 	<tr><td class="td1">작성자</td>
 		<td class="left">
 		<input type="text" name="id" size="70" class="input1" 
 					required="required"  value=${member.id} readonly></td>
 	</tr>
 	<tr><td class="td1">공연 이름</td>
 	 	<td class="left">
			<select name="title">
				<option value="none" selected disabled>----</option>
				<c:forEach var="vo" items="${perform}">
					<option value="${vo.perform_title }">${vo.perform_title}</option>
				</c:forEach>
			</select>
 	 	</td>
 	</tr>
 	<tr><td class="td1">내용</td>  <!-- textarea 의 크기 : rows="20" cols="80" -->
 		<td class="left"><textarea  rows="20" cols="80" name="content" class="input1" 
 					required="required"></textarea></td>
 	</tr>
 	<tr><td colspan="2" align="center">
 	<input type="submit" value="저장" class="button primary" >
 	<!-- <a class="button" href="javascript:post_data();">저장</a> -->
 	<input type="reset"  value="다시쓰기" class="button">
 	<input type="button" value="목록" 
 			onclick="location.href='list.do?pageNo=${page}'" class="button primary">
 			<!--글쓰기 오기전에 보고있었던 페이지 번호로 돌아가기  -->
 <!-- 	<a class="button" href="#">목록</a>  -->
 	</td></tr>
 </table>
 </div>
 </form>
 </div>
 </section>
 <%@ include file="../includes/footer.jsp" %>
</body>
</html>