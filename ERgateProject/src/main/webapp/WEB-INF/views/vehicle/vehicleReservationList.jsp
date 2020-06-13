<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>vehicleReservationList</title>
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
		width: 190px;
	}
	
	/* 체크박스 스타일 */
	.checkBox {
		zoom: 1.7;
	}

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
	
	/* 게시판 스타일 */
	.boardTable {
		width: 1400px;
		height: auto;
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
		height: 45px;
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
		margin-left: 520px;
		margin-top:50px;
	}
	.pagingBar:hover{
		cursor:pointer;
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

/* ==========페이지영역========== */
</style>
</head>
<body>
	<div class="outer">
		<div class="topBar">
			<!-- 메뉴명 -->
			<span>업무차량</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
				<li><button class="subBtn" onclick="location.href='currentStatus.ve'">업무차량 예약</button></li>
				<li><button class="subBtn subActive" onclick="location.href='reserveList.ve'">업무차량 예약현황</button></li>
				<li><button class="subBtn" onclick="location.href='vehicleList.ve?currentPage=1'">업무차량 관리</button></li>
			</ul>
		</div>

		<div class="contentArea">
			<!-- 달력 설정 부분 -->
			<div id="midContentArea">
	
				<h2 style="display: inline-block; margin-left: 540px;">
					<span id="arrowLeft" class="material-icons"> arrow_left </span> 
						
						<b id="calYear"></b>년 <b id="calMonth"></b>월&nbsp;
	
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
	
			<!-- 게시판 -->
			<table id="vrTable" class="boardTable">
				<thead>
					<tr>
						<th style="width:200px">부서명</th>
						<th style="width:200px">예약자</th>
						<th style="width:200px">업무차량</th>
						<th style="width:200px">사용목적</th>
						<th style="width:400px">사용기간</th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
				
			<div id="pagingArea"></div>
			
		</div>

	</div>

	
	<!-- 캘린더 -->	
	<script>
		$(document).ready(function(){
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			
			var newYear = "<c:out value='${md.year}'/>";
			var newMonth = "<c:out value='${md.month}'/>";
			
			// 날짜 변경값 있을 경우
			if (newYear != "") {
				$("#calYear").text(newYear);
				$("#calMonth").text(newMonth);
				
			} else { // 날짜변경값 없을경우(처음 페이지 요청했을때)
				$("#calYear").text(year);
				$("#calMonth").text(month);
			}
			
			listAjax(1);
			
			/* 이전으로  */
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
				
				if(newYear != ""){
					newMonth = newMonth - 1;
					if (newMonth < 1) {
						newMonth = 12;
						newYear = newYear - 1;
					}
					$("#calMonth").text(newMonth);
					$("#calYear").text(newYear);
					
					$("input[name=month]").attr("value",newMonth);
					$("input[name=year]").attr("value",newYear);
				}
				
				listAjax(1);
				
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
				
				if(newYear != ""){
					newMonth = parseInt(newMonth) + 1;
					if (newMonth > 12) {
						newMonth = 1;
						newYear = parseInt(newYear) + 1;
					}
					$("#calMonth").text(newMonth);
					$("#calYear").text(newYear);
					
					$("input[name=month]").attr("value",newMonth);
					$("input[name=year]").attr("value",newYear);
				}
				
				listAjax(1);
				
			});	
		
		});
	</script>
	
	<!-- 월별 예약 현황 조회 -->
	<script>
		function listAjax(cur){
			
			$.ajax({
				url:"reserveListAjax.ve",
				data:{calYear:$("#calYear").text(),
					  calMonth:$("#calMonth").text(),
					  currentPage:cur},
				type:"post",
				success:function(map){
					
					var value1 = "";
					
					if(map.list == null){
						value1 += 
							"<td colspan='5' rowspan='10'>조회된 결과가 없습니다.</td>";
							
					}else{
						for(var i in map.list){
						value1 +=
								"<tr>" +
									"<td>" + map.list[i].deptTitle + "</td>" + 
									"<td>" + map.list[i].empName + "</td>" +
									"<td>" + map.list[i].vhclModel + " " + map.list[i].vhclNo + "</td>" +
									"<td>" + map.list[i].vhclPurpose + "</td>" + 
									"<td>" + map.list[i].vhclStartDate + " " + map.list[i].vhclStartTime + ":00 ~ " + map.list[i].vhclEndDate + " " + map.list[i].vhclEndTime + ":00" + "</td>" +
								"</tr>";
						}
					}

					var value2 = "";
					
					if(map.pi.endPage > 1){
						value2 += 
							"<ul class='pagingBar'>";
							
							if(map.pi.currentPage == 1){
								value2 += 
									"<li><a href='#'>&lt;&lt;</a></li>";
							}else{
								value2 += 
									"<li><a onclick='listAjax(" + map.pi.startPage + ")';>&lt;&lt;</a></li>";
							}
							
							if(map.pi.currentPage == 1){
								value2 += 
									"<li><a href='#'>&lt;</a></li>";
							}else{
								value2 += 
									"<li><a onclick='listAjax(" + (map.pi.currentPage - 1) + ")';>&lt;</a></li>";
							}
							
							for(var p = map.pi.startPage; p <= map.pi.endPage; p++){
								
								if(map.pi.currentPage == p){
									value2 +=
										"<li><span>" + p + "</span></li>";
								}else{
									value2 +=
										"<li><a onclick='listAjax(" + p + ")';>" + p + "</a></li>";
								}
							}
							
							if(map.pi.currentPage == map.pi.maxPage){
								value2 += 
									"<li><a href='#'>&gt;</a></li>";
							}else{
								value2 += 
									"<li><a onclick='listAjax(" + (map.pi.currentPage + 1) + ")';>&gt;</a></li>";
							}
							
							if(map.pi.currentPage == map.pi.maxPage){
								value2 +=
									"<li><a href='#'>&gt;&gt;</a></li>";
							}else{
								value2 += 
									"<li><a onclick='listAjax(" + map.pi.endPage + ")';>&gt;&gt;</a></li>";
							}
							
							value2 += "</ul>";
					}
					
					$("#vrTable tbody").html(value1);
					$("#pagingArea").html(value2);
						
				},error:function(){
					console.log("월별 예약 현황 모달 리스트 조회 ajax 통신 실패");
				}
			});
		}
	</script>
	
</body>
</html>