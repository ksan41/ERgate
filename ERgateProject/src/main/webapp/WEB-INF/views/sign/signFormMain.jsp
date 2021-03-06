<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign form main</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
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
.selectArea {
	background: white;
	width: 920px;
	height: 450px;
	padding: 20px;
}

.selectDiv {
	margin-left: 25px;
	margin-right: 25px;
	float: left;
	width: 250px;
	height: 300px;
	border: 2px solid lightgray;
}

.selectDiv:hover {
	cursor: pointer;
	opacity: 70%;
}

.material-icons {
	font-size: 150px;
	color: rgb(190, 190, 190);
	display: table;
	margin:auto;
	margin-top:30px;
}
</style>
</head>
<body>
	<!-- 이곳에 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp" />
	<!-- 이곳에 메뉴바 include -->

	<div class="outer">
		<div class="topBar">
			<!-- 메뉴명 -->
			<span>전자결재</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
				<li><button class="subBtn" onclick="location.href='waitingList.si?currentPage=1';">결재대기함</button></li>
				<li><button class="subBtn" onclick="location.href='ongoingList.si?currentPage=1';">진행결재함</button></li>
				<li><button class="subBtn" onclick="location.href='reportList.si?currentPage=1';">상신내역</button></li>
				<c:if test="${loginUser.deptCode eq 'D2' }">
					<li><button class="subBtn"
							onclick="location.href='expenseList.si?currentPage=1';">지출결의내역</button></li>
				</c:if>
				<c:if test="${loginUser.deptCode eq 'D5' }">
					<li><button class="subBtn" onclick="location.href='hrList.si?currentPage=1'">외근&휴가내역</button></li>
				</c:if>		
			</ul>
		</div>
		<div class="contentArea">
			<button class="bigBtn" onclick="location.href='reportList.si?currentPage=1';">상신내역으로</button>
			<br> <br> <br>
			<div class="selectArea">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※문서 양식을 선택해주세요.</p>
				<br>
				<div id="selectAnnual" class="selectDiv" onclick="location.href='annualForm.si?empId=${loginUser.empId}';">
					<span class="material-icons"> emoji_food_beverage </span>
					<h2 align="center">휴가계</h2>
				</div>
				<div id="selectExpense" class="selectDiv" onclick="location.href='expenseForm.si';">
					<span class="material-icons"> account_balance_wallet </span>
					<h2 align="center">지출결의서</h2>
				</div>
				<div id="selectBusiness" class="selectDiv" onclick="location.href='businessForm.si';">
					<span class="material-icons"> work </span>
					<h2 align="center">외근신청서</h2>
				</div>
			</div>

		</div>
	</div>
</body>
</html>