<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>meetingroomCurrentStatus</title>

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
	#searchBtn1{
		width: 120px;
		margin-top: 17px;
		margin-right: 10px;
	}
	#searchBtn2{
		width: 90px;
	}
	#partArea{
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
	
	.mtrmCurrentInner{
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
	.mcTdImg{
		width: 200px;
		height: 200px;
		text-align: center;
	}
	.mcImg{
		width: 160px;
		height: 160px;
		border-radius: 50%;
		margin-bottom: 30px;
	}
	.mcTdContent{
		width: 220px;
		padding-left: 10px;
	}
	.mcContent1{
		font-weight: 550;
		font-size: 18px;
	}
	.mcContent2{
		margin-top: 10px;
	}
	.mcContent3{
		line-height: 140%;
	}
	.mcBtn{
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

	<!-- 메뉴바 -->

	<div class="outer">
		<div class="topBar">
			<!-- 메뉴명 -->
			<span>회의실</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
				<li><button class="subBtn subActive">회의실 예약</button></li>
			</ul>
		</div>
		<div class="contentArea">

			<button id="reservationBtn">예약하기</button>
			<a  id="reservation" class="open-modal" href="#open_reservation" style="display: none;">모달</a> <br> 
			<a  id="myReservation" class="open-modal" href="#myReservation_open_modal">나의 예약 현황</a>

		</div>

		<!-- 캘린더 api 쓸거임 -->

		<!-- 모달~모달~ 핵어렵 -->
		<!-- 모달 내용(예약하기 부분) -->
		<div id="open_reservation" class="modal" style="height: 730px;">
			<div class="modal-title">회의실 예약</div>
			<div class="modal-content">
				<table class="reservationContent">
					<tr>
						<td id="r1">신청자</td>
						<td id="r2">케빈</td>
					</tr>
					<tr>
						<td id="r1">사용기간</td>
						<td id="r2">
							<form name="" action="" method="post">
								<input type="date" class="inputs" style="width:140px">
								<input type="time" class="inputs" style="width:120px">
								<img src="${ pageContext.servletContext.contextPath }/resources/icons/minus.png" id="minusImg">
								<input type="date" class="inputs" style="width:140px">
								<input type="time" class="inputs" style="width:120px">
							</form>
						</td>
					</tr>
					<tr>
						<td id="r1">회의실</td>
						<td id="r2">
							<select name="meetingroom" class="inputs" style="width:120px">
								<option selected>회의실 선택</option>
								<option>5F 회의실1</option>
								<option>5F 회의실2</option>
								<option>5F 회의실3</option>
								<option>6F회의실</option>
							</select>
							<br>
							<button id="searchBtn1" class="searchBtn">가용회의실 검색</button> 
							<br> 
							<input type="text" id="meetingroomBox" class="inputs" style="height:30px" readonly>
						</td>
					</tr>
					<tr>
						<td id="r1">사용목적</td>
						<td id="r2">
							<input type="text" placeholder="내용을 입력하세요" class="inputs">
						</td>
					</tr>
					<tr>
						<td id="r1">참석자(내부)</td>
						<td id="r2"><button id="searchBtn2" class="searchBtn" onclick="window.open('meetingroomAddparticipants.jsp','popup_name','_blank')">참석자 지정</button>
							<textarea cols="60" rows="4" id="partArea" readonly></textarea>
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
				<button id="resetBtn" type="reset">취소</button>
			</div>
		</div>


		<!-- 모달(나의 예약 현황) -->
		<div id="myReservation_open_modal" class="modal">
			<div class="modal-title">나의 예약현황</div>
			<div class="modal-content">
			
				<table class="mtrmCurrentInner">
					<tr>
						<td rowspan="5" class="mcTdImg">
							<img class="mcImg" src="${ pageContext.servletContext.contextPath }/resources/siteImg/크기변환_KENN4462-1.jpg">
						</td>
						<td class="mcTdContent"><span class="mcContent1">3층 회의실1</span></td>
					</tr>
					<tr>
						<td class="mcTdContent"><span class="mcContent2">팀 미팅</span></td>
					</tr>
					<tr>
						<td class="mcTdContent">
							<span class="mcContent3">2020-05-05 09:00 <br>
							 ~ 2020-05-05 12:00</span>
						</td>
					</tr>
					<tr>
						<td class="mcTdContent"><button class="mcBtn" type="button">예약 취소</button></td>
					</tr>
				</table>
				
				<table class="mtrmCurrentInner">
					<tr>
						<td rowspan="5" class="mcTdImg">
							<img class="mcImg" src="${ pageContext.servletContext.contextPath }/resources/siteImg/크기변환_KENN4462-1.jpg">
						</td>
						<td class="mcTdContent"><span class="mcContent1">3층 회의실1</span></td>
					</tr>
					<tr>
						<td class="mcTdContent"><span class="mcContent2">팀 미팅</span></td>
					</tr>
					<tr>
						<td class="mcTdContent">
							<span class="mcContent3">2020-05-05 09:00 <br>
							 ~ 2020-05-05 12:00</span>
						</td>
					</tr>
					<tr>
						<td class="mcTdContent"><button class="mcBtn" type="button">예약 취소</button></td>
					</tr>
				</table>
				
				<table class="mtrmCurrentInner">
					<tr>
						<td rowspan="5" class="mcTdImg">
							<img class="mcImg" src="${ pageContext.servletContext.contextPath }/resources/siteImg/크기변환_KENN4462-1.jpg">
						</td>
						<td class="mcTdContent"><span class="mcContent1">3층 회의실1</span></td>
					</tr>
					<tr>
						<td class="mcTdContent"><span class="mcContent2">팀 미팅</span></td>
					</tr>
					<tr>
						<td class="mcTdContent">
							<span class="mcContent3">2020-05-05 09:00 <br>
							 ~ 2020-05-05 12:00</span>
						</td>
					</tr>
					<tr>
						<td class="mcTdContent"><button class="mcBtn" type="button">예약 취소</button></td>
					</tr>
				</table>
				
				<table class="mtrmCurrentInner">
					<tr>
						<td rowspan="5" class="mcTdImg">
							<img class="mcImg" src="${ pageContext.servletContext.contextPath }/resources/siteImg/크기변환_KENN4462-1.jpg">
						</td>
						<td class="mcTdContent"><span class="mcContent1">3층 회의실1</span></td>
					</tr>
					<tr>
						<td class="mcTdContent"><span class="mcContent2">팀 미팅</span></td>
					</tr>
					<tr>
						<td class="mcTdContent">
							<span class="mcContent3">2020-05-05 09:00 <br>
							 ~ 2020-05-05 12:00</span>
						</td>
					</tr>
					<tr>
						<td class="mcTdContent"><button class="mcBtn" type="button">예약 취소</button></td>
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
				<li><a href="#">&gt;</a></li>
				<li><a href="#">&gt;&gt;</a></li>
			</ul>
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
	</script>

</body>
</html>