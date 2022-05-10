<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
 --%>
 <script type="text/javascript">
 	function update() {
		document.getElementById('change').innerHTML=`
			<tr>
				<td>전화 번호</td>
				<td><input type="text" name="phone" required="required" value="${member.phone}"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" required="required" value="${member.email}"></td>
			</tr>
		`;
		document.getElementById('func').innerHTML=`
			<a class="button" onclick="javascript:save()">저장</a>
	        <a class="button" onclick="javascript:reset()">취소</a>
		`;
	}
 	function reset(){
 	    document.getElementById('change').innerHTML=`
 	    <tr>
			<td>전화 번호</td>
			<td>${member.phone}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${member.email}</td>
		</tr>
 	    `;
 	    document.getElementById('func').innerHTML=`
 	        <a class="button" onclick="javascript:update()">수정</a>
 	        <a class="button" onclick="javascript:deleteOk()">회원탈퇴</a>
 	    `;
 	}
 	function save(){
 	    document.forms[0].action='update.do';
 	    document.forms[0].submit();
		
 	}
 	function deleteOk(){
 		if(confirm(`${member.id}님 정말 탈퇴하시겠습니까?`)==true){
 		document.forms[0].action= 'delete.do'; 
 	    document.forms[0].submit();
 		}
 	}
 </script>
</head>
<body>
	<!-- wrap시작 -->
	<div id="wrap">
<%@ include file="../home.jsp" %>
		<!-- 컨테이너시작 -->
		<div id="container">
			<div class="location_area member">
				<div class="box_inner">
					<h2 class="tit_page">Freddo</h2>
					<p class="location">
						MyPage <span class="path">/</span> 마이페이지
					</p>
					
				</div>
			</div>
			<!-- 본문 -->
				<h3>${member.name }님의 프로필 </h3>
			<fieldset>
			<form action="./update.do" method="post">
			<input type="hidden" name="id" value="${member.id}">
			
				<table>
					<tr>
						<td>이름</td>
						<td>${member.name }</td>
					</tr>
					<tr>
						<td>성별</td>	
						<td>${member.gender }</td>
					</tr>
					<tr>
						<td>사용자 ID</td>
						<td>${member.id }</td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td>${member.birth_date }
					</tr>
					<tbody id="change">
					<tr>
						<td>전화 번호</td>
						<td>${member.phone }</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>${member.email }</td>
					</tr>
					</tbody>
					<tr>
						<td>가입일자</td>
						<td>${member.reg_date }
						
						</td>
					</tr>
					<tr>
					<td>
						<span id="func">
							<a class= "button" href="javascript:update()">수정</a>
							<a class= "button" href="javascript:deleteOk()">회원탈퇴</a>
						</span>
					</td>
					</tr>
				</table>
				</form>
				</fieldset>
		</div>
	</div>
</body>
</html>