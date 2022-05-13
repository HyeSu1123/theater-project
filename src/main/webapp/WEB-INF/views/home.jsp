<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
 	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">

</head>tpt
<body>
<%@ include file="./includes/top.jsp" %>
<!-- wrap시작 -->
<div id="wrap">
<!-- container -->
<div id="container">
	<!-- 롤링 -->
	<div class="main_rolling_pc">
		<div class="visualRoll">
		<!-- 롤링 이미지 목록 -->
			<ul class="viewImagList">
				<li class="imgList0">
					<div class="roll_content">
						<a href="#"><img src="" alt=""></a>
					</div>
				</li>
				<li class="imgList1">잠
					<div class="roll_content">
						<a href="#"><img src="" alt=""></a>
					</div>
				</li>
				<li class="imgList2">
					<div class="roll_content">
						<a href="#"><img src="" alt=""></a>
					</div>
				</li>
			</ul>
			<!-- 롤링 이미지 목록 끝 -->
			<!-- 롤링 버튼 시작 -->
			<div class="rollbtnArea">
				<ul class="rollingbtn">
					<li class="seq butt0">
						<a href="#"><img></a>
					</li>
					<li class="seq butt1">
						<a href="#"><img></a>
					</li>
					<li class="seq butt2">
						<a href="#"><img></a>
					</li>
				</ul>
			</div>
			<!-- 롤링 버튼 끝 -->
		</div>
	</div>
	<!-- PC롤링 끝 -->
	<!-- 모바일 롤링 시작 -->
	<div class="main_rolling_mobile">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<a href=""><img></a>
				</div>
				<div class="swiper-slide">
					<a href=""><img></a>
				</div>
				<div class="swiper-slide">
					<a href=""><img></a>
				</div>
				<div class="swiper-pagination"></div>
			</div>
		</div>
	</div>
	<!-- 모바일 롤링 끝 -->
	<!-- TOP -->
	<div class="about_area">
		<h2><b>TOP</b></h2>
		<div class="about_box">
			<ul class="place_list box_inner clear">
				<li>
					<a href=""><img>
						<h3>해당 공연 이름</h3>
						<span class="view">VIEW</span>
					</a>
				</li>
				<li>
					<a href=""><img>
						<h3>해당 공연 이름</h3>
						<span class="view">VIEW</span>
					</a>
				</li>
				<li>
					<a href=""><img>
						<h3>해당 공연 이름</h3>
						<span class="view">VIEW</span>
					</a>
				</li>			
			</ul>
		</div>
	</div>
	<!-- TOP끝 -->
	<!-- 상담 및 공지사항 시작 -->
            <div class="appbbs_area">
                <div class="appbbs_box box_inner clear">
                    <p class="app_line">
                        <a href="#">1:1 상담</a>
                    </p>
                    <div class="bbs_line">
                        <h3>NOTICE</h3>
                        <ul class="notice_recent">
                            <li><a href="#">이번 여름 휴가 제주갈까? 미션 투어 (여행경비 50만원 지원)</a></li>
                            <li><a href="#">박물관 미션투어 응모 당첨자 발표</a></li>
                            <li><a href="#">추석 연휴 티켓/투어 배송 및 직접 수령 안내</a></li>
                            <li><a href="#">하롱베이 서비스 OPEN!</a></li>
                            <li><a href="#">"투어 리스트 인 투어" 서비스 점검 안내</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 상담 및 공지사항 끝 -->
        </div>
        <!-- container 끝 -->
        <!-- footer 시작 -->
        <footer>
            <div class="foot_area box_inner">
                <ul class="foot_list clear">
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">개인정보취급방침</a></li>
                </ul>
                <h2>투어리스트인투어</h2>
                <p class="addr">
                    서울특별시 종로구 혜화동 9길 청운빌딩 5층
                    <span class="gubun">/</span>
                    <span class="br_line">
                        대표전화
                        <span class="space0">02-1234-5678</span>
                        <span class="gubun">/</span>
                    </span>
                    <span class="br_line">
                        Email : <span class="space0">titour@touristintour.com</span>
                    </span>
                </p>
                <p class="copy box_inner">
                    Copyright&copy; TouristInTour all right reserved
                </p>
                <ul class="snslink">
                    <li><a href="#">blog</a></li>
                    <li><a href="#">facebook</a></li>
                    <li><a href="#">instagram</a></li>
                </ul>
            </div>
        </footer>
        <!-- footer 끝 -->
    </div>
    <!-- wrap 끝 -->
</body>
</html>