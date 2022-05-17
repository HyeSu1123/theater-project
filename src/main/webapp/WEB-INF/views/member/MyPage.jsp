<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
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
 	    const frm = document.appForm;
 	    const email = frm.email;
		const reg4 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(email.value == ""){
			email.focus();
			alert("이메일을 입력해주세요");
			return false;
		}else if(!reg4.test(email.value)){
			email.focus();
			alert("이메일 형식을 맞춰주세요(ex:abc@naver.com)");
			return false;
		}
		const phone = frm.phone;
		const reg5 = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		if(phone.value == ""){
			phone.focus();
			alert("번호를 입력해주세요");
			return false;
		}else if(!reg5.test(phone.value)){
			phone.focus();
			alert("번호 형식을 맞춰주세요(ex:010-0000-0000)");
			return false;
		}
 	    document.forms[0].submit();
		
 	}
 	function deleteOk(){
 		if(confirm(`${member.id}님 정말 탈퇴하시겠습니까?`)==true){
 		document.forms[0].action= 'delete.do'; 
 	    document.forms[0].submit();
 		}
 	}
 </script>
<script type="text/javascript">
	if(${message != null}) alert('${message}');
</script>
</head>
<body>
<%@ include file="../includes/banner.jsp" %>
		<!-- 컨테이너시작 -->
<section id="main" class="wrapper">
	<header>
		<h2>FREDDO</h2>
			<p class="location">
			MyPage <span class="path">/</span> 내 정보
			</p>
	</header>
	<div class="inner">
			<!-- 본문 -->
				<h3>${member.name }님의 프로필 </h3>
			<fieldset>
			<form action="./update.do" method="post" name="appForm">
			<input type="hidden" name="id" value="${member.id}">
			<!-- Qinsert.do -->
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
					<td colspan="2" style="text-align: center;">
						<span id="func">
							<a class= "button" href="javascript:update()">수정</a>
							<a class= "button" href="javascript:deleteOk()">회원탈퇴</a>
						</span>
					</td>
					</tr>
				</table>
				</form>
				</fieldset>
				<a class="button primary small fit" href="${pageContext.request.contextPath }/member/qinsert.do">1:1문의 글 쓰기</a>
	
	<div class="clearp">
	<h3>예매 내역</h3>
</div>
<div class="clearp">
	<div class="poster">
		<img src="/upload/${performinfo.poster}" width="175px" height="250px" style="object-fit:contain">
	</div>
	<div class="perform_info">
		<h4>${performinfo.perform_title}</h4>
		<hr>
		<table style="text-align:left;">
			<tr>
				<th>예매 번호</th>
				<td>${ticketno}</td>
			</tr>
			<tr>
				<th style="width:30%;">극장</th>
				<td>${performinfo.theater_name}</td>
			</tr>
			<tr>
				<th>공연일</th>
				<td><fmt:formatDate value="${scheduleinfo.perform_date}" pattern="yyyy년 MM월 dd일"/></td>
			</tr>
			<tr>
				<th>공연 시간</th>
				<td>${scheduleinfo.start_time}</td>
			</tr>
			<tr>
				<th>인원</th>
				<td>${number} 명</td>
			</tr>
			<tr>
				<th>좌석</th>
				<td>${choicedseat}</td>
			</tr>

		</table>
	</div>
</div>
	
	</div>	
</section>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>