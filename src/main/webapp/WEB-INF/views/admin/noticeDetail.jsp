<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/freeboard.css">

<script type="text/javascript">
function deleteOk(){
	if(confirm('해당 글을 삭제하시겠습니까?')==true){
		document.forms[1].submit();
	}
}
</script>
<script type="text/javascript">
	setTimeout(function(){			//setTimeout 설정(210ms)
		if(${message != null}) alert('${message}');
	},210);
</script>
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
	<h3>공지사항</h3>
	<hr>
	<div style="margin:auto;">
		<table class="notice" id="title">
			<tr>
				<th class="notice" width="20%">제목</th>
				<td colspan="5"><div>${detail.notice_title}</div></td>
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
						<pre>${detail.notice_content}</pre>
					</div>
				</td>
			</tr>
		</table>
		
	</div>
	<!-- 수정, 삭제, 목록 버튼 -->
	<div style="text-align:center; " class="row gtr-uniform">	
	<c:if test="${admin != null }">
			<form action="noticeupdate.do" method="post">
				<input name="idx" type="hidden" value="${detail.notice_idx}">
				<input name="detail" type="hidden" value="${detail}">
				<input name="pageNo" type="hidden" value="${pageNo}">
				<button>수정</button>
			</form>
			
			<form action="noticedelete.do" method="post">
	 			<input name="idx" type="hidden" value="${detail.notice_idx}">
	 			<input name="pageNo" type="hidden" value="${pageNo}">
			 	<button type="button" onclick="deleteOk()">삭제</button>
			 </form>
	</c:if> 
		<form action="" method="post" name="formlist">
			<input name="columns" type="hidden">
			<input name="find" type="hidden">		
			<input name="pageNo" type="hidden" value="${pageNo}">
			<button type="button" onclick="goList()">목록</button>
		</form>
	</div>
	<div style="margin:auto;">
		<table class="notice" id="title">
		<c:choose>
			<c:when test="${detail.last_idx==-1}">
			<tr>
				<th class="notice" width="20%">이전글</th>
				<td width="80%">${detail.last_title}</td>
			</tr>
			</c:when>
			<c:otherwise>
			<tr>
				<th class="notice" width="20%"><label for="last">이전글</label></th>
				<td width="80%"><a href="noticedetail.do?idx=${detail.last_idx}" class="title" id="last">${detail.last_title}</a></td>
			</tr>
			</c:otherwise>
		</c:choose>
			<c:choose>
			<c:when test="${detail.next_idx==99999}">
			<tr>
				<th class="notice" width="20%">다음글</th>
				<td width="80%">${detail.next_title}</td>
			</tr>
			</c:when>
			<c:otherwise>
			<tr>
				<th class="notice" width="20%"><label for="next">다음글</label></th>
				<td width="80%"><a href="noticedetail.do?idx=${detail.next_idx}" class="title" id="next">${detail.next_title}</a></td>
			</tr>
			</c:otherwise>
		</c:choose>
		</table>
	</div>
	</div>
</section>
<%@ include file="../includes/footer.jsp" %>
<script type="text/javascript">
const url = new URL(window.location.href);	
const urlParams = url.searchParams;			//URLSearchParams 객체
//console.log(urlParams.get('find'))		//파라미터 값 가져오기
	function goList(){
		const frm = document.formlist;
		if(urlParams.get('find')==""){
			frm.action="noticelist.do";
		}
		else{
			frm.action="noticesearch.do";
			frm.columns.value=urlParams.get('columns');
			frm.find.value=urlParams.get('find');
		}
		frm.submit();
	}
</script>
</body>
</html>