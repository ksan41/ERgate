<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

html, body {
	margin: 0;
	height: 100%;
	overflow: auto;
	font-family: 'Nanum Gothic', serif;
	overflow-x: hidden;
}

.menubar {
	position: fixed;
	width: 320px;
	height: 100%;
	float: left;
	background-color: white;
}

.menubar div {
	border: 1px solid rgb(250, 250, 250, 0);
	box-sizing: border-box;
}

.menuIcons {
	fill: rgb(190, 190, 190);
}

#logoArea {
	height: 7%;
}

#logoArea:hover {
	cursor: pointer;
	opacity: 70%;
}

#logoArea>img {
	width: auto;
	height: 75%;
	margin: 20px;
}

#infoArea {
	height: 40%;
}

#profile_area {
	height: 60%;
	width: 100%;
}

#info_userInfoArea {
	height: 25%;
	width: 100%;
	text-align: center;
}

#info_btnArea {
	height: 15%;
	width: 100%;
}

#navigatorArea {
	height: 63%;
}

#profileImg {
	border: 1px solid lightgray;
	margin: auto;
	border-radius: 50%;
	margin-top: 80px;
	width: 120px;
	height: 120px;
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: lightgray;
}

#profileImg>img {
	max-width: 100%;
	height: auto;
}

#info_userName {
	font-size: 25px;
	width: 200px;
	margin: 0 auto;
}

#info_setting {
	fill: rgb(190, 190, 190);
	width: 30px;
	display: inline-block;
	vertical-align: bottom;
	height: 100%;
}

#info_userInfoArea>a>svg {
	fill: rgb(143, 221, 206);
	width: 20px;
	display: inline-block;
	vertical-align: bottom;
}

#naviIcons {
	margin: auto;
	margin-top: 50px;
	border-spacing: 15px;
}

#naviIcons th:hover>svg, #naviIcons th:hover>span {
	fill: rgb(143, 221, 206);
	color: rgb(143, 221, 206);
	cursor: pointer;
}

.on {
	fill: rgb(143, 221, 206);
	color: rgb(143, 221, 206);
}

#infoBtns {
	margin-left: 60px;
}

#infoBtns>button {
	margin-right: 5px;
}

.middleBtn {
	width: 90px;
	height: 35px;
	border: 0px;
	border-radius: 5px;
	background: rgb(26, 188, 156);
	color: white;
	font-size: 15px;
}

.middleBtn:hover {
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="menubar">
		<!-- 로고영역 -->
		<div id="logoArea">
			<img src="../../resources/siteImg/logo.png" alt="">
		</div>
		<!-- 로고영역 -->
		<div id="infoArea" onclick="매핑값">
			<!-- 프로필사진 영역 -->
			<div id="profile_area">
				<div id="profileImg">
					<img src="../../resources/siteImg/3531276919_gdNCw120_glffj3_1476631182027.jpg" alt="">
				</div>
			</div>
			<!-- 프로필사진 영역 -->
			<!-- 사용자 정보 영역 -->
			<div id="info_userInfoArea">
				<p id="info_userName">
					홍길동<a href="매핑값"><svg id="info_setting"
							xmlns="http://www.w3.org/2000/svg"
							enable-background="new 0 0 24 24" viewBox="0 0 24 24"
							fill="black" width="48px" height="48px">
							<g>
							<path d="M0,0h24v24H0V0z" fill="none" />
							<path
								d="M19.14,12.94c0.04-0.3,0.06-0.61,0.06-0.94c0-0.32-0.02-0.64-0.07-0.94l2.03-1.58c0.18-0.14,0.23-0.41,0.12-0.61 l-1.92-3.32c-0.12-0.22-0.37-0.29-0.59-0.22l-2.39,0.96c-0.5-0.38-1.03-0.7-1.62-0.94L14.4,2.81c-0.04-0.24-0.24-0.41-0.48-0.41 h-3.84c-0.24,0-0.43,0.17-0.47,0.41L9.25,5.35C8.66,5.59,8.12,5.92,7.63,6.29L5.24,5.33c-0.22-0.08-0.47,0-0.59,0.22L2.74,8.87 C2.62,9.08,2.66,9.34,2.86,9.48l2.03,1.58C4.84,11.36,4.8,11.69,4.8,12s0.02,0.64,0.07,0.94l-2.03,1.58 c-0.18,0.14-0.23,0.41-0.12,0.61l1.92,3.32c0.12,0.22,0.37,0.29,0.59,0.22l2.39-0.96c0.5,0.38,1.03,0.7,1.62,0.94l0.36,2.54 c0.05,0.24,0.24,0.41,0.48,0.41h3.84c0.24,0,0.44-0.17,0.47-0.41l0.36-2.54c0.59-0.24,1.13-0.56,1.62-0.94l2.39,0.96 c0.22,0.08,0.47,0,0.59-0.22l1.92-3.32c0.12-0.22,0.07-0.47-0.12-0.61L19.14,12.94z M12,15.6c-1.98,0-3.6-1.62-3.6-3.6 s1.62-3.6,3.6-3.6s3.6,1.62,3.6,3.6S13.98,15.6,12,15.6z" /></g></svg></a>
				</p>
				<span>개발1팀 / 팀장</span> <br> <a href="매핑값"
					style="text-decoration: none; color: rgb(143, 221, 206); font-weight: bolder;">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
						fill="black" width="24px" height="24px">
						<path d="M0 0h24v24H0z" fill="none" />
						<path
							d="M12 17c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2
                         2zm6-9h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6h1.9c0-1.71 1.39-3.1 3.1-3.1 1.71
                          0 3.1 1.39 3.1 3.1v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 
                          2-2V10c0-1.1-.9-2-2-2zm0 12H6V10h12v10z" /></svg>로그아웃
				</a>
			</div>
			<!-- 사용자 정보 영역 -->
			<!-- 출,퇴근버튼 영역 -->
			<div id="info_btnArea">
				<div id="infoBtns">
					<button class="middleBtn">출근</button>
					<button class="middleBtn">퇴근</button>
				</div>
			</div>
			<!-- 출,퇴근버튼 영역 -->
		</div>
		<!-- 메뉴바 영역 -->
		<div id="navigatorArea">
			<table id="naviIcons">
				<tr>
					<th onclick="매핑값"><svg class="menuIcons"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
							fill="black" width="48px" height="48px">
							<path d="M0 0h24v24H0z" fill="none" />
							<path
								d="M17 10H7v2h10v-2zm2-7h-1V1h-2v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 16H5V8h14v11zm-5-5H7v2h7v-2z" /></svg>
						<br>
					<span>일정</span></th>
					<th onclick="매핑값"><svg class="menuIcons"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
							fill="black" width="48px" height="48px">
							<path d="M0 0h24v24H0z" fill="none" />
							<path
								d="M20 6h-4V4c0-1.11-.89-2-2-2h-4c-1.11 0-2 .89-2 2v2H4c-1.11 0-1.99.89-1.99 2L2 19c0 1.11.89 2 2 2h16c1.11 0 2-.89 2-2V8c0-1.11-.89-2-2-2zm-6 0h-4V4h4v2z" /></svg>
						<br>
					<span>근태</span></th>
					<th onclick="매핑값"><svg class="menuIcons"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
							fill="black" width="48px" height="48px">
							<path d="M0 0h24v24H0z" fill="none" />
							<path
								d="M19 3h-4.18C14.4 1.84 13.3 1 12 1c-1.3 0-2.4.84-2.82 2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-7 0c.55 0 1 .45 1 1s-.45 1-1 1-1-.45-1-1 .45-1 1-1zm2 14H7v-2h7v2zm3-4H7v-2h10v2zm0-4H7V7h10v2z" /></svg>
						<br>
					<span>전자결재</span></th>
				</tr>
				<tr></tr>
				<tr>
					<th onclick="매핑값"><svg class="menuIcons"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
							fill="black" width="48px" height="48px">
							<path
								d="M20 2H4c-1.1 0-1.99.9-1.99 2L2 22l4-4h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zM6 9h12v2H6V9zm8 5H6v-2h8v2zm4-6H6V6h12v2z" />
							<path d="M0 0h24v24H0z" fill="none" /></svg> <br>
					<span>공지</span></th>
					<th onclick="매핑값"><svg class="menuIcons"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
							fill="black" width="48px" height="48px">
							<path d="M0 0h24v24H0z" fill="none" />
							<path
								d="M21 6h-2v9H6v2c0 .55.45 1 1 1h11l4 4V7c0-.55-.45-1-1-1zm-4 6V3c0-.55-.45-1-1-1H3c-.55 0-1 .45-1 1v14l4-4h10c.55 0 1-.45 1-1z" /></svg>
						<br>
					<span>사내게시판</span></th>
					<th onclick="매핑값"><svg class="menuIcons"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
							fill="black" width="48px" height="48px">
							<path
								d="M20 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z" />
							<path d="M0 0h24v24H0z" fill="none" /></svg> <br>
					<span>메일</span></th>
				</tr>
				<tr></tr>
				<tr>
					<th onclick="매핑값"><svg class="menuIcons"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
							fill="black" width="48px" height="48px">
							<path d="M0 0h24v24H0z" fill="none" />
							<path
								d="M16 11c1.66 0 2.99-1.34 2.99-3S17.66 5 16 5c-1.66 0-3 1.34-3 3s1.34 3 3 3zm-8 0c1.66 0 2.99-1.34 2.99-3S9.66 5 8 5C6.34 5 5 6.34 5 8s1.34 3 3 3zm0 2c-2.33 0-7 1.17-7 3.5V19h14v-2.5c0-2.33-4.67-3.5-7-3.5zm8 0c-.29 0-.62.02-.97.05 1.16.84 1.97 1.97 1.97 3.45V19h6v-2.5c0-2.33-4.67-3.5-7-3.5z" /></svg>
						<br>
					<span>회의실</span></th>
					<th onclick="매핑값" h><svg class="menuIcons"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
							fill="black" width="48px" height="48px">
							<path
								d="M18.92 5.01C18.72 4.42 18.16 4 17.5 4h-11c-.66 0-1.21.42-1.42 1.01L3 11v8c0 .55.45 1 1 1h1c.55 0 1-.45 1-1v-1h12v1c0 .55.45 1 1 1h1c.55 0 1-.45 1-1v-8l-2.08-5.99zM6.5 15c-.83 0-1.5-.67-1.5-1.5S5.67 12 6.5 12s1.5.67 1.5 1.5S7.33 15 6.5 15zm11 0c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5 1.5.67 1.5 1.5-.67 1.5-1.5 1.5zM5 10l1.5-4.5h11L19 10H5z" />
							<path d="M0 0h24v24H0z" fill="none" /></svg> <br>
					<span>업무차량</span></th>
					<th onclick="매핑값"><svg class="menuIcons"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
							fill="black" width="48px" height="48px">
							<path d="M0 0h24v24H0z" fill="none" />
							<path d="M22 11V3h-7v3H9V3H2v8h7V8h2v10h4v3h7v-8h-7v3h-2V8h2v3z" /></svg>
						<br>
					<span>조직도</span></th>
				</tr>
			</table>
		</div>
		<!-- 메뉴바 영역 -->
	</div>

	<!-- 메뉴아이콘 효과용 스크립트 -->
	<script>
        $(function(){
            $('.menuIcons').click(function(){
                var index=$('.menuIcons').index(this);
                $("#naviIcons span").removeClass('on');
                $('.menuIcons').removeClass('on');
                $(this).addClass('on');
                $("#naviIcons span:eq("+index+")").addClass('on');
            });
        });
    </script>
	<!-- 메뉴아이콘 효과용 스크립트 -->

</body>
</html>