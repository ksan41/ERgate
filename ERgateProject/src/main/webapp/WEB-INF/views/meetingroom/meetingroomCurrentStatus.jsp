<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>meetingroomCurrentStatus</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- menubar include  -->
<jsp:include page="../common/menubar.jsp" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

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
	margin-top: 20px;
	margin-left: 100px;
	width: 1600px;
	height: 1000px;
	float: left;
}
/* 콘텐츠영역 */

/* ==========페이지영역========== */
html, body {
	margin: 0;
	height: 100%;
	overflow-x: hidden;
	overflow-y: auto;
	font-family: "Nanum Gothic", serif;
	overflow-x: hidden;
}
.subBtns{
	margin-top:0px;
}

#reservationBtn {
	width: 140px;
	height: 40px;
	border: 0px;
	border-radius: 5px;
	background: rgb(26, 188, 156);
	color: white;
	font-size: 18px;
	margin-left: 50px;
}

#reservationBtn:hover {
	cursor: pointer;
}

/* 나의 예약 현황 버튼*/
#myReservation {
	width: 120px;
	height: 30px;
	border-bottom: 2px solid rgb(26, 188, 156);
	color: rgb(26, 188, 156);
	font-size: 18px;
	font-weight: 550;
	margin-top: -33px;
	margin-left: 750px;
	float: left;
	text-decoration: none;
}

#myReservationBtn:hover {
	cursor: pointer;
}

a#myReservation {
	text-align: center;
}


/* ===========예약 시간표============= */
margin{0px}
.table_time {
    border-collapse: separate;
    border-top: 2px solid #8c8c8c;
    border-left: 1px solid #ccc;

}
.table_time td {
    position: relative;
    background: #efefef;
    height: 51px;
    vertical-align: middle;
}
.table_time td, .table_time th {
    width: 100px;
    border-bottom: 1px solid #ccc;
    border-right: 1px solid #ccc;
    text-align: center;
    font-size: 14px;
    color: #333;
}

.table_resource_box {

    width: 980px;
}
.table_resource {
    float: left;
    border-collapse: separate;
    border-top: 2px solid #8c8c8c;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
.table_resource td, .table_resource th {
    border-bottom: 1px solid #ccc;
    border-right: 1px solid #ccc;
}
.table_resource td {
    width: 165px;
    height: 25px;
}
p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.table_resource tr:first-child th {
    width: 165px;
    background: #f9f9f9;
    height: 45px;
    line-height: 45px;
    border-bottom: 1px solid #ccc;
    border-right: 1px solid #ccc;
    font-weight: 700;
    font-size: 14px;
    color: #333;
}



/*========== 여기까지 예약 시간표 style 부분 =========*/



/* ==========예약하기 모달========== */

/* 예약 모달 */
.modal {
	max-width: 2000px;
	width: 1000px;
	height: 700px; /* 모달 크기지정 */
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

.reservationContent {
	width: 100%;
	height: 400px;
	margin-top: 10px;
	border-collapse: collapse;
	border-bottom: 3px solid lightgray;
	border-top: 3px solid #dddd;
	border-left: none;
	border-right: none;
}

.reservationContent * {
	font-size: 15px;
}

#minusImg {
	width: 15px;
	height: 15px;
	vertical-align: middle;
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom: 5px;
}

/*select 옵션*/
.meetionroom {
	float: left;
}

.inputs {
	width: 300px;
	height: 30px;
	border: 1px solid lightgray;
	border-radius: 3px;
	padding-left: 5px;
	font-size: 16px;
}

.btns {
	margin-left: 30%;
}

/* 가용회의실 검색, 참석자 지정 버튼*/
.searchBtn {
	height: 33px;
	border: none;
	border-radius: 5px;
	background: rgb(190, 190, 190);
	color: white;
	font-size: 14px;
	float: left;
}

.searchBtn:hover {
	cursor: pointer;
}

#searchBtn1 {
	width: 120px;
	margin-top: 17px;
	margin-right: 10px;
}

#searchBtn2 {
	width: 90px;
}

#partArea {
	border: 1px solid lightgray;
	margin-left: 10px;
	border-radius: 3px;
	resize: none;
}

#meetingroomBox {
	float: left;
	height: 20px;
}

#r1 {
	width: 20%;
	text-align: center;
	border-bottom: 1px ridge lightgray;
	background-color: #eeee;
}

#r2 {
	width: 80%;
	padding: 20px;
	border-bottom: 1px solid lightgray;
}

#r3 {
	text-align: center;
	background-color: #eeee;
}

#r4 {
	width: 80%;
	padding: 20px;
}

#reservBtn, #resetBtn {
	width: 140px;
	height: 40px;
	border: 0px;
	border-radius: 5px;
	color: white;
	font-size: 18px;
	margin-top: 20px;
}

#reservBtn {
	background: rgb(26, 188, 156);
	margin-left: 60px;
}

#resetBtn {
	background: rgb(190, 190, 190);
}

#reservBtn:hover, #resetBtn:hover {
	cursor: pointer;
}

/* ==========예약하기 모달========== */

/* ==========나의 예약 현황 모달========== */
.mtrmCurrentInner {
	width: 420px;
	height: 210px;
	margin-left: 30px;
	margin-right: 20px;
	margin-top: 20px;
	margin-bottom: 20px;
	display: inline-block;
	border: 1px solid rgb(160, 160, 160);
	border-radius: 5px;
	padding-top: 10px;
}

.mcTdImg {
	width: 200px;
	height: 200px;
	text-align: center;
}

.mcImg {
	width: 160px;
	height: 160px;
	border-radius: 50%;
	margin-bottom: 30px;
}

.mcTdContent {
	width: 220px;
	padding-left: 10px;
}

.mcContent1 {
	font-weight: 550;
	font-size: 18px;
}

.mcContent2 {
	margin-top: 10px;
}

.mcContent3 {
	line-height: 140%;
}

.mcBtn {
	width: 180px;
	height: 35px;
	border: 1px solid rgb(160, 160, 160);
	color: rgb(160, 160, 160);
	background: none;
	border-radius: 5px;
	font-size: 16px;
	margin-bottom: 10px;
}

/* 페이징바 스타일 */
.pagingBar {
	list-style: none;
	margin-left: 300px;
	margin-top: 40px;
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

/* 스케줄관련 아이콘스타일 */
.material-icons {
	font-size: 40px;
	vertical-align: middle;
}

.material-icons:hover {
	cursor: pointer;
}

.pageNoClick {
	pointer-events: none;
	cursor: default;
}

/* ==========나의 예약 현황 모달========== */
</style>
</head>
<body>

	<!-- 메뉴바 -->

	<div class="outer">
		<div class="topBar">
			<!-- 메뉴명 -->
			<span>회의실</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<li><button class="subBtn subActive">회의실 예약</button></li>
			</ul>
		</div>
		<div class="contentArea">

			<h2 style="display: inline-block; margin-left: 330px;">
				<span id="arrowLeft" class="material-icons"> arrow_left </span> <b
					id="calYear"></b>년 <b id="calMonth"></b>월

				<svg class="schedule_icons" xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 24 24" fill="black" width="48px" height="48px">
				<path
						d="M20 3h-1V1h-2v2H7V1H5v2H4c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 18H4V8h16v13z" />
				<path d="M0 0h24v24H0z" fill="none" /></svg>
				<span id="arrowRight" class="material-icons"> arrow_right </span>
			</h2>

			<form id="changeMonthForm" action="expenseListM.si" method="get">
				<input type="hidden" name="year"> <input type="hidden"
					name="month"> <input type="hidden" name="currentPage"
					value="1">
			</form>

			<script>
				$(document).ready(function() {
					var date = new Date();
					var year = date.getFullYear();
					var month = date.getMonth() + 1;

					var newYear = "<c:out value='${sds.year}'/>";
					var newMonth = "<c:out value='${sds.month}'/>";

					if (newYear != "") {
						$("#calYear").text(newYear);
						$("#calMonth").text(newMonth);
					} else {
						$("#calYear").text(year);
						$("#calMonth").text(month);
					}

					$("#arrowLeft").click(function() {
						month = month - 1;
						if (month < 1) {
							month = 12;
							year = year - 1;
						}
						$("#calMonth").text(month);
						$("#calYear").text(year);

						$("input[name=month]").attr("value", month);
						$("input[name=year]").attr("value", year);

						if (newYear != "") {
							newMonth = newMonth - 1;
							if (newMonth < 1) {
								newMonth = 12;
								newYear = newYear - 1;
							}
							$("#calMonth").text(newMonth);
							$("#calYear").text(newYear);

							$("input[name=month]").attr("value", newMonth);
							$("input[name=year]").attr("value", newYear);
						}

						$("#changeMonthForm").submit();

					});

					$("#arrowRight").click(function() {
						month = parseInt(month) + 1;
						if (month > 12) {
							month = 1;
							year = parseInt(year) + 1;
						}
						$("#calMonth").text(month);
						$("#calYear").text(year);

						$("input[name=month]").attr("value", month);
						$("input[name=year]").attr("value", year);

						if (newYear != "") {
							newMonth = parseInt(newMonth) + 1;
							if (newMonth > 12) {
								newMonth = 1;
								newYear = parseInt(newYear) + 1;
							}
							$("#calMonth").text(newMonth);
							$("#calYear").text(newYear);

							$("input[name=month]").attr("value", newMonth);
							$("input[name=year]").attr("value", newYear);
						}

						$("#changeMonthForm").submit();
					});

				});
			</script>
			<div class="subBtns">
				<button id="reservationBtn">예약하기</button>
				<a id="reservation" class="open-modal" href="#open_reservation" style="display: none;">모달</a> <br>
				<a id="myReservation" class="open-modal" href="#myReservation_open_modal">나의 예약 현황</a>
			</div>


		<!-- 예약하기(main) 부분 -->
	
		<div class="resource_layout">
			<div style="float: left;">
				<!-- 시간 table  -->
				<table class="table_time" cellpadding="0" cellspacing="0">
					<tr>
						<th style="height: 73px">시간</th>
					</tr>
					<tr class="">
						<td>07:00</td>
					</tr>
					<tr class="">
						<td>08:00</td>
					</tr>
					<tr class="">
						<td>09:00</td>
					</tr>
					<tr class="">
						<td>10:00</td>
					</tr>
					<tr class="">
						<td>11:00</td>
					</tr>
					<tr class="">
						<td>12:00</td>
					</tr>
					<tr class="">
						<td>13:00</td>
					</tr>
					<tr class="">
						<td>14:00</td>
					</tr>
					<tr class="">
						<td>15:00</td>
					</tr>
					<tr class="">
						<td>16:00</td>
					</tr>
					<tr class="">
						<td>17:00</td>
					</tr>
					<tr class="">
						<td>18:00</td>
					</tr>
					<tr class="">
						<td>19:00</td>
					</tr>

				</table>
			</div>
			<!-- 회의실 table -->

			<div class="table_resource_box" style="float: left; width: 800px">
				<table class="table_resource" id="mtrmSC"  style="float: left;" cellpadding="0"
					cellspacing="0">
					<tr>
						<th><p>3층회의실</p></th>
						<th><p>3층회의실2</p></th>
						<th><p>5층회의실</p></th>
						<th><p>5층회의실2</p></th>
						<th><p>6층회의실</p></th>
					</tr>
					<tr id="07:00" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="07:30" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="08:00" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="08:30" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="09:00" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="09:30" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="10:00" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="10:30" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="11:00" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="11:30" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="12:00" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="12:30" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="13:00" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="13:30" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="14:00" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="14:30" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="15:00" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="15:30" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="16:00" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="16:30" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="17:00" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="17:30" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="18:00" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="18:30" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="19:00" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>
					<tr id="19:30" class="">
						<td name="000010"><p></p></td>
						<td name="000011"><p></p></td>
						<td name="000013"><p></p></td>
						<td name="rooma0"><p></p></td>
						<td name="roomb0"><p></p></td>
					</tr>



				</table>
			</div>
		</div>

		<!-- 위에까지 예약하기(main) 부분 -->
			

		</div>

		
			

		<!-- 모달 (예약하기 부분) -->
		<div id="open_reservation" class="modal" style="height: 730px;">
			<div class="modal-title">회의실 예약</div>
			<div class="modal-content">
				<table class="reservationContent">
					<tr>
						<td id="r1">신청자</td>
						<td id="r2">${ loginUser.empName }님</td>
					</tr>
					<tr>
						<td id="r1">사용기간</td>
						<td id="r2">
							<form name="" action="" method="post">
								<input type="date" class="inputs" style="width: 140px">
								<input type="time" class="inputs" style="width: 120px">
								<img
									src="${ pageContext.servletContext.contextPath }/resources/icons/minus.png"
									id="minusImg"> <input type="date" class="inputs"
									style="width: 140px"> <input type="time" class="inputs"
									style="width: 120px">
							</form>
						</td>
					</tr>
					<tr>
						<td id="r1">회의실</td>
						<td id="r2"><select name="meetingroom" class="inputs"
							style="width: 120px">
								<option selected>회의실 선택</option>
								<option>5F 회의실1</option>
								<option>5F 회의실2</option>
								<option>5F 회의실3</option>
								<option>6F회의실</option>
						</select> <br>
							<button id="searchBtn1" class="searchBtn">가용회의실 검색</button> <br>
							<input type="text" id="meetingroomBox" class="inputs"
							style="height: 30px" readonly></td>
					</tr>
					<tr>
						<td id="r1">사용목적</td>
						<td id="r2"><input type="text" placeholder="내용을 입력하세요"
							class="inputs"></td>
					</tr>
					<tr>
						<td id="r1">참석자(내부)</td>
						<td id="r2"><button id="searchBtn2" class="searchBtn"
								onclick="window.open('meetingroomAddparticipants.jsp','popup_name','_blank')">참석자
								지정</button> <textarea cols="60" rows="4" id="partArea" readonly></textarea>
						</td>
					</tr>
					<tr>
						<td id="r3">참석자(외부)</td>
						<td id="r4"><input type="text" class="inputs"></td>
					</tr>
				</table>
			</div>

			<!-- 예약/취소 버튼 -->
			<div class="btns">
				<button id="reservBtn" type="submit">예약하기</button>
				<button id="resetBtn" type="reset" onClick="history.go(0)">취소</button>
			</div>
		</div>


		<!-- 모달(나의 예약 현황) -->
		<div id="myReservation_open_modal" class="modal">
			<div class="modal-title">나의 예약현황</div>
			<div class="modal-content" id="mtrmCurrentInnerPage">

				<table class="mtrmCurrentInner">
					<tr>
						<td rowspan="5" class="mcTdImg"><img class="mcImg"
							src="${ pageContext.servletContext.contextPath }/resources/siteImgs/크기변환_KENN4462-1.jpg">
						</td>
						<td class="mcTdContent"><span class="mcContent1">3층
								회의실1</span></td>
					</tr>
					<tr>
						<td class="mcTdContent"><span class="mcContent2">팀 미팅</span></td>
					</tr>
					<tr>
						<td class="mcTdContent"><span class="mcContent3">2020-05-05
								09:00 <br> ~ 2020-05-05 12:00
						</span></td>
					</tr>
					<tr>
						<td class="mcTdContent"><button class="mcBtn" type="button">예약
								취소</button></td>
					</tr>
				</table>

				<table class="mtrmCurrentInner">
					<tr>
						<td rowspan="5" class="mcTdImg"><img class="mcImg"
							src="${ pageContext.servletContext.contextPath }/resources/siteImgs/크기변환_KENN4462-1.jpg">
						</td>
						<td class="mcTdContent"><span class="mcContent1">3층
								회의실1</span></td>
					</tr>
					<tr>
						<td class="mcTdContent"><span class="mcContent2">팀 미팅</span></td>
					</tr>
					<tr>
						<td class="mcTdContent"><span class="mcContent3">2020-05-05
								09:00 <br> ~ 2020-05-05 12:00
						</span></td>
					</tr>
					<tr>
						<td class="mcTdContent"><button class="mcBtn" type="button">예약
								취소</button></td>
					</tr>
				</table>

				<table class="mtrmCurrentInner">
					<tr>
						<td rowspan="5" class="mcTdImg"><img class="mcImg"
							src="${ pageContext.servletContext.contextPath }/resources/siteImgs/크기변환_KENN4462-1.jpg">
						</td>
						<td class="mcTdContent"><span class="mcContent1">3층
								회의실1</span></td>
					</tr>
					<tr>
						<td class="mcTdContent"><span class="mcContent2">팀 미팅</span></td>
					</tr>
					<tr>
						<td class="mcTdContent"><span class="mcContent3">2020-05-05
								09:00 <br> ~ 2020-05-05 12:00
						</span></td>
					</tr>
					<tr>
						<td class="mcTdContent"><button class="mcBtn" type="button">예약
								취소</button></td>
					</tr>
				</table>

				<table class="mtrmCurrentInner">
					<tr>
						<td rowspan="5" class="mcTdImg"><img class="mcImg"
							src="${ pageContext.servletContext.contextPath }/resources/siteImgs/크기변환_KENN4462-1.jpg">
						</td>
						<td class="mcTdContent"><span class="mcContent1">3층
								회의실1</span></td>
					</tr>
					<tr>
						<td class="mcTdContent"><span class="mcContent2">팀 미팅</span></td>
					</tr>
					<tr>
						<td class="mcTdContent"><span class="mcContent3">2020-05-05
								09:00 <br> ~ 2020-05-05 12:00
						</span></td>
					</tr>
					<tr>
						<td class="mcTdContent"><button class="mcBtn" type="button"
								onClick="history.go(0)">예약 취소</button></td>
					</tr>
				</table>

				<!-- 페이징바 -->
				<ul class="pagingBar">

					<c:choose>
						<c:when test="${ pi.currentPage eq 1 }">
							<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item "><a class="page-link"
								href="myReserve.me?currentPage=${ pi.currentPage-1 }">Previous</a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:choose>
							<c:when test="${ p eq pi.currentPage }">
								<li class="page-item disabled"><a class="page-link"
									href="#">${ p }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="myReserve.me?currentPage=${ p }">${ p }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
							<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="myReserve.me?currentPage=${ pi.currentPage+1 }">Next</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
				<!-- 페이징바 -->

			</div>
		</div>

		<br> <br>
	</div>

	<!-- 모달용 스크립트 -->
	<script>
		$('.open-modal').click(function() {
			$(this).modal({
				fadeDuration : 150
			});
		});

		/* 예약하기 모달 여는 function */
		$("#reservationBtn").on("click", function() {
			$("#reservation").click();
		});

		$(function() {
			$("#mtrmCurrentInnerPage tr").click(
					function() {
						location.href = "reserveDetail.me?mno"
								+ $(this).children().eq(0).text();
					});
		});
		
		
		
	</script>
	<script>
		$(function(){
			$("#mtrmSC").click(function(){
				window.open('meetingroomCurrentStatusPopup.jsp','popup_name','_blank');
			});
			
		});
	</script>

</body>
</html>