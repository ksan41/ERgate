<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign expense list</title>

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

/* 페이징바 스타일 */
.pagingBar {
	list-style: none;
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

.pagingBar .pstyle>span {
	color: rgb(26, 188, 156);
	border: 1px solid rgb(26, 188, 156);
}

.pagingBar .pstyle a:hover {
	color: rgb(26, 188, 156);
	border: 1px solid rgb(26, 188, 156);
}

.pagingBar li .crt{
	color: rgb(26, 188, 156);
	border: 1px solid rgb(26, 188, 156);
}

/* 페이징바 스타일 */

/* 게시판 스타일 */
.boardTable {
	width: 1400px;
	height: 400px;
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
	height: 35px;
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

.boardTable tr:hover .nonContent {
	pointer-events: none;
}

/* 게시판 스타일 */

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

/* 체크박스 스타일 */
.checkBox {
	zoom: 1.7;
}

/* 스케줄관련 아이콘스타일 */
.schedule_icons {
	fill: rgb(190, 190, 190); /* 검은색 : rgb(94, 94, 94)*/
	width: 35px;
	vertical-align: bottom;
}
/* 스케줄관련 아이콘스타일 */
.material-icons {
	font-size: 40px;
	vertical-align: middle;
}

.material-icons:hover {
	cursor: pointer;
}

.pageNoClick{
	pointer-events: none;
    cursor: default;
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
				<li><button class="subBtn"
						onclick="location.href='waitingList.si?currentPage=1';">결재대기함</button></li>
				<li><button class="subBtn"
						onclick="location.href='ongoingList.si?currentPage=1';">진행결재함</button></li>
				<li><button class="subBtn"
						onclick="location.href='reportList.si?currentPage=1';">상신내역</button></li>
						
				<c:if test="${loginUser.deptCode eq 'D2' }">
					<li><button class="subBtn subActive"
							onclick="location.href='expenseList.si?currentPage=1';">지출결의내역</button></li>
				</c:if>
				<c:if test="${loginUser.deptCode eq 'D5' }">
					<li><button class="subBtn">외근&휴가내역</button></li>
				</c:if>		
			</ul>
		</div>
		<div class="contentArea">
			<h2 style="display: inline-block; margin-left: 530px;">
				<span id="arrowLeft" class="material-icons"> arrow_left </span> 

						<b id="calYear"></b>년 <b id="calMonth"></b>월
				
				<svg class="schedule_icons" xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 24 24" fill="black" width="48px" height="48px">
				<path
						d="M20 3h-1V1h-2v2H7V1H5v2H4c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 18H4V8h16v13z" />
				<path d="M0 0h24v24H0z" fill="none" /></svg>
				<span id="arrowRight" class="material-icons"> arrow_right </span>
			</h2>
			
			<form id="changeMonthForm" action="expenseListM.si" method="get">
				<input type="hidden" name="year">
				<input type="hidden" name="month">
				<input type="hidden" name="currentPage" value="1">
			</form>
			
	<script>
		$(document).ready(function() {
			// 기본적으로 문서 열었을때 오늘날짜 보여지도록 변수에 저장해둠
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth() + 1;				
			
			// 날짜 변경시 갱신될 년월
			var newYear = "<c:out value='${sds.year}'/>";
			var newMonth = "<c:out value='${sds.month}'/>";		
			
			if(newYear != ""){ // 날짜 변경값 있을경우
				$("#calYear").text(newYear);
				$("#calMonth").text(newMonth);
			}else{ // 처음 페이지 요청했을경우
				$("#calYear").text(year);
				$("#calMonth").text(month);
			}
			
			// 이전버튼 눌렀을 경우
			$("#arrowLeft").click(function() {
				month = month - 1;
				if (month < 1) {
					month = 12;
					year = year - 1;
				}
				$("#calMonth").text(month);
				$("#calYear").text(year);
				
				$("input[name=month]").attr("value",month);
				$("input[name=year]").attr("value",year);
				
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
				
				$("#changeMonthForm").submit();

			});
			
			// 다음버튼 눌렀을경우
			$("#arrowRight").click(function() {
				month = parseInt(month) + 1;
				if (month > 12) {
					month = 1;
					year = parseInt(year) + 1;
				}
				$("#calMonth").text(month);
				$("#calYear").text(year);
				
				$("input[name=month]").attr("value",month);
				$("input[name=year]").attr("value",year);
				
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
				
				$("#changeMonthForm").submit();
			});

		});
		
		
	</script>
			
			
			<br> <br>

			<table class="boardTable">
				<thead>
					<tr>
						<th>상태</th>
						<th width="130">문서분류</th>
						<th width="130">문서번호</th>
						<th>기안부서</th>
						<th>기안자</th>
						<th>결재자</th>
						<th width="400">제목</th>
						<th>기안일시</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${ empty list }">
						<tr>
							<td colspan="8" rowspan="10">조회된 결과가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="l">
							<tr>
								<c:choose>
									<c:when test="${l.signStatus eq 0 }">
										<td>진행중</td>
									</c:when>
									<c:when test="${l.signStatus eq 1 }">
										<td>결재완료</td>
									</c:when>
									<c:otherwise>
										<td>미결</td>
									</c:otherwise>
								</c:choose>
								<td>지출결의서</td>
								<td>${l.documentNo }</td>
								<td>${l.deptTitle }</td>
								<td>${l.empName }</td>
								<td>결재자</td>
								<td>${l.signTitle }</td>
								<td>${l.draftDate }</td>
							</tr>
						</c:forEach>
						<c:forEach var="b" begin="1" end="${10-fn:length(list)}">
    						<tr>
							<td class="nonContent">&nbsp;</td>
							<td class="nonContent">&nbsp;</td>
							<td class="nonContent">&nbsp;</td>
							<td class="nonContent">&nbsp;</td>
							<td class="nonContent">&nbsp;</td>
							<td class="nonContent">&nbsp;</td>
							<td class="nonContent">&nbsp;</td>
							<td class="nonContent">&nbsp;</td>
						</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			
			<script>
				$(function(){
					$(".boardTable>tbody tr").click(function(){
						var documentNo = $(this).children().eq(2).text();					
						window.open("signDetail.si?documentNo="+ documentNo + "&signTypeNo=0", "ddd",'_blank') ;
						
					});
					
				});
			</script>
			
			<br>
			<!-- 페이징바 -->
			<c:if test="${!empty pi}">
				<c:choose>
					<c:when test="${empty sds }">
						<ul class="pagingBar">
							<li><a href="expenseList.si?currentPage=1">&lt;&lt;</a></li>
							<c:choose>
								<c:when test="${pi.currentPage eq 1 }">
									<li><a href="#" class="pageNoClick">&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="expenseList.si?currentPage=${pi.currentPage -1 }">&lt;</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
								<c:choose>
									<c:when test="${pi.currentPage eq p }">
										<li><span>${p}</span>
									</c:when>
									<c:otherwise>
										<li><a href="expenseList.si?currentPage=${p}">${p}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
	
							<c:choose>
								<c:when test="${pi.currentPage eq pi.maxPage }">
									<li><a href="#" class="pageNoClick">&gt;</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="expenseList.si?currentPage=${pi.currentPage + 1 }">&gt;</a></li>
								</c:otherwise>
							</c:choose>
							<li><a href="expenseList.si?currentPage=${pi.maxPage }">&gt;&gt;</a></li>
						</ul>
						<!-- 페이징바 -->
					</c:when>
					<c:otherwise>
						<ul class="pagingBar">
							<li><a href="expenseListM.si?currentPage=1?year=${sds.year }?month=${sds.month}">&lt;&lt;</a></li>
							<c:choose>
								<c:when test="${pi.currentPage eq 1 }">
									<li><a href="#" class="pageNoClick">&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="expenseListM.si?currentPage=${pi.currentPage -1 }?year=${sds.year }?month=${sds.month}">&lt;</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
								<c:choose>
									<c:when test="${pi.currentPage eq p }">
										<li><span>${p}</span>
									</c:when>
									<c:otherwise>
										<li><a href="expenseListM.si?currentPage=${p}?year=${sds.year }?month=${sds.month}">${p}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
	
							<c:choose>
								<c:when test="${pi.currentPage eq pi.maxPage }">
									<li><a href="#" class="pageNoClick">&gt;</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="expenseListM.si?currentPage=${pi.currentPage + 1 }?year=${sds.year }?month=${sds.month}">&gt;</a></li>
								</c:otherwise>
							</c:choose>
							<li><a href="expenseListM.si?currentPage=${pi.maxPage }?year=${sds.year }?month=${sds.month}">&gt;&gt;</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</c:if>




		</div>
	</div>


</body>
</html>