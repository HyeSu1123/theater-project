<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<%-- 	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
 --%>
 <link rel="javascript" href="">
 
 	<script type="text/javascript">
	function checkid(){
		var popupWidth = 300;
		var popupHeight = 150;
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		
		var id = document.appForm.id.value;
		var url="./idCheck.do?id="+id;
		window.open(url,"아이디 중복체크",'height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
		
		
	}
	
	const sendit = function(){
		var space = /\s/g;
		const frm = document.appForm;
		const id = frm.id;
		const reg = /[^a-z0-9]/g;
		
		if(id.value == ""){
			id.focus();
			alert("아이디를 입력해주세요");
			return false;
		}else if(id.value.match(space)){
			id.focus();
			alert("공백없이 입력해주세요");
			return false;
		}else if(reg.test(id.value)){
			id.focus();
			alert("아이디는 영문 소문자 숫자만 입력해주세요");
			return false;
		}else if(id.value.length < 5){
			id.focus();
			alert("최소 5자 이상 입력해주세요");
			return false;
		}else if(id.value.length > 10){
			id.focus();
			alert("최대 10자 이내로 입력해주세요");
			return false;
		}
		
		const pw = frm.password;
		const reg2 = /[^a-zA-Z0-9]/g;
		const upper = /[A-Z]/g, lower = /[a-z]/g, digit = /[0-9]/g;
		if(pw.value == ""){
			pw.focus();
			alert("비밀번호를 입력해주세요");
			return false;
		}else if(pw.value.match(space)){
			pw.focus();
			alert("공백없이 입력해주세요");
			return false;
		}else if(reg2.test(pw.value)){
			pw.focus();
			alert("비밀번호는 영문 대/소문자, 숫자만 입력해주세요");
			return false;
		}else if(pw.value.length <= 5){
			pw.focus();
			alert("비밀번호는 최소 5자 이상 입력해주세요");
			return false;
		}else if(pw.value.length > 10){
			pw.focus();
			alert("비밀번호는 최대 10자 이내 입력해주세요");
			return false;
		}else if(!upper.test(pw.value) || !lower.test(pw.value) || !digit.test(pw.value)){
			pw.focus();
			alert("비밀번호는 영문 대/소문자, 숫자를 모두 포함해야합니다.");
			return false;
		}
		
		const pw_ck = frm.password2;
		if(pw_ck.value == ""){
			pw_ck.focus();
			alert("비밀번호를 입력해주세요");
			return false;
		}else if(pw_ck.value != pw.value){
			pw_ck.focus();
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		const name = frm.name;
		if(name.value == ""){
			name.focus();
			alert("이름을 입력해주세요");
			return false;
		}
		const bir = frm.birth_date;
		const reg3 = /^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/;
		if(bir.value == ""){
			bir.focus();
			alert("생일을 입력해주세요");
			return false;
		}else if(!reg3.test(bir.value)){
			bir.focus();
			alert("날짜 형식을 맞춰주세요(ex:2000-01-01)");
			return false;
		}
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
		const agree = frm.agree;
		if(!agree.checked){
			alert("약관 동의를 체크해주세요");
			agree.focus();
			return false;
		}
		
		document.appForm.submit();
	}
	
	</script>
</head>
<body>
	<!-- wrap시작 -->
	<div id="wrap">
<%@ include file="../includes/top.jsp" %>

		<!-- 컨테이너시작 -->
		<div id="container">
			<div class="location_area member">
				<div class="box_inner">
					<h2 class="tit_page">Freddo</h2>
					<p class="location">
						MEMBER <span class="path">/</span> 회원가입
					</p>
					
				</div>
			</div>
			<!-- 본문 -->
			<div class="bodytext_area box_inner">
			<!-- 회원가입 -->
			<form name="appForm" method="post" action="./join.do">
			<table>
				<legend>회원가입 입력 양식</legend>
				<!-- 아이디 -->
				<tr class="app_list">
					<td class="clear">
					<label for="id" class="tit_lbl">ID</label></td>
					<td><input type="text" id="id" name="id" placeholder="ID를 입력해주세요"> 
						<button class="idchk" type="button" id="idchk" onclick="checkid()">중복확인</button>
					</td>
					
				</tr>
				<!-- 비밀번호 -->
				<tr class="app_list">
					<td class="clear">
					<label for="password" class="tit_lbl">PassWord</label></td>
					<td><input type="password" id="password" name="password" placeholder="password를 입력해주세요">
					</td>
				</tr>
				<!-- 비밀번호 확인 -->
				<tr class="app_list">
					<td class="clear">
					<label for="password2" class="tit_lbl">PassWord 확인</label></td>
					<td><input type="password" id="password2" name="password2" placeholder="password를 확인해주세요">
					</td>
				</tr>
				<!-- 이름 -->
				<tr class="app_list">
					<td class="clear">
					<label for="name" class="tit_lbl">이름</label></td>
					<td><input type="text" id="name" name="name" placeholder="이름을 입력해주세요">
					</td>
				</tr>
				<!-- 생일 -->
				<tr class="app_list">
					<td class="clear">
					<label for="birth_date" class="tit_lbl">생일</label></td>
					<td><input type="text" id="birth_date" name="birth_date" placeholder="생일을 입력해주세요">
					</td>
				</tr>
				<!-- 성별 -->
				<tr class="app_list">
					<td class="tit_lbl"> 성별</td>
					<td class="app_content radio_atea">
					<input type="radio" name="gender" id="male" class="radio" value="남자" checked="checked">
					<label for="male">남자</label>
					<input type="radio" name="gender" id="female" class="radio" value="여자">
					<label for="female">여자</label>
					</td>
				</tr>
				<!-- 이메일 -->
				<tr class="app_list">
				<td class="clear">
					<label for="email" class="tit_lbl ">이메일</label></td>
					<td><input type="text" id="email" name="email" placeholder="이메일을 입력해주세요">
					</td>
				</tr>
					
				<!-- 전화번호 -->
				<tr class="app_list">
					<td class="clear">
					<label for="phon" class="tit_lbl ">번호</label></td>
					<td><input type="text" id="phone" name="phone" placeholder="번호를 입력해주세요">
					</td>
				</tr>
				<!-- 개인정보동의 -->
				<tr>
					<td class="tit_lbl">개인정보 동의</td>
					<td class="app_content checkbox_area">
						<input type="checkbox" name="agree" id="agree_lbl">
						<label for="agree_lbl">동의함</label>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center">
					<input type="button" value="회원가입" onclick="sendit()">
					<input type="reset" value="다시쓰기"></td>
				</tr>
			</table>
			</form>
			</div>
		</div>	
	</div>
	

</body>
</html>