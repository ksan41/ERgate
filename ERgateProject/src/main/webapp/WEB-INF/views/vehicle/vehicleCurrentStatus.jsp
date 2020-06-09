<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>vehicleCurrentStatus</title>

<!-- 이 부분  -->
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
    #subMenuList{margin: 0;list-style:none;padding-left: 0;}
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
	#myReservation{
		width: 120px;
		height: 30px;
		border-bottom: 2px solid rgb(26, 188, 156);
		color: rgb(26, 188, 156);
		font-size: 18px;
		font-weight: 550;
		margin-top: -33px;
		margin-left:1000px;
		float:left;
		text-decoration:none;
	}
	#myReservationBtn:hover {
		cursor: pointer;
	}
	a#myReservation{
		text-align:center;
	}
	
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


	<!-- 메뉴바 -->

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
		<div class="contentArea">

			<button id="reservationBtn">예약하기</button>
			<a id="reservation" class="open-modal" href="#open_reservation" style="display: none;">모달</a> <br> 
			<a id="myReservation" class="open-modal" href="#myReservation_open_modal">나의 예약 현황</a>

		</div>

		<!-- 모달 (예약하기) -->
		<div id="open_reservation" class="modal" style="height: 600px;">
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
								<input name="vhclStartTime" type="time" class="inputs" style="width:120px" required>
								<img src="${ pageContext.servletContext.contextPath }/resources/icons/minus.png" id="minusImg">
								<input name="vhclEndDate" type="date" class="inputs" style="width:140px" required>
								<input name="vhclEndTime" type="time" class="inputs" style="width:120px" required>
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
								<button id="searchBtn1" class="searchBtn">가용차량 검색</button> 
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
					<button id="resetBtn" type="reset">취소</button>
				</div>
			</form>
		</div>


		<!-- 모달 (나의 예약 현황) -->
		<div id="myReservation_open_modal" class="modal">
			<div class="modal-title">나의 예약현황</div>
			<div class="modal-content">
			
			<c:forEach items="${ list }" var="vr">
			
				<table class="vhclCurrentInner">
					<tr>
						<td rowspan="5" class="vcTdImg">
						
							<c:choose>
								<c:when test="${ empty vr.vhclImage }">
									<img class="vcImg" src="${pageContext.servletContext.contextPath }/resources/siteImgs/vhclLogo.png">
								</c:when>
								<c:otherwise>
									<img class="vcImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/vehicle/${ vr.vhclImage }">
								</c:otherwise>
							</c:choose>
							
						</td>
						<td class="vcTdContent"><span class="vcContent1">${ vr.vhclModel } ${ vr.vhclNo }</span></td>
					</tr>
					<tr>
						<td class="vcTdContent"><span class="vcContent2">${ vr.vhclPurpose }</span></td>
					</tr>
					<tr>
						<td class="vcTdContent">
							<span class="vcContent3">${ vr.vhclStartDate } ${ vr.vhclStartTime } <br>
							 ~ ${ vr.vhclEndDate } ${ vr.vhclEndTime }</span>
						</td>
					</tr>
					<tr>
						<td class="vcTdContent">
						
							<!-- 오늘 날짜와 비교하는 조건문 주기 -->
							<button class="vcBtn" type="button" onclick="location.href='cancelReserve.ve?vhclReserveNo=${ vr.vhclReserveNo }'">예약 취소</button>
							
						</td>
					</tr>
				</table>
				
			</c:forEach>

			<!-- 페이징바 -->
			<c:if test="${ pi.startPage eq 1 }">
			
				<ul class="pagingBar">
					
	               	<c:choose>
	                	<c:when test="${ pi.currentPage eq 1 }">
	                		<li><a href="#">&lt;&lt;</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li><a href="myReserve.ve?currentPage=${ pi.startPage }">&lt;&lt;</a></li>
	                    </c:otherwise>
					</c:choose>
					
					<c:choose>
	                	<c:when test="${ pi.currentPage eq 1 }">
	                		<li><a href="#">&lt;</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li><a href="myReserve.ve?currentPage=${ pi.currentPage - 1 }">&lt;</a></li>
	                    </c:otherwise>
					</c:choose>
					
	                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                   	<c:choose>
	                   		<c:when test="${ p eq pi.currentPage }">
			                    <li><span>${ p }</span></li>
		                    </c:when>
		                    <c:otherwise>
		                    	<li><a href="myReserve.ve?currentPage=${ p }">${ p }</a></li>
			                </c:otherwise>
						</c:choose>	                    
					</c:forEach>
	
	                <c:choose>
	                   	<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    <li><a href="#">&gt;</a></li>
	                   	</c:when>
	                   	<c:otherwise>
		                    <li><a href="myReserve.ve?currentPage=${ pi.currentPage + 1 }">&gt;</a></li>
		                </c:otherwise>
	                </c:choose>
	                
	                <c:choose>
	                   	<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    <li><a href="#">&gt;&gt;</a></li>
	                   	</c:when>
	                   	<c:otherwise>
		                    <li><a href="myReserve.ve?currentPage=${ pi.endPage }">&gt;&gt;</a></li>
		                </c:otherwise>
	                </c:choose>
					
				</ul>
				
			</c:if>
			<!-- 페이징바 -->

			</div>
		</div>
		
	<br>
	<br>
	</div>

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
		
		/* 취소버튼 클릭 시 모달 닫히는 기능 추가하기 */
		$("#resetBtn").on('click', function(){
			$('#open_reservation').modal("hide");
		});
		
	</script>

</body>
</html>