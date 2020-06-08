<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>vehicleManagement</title>
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
	
	/* 모달팝업 스타일 */
	.modal {
		width: 850px;
		max-width: 2000px;
		height: 650px; /* 모달 크기지정 */
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
	

/* ==========페이지영역========== */
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

	/* 회의실 목록 */
	#vhclManageOuter {
		width: 1400px;
		height: 500px;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	.vhclManageInner {
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
	.vmTdImg {
		width: 250px;
		height: 220px;
		text-align: center;
	}
	.vmImg {
		width: 180px;
		height: 180px;
		border-radius: 50%;
		margin-bottom: 30px;
	}
	.vmTdContent {
		width: 270px;
		padding-left: 20px;
	}
	.vmLabel {
		font-weight: 550;
	}
	.vmBtn {
		width: 180px;
		height: 35px;
		border: 1px solid rgb(160, 160, 160);
		color: rgb(160, 160, 160);
		background: none;
		border-radius: 5px;
		font-size: 16px;
	}
	/* 회의실 목록 */
		
	/* 수정하기 버튼*/
	.btns {
		margin-left: 30%;
		margin-top: 30px;
	}
	
/* ==========모달 공통 CSS ========== */
	
	/* 공통 */
	.vehicleModalTable {
		width: 100%;
		height: auto;
		margin-top: 10px;
		border-collapse: collapse;
		border-bottom: 3px solid lightgray;
		border-top: 3px solid #dddd;
		border-left: none;
		border-right: none;
	}
	.vmModalInput{
		margin-left: 20px;
		margin-top: 10px;
		margin-bottom: 10px;
		width: 300px;
		height: 30px;
		border: 1px solid lightgray;
		border-radius: 3px;
		padding-left: 10px;
		font-size: 16px;
	}
	.vmName, .vmLocation, .vmPersonnel, .vmImgEnroll{
		background-color: #eeee;
	}
	.vmName {
		width: 200px;
		height: 50px;
		text-align: center;
		font-weight: 400px;
		font-size: 16px;
		border-bottom: 1px solid rgb(190, 190, 190);
	}
	.vmName2 {
		border-bottom: 1px solid lightgray;
	}
	.vmLocation {
		width: 200px;
		height: 50px;
		text-align: center;
		font-weight: 400px;
		font-size: 16px;
		border-style: none;
		border-bottom: 1px solid rgb(190, 190, 190);
	}
	.vmLocation2 {
		border-bottom: 1px solid lightgray;
	}
	.vmPersonnel {
		width: 200px;
		height: 50px;
		text-align: center;
		font-weight: 400px;
		font-size: 16px;
		border-bottom: 1px solid rgb(190, 190, 190);
	}
	.vmPersonnel2 {
		border-bottom: 1px solid lightgray;
	}
	.vmImgEnroll1 {
		width: 200px;
		height: 50px;
		text-align: center;
		font-weight: 400px;
		font-size: 16px;
	}

	/* 등록, 수정 버튼 */
	.vmSubmitBtn {
		width: 140px;
		height: 40px;
		border: 0px;
		border-radius: 5px;
		background: rgb(26, 188, 156);
		color: white;
		font-size: 18px;
		margin-left: 30px;
	}
	/* 취소 버튼 */
	.vmResetBtn {
		width: 140px;
		height: 40px;
		border: 0px;
		border-radius: 5px;
		background: rgb(190, 190, 190);
		color: white;
		font-size: 18px;
	}
	button:hover {
		cursor: pointer;
	}
	
	/* 공통 */
/* ==========모달 공통 CSS ========== */

	
/* ==========회의실 등록 모달========== */

	#vmImgEnroll{
		width: 200px;
		height: 200px;
		border-radius: 50%;
		margin-bottom: 20px;	
		margin-top: 20px;
		margin-left: 20px;
	}
/* ==========회의실 등록 모달========== */
	
/* ==========회의실 수정 모달========== */

	#vmImgEdit{
		width: 200px;
		height: 200px;
		border-radius: 50%;
		margin-bottom: 20px;	
		margin-top: 20px;
		margin-left: 20px;
	}
	
/* ==========회의실 수정 모달========== */


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
				<li><button class="subBtn" onclick="location.href='currentStatus.ve'">업무차량 예약</button></li>
				<li><button class="subBtn" style="width: 170px" onclick="location.href='reserveList.ve'">업무차량 예약현황</button></li>
				<li><button class="subBtn subActive" onclick="location.href='vehicleList.ve?currentPage=1'">업무차량 관리</button></li>
				
			</ul>
		</div>

		<div class="contentArea">
			<button id="enrollBtn" style="align: right" onclick="open_modal();">등록하기</button>
			<a id="open_enroll" class="open-modal" href="#enroll" style="display: none;">모달</a> <br> 
			
			<div id="vhclManageOuter">
			
			<c:forEach items="${ list }" var="v">
			
				<table class="vhclManageInner">
					<tr>
						<td rowspan="5" class="vmTdImg">
							
							<c:choose>
								<c:when test="${ empty v.vhclImage }">
									<img class="vmImg" src="${pageContext.servletContext.contextPath }/resources/siteImgs/vhclLogo.png">
								</c:when>
								<c:otherwise>
									<img class="vmImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/vehicle/${ v.vhclImage }">
								</c:otherwise>
								
							</c:choose>
						</td>
						<td class="vmTdContent">
							<span class="vmLabel">차종</span>&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="vmContent">${ v.vhclModel }</span>
						</td>
					</tr>
					<tr>
						<td class="vmTdContent">
							<span class="vmLabel">차량 번호</span>&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="vmContent">${ v.vhclNo }</span>
						</td>
					</tr>
					<tr>
						<td class="vmTdContent">
							<span class="vmLabel">최대 탑승인원</span>&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="vmContent">${ v.vhclCapacity }명</span>
						</td>
					</tr>
					<tr>
						<td class="vmTdContent">
							<span class="vmLabel">등록일</span>&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="vmContent">${ v.vhclEnrollDate }</span>
						</td>
					</tr>
					<tr>
						<td class="vmTdContent">
							<button class="vmBtn" type="button" onclick="open_modal2();">수정하기</button>
							<a id="open_edit" class="open-modal" href="#edit" style="display: none;">모달</a> <br>
						</td>
					</tr>
				</table>
				
			</c:forEach>
				
			</div>
			
			<!-- 페이징바 -->
			<ul class="pagingBar">
				
               	<c:choose>
                	<c:when test="${ pi.currentPage eq 1 }">
                		<li><a href="#">&lt;&lt;</a></li>
                    </c:when>
                    <c:otherwise>
                    	<li><a href="vehicleList.ve?currentPage=${ pi.startPage }">&lt;&lt;</a></li>
                    </c:otherwise>
				</c:choose>
				
				<c:choose>
                	<c:when test="${ pi.currentPage eq 1 }">
                		<li><a href="#">&lt;</a></li>
                    </c:when>
                    <c:otherwise>
                    	<li><a href="vehicleList.ve?currentPage=${ pi.currentPage - 1 }">&lt;</a></li>
                    </c:otherwise>
				</c:choose>
				
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                   	<c:choose>
                   		<c:when test="${ p eq pi.currentPage }">
		                    <li><span>${ p }</span></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li><a href="vehicleList.ve?currentPage=${ p }">${ p }</a></li>
		                </c:otherwise>
					</c:choose>	                    
				</c:forEach>

                <c:choose>
                   	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    <li><a href="#">&gt;</a></li>
                   	</c:when>
                   	<c:otherwise>
	                    <li><a href="vehicleList.ve?currentPage=${ pi.currentPage + 1 }">&gt;</a></li>
	                </c:otherwise>
                </c:choose>
                
                <c:choose>
                   	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    <li><a href="#">&gt;&gt;</a></li>
                   	</c:when>
                   	<c:otherwise>
	                    <li><a href="vehicleList.ve?currentPage=${ pi.endPage }">&gt;&gt;</a></li>
	                </c:otherwise>
                </c:choose>
				
			</ul>
			<!-- 페이징바 -->
			
		</div>

		<!-- 모달팝업 (head부분에 링크들도 복사해주셔야합니다) 모달 사용시엔 메뉴바를 head맨 윗부분에 include해주셔야 합니다. -->
		<!-- 모달 타겟. href의 #xxx와 모달영역의 id(xxx)가 한셋트입니다. 용도에 따라 href와 id는 변경해주세요.(여러개 가능) 모달타겟으로 쓸 요소에 class와 href 복사해주세요. -->
		<div id="enroll" class="modal">
			<div class="modal-title">업무차량 등록</div>
			<div class="modal-content">
			<a class="open-modal" href="#modal-form"></a>
			<form action="insert.ve" method="post" enctype="multipart/form-data">
				<div>
					<table class="vehicleModalTable">
						<tr>
							<td class="vmName">차종</td>
							<td class="vmName2">
								<input name="vhclModel" class="vmModalInput" type="text">
							</td>
						</tr>
						<tr>
							<td class="vmLocation">차량 번호</td>
							<td class="vmLocation2">
								<input name="vhclNo" class="vmModalInput" type="text">
							</td>
						</tr>
						<tr>
							<td class="vmPersonnel">최대 탑승인원</td>
							<td class="vmPersonnel2">
								<input name="vhclCapacity" class="vmModalInput" type="text">
							</td>
						</tr>
						<tr>
							<td class="vmImgEnroll1">차량 이미지</td>
							<td class="vmImgEnroll2">
								<img id="vmImgEnroll" src="${ pageContext.servletContext.contextPath }/resources/siteImgs/vhclLogo.png">
							</td>
						</tr>
					</table>
				</div>
				<!-- 예약/취소 버튼 -->
				<div class=btns>
					<button class="vmSubmitBtn" type="submit">등록하기</button>
					<button class="vmResetBtn" type="reset">취소</button>
				</div>
				
				<div id="fileArea">
					<input type="file" name="uploadFile" id="fileInput" onchange="loadImg(this, 1);">
				</div>
			</form>
			</div>
		</div>
		
		
		
		<!-- 수정하기 모달 -->
		<div id="edit" class="modal">
			<div class="modal-title">업무차량 수정</div>
			<div class="modal-content">
			<form action="update.ve" method="post" enctype="multipart/form-data">
				<div>
	                <table class="vehicleModalTable">
	                    <tr>
							<td class="vmName">차종</td>
							<td class="vmName2"><input class="vmModalInput" type="text" value="${ v.vhclModel }"></td>
						</tr>
						<tr>
							<td class="vmLocation">차량 번호</td>
							<td class="vmLocation2"><input class="vmModalInput" type="text" value="${ v.vhclNo }"></td>
						</tr>
						<tr>
							<td class="vmPersonnel">최대 탑승인원</td>
							<td class="vmPersonnel2"><input class="vmModalInput" type="text" value="${ v.vhclCapacity }"></td>
						</tr>
						<tr>
							<td class="vmImgEnroll1">차량 이미지</td>
							<td class="vmImgEnroll2">
								
								<c:choose>
									<c:when test="${ empty v.vhclImage }">
										<img id="vmImgEdit" src="${pageContext.servletContext.contextPath }/resources/siteImgs/vhclLogo.png">
									</c:when>
									<c:otherwise>
										<img id="vmImgEdit" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/vehicle/${ v.vhclImage }">
									</c:otherwise>
								</c:choose>
								
							</td>
						</tr>
	                </table>
	            </div>
                <!-- 예약/취소 버튼 -->
				<div class=btns>
					<button class="vmSubmitBtn" type="submit">수정하기</button>
					<button class="vmResetBtn" type="reset">삭제하기</button>
				</div>

				<div id="fileArea2">
					<input type="file" name="reUploadFile" id="fileInput2" onchange="loadImg2(this, 1);">
				</div>
			</form>
			</div>
			<a id="open_edit" class="open-modal" href="#edit" style="display: none;">모달</a> <br> 
		</div>

	</div>
	
	
    <!-- 사진 첨부 -->
    <script>
		$(function(){
			$("#fileArea").hide();
			
			$("#vmImgEnroll").click(function(){
				$("#fileInput").click();
			});
		});
	
		function loadImg(inputFile, num){

			if(inputFile.files.length == 1){
				
				var reader = new FileReader();
				
				reader.readAsDataURL(inputFile.files[0]);
				
				reader.onload = function(e){
					switch(num){
						case 1: $("#vmImgEnroll").attr("src", e.target.result); break;
					}
				};
			}
		}
	</script>
	
	<!-- 사진 첨부 (수정) -->
    <script>
		$(function(){
			$("#fileArea2").hide();
			
			$("#vmImgEdit").click(function(){
				$("#fileInput2").click();
			});
		});
	
		function loadImg2(inputFile, num){

			if(inputFile.files.length == 1){
				
				var reader = new FileReader();
				
				reader.readAsDataURL(inputFile.files[0]);
				
				reader.onload = function(e){
					switch(num){
						case 1: $("#vmImgEdit").attr("src", e.target.result); break;
					}
				};
			}
		}
	</script>
		
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
		
		function open_modal2() {
			$("#open_edit").click();
		};

	</script>

</body>
</html>