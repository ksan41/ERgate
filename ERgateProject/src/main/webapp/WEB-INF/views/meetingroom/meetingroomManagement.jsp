<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>meetingroomManagement</title>
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

/*등록하기 버튼*/
#enrollBtn {
	width: 140px;
	height: 40px;
	border: 0px;
	border-radius: 5px;
	background: rgb(26, 188, 156); /* 회색 : rgb(190, 190, 190) */
	color: white;
	font-size: 18px;
	margin-left: 990px;
}

#enrollBtn:hover {
	cursor: pointer;
}
/*등록하기 버튼*/
/*등록하기 클릭 시 나오는 내용*/

/*회의실 등록 부분 content*/
.meetingroomEnroll {
	width: 800px;
	height: 500px;
	border-top: 2px solid lightgray;
	border-bottom: 2px solid lightgray;
}

/* 예약하기 버튼*/
.btns {
	margin-left: 30%;
	margin-top: 30px;
}

.reservationBtn {
	width: 140px;
	height: 40px;
	border: 0px;
	border-radius: 5px;
	background: rgb(26, 188, 156); /* 회색 : rgb(190, 190, 190) */
	color: white;
	font-size: 18px;
	margin-left: 50px;
}

.reservationBtn:hover {
	cursor: pointer;
}

/* 취소 버튼 */
.resetBtn {
	width: 140px;
	height: 40px;
	border: 0px;
	border-radius: 5px;
	background: rgb(190, 190, 190);
	color: white;
	font-size: 18px;
}

.resetBtn:hover {
	cursor: pointer;
}

.mrName {
	background-color: lightgray;
	width: 200px;
	height: 50px;
	text-align: center;
	font-weight: 400px;
	font-size: 16px;
	border-bottom: 1px solid lightgray;
}

.mrName2 {
	border-bottom: 1px solid lightgray;
}

.mrLocation {
	background-color: lightgray;
	width: 200px;
	height: 50px;
	text-align: center;
	font-weight: 400px;
	font-size: 16px;
	border-style: none;
}

.mrLocation2 {
	border-bottom: 1px solid lightgray;
}

.mrPersonnel {
	background-color: lightgray;
	width: 200px;
	height: 50px;
	text-align: center;
	font-weight: 400px;
	font-size: 16px;
}

.mrPersonnel2 {
	border-bottom: 1px solid lightgray;
}

.mrImg {
	background-color: lightgray;
	width: 200px;
	height: 50px;
	text-align: center;
	font-weight: 400px;
	font-size: 16px;
}

.meetingroomEnroll input {
	height: 30px;
	width: 350px;
	margin-left: 5px;
}

/*회의실 이미지 관련 css*/
.meetingroomImg {
	width: 100px;
	height: 100px;
	float: left;
}

.profile {
	width: 100px;
	height: 100px;
	object-fit: cover;
	border-radius: 70%;
	float: left;
	overflow: hidden;
	margin-top: 10px;
	margin-left: 20px;
}

/*등록하기 클릭 시 나오는 내용*/

/* 수정하기 클릭 시 나오는 내용*/

/*회의실 등록 부분 content*/
.meetingroomEdit {
	width: 800px;
	height: 500px;
	border-top: 2px solid lightgray;
	border-bottom: 2px solid lightgray;
}

/* 예약하기 버튼*/
.btns {
	margin-left: 30%;
	margin-top: 30px;
}

.editBtn {
	width: 140px;
	height: 40px;
	border: 0px;
	border-radius: 5px;
	background: rgb(26, 188, 156); /* 회색 : rgb(190, 190, 190) */
	color: white;
	font-size: 18px;
	margin-left: 50px;
}

.editBtn:hover {
	cursor: pointer;
}

/* 취소 버튼 */
.deleteBtn {
	width: 140px;
	height: 40px;
	border: 0px;
	border-radius: 5px;
	background: rgb(190, 190, 190);
	color: white;
	font-size: 18px;
}

.deleteBtn:hover {
	cursor: pointer;
}

.mrNameEdit {
	background-color: lightgray;
	width: 200px;
	height: 50px;
	text-align: center;
	font-weight: 400px;
	font-size: 16px;
	border-bottom: 1px solid lightgray;
}

.mrNameEdit2 {
	border-bottom: 1px solid lightgray;
	font-size: 14px;
}

.mrLocationEdit {
	background-color: lightgray;
	width: 200px;
	height: 50px;
	text-align: center;
	font-weight: 400px;
	font-size: 16px;
	border-style: none;
}

.mrLocationEdit {
	border-bottom: 1px solid lightgray;
	font-size: 14px;
}

.mrPersonnelEdit {
	background-color: lightgray;
	width: 200px;
	height: 50px;
	text-align: center;
	font-weight: 400px;
	font-size: 16px;
}

.mrPersonnelEdit2 {
	border-bottom: 1px solid lightgray;
	font-size: 14px;
}

.mrImgEdit {
	background-color: lightgray;
	width: 200px;
	height: 50px;
	text-align: center;
	font-weight: 400px;
	font-size: 16px;
}

.meetingroomEnroll input {
	height: 30px;
	width: 350px;
	margin-left: 5px;
}

.meetingroomImg {
	width: 150px;
	height: 150px;
	float: left;
}

.profile {
	width: 150px;
	height: 150px;
	object-fit: cover;
	border-radius: 50%;
	float: left;
	overflow: hidden;
	margin-top: 10px;
	margin-left: 20px;
}

/* 회의실 목록 */
#mtrmManageOuter {
	width: 1400px;
	height: 500px;
	margin-top: 20px;
	margin-bottom: 20px;
}

.mtrmManageInner {
	width: 520px;
	height: 230px;
	margin-left: 30px;
	margin-right: 30px;
	margin-top: 10px;
	margin-bottom: 10px;
	display: inline-block;
	border: 1px solid rgb(160, 160, 160);
	border-radius: 5px;
	padding-top: 10px;
}

.mmTdImg {
	width: 250px;
	height: 220px;
	text-align: center;
}

.mmImg {
	width: 180px;
	height: 180px;
	border-radius: 50%;
	margin-bottom: 30px;
}

.mmTdContent {
	width: 270px;
	padding-left: 20px;
}

.mmLabel {
	font-weight: 550;
}

.mmBtn {
	width: 180px;
	height: 35px;
	border: 1px solid rgb(160, 160, 160);
	color: rgb(160, 160, 160);
	background: none;
	border-radius: 5px;
	font-size: 16px;
}
/* 회의실 목록 */

/* 페이징바 스타일 */
.pagingBar {
	list-style: none;
	margin-top: 50px;
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
				<li><button class="subBtn" style="width: 170px">회의실 예약현황</button></li>
				<li><button class="subBtn subActive" onclick="open_modal();">회의실관리</button></li>
				<!-- <a id="meetingroomManage" class="open-modal" href="#meetingroomManage" style="display: none;">모달</a> -->
			</ul>
		</div>

		<div class="contentArea">
			<button id="enrollBtn" style="align: right" onclick="open_modal();">등록하기</button>
			<a id="open_enroll" class="open-modal" href="#enroll" style="display: none;">모달</a> <br> 
			
			<div id="mtrmManageOuter">
			
				<table class="mtrmManageInner">
					<tr>
						<td rowspan="5" class="mmTdImg">
							<img class="mmImg" src="${ pageContext.servletContext.contextPath }/resources/siteImg/크기변환_KENN4462-1.jpg">
						</td>
						<td class="mmTdContent"><span class="mmLabel">회의실명</span class="mmContent">&nbsp;&nbsp;&nbsp;&nbsp;<span>3층 회의실1</span></td>
					</tr>
					<tr>
						<td class="mmTdContent"><span class="mmLabel">회의실 위치</span class="mmContent">&nbsp;&nbsp;&nbsp;&nbsp;<span>3층 301호</span></td>
					</tr>
					<tr>
						<td class="mmTdContent"><span class="mmLabel">수용인원</span class="mmContent">&nbsp;&nbsp;&nbsp;&nbsp;<span>최대 6인</span></td>
					</tr>
					<tr>
						<td class="mmTdContent"><span class="mmLabel">등록일</span class="mmContent">&nbsp;&nbsp;&nbsp;&nbsp;<span>2019-04-04</span></td>
					</tr>
					<tr>
						<td class="mmTdContent"><button class="mmBtn" type="button" onclick="open_modal();">수정하기</button>
							
						</td>
						
					</tr>
				</table>
				
				<table class="mtrmManageInner">
					<tr>
						<td rowspan="5" class="mmTdImg">
							<img class="mmImg" src="${ pageContext.servletContext.contextPath }/resources/siteImg/크기변환_KENN4462-1.jpg">
						</td>
						<td class="mmTdContent"><span class="mmLabel">회의실명</span class="mmContent">&nbsp;&nbsp;&nbsp;&nbsp;<span>3층 회의실1</span></td>
					</tr>
					<tr>
						<td class="mmTdContent"><span class="mmLabel">회의실 위치</span class="mmContent">&nbsp;&nbsp;&nbsp;&nbsp;<span>3층 301호</span></td>
					</tr>
					<tr>
						<td class="mmTdContent"><span class="mmLabel">수용인원</span class="mmContent">&nbsp;&nbsp;&nbsp;&nbsp;<span>최대 6인</span></td>
					</tr>
					<tr>
						<td class="mmTdContent"><span class="mmLabel">등록일</span class="mmContent">&nbsp;&nbsp;&nbsp;&nbsp;<span>2019-04-04</span></td>
					</tr>
					<tr>
						<td class="mmTdContent"><button class="mmBtn" type="button">수정하기</button></td>
					</tr>
				</table>
				
				<table class="mtrmManageInner">
					<tr>
						<td rowspan="5" class="mmTdImg">
							<img class="mmImg" src="${ pageContext.servletContext.contextPath }/resources/siteImg/크기변환_KENN4462-1.jpg">
						</td>
						<td class="mmTdContent"><span class="mmLabel">회의실명</span class="mmContent">&nbsp;&nbsp;&nbsp;&nbsp;<span>3층 회의실1</span></td>
					</tr>
					<tr>
						<td class="mmTdContent"><span class="mmLabel">회의실 위치</span class="mmContent">&nbsp;&nbsp;&nbsp;&nbsp;<span>3층 301호</span></td>
					</tr>
					<tr>
						<td class="mmTdContent"><span class="mmLabel">수용인원</span class="mmContent">&nbsp;&nbsp;&nbsp;&nbsp;<span>최대 6인</span></td>
					</tr>
					<tr>
						<td class="mmTdContent"><span class="mmLabel">등록일</span class="mmContent">&nbsp;&nbsp;&nbsp;&nbsp;<span>2019-04-04</span></td>
					</tr>
					<tr>
						<td class="mmTdContent"><button class="mmBtn" type="button">수정하기</button></td>
					</tr>
				</table>
				
				<table class="mtrmManageInner">
					<tr>
						<td rowspan="5" class="mmTdImg">
							<img class="mmImg" src="${ pageContext.servletContext.contextPath }/resources/siteImg/크기변환_KENN4462-1.jpg">
						</td>
						<td class="mmTdContent"><span class="mmLabel">회의실명</span class="mmContent">&nbsp;&nbsp;&nbsp;&nbsp;<span>3층 회의실1</span></td>
					</tr>
					<tr>
						<td class="mmTdContent"><span class="mmLabel">회의실 위치</span class="mmContent">&nbsp;&nbsp;&nbsp;&nbsp;<span>3층 301호</span></td>
					</tr>
					<tr>
						<td class="mmTdContent"><span class="mmLabel">수용인원</span class="mmContent">&nbsp;&nbsp;&nbsp;&nbsp;<span>최대 6인</span></td>
					</tr>
					<tr>
						<td class="mmTdContent"><span class="mmLabel">등록일</span class="mmContent">&nbsp;&nbsp;&nbsp;&nbsp;<span>2019-04-04</span></td>
					</tr>
					<tr>
						<td class="mmTdContent"><button class="mmBtn" type="button" onclick="">수정하기</button></td> <!-- 모달로 수정하기 페이지 열기 -->
					</tr>
				</table>
				
			</div>
			
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



	<!-- 모달팝업 (head부분에 링크들도 복사해주셔야합니다)
		모달 사용시엔 메뉴바를 head맨 윗부분에 include해주셔야 합니다.
	 -->

	<!-- 모달 타겟. href의 #xxx와 모달영역의 id(xxx)가 한셋트입니다.
		용도에 따라 href와 id는 변경해주세요.(여러개 가능)
		모달타겟으로 쓸 요소에 class와 href 복사해주세요.
	 -->
		


		<div id="enroll" class="modal">
			<div class="modal-title">회의실 등록</div>
			<div class="modal-content">
			<a class="open-modal" href="#modal-form"></a> <br>
			
				<div>
					<table class="meetingroomEnroll">
						<tr>
							<td class="mrName">회의실 명</td>
							<td class="mrName2"><input type="text"></td>
						</tr>

						<tr>
							<td class="mrLocation">회의실 위치</td>
							<td class="mrLocation2"><input type="text"></td>
						</tr>

						<tr>
							<td class="mrPersonnel">최대 수용인원</td>
							<td class="mrPersonnel2"><input type="text"></td>
						</tr>

						<tr>
							<td class="mrImg">회의실 이미지</td>
							<td class="mrImg2">
								<div class="meetingroomImg">
									<img class="mcImg" src="${ pageContext.servletContext.contextPath }/resources/siteImg/크기변환_KENN4462-1.jpg">
								</div>
							</td>
						</tr>


					</table>
				</div>
				<!-- 예약/취소 버튼 -->
				<div class=btns>
					<button class="reservationBtn" type="submit">등록하기</button>
					<button class="resetBtn" type="reset">삭제하기</button>
				</div>


			</div>
		</div>
		
		
		
		<!-- 수정하기 부분 내용 -->




		<div id="edit" class="modal">
			<div class="modal-title">회의실 수정</div>
			<div class="modal-content">

			<div>
                <table class="meetingroomEdit">
                    <tr>
                        <td class="mrNameEdit">회의실 명</td>
                        <td class="mrNameEdit2"> <input type="text" value="  &nbsp;3층 회의실1"></td>
                    </tr>

                    <tr>
                        <td class="mrLocationEdit">회의실 위치</td>
                        <td class="mrLocationEdit2"><input type="text" value="  &nbsp; 3층"> </td>
                    </tr>

                    <tr>
                        <td class="mrPersonnelEdit">최대 수용인원</td>
                        <td class="mrPersonnelEdit2"><input type="text" value="  &nbsp; 6명"> </td>
                    </tr>

                    <tr>
                        <td class="mrImgEdit">회의실 이미지</td>
                        <td class="mrImgEdit2"> 
                            <div class="meetingroomImg">
                                <img class="profile" src="크기변환_KENN4462-1.jpg">
                            </div> 
                    </td>
                    </tr>
                  
                    
                </table>
            </div>
                    <!-- 예약/취소 버튼 -->
			<div class=btns>
				<button class="editBtn" type="submit">수정하기</button>
				<button class="deleteBtn" type="reset">삭제하기</button>
			</div>



</div>
			<a id="open_edit" class="open-modal" href="#edit" style="display: none;">모달</a> <br> 
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<!-- 모달용 스크립트 -->
		<script>
			$('.open-modal').click(function() {
				$(this).modal({
					fadeDuration : 150
				});

			});
			
			/* 등록하기 모달 여는 function */
			function open_modal() {
				$("#open_enroll").click();
			};
			
			



		</script>

	</div>




</body>
</html>