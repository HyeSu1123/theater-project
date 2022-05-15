<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/freeboard.css">
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
				NOTICE <span class="path">/</span> 공지사항
				</p>
		</header>
		<div class="inner">
	<h3>공지사항 등록</h3>
	<hr>
	<div style="margin:auto;">
		<form action="noticeinsert.do" method="post">
			<table class="notice" id="title">
				<tr>
					<th class="notice" width="20%">제목</th>
					<td width="80%">
						<textarea style="width:100%;resize: none;" 
						rows="1" name="notice_title" required="required"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div>
							<textarea  rows="20" cols="80" name="notice_content" 
			                style="border:1px solid gray;width:100%;resize: none;" placeholder="내용을 입력하세요." required="required"></textarea>
						</div>
					</td>
				</tr>
			</table>
			<div style="text-align:center;">
				<button>등록</button>
				<button type="button" onclick="location.href='noticelist.do'">취소</button>
			</div>
		</form>
	</div>
	</div>
</section>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>