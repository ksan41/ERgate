<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign HRlist</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style>
/* ==========페이지영역========== */
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

/* 서브메뉴바 영역 */
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
/* 서브메뉴바 영역 */

/* 서브메뉴바 메뉴버튼(기본) */
.subBtn {
	border: 0;
	width: 150px;
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
/* 서브메뉴바 메뉴버튼(현재페이지일때) */

/* 콘텐츠영역 */
.contentArea {
	margin-top: 50px;
	margin-left: 100px;
	width: 1600px;
	height: auto;
	float: left;
}
/* 콘텐츠영역 */

/* ==========페이지영역========== */

/* 페이징바 스타일 */
.pagingBar {
	list-style: none;
	margin-left: 400px;
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

/* 게시판 스타일 */
.boardTable {
	width: 1400px;
	height: 400px;
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

/* 큰버튼 스타일 */
.bigBtn {
	width: 140px;
	height: 40px;
	border: 0px;
	border-radius: 5px;
	background: rgb(26, 188, 156); /* 회색 : rgb(190, 190, 190) */
	color: white;
	font-size: 18px;
}

.bigBtn:hover {
	cursor: pointer;
}
/* 큰버튼 스타일 */

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
.material-icons {
	font-size: 40px;
	vertical-align: middle;
}

.material-icons:hover {
	cursor: pointer;
}
</style>
</head>
<body>
	<!-- 이곳에 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp" />
	<!-- 이곳에 메뉴바 include -->

	<div class="outer">
		<div class="topBar">
			<!-- 메뉴명 -->
			<span>전자결재</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
				<li><button class="subBtn">결재대기함</button></li>
				<li><button class="subBtn">진행결재함</button></li>
				<li><button class="subBtn">상신내역</button></li>
				<li><button class="subBtn">지출결의내역</button></li>
				<li><button class="subBtn subActive">외근&휴가내역</button></li>
			</ul>
		</div>
		<div class="contentArea">
			<h2 style="display: inline-block; margin-left: 530px;">
				<span class="material-icons"> arrow_left </span> 2020년 5월
				<svg class="schedule_icons" xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 24 24" fill="black" width="48px" height="48px">
				<path
						d="M20 3h-1V1h-2v2H7V1H5v2H4c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 18H4V8h16v13z" />
				<path d="M0 0h24v24H0z" fill="none" /></svg>
				<span class="material-icons"> arrow_right </span>
			</h2>
			<br> <br>

			<table class="boardTable">
				<thead>
					<tr>
						<th>상태</th>
						<th width="130">문서분류</th>
						<th width="130">문서번호</th>
						<th>기안부서</th>
						<th>기안자</th>
						<th>결재자</th>
						<th width="400">제목</th>
						<th>기안일시</th>
					</tr>
				</thead>
				<tr>
					<td>완료</td>
					<td>휴가계</td>
					<td>25</td>
					<td>경영부</td>
					<td>김길동</td>
					<td>이지영</td>
					<td>김길동 05/20연차</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td>완료</td>
					<td>외근신청서</td>
					<td>25</td>
					<td>총무부</td>
					<td>정유리</td>
					<td>홍길동</td>
					<td>총무1팀 외근신청서</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td>완료</td>
					<td>휴가계</td>
					<td>25</td>
					<td>경영부</td>
					<td>김길동</td>
					<td>이지영</td>
					<td>김길동 05/20연차</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td>완료</td>
					<td>외근신청서</td>
					<td>25</td>
					<td>총무부</td>
					<td>정유리</td>
					<td>홍길동</td>
					<td>총무1팀 외근신청서</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td>완료</td>
					<td>휴가계</td>
					<td>25</td>
					<td>경영부</td>
					<td>김길동</td>
					<td>이지영</td>
					<td>김길동 05/20연차</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td>완료</td>
					<td>외근신청서</td>
					<td>25</td>
					<td>총무부</td>
					<td>정유리</td>
					<td>홍길동</td>
					<td>총무1팀 외근신청서</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td>완료</td>
					<td>휴가계</td>
					<td>25</td>
					<td>경영부</td>
					<td>김길동</td>
					<td>이지영</td>
					<td>김길동 05/20연차</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td>완료</td>
					<td>외근신청서</td>
					<td>25</td>
					<td>총무부</td>
					<td>정유리</td>
					<td>홍길동</td>
					<td>총무1팀 외근신청서</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td>완료</td>
					<td>휴가계</td>
					<td>25</td>
					<td>경영부</td>
					<td>김길동</td>
					<td>이지영</td>
					<td>김길동 05/20연차</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td>완료</td>
					<td>외근신청서</td>
					<td>25</td>
					<td>총무부</td>
					<td>정유리</td>
					<td>홍길동</td>
					<td>총무1팀 외근신청서</td>
					<td>2020/05/10</td>
				</tr>
			</table>
			<br>
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
	</div>
</body>
</html>