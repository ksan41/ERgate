<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signDetailExpense</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

html, body {
	margin: 0;
	height: 100%;
	overflow-x: hidden;
	overflow-y: auto;
	font-family: "Nanum Gothic", serif;
	overflow-x: hidden;
}

/* 현재팝업창 사이즈조절 */
.popup-outer {
	width: 1250px;
	height: 800px;
	margin: 0;
	box-sizing: border-box;
}

.popup-title {
	margin: 0;
	width: 100%;
	height: 50px;
	background-color: rgba(22, 160, 133, 0.68);
	font-size: 25px;
	padding: 10px;
	color: white;
	box-sizing: border-box;
}

.popup-content {
	padding: 20px;
}

/* 중간버튼 스타일 */
.middleBtn {
	width: 90px;
	height: 35px;
	border: 0px;
	border-radius: 5px;
	background: rgb(26, 188, 156); /* 회색 : rgb(190, 190, 190) */
	color: white;
	font-size: 15px;
}

.middleBtn:hover {
	cursor: pointer;
}
/* 중간버튼 스타일 */
/* 큰버튼 스타일 */
.bigBtn {
	width: 140px;
	height: 40px;
	border: 0px;
	border-radius: 5px;
	background: rgb(26, 188, 156); /* 회색 : rgb(190, 190, 190) */
	color: white;
	font-size: 18px;
	margin-right: 5px;
}

.bigBtn:hover {
	cursor: pointer;
}
/* 큰버튼 스타일 */
#btnArea {
	margin-left: 910px;
}

/* 테이블스타일 */
#signInfo1 {
	width: 1200px;
	height: 100px;
	border-width: 1px 0;
	border-collapse: collapse;
	text-align: center;
	font-size: 16px;
}

#signInfo1 th {
	background-color: #EAEAEA;
	border: 1px solid lightgray;
	height: 35px;
}

#signInfo1 td {
	border: 1px solid lightgray;
	height: 35px;
}

#signInfo2 {
	width: 1200px;
	height: 175px;
	border-width: 1px 0;
	border-collapse: collapse;
	text-align: center;
	font-size: 16px;
	border-width: 1px 0;
}

#signInfo2 th {
	background-color: #EAEAEA;
	border: 1px solid lightgray;
	height: 35px;
}

#signInfo2 td {
	border: 1px solid lightgray;
	position: relative;
}

.circle {
	color: rgb(231, 76, 60);
	font-size: 80px;
	display: inline-block;
	position: relative;
	bottom: 120px;
	opacity: 70%;
}

h2, h3 {
	margin: 0;
	padding: 0;
}

#checkArea {
	width: 1200px;
	border-width: 1px 0;
	border-collapse: collapse;
	text-align: center;
	font-size: 16px;
}

/* input창 스타일(가로크기는 자유) */
.inputs {
	height: 30px;
	border: 1px solid lightgray;
	border-radius: 3px;
}
/* input창 스타일 */

/* textarea스타일 */
.textArea {
	border: 1px solid lightgray;
	border-radius: 3px;
	resize: none;
}

#signInfo3 {
	width: 700px;
	height: 100px;
	border-width: 1px 0;
	border-collapse: collapse;
	text-align: center;
	font-size: 18px;
	border-collapse: separate;
	border-spacing: 0 10px;
}

/* textarea스타일 */
#contentTable {
	width: 1200px;
	border-width: 1px 0;
	border-collapse: collapse;
	text-align: center;
	font-size: 16px;
	margin-bottom: 100px;
}

#contentTable th {
	background-color: #EAEAEA;
	border: 1px solid lightgray;
	height: 35px;
}

#contentTable td {
	border: 1px solid lightgray;
	position: relative;
}

#contentTable input {
	width: 96%;
	height: 35px;
	border: 1px solid white;
}

#fileArea{
	width:1000px;
	height:200px;
	padding:5px;
	border:1px solid lightgray;
	text-align:left;
}
</style>
</head>
<body>


	<div class="popup-outer">
		<div class="popup-title">기안상세</div>
		<div class="popup-content">
			<h1>지출결의서</h1>
			<div id="btnArea">
				<button class="bigBtn" id="signSubmit" style="margin-left:150px;">결재</button>
			</div>
			<br>
			<form id="signForm" action="#" method="get">
				<table id="signInfo1">
					<tr>
						<th>기안부서</th>
						<td width="400">인사부</td>
						<th>문서분류</th>
						<td width="400">지출결의서</td>
					</tr>
					<tr>
						<th>기안자</th>
						<td>김기철</td>
						<th>문서번호</th>
						<td>00000</td>
					</tr>
					<tr>
						<th>기안일시</th>
						<td>2020/05/10</td>
						<th>지출기간</th>
						<td><input class="inputs" name="" type="date" value="2020-05-01"> ~ <input
							name="" class="inputs" type="date" value="2020-05-15"></td>
					</tr>
				</table>
				<br>
				<table id="signInfo2">
					<tr>
						<th rowspan="2" width="120">결재라인
						</th>
						<th>팀장</th>
						<th>팀장</th>
						<th>팀장</th>
						<th>팀장</th>
						<th>팀장</th>
						<th>팀장</th>
					</tr>
					<tr>
						<td width="150"><h2>1</h2>
							<h3>전지현</h3></td>
						<td width="150"><h2>2</h2>
							<h3>전지현</h3></td>
						<td width="150"><h2>3</h2>
							<h3>전지현</h3></td>
						<td width="150"><h2>4</h2>
							<h3>전지현</h3></td>
						<td width="150"><h2>5</h2>
							<h3>전지현</h3></td>
						<td width="150"><h2>6</h2>
							<h3>전지현</h3></td>
					</tr>
					<tr>
						<th>수신참조</th>
						<td colspan="6" align="left"><span>@앨리스 </span> <span>@레베카
						</span> <span>@마리아 </span> <span>@존 </span> <span>@올리버 </span> <span>@샬롯
						</span></td>
					</tr>
				</table>

				<!-- 결재완료시 체크될 부분 -->
				<table id="checkArea">
					<tr>
						<th width="120"></th>
						<td width="150"><span class="material-icons circle">
								panorama_fish_eye </span></td>
						<td width="150"><span class="material-icons circle">
								panorama_fish_eye </span></td>
						<td width="150"><span class="material-icons circle">
								panorama_fish_eye </span></td>
						<td width="150"><span class="material-icons circle">
								panorama_fish_eye </span></td>
						<td width="150"><span class="material-icons circle">
								panorama_fish_eye </span></td>
						<td width="150"><span class="material-icons circle">
								panorama_fish_eye </span></td>
					</tr>
				</table>
				<table id="signInfo3">
					<thead>
						<tr>
							<th width="120">제목</th>
							<td><input class="inputs" type="text" style="width: 100%;" value="인사부 05/01~05/15 지출결의서"></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td colspan="6"></td>
						</tr>
						<tr>
							<td colspan="2" rowspan="2">
								<div id="fileArea">
									<a href="#">첨부파일1.jpg</a><br>
									<a href="#">첨부파일2.pdf</a><br>
								</div>
							</td>
						</tr>
						<tr></tr>
						<tr>

						</tr>
						<tr>
							<td colspan="8"></td>
						</tr>
					</thead>
				</table>

				<!-- 테이블값 가져올 el -->
				<c:set var="contentVal" scope="page" />
				<input type="hidden" name="contentTable">
				<table id="contentTable">
					<thead>
						<tr>
							<th width="150">사용일시</th>
							<th width="280">사용처</th>
							<th>지출사유</th>
							<th width="150">사용금액(원)</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input class="inputVal" type="text" value="2020/05/01"></td>
							<td><input class="inputVal" type="text" value="내동생고기"></td>
							<td><input class="inputVal" type="text" value="인사부 5월 회식"></td>
							<td><input class="inputVal" type="text" value="650000"></td>
						</tr>
						<tr>
							<td><input class="inputVal" type="text" value="2020/05/04"></td>
							<td><input class="inputVal" type="text" value="드럼오피스"></td>
							<td><input class="inputVal" type="text" value="복사용지 구매"></td>
							<td><input class="inputVal" type="text" value="25000"></td>
						</tr>
						<tr>
							<td><input class="inputVal" type="text" value="2020/05/10"></td>
							<td><input class="inputVal" type="text" value="사부웨이"></td>
							<td><input class="inputVal" type="text" value="인사부 야근식비"></td>
							<td><input class="inputVal" type="text" value="60000"></td>
						</tr>
						<tr>
							<td><input class="inputVal" type="text" value="2020/05/15"></td>
							<td><input class="inputVal" type="text" value="사부웨이"></td>
							<td><input class="inputVal" type="text" value="인사부 야근식비"></td>
							<td><input class="inputVal" type="text" value="35000"></td>
						</tr>
					</tbody>
				</table>

			</form>
		</div>
	</div>




	<!-- 팝업창 자동 사이즈맞춤용 스크립트 -->
	<script>
	//모든 input요소 readonly처리
	$('input').prop('readonly', true);

		$(document)
				.ready(
						function() {
							// 팝업 창 크기를 HTML 크기에 맞추어 자동으로 크기를 조정하는 함수.
							var strWidth;
							var strHeight;

							//innerWidth / innerHeight / outerWidth / outerHeight 지원 브라우저
							if (window.innerWidth && window.innerHeight
									&& window.outerWidth && window.outerHeight) {
								strWidth = $(".popup-outer").outerWidth()
										+ (window.outerWidth - window.innerWidth);
								strHeight = $(".popup-outer").outerHeight()
										+ (window.outerHeight - window.innerHeight);
							} else {
								var strDocumentWidth = $(document).outerWidth();
								var strDocumentHeight = $(document)
										.outerHeight();

								window.resizeTo(strDocumentWidth,
										strDocumentHeight);

								var strMenuWidth = strDocumentWidth
										- $(window).width();
								var strMenuHeight = strDocumentHeight
										- $(window).height();

								strWidth = $(".popup-outer").outerWidth()
										+ strMenuWidth;
								strHeight = $(".popup-outer").outerHeight()
										+ strMenuHeight;
							}

							//resize
							window.resizeTo(strWidth, strHeight);
						});
	</script>

</body>
</html>