<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign waiting list</title>
<jsp:include page="../common/menubar.jsp" />
<!-- <link rel="stylesheet" href="http://www.w3ii.com/lib/w3.css"> -->

<!-- 모달 사용페이지에 복사해주세요 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<!-- 모달 사용페이지에 복사해주세요 -->
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

/* 작은버튼 스타일 */
.smallBtn {
	width: 60px;
	height: 25px;
	border: 0px;
	border-radius: 5px;
	background: rgb(190, 190, 190); /* 회색 : rgb(190, 190, 190) */
	color: white;
	font-size: 12px;
	margin-left:50px;
}

.smallBtn:hover {
	cursor: pointer;
}
/* 작은버튼 스타일 */

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

/* 모달팝업 스타일 */
.modal {
	width: 300px;
	height: 400px; /* 모달 크기지정 */
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

#sign_thumb{
	width:200px;
	height:200px;
	border:1px solid lightgray;
	margin:auto;
}

/* 모달팝업 스타일 */
</style>
</head>
<body>
	<!-- 이곳에 메뉴바 include -->
	
	<!-- 이곳에 메뉴바 include -->

	<div class="outer">
		<div class="topBar">
			<!-- 메뉴명 -->
			<span>전자결재</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
				<li><button class="subBtn subActive">결재대기함</button></li>
				<li><button class="subBtn">진행결재함</button></li>
				<li><button class="subBtn">상신내역</button></li>
				<li><button class="subBtn">지출결의내역</button></li>
				<li><button class="subBtn">외근&휴가내역</button></li>
			</ul>
		</div>
		<div class="contentArea">
			<button class="bigBtn">선택결재</button>
			<button class="bigBtn" style="background: rgb(190, 190, 190);" onclick="open_modal();">서명등록</button>
			<h2 style="display: inline-block; margin-left: 300px;">2020년 5월
				10일</h2>
			<br> <br>

			<table class="boardTable">
				<thead>
					<tr>
						<th width="40"><input class="checkBox" type="checkbox"></th>
						<th>상태</th>
						<th>문서분류</th>
						<th>문서번호</th>
						<th>기안부서</th>
						<th>기안자</th>
						<th>제목</th>
						<th>기안일시</th>
					</tr>
				</thead>
				<tr>
					<td><input class="checkBox" type="checkbox"></td>
					<td>진행중</td>
					<td>지출결의서</td>
					<td>25</td>
					<td>경영부</td>
					<td>김길동</td>
					<td>경영1팀 지출결의서</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td><input class="checkBox" type="checkbox"></td>
					<td>진행중</td>
					<td>지출결의서</td>
					<td>25</td>
					<td>경영부</td>
					<td>김길동</td>
					<td>경영1팀 지출결의서</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td><input class="checkBox" type="checkbox"></td>
					<td>진행중</td>
					<td>지출결의서</td>
					<td>25</td>
					<td>경영부</td>
					<td>김길동</td>
					<td>경영1팀 지출결의서</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td><input class="checkBox" type="checkbox"></td>
					<td>진행중</td>
					<td>지출결의서</td>
					<td>25</td>
					<td>경영부</td>
					<td>김길동</td>
					<td>경영1팀 지출결의서</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td><input class="checkBox" type="checkbox"></td>
					<td>진행중</td>
					<td>지출결의서</td>
					<td>25</td>
					<td>경영부</td>
					<td>김길동</td>
					<td>경영1팀 지출결의서</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td><input class="checkBox" type="checkbox"></td>
					<td>진행중</td>
					<td>지출결의서</td>
					<td>25</td>
					<td>경영부</td>
					<td>김길동</td>
					<td>경영1팀 지출결의서</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td><input class="checkBox" type="checkbox"></td>
					<td>진행중</td>
					<td>지출결의서</td>
					<td>25</td>
					<td>경영부</td>
					<td>김길동</td>
					<td>경영1팀 지출결의서</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td><input class="checkBox" type="checkbox"></td>
					<td>진행중</td>
					<td>지출결의서</td>
					<td>25</td>
					<td>경영부</td>
					<td>김길동</td>
					<td>경영1팀 지출결의서</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td><input class="checkBox" type="checkbox"></td>
					<td>진행중</td>
					<td>지출결의서</td>
					<td>25</td>
					<td>경영부</td>
					<td>김길동</td>
					<td>경영1팀 지출결의서</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td><input class="checkBox" type="checkbox"></td>
					<td>진행중</td>
					<td>지출결의서</td>
					<td>25</td>
					<td>경영부</td>
					<td>김길동</td>
					<td>경영1팀 지출결의서</td>
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


			<!-- 모달팝업 (head부분에 링크들도 복사해주셔야합니다)-->

			<!-- 모달 타겟. href의 #xxx와 모달영역의 id(xxx)가 한셋트입니다.
     용도에 따라 href와 id는 변경해주세요.(여러개 가능)
     모달타겟으로 쓸 요소에 class와 href 복사해주세요.
-->
			<a class="open-modal" href="#modal-form" style="display:none;">모달열기</a> <br>


			<div id="modal-form" class="modal">
				<div class="modal-title">서명등록</div>
				<div class="modal-content">
					<div id="sign_thumb">
					</div>
					<br>
					<button class="smallBtn">첨부파일</button>
					<a href="#">첨부파일.jsp</a>
					<br><br>
					<button class="bigBtn" style="margin-left:60px;">등록</button>
				</div>
			</div>

			<!-- 모달용 스크립트 -->
			<script>
				function open_modal(){
					$(".open-modal").click();
				};
			
				$('.open-modal').click(function() {
					$(this).modal({
						fadeDuration : 150
					});

				});
			</script>


			<!-- 모달팝업 -->
		</div>
	</div>
</body>
</html>