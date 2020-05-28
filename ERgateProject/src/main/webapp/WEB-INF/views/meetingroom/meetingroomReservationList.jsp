<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>meetingroomReservationList</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<jsp:include page="../common/menubar.jsp" />
<!-- 모달 사용페이지에 복사해주세요 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<!-- 모달 사용페이지에 복사해주세요 -->

<style>
.outer {
	padding-left: 320px;
	float: left;
	width: 100%;
	min-height: 100%;
	background-color: rgba(224, 224, 224, 0.12);
}

.topBar {
	background-color: rgba(22, 160, 133, 0.39);
	width: 100%;
	height: 50px;
	color: white;
	font-size: 25px;
	box-sizing: border-box;
	padding-top: 10px;
	padding-left: 30px;
	font-weight: 500;
}


.contentArea {
	margin-top: 50px;
	margin-left: 100px;
	width: 1600px;
	height: auto;
	float: left;
}

/* 모달팝업 스타일 */
.modal {
	width: 1000px;
	max-width: 2000px;
	height: 800px; /* 모달 크기지정 */
	padding: 0px;
	border-radius: 0px;
}

.modal-title {
	margin: 0;
	width: 100%;
	height: 50px;
	background-color: rgba(22, 160, 133, 0.68);
	font-size: 25px;
	padding: 10px;
	color: white;
	box-sizing: border-box;
}

.modal-content {
	padding: 20px;
}

/* 모달팝업 스타일 */

.subMenuArea {
	background-color: white;
	width: 100%;
	height: 70px;
}

#subMenuList {
	margin: 0;
	list-style: none;
	padding-left: 0;
}

#subMenuList li {
	margin-top: 10px;
	margin-left: 20px;
	float: left;
	text-decoration-style: none;
}

.subBtn {
	border: 0;
	width: 160px;
	height: 50px;
	font-size: 19px;
	color: rgb(127, 127, 127);
	background-color: white;
	border-radius: 25px;
}

.subBtn:hover {
	cursor: pointer;
}
/* 서브메뉴바 메뉴버튼(기본) */
/* 서브메뉴바 메뉴버튼(현재페이지일때) */
.subActive {
	border: 4px solid rgb(26, 188, 156);
}

/* 체크박스 스타일 */
.checkBox {
	zoom: 1.7;
}

/* 스케줄관련 아이콘스타일 */
.schedule_icons {
	fill: rgb(190, 190, 190); /* 검은색 : rgb(94, 94, 94)*/
	width: 35px;
	vertical-align: bottom;
}
/* 스케줄관련 아이콘스타일 */

.material-icons{
	font-size:40px;
	vertical-align:middle;
}
.material-icons:hover{
	cursor:pointer;
}


/* 게시판 스타일 */
.boardTable {
	width: 1400px;
	height: 400px;
	margin-top: 10px;
}

.boardTable, .boardTable th, .boardTable td {
	border-width: 1px 0;
	border-collapse: collapse;
	text-align: center;
	font-size: 16px;
}

.boardTable th {
	background-color: #999;
	color: #fff;
	height: 35px;
}

.boardTable td {
	border-color: lightgray;
	border-style: solid;
	height: 35px;
}

.boardTable tr:hover td {
	background-color: rgb(224, 224, 224);
	cursor: pointer;
}

/* 게시판 스타일 */

/* 페이징바 스타일 */
.pagingBar {
	list-style: none;
	margin-left: 400px;
	margin-top:50px;
}

.pagingBar li {
	float: left;
}

.pagingBar li * {
	float: left;
	padding: 4px;
	margin-right: 3px;
	width: 20px;
	color: rgb(190, 190, 190);
	font: bold 12px tahoma;
	border: 1px solid rgb(190, 190, 190);
	text-align: center;
	text-decoration: none;
	font-size: 15px;
}

.pagingBar li>span {
	color: rgb(26, 188, 156);
	border: 1px solid rgb(26, 188, 156);
}

.pagingBar li a:hover {
	color: rgb(26, 188, 156);
	border: 1px solid rgb(26, 188, 156);
}

/* 페이징바 스타일 */


</style>
</head>
<body>
	<div class="outer">
		<div class="topBar">
			<!-- 메뉴명 -->
			<span>회의실</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
				<li><button class="subBtn">회의실 예약</button></li>
				<li><button class="subBtn subActive" onclick="">회의실 예약현황</button></li>
				<li><button class="subBtn" onclick="open_modal();">회의실 관리</button></li>
			</ul>
		</div>

		<div class="contentArea">
			<!-- 달력 설정 부분 -->
			
				<h2 style="display: inline-block; margin-left: 500px;">
					<span class="material-icons"> arrow_left </span> 2020년 5월
					<svg class="schedule_icons" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="black" width="48px" height="48px">
					<path d="M20 3h-1V1h-2v2H7V1H5v2H4c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 18H4V8h16v13z" />
					<path d="M0 0h24v24H0z" fill="none" /></svg>
					<span class="material-icons"> arrow_right </span>
				</h2>
				<br> <br>
			

			<!-- 게시판 -->
			<table class="boardTable">
				<thead>
					<tr>
						<th>부서명</th>
						<th>예약자</th>
						<th>회의실</th>
						<th style="width:400px">사용목적</th>
						<th style="width:350px">사용기간</th>
					</tr>
				</thead>
				<tr>
					<td>인사팀</td>
					<td>앨리스</td>
					<td>5층 회의실1</td>
					<td>팀미팅</td>
					<td>2020-05-10 10:00 ~ 2020-05-10 10:00</td>
				</tr>
				<tr>
					<td>인사팀</td>
					<td>앨리스</td>
					<td>5층 회의실1</td>
					<td>팀미팅</td>
					<td>2020-05-10 10:00 ~ 2020-05-10 10:00</td>
				</tr>
				<tr>
					<td>인사팀</td>
					<td>앨리스</td>
					<td>5층 회의실1</td>
					<td>팀미팅</td>
					<td>2020-05-10 10:00 ~ 2020-05-10 10:00</td>
				</tr>
				<tr>
					<td>인사팀</td>
					<td>앨리스</td>
					<td>5층 회의실1</td>
					<td>팀미팅</td>
					<td>2020-05-10 10:00 ~ 2020-05-10 10:00</td>
				</tr>
				<tr>
					<td>인사팀</td>
					<td>앨리스</td>
					<td>5층 회의실1</td>
					<td>팀미팅</td>
					<td>2020-05-10 10:00 ~ 2020-05-10 10:00</td>
				</tr>
				<tr>
					<td>인사팀</td>
					<td>앨리스</td>
					<td>5층 회의실1</td>
					<td>팀미팅</td>
					<td>2020-05-10 10:00 ~ 2020-05-10 10:00</td>
				</tr>
				<tr>
					<td>인사팀</td>
					<td>앨리스</td>
					<td>5층 회의실1</td>
					<td>팀미팅</td>
					<td>2020-05-10 10:00 ~ 2020-05-10 10:00</td>
				</tr>

			</table>

			<!-- 페이징바 -->
			<ul class="pagingBar">
				<li><a href="#">&lt;&lt;</a></li>
				<li><a href="#">&lt;</a></li>
				<li><span>1</span></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">6</a></li>
				<li><a href="#">7</a></li>
				<li><a href="#">8</a></li>
				<li><a href="#">9</a></li>
				<li><a href="#">10</a></li>
				<li><a href="#">&gt;</a></li>
				<li><a href="#">&gt;&gt;</a></li>
			</ul>
			<!-- 페이징바 -->

		</div>


		<!-- 모달팝업 (head부분에 링크들도 복사해주셔야합니다)
			 모달 사용시엔 메뉴바를 head맨 윗부분에 include해주셔야 합니다.
		-->

		<!-- 모달 타겟. href의 #xxx와 모달영역의 id(xxx)가 한셋트입니다.
		     용도에 따라 href와 id는 변경해주세요.(여러개 가능)
		     모달타겟으로 쓸 요소에 class와 href 복사해주세요.
		-->
		<!-- <a class="open-modal" href="#modal-form">모달열기</a> <br> -->


		<div id="meetingroomManage" class="modal">
			<div class="modal-title">모달타이틀</div>
			<div class="modal-content">모달내용작성해주세요</div>
		</div>

		<!-- 모달용 스크립트 -->
		<script>
			$('.open-modal').click(function() {
				$(this).modal({
					fadeDuration : 150
				});

			});
		</script>


	</div>




</body>
</html>