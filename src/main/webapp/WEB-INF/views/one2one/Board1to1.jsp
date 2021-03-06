<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>문의내역</title>
</head>
<body>
<%@ include file="../includes/banner.jsp" %>
		<!-- 컨테이너시작 -->
	<section id="main" class="wrapper">
		<header>
			<h2>FREDDO</h2>
				<p class="location">
				SERVICE CENTER <span class="path">/</span> 문의내역
				</p>
		</header>
		<div class="inner">
	<!-- 상담 및 공지사항 시작 -->
            <div class="appbbs_area">
                <div class="appbbs_box box_inner clear">
                    <table>
					 	<tr><th width="10%">문의번호</th>
					 		<th width="40%">제목</th>
					 		<th width="15%">아이디</th>
					 		<th width="15%">작성일</th>
					 		<th width="20%">답변상태</th></tr>
					 	<c:forEach var="vo" items="${list}"> 
						<tr>
							<td >${vo.question_idx }</td> 	
					 		<td ><a href="detail.do?question_idx=${vo.question_idx }">${vo.question_title }</a></td>
					 		<td>${vo.id }</td>
					 		<td>
					 		<fmt:formatDate value="${vo.question_date }" pattern="yyyy-MM-dd"/>  
					 		</td >
					 		<c:if test="${vo.status=='답변 대기'}">
			 					<td><span style="color:red;font-weight:bolder;">답변 대기</span></td>
			 				</c:if>
			 				<c:if test="${vo.status=='답변 완료'}">
			 					<td><span style="color:#3d3;font-weight:bolder;">답변 완료</span></td>
			 				</c:if>
					 		
					 	</tr>
					 	</c:forEach>
					 	<tr><td colspan="4" align="right">
					 		<a class="button" href="javascript:history.back();">이전</a>
					 		</td>
					 	</tr>
					</table>
    			</div>
    		</div>
    <!-- wrap 끝 -->
    </div>
    </section>
    <%@ include file="../includes/footer.jsp" %>
</body>
</html>