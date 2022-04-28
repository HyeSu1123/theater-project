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
			return alert("아이디를 입력해주세요");
		}else if(id.value.match(space)){
			id.focus();
			return alert("공백없이 입력해주세요");
		}else if(reg.test(id.value)){
			id.focus();
			return alert("아이디는 영문 소문자 숫자만 입력해주세요");
		}else if(id.value.length <= 5){
			id.focus();
			return alert("최소 5자 이상 입력해주세요");
		}else if(id.value.length > 10){
			id.focus();
			return alert("최대 10자 이내로 입력해주세요");
		}
		
		const pw = frm.password;
		reg = /[^a-zA-Z0-9]/g;
		const upper = /[A-Z]/g, lower = /[a-z]/g, digit = /[0-9]/g;
		if(pw.value == ""){
			pw.focus();
			return alert("비밀번호를 입력해주세요");
		}else if(pw.value.match(space)){
			pw.focus();
			return alert("공백없이 입력해주세요");
		}else if(reg.test(pw.value)){
			pw.focus();
			return alert("비밀번호는 영문 대/소문자, 숫자만 입력해주세요");
		}else if(pw.value.length <= 5){
			pw.focus();
			return alert("비밀번호는 최소 5자 이상 입력해주세요");
		}else if(pw.value.length > 10){
			pw.focus();
			return alert("비밀번호는 최대 10자 이내 입력해주세요");
		}else if(!upper.test(pw.value) || !lower.test(pw.value) || !digit.test(pw.value)){
			pw.focus();
			return alert("비밀번호는 영문 대/소문자, 숫자를 모두 포함해야합니다.");
		}
			
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
			<form name="appForm" method="post" action="./join.do" onsubmit="sendit()">
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
					<input type="radio" name="gender" id="male" class="radio" value="남" checked="checked">
					<label for="male">남자</label>
					<input type="radio" name="gender" id="female" class="radio" value="여">
					<label for="female">여자</label>
					</td>
				</tr>
				<!-- 이메일 -->
				<tr class="app_list">
				<td class="clear">
					<label for="email" class="tit_lbl ">이메일</label></td>
					<td><input type="email" id="email" name="email" placeholder="이메일을 입력해주세요">
					</td>
				</tr>
					
				<!-- 전화번호 -->
				<tr class="app_list">
					<td class="clear">
					<label for="phon" class="tit_lbl ">번호</label></td>
					<td><input type="tel" id="phone" name="phone" placeholder="번호를 입력해주세요">
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
					<input type="submit" value="회원가입">
					<input type="reset" value="다시쓰기"></td>
				</tr>
			</table>
			</form>
			</div>
		</div>	
	</div>
	

</body>
</html>