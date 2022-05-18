<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/freeboard.css">

<script src="https://kit.fontawesome.com/7ebf19920b.js" crossorigin="anonymous"></script>
</head>
<body>
<script type="text/javascript">
	if(${message != null}) alert('${message}');
</script>
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
	<h3>공지사항 수정</h3>
	<hr>
	<div style="margin:auto;">
		<form action="noticeupdatesave.do" method="post">
			<table class="notice" id="title">
				<tr>
					<th class="notice" width="20%">제목</th>
					<td colspan="5">
						<textarea style="width:100%;resize: none;" 
						rows="1" name="title" required="required">${detail.notice_title}</textarea>
					</td>
				</tr>
				<tr>
					<th class="notice" width="20%">작성일</th>
					<td colspan="2">${detail.notice_date}</td>
					<th class="notice" width="20%">조회수</th>
					<td colspan="2">${detail.notice_view}</td>
				</tr>
				<tr>
					<td colspan="6">
						<div>
							<textarea  rows="20" name="content" 
			                style="border:1px solid gray;width:100%;resize: none;" required="required">${detail.notice_content}</textarea>
						</div>
					</td>
				</tr>
			</table>
			<input name="idx" type="hidden" value="${detail.notice_idx}">
			<div style="text-align:center;">
				<button>저장</button>
			</div>
		</form>
			<div style="text-align:center;">
				<form action="noticedetail.do">
					<input name="idx" type="hidden" value="${detail.notice_idx}">
					<button>취소</button>
				</form>
			</div>
	</div>
	</div>
</section>
<%@ include file="../includes/footer.jsp" %>
<script type="text/javascript">
/* 	function reset(){
		document.forms[1].submit();
	} */
</script>
</body>
</html>