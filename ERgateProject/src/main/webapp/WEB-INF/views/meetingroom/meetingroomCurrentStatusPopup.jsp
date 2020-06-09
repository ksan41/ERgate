<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	width: 800px;
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
</style>
</head>
<body>
	<!-- 테이블 눌렀을 때 팝업창 나오는거 -->

		<div id="open_reservation" class="modal" style="height: 730px;">
			<div class="modal-title">회의실 예약</div>
			<div class="modal-content">
				<form action="" id="reservationForm" name="reservationForm">
					<table class="reservationContent">
						<tr>
							<td id="r1">신청자</td>
							<td id="r2"><input type="hidden" name="empId"
								value="${ loginUser.empId }"><span>${ loginUser.empName }</span></td>
						</tr>
						<tr>
							<td id="r1">사용기간</td>
							<td id="r2"><input type="date" name="mtrmStartDate"
								class="inputs" style="width: 140px"> <input type="time"
								name="mtrmStartTime" class="inputs" style="width: 120px">
								<img
								src="${ pageContext.servletContext.contextPath }/resources/icons/minus.png"
								id="minusImg"> <input type="date" name="mtrmEndDate"
								class="inputs" style="width: 140px"> <input type="time"
								name="mtrmEndTime" class="inputs" style="width: 120px">
							</td>
						</tr>
						<tr>
							<td id="r1">회의실</td>
							<td id="r2"><select name="mtrmCode" class="inputs"
								style="width: 120px">
									<option>회의실 선택</option>
									<option value="1" selected>3F 회의실</option>
									<option value="2">5F 회의실1</option>
									<option value="3">5F 회의실2</option>
									<option value="4">6F 회의실1</option>
									<option value="5">6F 회의실2</option>
							</select> <br>
								<button id="searchBtn1" class="searchBtn">가용회의실 검색</button> <br>
								<input type="text" id="meetingroomBox" class="inputs"
								style="height: 30px" readonly></td>
						</tr>
						<tr>
							<td id="r1">사용목적</td>
							<td id="r2"><input type="text" placeholder="내용을 입력하세요"
								class="inputs" name="mtrmPurpose" value="${ mr.mtrmPurpose }"></td>
						</tr>
						<tr>
							<td id="r1">참석자(내부)</td>
							<td id="r2">
								<button id="searchBtn2" class="searchBtn" onclick="window.open('meetingroomAddparticipants.jsp','popup_name','_blank')">참석자지정</button>
								<textarea name="inside" cols="60" rows="4" id="partArea" readonly></textarea>
							</td>
						</tr>
						<tr>
							<td id="r3">참석자(외부)</td>
							<td id="r4"><input type="text" name="outside" class="inputs" name=""></td>
						</tr>
					</table>
				</form>
			</div>

			<!-- 예약/취소 버튼 -->
			<div class="btns">
				<button id="reservBtn" type="button">예약하기</button>
				<button id="resetBtn" type="reset" onclick="history.go(0)">취소</button>
			</div>
		</div>




	<!-- 팝업창 자동 사이즈맞춤용 스크립트 -->
	<script>
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