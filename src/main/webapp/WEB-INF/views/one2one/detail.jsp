<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>문의내용</title>
</head>
<body>
<%@ include file="../includes/banner.jsp" %>
		<!-- 컨테이너시작 -->
	<section id="main" class="wrapper">
		<header>
			<h2>FREDDO</h2>
				<p class="location">
				NOTICE <span class="path">/</span> 문의내용
				</p>
		</header>
		<div class="inner">
	<!-- 상담 및 공지사항 시작 -->
            <div class="appbbs_area">
                <div class="appbbs_box box_inner clear">
                    <p class="app_line">  
                        <table style="width:80%;margin:auto;">
 	<tr><td width="20%" >제목</td>
 		<td width="40%" >${getOne.question_title}</td>
 		<td width="20%" >답변상태</td>
 		<td >${getOne.status }</td>
 	</tr>
 	<tr><td >작성자</td>
 		<td >${getOne.id } 
 		
 		<td >작성날짜</td>
 		<td >
 		
 		<fmt:formatDate value="${getOne.question_date }" pattern="yyyy-MM-dd"/>
 		</td>
 	</tr>
 	<tr><td >내용</td>
 		<td colspan="3"  style="text-align: left ; font-size: 13pt;border: 1px solid #444444; ; ">
 		<div  style="height: 400px;">
 		${getOne.question_content }</div></td>   
 	
 	
 	<!--답변 없으면 답변x라는 문구 ,답변있으면 답변 text보여줌 -->
 	<c:choose>
 	<c:when test="${answer.answer_content==null  }">
 		<tr>
 		<td style="text-align: center">아직 답변이 작성되지 않았습니다</td></tr>
 	</c:when>
 	<c:otherwise>
 	<tr><td >답변 작성자</td>
 		<td >${answer.answer_writer }</td> 
 		
 		<td >작성날짜</td>
 		<td >
 		<fmt:formatDate value="${answer.answer_date }" pattern="yyyy-MM-dd"/>
 		</td>
 		</tr>
 		
 	<tr><td >답변내용</td>
 		<td colspan="3"  style="text-align: left ; font-size: 13pt;border: 1px solid #444444; ; ">
 		<div  style="height: 400px; ">
 		${answer.answer_content}
 		</div></td> 
 		</c:otherwise>
 		
 		
 		</c:choose> 
 		
 			
 	
 	<tr><td colspan="4" align="right">
 		<a class="button" href="javascript:history.back();">이전</a>
 		
 		</td>
 	</tr>
</table>
            <!-- 상담 및 공지사항 끝 -->
        <!-- container 끝 -->
        </div>
        </div>
        </div>
        </section>
    <!-- wrap 끝 -->
</body>
</html>