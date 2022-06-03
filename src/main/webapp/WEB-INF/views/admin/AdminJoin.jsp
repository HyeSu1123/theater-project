<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/validation.js">
</script>
</head>
<body>
<script type="text/javascript">
	if(${message != null}) alert('${message}');
</script>
<!-- wrap시작 -->
<%@ include file="../includes/banner.jsp" %>
<!-- Main -->
<section id="main" class="wrapper">
	<header>
		<h2>FREDDO</h2>
		<p class="location">
			ADMIN <span class="path">/</span> 관리자 회원가입
		</p>
	</header>
	<div class="inner">
		<section>
			<h3>Admin</h3>
			<h4>AdminJoin</h4>
			
			<div class="table-wrapper">
			<form name="appForm" method="post" action="./adminjoin.do">
			<table>
			<tbody>
				<!-- 아이디 -->
				<tr class="app_list">
					<td class="clear"><label for="id" class="tit_lbl">ID</label></td>
					<td><input type="text" id="id" name="id" placeholder="ID를 입력해주세요"></td> 
					<td>
					<button class="idchk" type="button" id="idchk" onclick="checkid()">중복확인</button>
					</td>
				</tr>
				<!-- 비밀번호 -->
				<tr class="app_list">
					<td class="clear">
					<label for="password" class="tit_lbl">PassWord</label></td>
					<td><input type="password" id="password" name="password" placeholder="password를 입력해주세요"></td>
				</tr>
				<!-- 비밀번호 확인 -->
				<tr class="app_list">
					<td class="clear">
					<label for="password2" class="tit_lbl">PassWord Check</label></td>
					<td><input type="password" id="password2" name="password2" placeholder="password를 확인해주세요"></td>
				</tr>
				<!-- 이름 -->
				<tr class="app_list">
					<td class="clear">
					<label for="name" class="tit_lbl">Name</label></td>
					<td><input type="text" id="name" name="name" placeholder="이름을 입력해주세요"></td>
				</tr>
				<!-- 생일 -->
				<tr class="app_list">
					<td class="clear">
					<label for="birth_date" class="tit_lbl">Birth Date</label></td>
					<td><input type="text" id="birth_date" name="birth_date" placeholder="생일을 입력해주세요"></td>
				</tr>
				<!-- 성별 -->
				<tr class="app_list">
					<td class="tit_lbl">Gender</td>
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
					<label for="email" class="tit_lbl ">Email</label></td>
					<td><input type="text" id="email" name="email" placeholder="이메일을 입력해주세요"></td>
				</tr>
					
				<!-- 전화번호 -->
				<tr class="app_list">
					<td class="clear">
					<label for="phone" class="tit_lbl ">Phone</label></td>
					<td><input type="text" id="phone" name="phone" placeholder="번호를 입력해주세요"></td>
				</tr>
				<!-- 개인정보동의 -->
				<tr>
					<td class="tit_lbl">개인정보 동의</td>
					<td class="app_content checkbox_area">
						<input type="checkbox" name="agree" id="agree_lbl">
						<label for="agree_lbl">동의함</label>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3" style="text-align: center">
					<input type="button" value="Send" onclick="sendit()" class="primary">
					<input type="reset" value="Reset"></td>
				</tr>
			</tfoot>
		</table>
		</form>
		</div>
	</section>
</div>
</section>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>