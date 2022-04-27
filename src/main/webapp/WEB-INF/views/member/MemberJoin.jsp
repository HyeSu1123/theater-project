<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
</head>
<body>
	<!-- wrap시작 -->
	<div id="wrap">
		<!-- 헤더 시작 -->
		<header>
			<div class="header_area box_inner clear">
				<h1><a href="home.jsp">Freddo</a></h1>
				<p class="opengnb">
					<a href="#">
					<b class="hdd">메뉴</b>
					<span></span><span></span>
					</a>
				</p>
				<div class="header_cont">
					<ul class="util clear">
						<li><a href="#">로그인</a></li>
						<li><a href="#">회원가입</a></li>
					</ul>
					<nav>
						<ul class="gnb clear">
							<li>
								<a href="" class="openAll1">공연 전시</a>
								<div class="gnb_depth">
									<ul class="submenu_list">
										<li><a href="">공연 전시</a></li>
									</ul>
								</div>
							</li>
							<li>
								<a href="" class="openAll2">커뮤니티</a>
								<div class="gnb_depth">
									<ul class="submenu_list">
										<li><a href="">공지사항</a></li>
										<li><a href="">관람 후기</a></li>
									</ul>
								</div>
							</li>
							<li>
								<a href="" class="openAll3">고객센터</a>
								<div class="gnb_depth">
									<ul class="submenu_list">
										<li><a href="">1:1문의하기</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</nav>
					<p class="closePop"><a href="">닫기</a></p>
				</div>
			</div>
		</header>
		<!-- 헤더 끝 -->
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
			<form class="appForm" method="post" action="./join.do">
			<table>
				<legend>회원가입 입력 양식</legend>
				<p class="info_pilsoo pilsoo_item">필수입력</p>
				<!-- 아이디 -->
				<tr class="app_list">
					<td class="clear">
					<label for="id" class="tit_lbl pilsoo_item">ID</label></td>
					<td><input type="text" id="id" placeholder="ID를 입력해주세요"></td>
				</tr>
				<!-- 비밀번호 -->
				<tr class="app_list">
					<td class="clear">
					<label for="password" class="tit_lbl pilsoo_item">PassWord</label></td>
					<td><input type="password" id="password" placeholder="password를 입력해주세요"></td>
				</tr>
				<!-- 비밀번호 확인 -->
				<tr class="app_list">
					<td class="clear">
					<label for="password2" class="tit_lbl pilsoo_item">PassWord 확인</label></td>
					<td><input type="password" id="password2" placeholder="password를 다시 입력해주세요"></td>
				</tr>
				<!-- 이름 -->
				<tr class="app_list">
					<td class="clear">
					<label for="name" class="tit_lbl pilsoo_item">이름</label></td>
					<td><input type="text" id="name" placeholder="이름을 입력해주세요"></td>
				</tr>
				<!-- 생일 -->
				<tr class="app_list">
					<td class="clear">
					<label for="birth" class="tit_lbl pilsoo_item">생일</label></td>
					<td><input type="text" id="birth" placeholder="생일을 입력해주세요"></td>
				</tr>
				<!-- 성별 -->
				<tr class="app_list">
					<td class="tit_lbl"> 성별</td>
					<td class="app_content radio_atea">
					<input type="radio" name="gender" id="male" value="남">
					<label for="male">남자</label>
					<input type="radio" name="gender" id="female" value="남">
					<label for="female">여자</label>
					</td>
				</tr>
				<!-- 이메일 -->
				<tr class="app_list">
				<td class="clear">
					<label for="email" class="tit_lbl pilsoo_item">이메일</label></td>
					<td><input type="text" id="email" placeholder="이메일을 입력해주세요"></td>
				</tr>
					
				<!-- 전화번호 -->
				<tr class="app_list">
					<td class="clear">
					<label for="phon" class="tit_lbl pilsoo_item">번호</label></td>
					<td><input type="tel" id="phone" placeholder="번호를 입력해주세요"></td>
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
					<input type="submit" value="가입하기">
					<input type="reset" value="다시쓰기"></td>
				</tr>
			</table>
			</form>
			</div>
		</div>
		
		
		
	</div>
</body>
</html>