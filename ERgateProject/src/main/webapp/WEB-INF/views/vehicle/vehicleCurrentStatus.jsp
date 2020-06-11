<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>vehicleCurrentStatus</title>
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
    .outer{
        padding-left: 320px;
        float: left;
        width: 100%;
        min-height: 100%;
        background-color: rgba(224, 224, 224, 0.12);
    }
    .topBar {
        background-color:rgba(22, 160, 133, 0.39);
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
    .subMenuArea{
        background-color: white;
        width: 100%;
        height: 70px;
    }
    #subMenuList{
    	margin: 0;
    	list-style:none;
    	padding-left: 0;
    }
    #subMenuList li{
        margin-top: 10px;
        margin-left: 20px;
        float:left;
        text-decoration-style: none;
    }
    /* 서브메뉴바 영역 */

    /* 서브메뉴바 메뉴버튼(기본) */
    .subBtn{
        border:0;
        width: 150px;
        height: 50px;
        font-size: 19px;
        color:rgb(127, 127, 127);
        background-color: white;
        border-radius: 25px;
    }
    .subBtn:hover{cursor: pointer;}
    /* 서브메뉴바 메뉴버튼(기본) */
    
    /* 서브메뉴바 메뉴버튼(현재페이지일때) */
    .subActive{
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
	
	html, body {
		margin: 0;
		height: 100%;
		overflow-x: hidden;
		overflow-y: auto;
		font-family: "Nanum Gothic", serif;
		overflow-x: hidden;
	}
	.subBtns{
		margin-top:-50px;
	}
	#reservationBtn {
		width: 140px;
		height: 40px;
		border: 0px;
		border-radius: 5px;
		background: rgb(26, 188, 156);
		color: white;
		font-size: 18px;
		margin-left: 25px;
	}
	#reservationBtn:hover {
		cursor: pointer;
	}
	
	/* 나의 예약 현황 버튼*/
	#myReservation{
		width: 120px;
		height: 30px;
		border-bottom: 2px solid rgb(26, 188, 156);
		color: rgb(26, 188, 156);
		font-size: 18px;
		font-weight: 550;
		margin-top: -33px;
		margin-left: 970px;
		float:left;
		text-decoration:none;
	}
	#myReservationBtn:hover {
		cursor: pointer;
	}
	a#myReservation{
		text-align:center;
	}
	/* 나의 예약 현황 버튼*/
	
	
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
	/* 스케줄관련 아이콘스타일 */


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
	    width: 120px;
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
		width:100%;
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
	    height: 51px;
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
	
/* ===========예약 시간표============= */


/* ==========모달 공통 CSS ========== */
	
	/* 모달팝업 스타일 */
	.modal {
		max-width: 2000px;
		width: 1000px;
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
	
/* ==========모달 공통 CSS ========== */

	
/* ==========예약하기 모달========== */

	#open_reservation{
		height: 650px; /* 모달 크기지정 */
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
	.reservationContent *{
		font-size: 15px;
	}

	#minusImg{
		width: 15px;
		height: 15px;
		vertical-align: middle;
		margin-left: 10px;
		margin-right: 10px;
		margin-bottom: 5px;
	}

	/*select 옵션*/
	.vehicle {
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
	}
	.searchBtn:hover {
		cursor: pointer;
	}
	#searchBtn1{
		width: 120px;
	}
	#searchBtn2{
		width: 90px;
	}
	#vehicleSelect, #searchBtn1{
		margin-bottom: 10px;
	}
	#partArea{
		border: 1px solid lightgray;
		margin-top: 10px;
		border-radius: 3px;
		resize: none;
		padding-left: 15px;
		padding-top: 15px;
		font-family: 'Nanum Gothic', serif;
		font-size: 16px;
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
	#reservBtn, #resetBtn{
		width: 140px;
		height: 40px;
		border: 0px;
		border-radius: 5px;
		color: white;
		font-size: 18px;
		margin-top: 20px;
	}
	#reservBtn{
		background: rgb(26, 188, 156);
		margin-left: 60px;
	}
	#resetBtn{
		background: rgb(190, 190, 190);
	}
	#reservBtn:hover, #resetBtn:hover{
		cursor: pointer;
	}

/* ==========예약하기 모달========== */


/* ==========나의 예약 현황 모달========== */

	#myReservation_open_modal{
		height: auto; /* 모달 크기지정 */
	}
	
	.vhclCurrentInner{
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
	.vcTdImg{
		width: 200px;
		height: 200px;
		text-align: center;
	}
	.vcImg{
		width: 160px;
		height: 160px;
		border-radius: 50%;
		margin-bottom: 30px;
	}
	.vcTdContent{
		width: 220px;
		padding-left: 10px;
	}
	.vcContent1{
		font-weight: 550;
		font-size: 18px;
	}
	.vcContent2{
		margin-top: 10px;
	}
	.vcContent3{
		line-height: 140%;
	}
	.vcBtn{
		width: 180px;
		height: 35px;
		border: 1px solid rgb(160, 160, 160);
		color: rgb(160, 160, 160);
		background: none;
		border-radius: 5px;
		font-size: 16px;
		margin-bottom: 10px;
	}
	.reserveCancelBtn:hover{
		cursor: pointer;
	}
	
	/* 페이징바 스타일 */
	.pagingBar {
		list-style: none;
		margin-left: 340px;
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
	
	#vcPagingBar {
		margin-bottom: 30px;
		padding-bottom: 30px;
	}
	/* 페이징바 스타일 */
	
/* ==========나의 예약 현황 모달========== */


</style>
</head>
<body>

	<c:if test="${ !empty msg }">
		<script>
			alert('${ msg }');
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>

	<div class="outer">
		<div class="topBar">
			<!-- 메뉴명 -->
			<span>업무차량</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
				<li><button class="subBtn subActive" onclick="location.href='currentStatus.ve'">업무차량 예약</button></li>
				
				<c:if test="${ loginUser.deptTitle eq '총무팀' }">
					<li><button class="subBtn" style="width: 170px" onclick="location.href='reserveList.ve'">업무차량 예약현황</button></li>
					<li><button class="subBtn" onclick="location.href='vehicleList.ve?currentPage=1'">업무차량 관리</button></li>
				</c:if>
				
			</ul>
		</div>
		<div class="contentArea" style="margin-top: 30px;">
			<div id="midContentArea">

				<h2 style="display: inline-block; margin-left: 400px; margin-bottom:10px;">
					<span id="arrowLeft" class="material-icons"> arrow_left </span> 
						
						<b id="calYear"></b>년 <b id="calMonth"></b>월<b id="calDay"></b>일 &nbsp;
	
					<svg class="schedule_icons" xmlns="http://www.w3.org/2000/svg"
						viewBox="0 0 24 24" fill="black" width="30px" height="30px" style="vertical-align: text-top;">
					<path
							d="M20 3h-1V1h-2v2H7V1H5v2H4c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 18H4V8h16v13z" />
					<path d="M0 0h24v24H0z" fill="none" /></svg>
					<span id="arrowRight" class="material-icons"> arrow_right </span>
				</h2>
	
				<form id="changeMonthForm" action="currentStatusD.me" method="get">
					<input type="hidden" name="year"> 
					<input type="hidden" name="month">
					<input type="hidden" name="day">
				</form>

			</div>
		
			<div class="subBtns">
				<button id="reservationBtn">예약하기</button>
				<a id="reservation" class="open-modal" href="#open_reservation" style="display: none;">모달</a> <br> 
				<a id="myReservation" class="open-modal" href="#myReservation_open_modal">나의 예약 현황</a>
			</div>
			
			<br><br>
			<!-- 예약하기(main) 부분 -->

			<div class="resource_layout">
				<div style="float: left;">
					<!-- 시간 table  -->
					<table class="table_time" cellpadding="0" cellspacing="0">
						<tr>
							<th style="height: 73px">시간</th>
						</tr>
						
						<tr class="a">
							<td>10:00</td>
						</tr>
						<tr class="a">
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

				<div class="table_resource_box" style="float: left; width: 1000px">
					<table class="table_resource" id="mtrmSC" style="float: left;" cellpadding="0" cellspacing="0">
						<tr>
							<th><p>그랜저 33허 3333</p></th>
							<th><p>소나타 33허 3333</p></th>
							<th><p>카니발 33허 3333</p></th>
							<th><p>스타렉스 33허 3333</p></th>
							<th><p>스파크 33허 3333</p></th>
						</tr>
						
						<tr id="10:00" class="">
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
						
						<tr id="12:00" class="">
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
						
						<tr id="14:00" class="">
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
						
						<tr id="16:00" class="">
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
						
						<tr id="18:00" class="">
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
						
					</table>
				</div>
			</div>
			<!--  예약하기(main) 부분 -->
		</div>

		<!-- 모달 (예약하기) -->
		<div id="open_reservation" class="modal">
			<div class="modal-title">업무차량 예약</div>
			<form action="reserve.ve" action="post">
				<div class="modal-content">
					<table class="reservationContent">
						<input type="hidden" name="empId" value="${ loginUser.empId }"/>
						<input type="hidden" name="deptTitle" value="${ loginUser.deptTitle }"/>
						<tr>
							<td id="r1">신청자</td>
							<td id="r2">${ loginUser.empName }</td>
						</tr>
						<tr>
							<td id="r1">사용기간</td>
							<td id="r2">
								<input name="vhclStartDate" type="date" class="inputs" style="width:140px" required>
								<select name="vhclStartTime" class="inputs" style="width:110px" required>
									<option disabled selected>시작 시각</option>
									<option value="10">10:00</option>
									<option value="11">11:00</option>
									<option value="12">12:00</option>
									<option value="13">1:00</option>
									<option value="14">2:00</option>
									<option value="15">3:00</option>
									<option value="16">4:00</option>
									<option value="17">5:00</option>
									<option value="18">6:00</option>
									<option value="19">7:00</option>
								</select>
								<img src="${ pageContext.servletContext.contextPath }/resources/icons/minus.png" id="minusImg">
								<input name="vhclEndDate" type="date" class="inputs" style="width:140px" required>
								<select name="vhclEndTime" class="inputs" style="width:110px" required>
									<option disabled selected>종료 시각</option>
									<option value="10">10:00</option>
									<option value="11">11:00</option>
									<option value="12">12:00</option>
									<option value="13">1:00</option>
									<option value="14">2:00</option>
									<option value="15">3:00</option>
									<option value="16">4:00</option>
									<option value="17">5:00</option>
									<option value="18">6:00</option>
									<option value="19">7:00</option>
								</select>
							</td>
						</tr>
						<tr>
							<td id="r1">업무차량</td>
							<td id="r2">
								<select id="vehicleSelect" name="vhclCode" class="inputs" style="width:180px; height:33px;" required>
									<option disabled selected>업무차량 선택</option>
									<option value="111">그랜저 33허 3333</option>
									<option value="112">소나타 33허 3333</option>
									<option value="113">카니발 33허 3333</option>
									<option value="114">스타렉스 33허 3333</option>
									<option value="115">스파크 33허 3333</option>
								</select>
								<button id="searchBtn1" class="searchBtn" type="button">가용차량 검색</button> 
								<br>
								<span style="color:gray; font-size:14px;">차량을 선택하고 추가 정보를 확인하세요.</span>
								<br> 
								<textarea cols="60" rows="4" id="partArea" readonly></textarea>
							</td>
						</tr>
						<tr>
							<td id="r1">사용목적</td>
							<td id="r2">
								<input name="vhclPurpose" type="text" placeholder="내용을 입력하세요" class="inputs" required>
							</td>
						</tr>
					</table>
				</div>
				
				<div class="btns">
					<button id="reservBtn" type="submit">예약하기</button>
					<button id="resetBtn" type="reset" onclick="history.go(0)">취소</button>
				</div>
			</form>
		</div>


		<!-- 모달 (나의 예약 현황) -->
		<div id="myReservation_open_modal" class="modal">
			<div class="modal-title">나의 예약현황</div>
			<div id="modalContent2" class="modal-content"></div>
		</div>
		
	</div>
	
	
	<!-- 나의 예약 현황 리스트 조회 ajax -->
	<script>
		function myReserveList(cur){
			
			
			
			 $.ajax({
				url:"myReserve.ve",
				data:{empId:"${loginUser.empId}",
					  currentPage:cur},
				type:"post",
				success:function(map){ // map
					
					// map.pi  => {}
					// map.list => [{}, {}]
					
					var value1 = "";
					
					for(var i in map.list){
						value1 += 
							"<table class='vhclCurrentInner'>" + 
							"<tr>" +
								"<td rowspan='5' class='vcTdImg'>";
								
								if(map.list[i].vhclImage == null) {
									value1 += 
										"<img class='vcImg' src='${pageContext.servletContext.contextPath }/resources/siteImgs/vhclLogo.png'>";
								}else{
									value1 += 
										"<img class='vcImg' src='${ pageContext.servletContext.contextPath }/resources/uploadFiles/vehicle/" + map.list[i].vhclImage + "'>";
								};
								
						value1 += 
								"</td>" + 
								"<td class='vcTdContent'><span class='vcContent1'>" + map.list[i].vhclModel + " " + map.list[i].vhclNo + "</span></td>" +
							"</tr>" + 
							"<tr>" + 
								"<td class='vcTdContent'><span class='vcContent2'>" + map.list[i].vhclPurpose + "</span></td>" + 
							"</tr>" + 
							"<tr>" + 
								"<td class='vcTdContent'>" +
									"<span class='vcContent3'>" + map.list[i].vhclStartDate + " " + map.list[i].vhclStartTime + "<br>" +
									 "~" + map.list[i].vhclEndDate + " " + map.list[i].vhclEndTime + "</span>" +
								"</td>" +
							"</tr>" +
							"<tr>" +
								"<td class='vcTdContent'>" + 
									"<input type='hidden' class='vcVhclReserveNo' name='vhclReserveNo' value='" + map.list[i].vhclReserveNo + "'/>" +
									"<button class='vcBtn reserveCancelBtn' type='button'>예약 취소</button>" + 
								"</td>" + 
							"</tr>" +
						"</table>";
								
					}
					
					var value2 = "";
					
					if(map.pi.endPage > 1){
						value2 += 
						"<ul class='pagingBar' id='vcPagingBar'>";
						
						if(map.pi.currentPage == 1){
							value2 += 
								"<li><a href='#'>&lt;&lt;</a></li>";
						}else{
							value2 += 
								"<li><a onclick='myReserveList(" + map.pi.startPage + ")';>&lt;&lt;</a></li>";
						}
						
						if(map.pi.currentPage == 1){
							value2 += 
								"<li><a href='#'>&lt;</a></li>";
						}else{
							value2 += 
								"<li><a onclick='myReserveList(" + (map.pi.currentPage - 1) + ")';>&lt;</a></li>";
						}
						
						for(var p = map.pi.startPage; p <= map.pi.endPage; p++){
							
							if(map.pi.currentPage == p){
								value2 +=
									"<li><span>" + p + "</span></li>";
							}else{
								value2 +=
									"<li><a onclick='myReserveList(" + p + ")';>" + p + "</a></li>";
							}
						}
						
						if(map.pi.currentPage == map.pi.maxPage){
							value2 += 
								"<li><a href='#'>&gt;</a></li>";
						}else{
							value2 += 
								"<li><a onclick='myReserveList(" + (map.pi.currentPage + 1) + ")';>&gt;</a></li>";
						}
						
						if(map.pi.currentPage == map.pi.maxPage){
							value2 +=
								"<li><a href='#'>&gt;&gt;</a></li>";
						}else{
							value2 += 
								"<li><a onclick='myReserveList(" + map.pi.endPage + ")';>&gt;&gt;</a></li>";
						}
						
						value2 += "</ul>";
					}
				
					
					$("#modalContent2").html(value1+value2);
					
				},error:function(){
					console.log("나의 예약 현황 모달 리스트 조회 ajax 통신 실패");
				}
			}); 
		}
		
		$(function(){
			myReserveList(1);
		});
	</script>
	
	<!-- 차량 예약 취소 ajax -->
	<script>
		$(document).on("click", ".reserveCancelBtn", function(){
			
			$.ajax({
				url:"cancelReserve.ve",
				data:{vhclReserveNo:$(this).prev().val()},
				type:"post",
				success:function(status){
					
					console.log(status);
					
					if(status == "success"){
						
						alert("성공적으로 예약 취소되었습니다.");
						
						myReserveList(1);
						
					}else{
						alert("예약 취소 실패하였습니다. 다시 시도해 주세요.");
					}
										
				},error:function(){
					console.log("차량 예약 취소 ajax 통신 실패");
				}
			});
		});
	</script>

	<!-- 모달용 스크립트 -->
	<script>
		$('.open-modal').click(function() {
			$(this).modal({
				fadeDuration : 150
			});
		});

		/* 예약하기 모달 여는 function */
		$("#reservationBtn").on("click",function(){
				$("#reservation").click();
		});
	</script>
	
	<!-- 캘린더 테이블 -->
	<script>
		$(document).ready(function() {
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			var day = date.getDate();

			var newYear = "<c:out value='${mds.year}'/>";
			var newMonth = "<c:out value='${mds.month}'/>";
			var newDay =  "<c:out value='${mds.date}'/>";
		 	
			// 날짜 변경값 있을 경우
			if (newYear != "") {
				$("#calYear").text(newYear);
				$("#calMonth").text(newMonth);
				$("#calDay").text(newDay);
				
			} else { // 날짜변경값 없을경우(처음 페이지 요청했을때)
				$("#calYear").text(year);
				$("#calMonth").text(month);
				$("#calDay").text(day);
			}
			
			/* 이전으로  */
			$("#arrowLeft").click(function() {
				month = month - 1;
				if (month < 1) {
					month = 12;
					year = year - 1;
					
				}
				$("#calMonth").text(month);
				$("#calYear").text(year);
				$("#calDay").text(day);
				

				$("input[name=month]").attr("value", month);
				$("input[name=year]").attr("value", year);
				$("input[name=day]").attr("value", day);

				if (newYear != "") {
					newMonth = newMonth - 1;
					if (newMonth < 1) {
						newMonth = 12;
						newYear = newYear - 1;
					}
					$("#calMonth").text(newMonth);
					$("#calYear").text(newYear);
					$("#calDay").text(newDay);

					$("input[name=month]").attr("value", newMonth);
					$("input[name=year]").attr("value", newYear);
					$("input[name=day]").attr("value", newDay);
				}

				$("#changeMonthForm").submit();

			});
			
			/* 다음으로 */
			$("#arrowRight").click(function() {
				date = date.getDate() + 1
				newYear = date.getFullYear();
				newMonth = date.getMonth() + 1;
				newDay = date.getDate() + 1;

				$("input[name=month]").attr("value", newMonth);
				$("input[name=year]").attr("value", newYear);
				$("input[name=day]").attr("value", newDay);
				
				$("#changeMonthForm").submit(); 
			});
		});
	</script>
	
	<!-- 가용차량 검색 ajax -->
	<script>
		$("#searchBtn1").click(function(){
			
			$.ajax({
				url:"select.ve",
				data:{vhclCode:$("#vehicleSelect").val()},
				type:"post",
				success:function(vehicle){
					
					var vhclModel = vehicle.vhclModel;
					var vhclNo = vehicle.vhclNo;
					var vhclCapacity = vehicle.vhclCapacity;
					var vhclImage = vehicle.vhclImage;
					var vhclCode = vehicle.vhclCode;
					var vhclEnrollDate = vehicle.vhclEnrollDate;
					var vhclStatus = vehicle.vhclStatus;
					
					$("#partArea").html("차종 : " + vhclModel + ", " + "차량 번호 : " + vhclNo + ", " + "최대 탑승 인원 : " + vhclCapacity);
					
				},error:function(){
					console.log("가용 차량 검색 ajax 통신 실패");
				}
			});
		});
	</script>

</body>
</html>