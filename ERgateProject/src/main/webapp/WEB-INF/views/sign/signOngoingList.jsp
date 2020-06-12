<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign ongoing list</title>

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

.pagingBar li>span {
	color: rgb(26, 188, 156);
	border: 1px solid rgb(26, 188, 156);
}

.pagingBar li a:hover {
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



.material-icons{
	font-size:40px;
	vertical-align:middle;
}
.material-icons:hover{
	cursor:pointer;
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
				<li><button class="subBtn" onclick="location.href='waitingList.si?currentPage=1';">결재대기함</button></li>
				<li><button class="subBtn subActive" onclick="location.href='ongoingList.si?currentPage=1';">진행결재함</button></li>
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
			<button class="bigBtn" onclick="location.href='formSelect.si';">기안</button>
			<h2 style="display: inline-block; margin-left: 400px;">
				
				<b id="calYear"></b>년 <b id="calMonth"></b>월<b id="calDay"></b>일
				 
			</h2>
			<br> <br>
			
	<script>
		$(document).ready(function() {
			// 기본적으로 문서 열었을때 오늘날짜 보여지도록 변수에 저장해둠
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth() + 1;				
			var day = date.getDate();
			
			$("#calYear").text(year);
			$("#calMonth").text(month);
			$("#calDay").text(day);
		
			
		});
	</script>			
			
			
			<table class="boardTable">
				<thead>
					<tr>
						<th width="150">상태</th>
						<th width="200">문서분류</th>
						<th width="250">문서번호</th>
						<th width="150">결재자</th>
						<th>제목</th>
						<th width="150">기안일시</th>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${empty list }">
						<td colspan="6" rowspan="10"  class="pageNoClick">조회된 결과가 없습니다.</td>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="l">
							<tr>
								<input type="hidden" name="signTypeNo" value="${l.signTypeNo }">
								<c:if test="${l.signStatus eq 0 }">
									<td>진행중</td>
								</c:if>
								<td>${l.signTypeName }</td>
								<td>${l.documentNo }</td>
								<td>${l.empName }</td>
								<td>${l.signTitle }</td>
								<td>${l.draftDate }</td>
							</tr>
						</c:forEach>
						<c:forEach var="b" begin="1" end="${10-fn:length(list)}">
    						<tr>
							<td class="pageNoClick">&nbsp;</td>
							<td class="pageNoClick">&nbsp;</td>
							<td class="pageNoClick">&nbsp;</td>
							<td class="pageNoClick">&nbsp;</td>
							<td class="pageNoClick">&nbsp;</td>
							<td class="pageNoClick">&nbsp;</td>
						</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			<br>
			
			<script>
				$(function(){
					$(".boardTable>tbody tr").click(function(){
						var documentNo = $(this).children().eq(3).text();
						var signTypeNo = $(this).children().eq(0).val();
						window.open("signDetail.si?documentNo="+ documentNo + "&signTypeNo="+signTypeNo, "ddd",'_blank') ;
						
					});
					
				});
			</script>			
			
			
			<!-- 페이징바 -->
		<c:if test="${!empty pi}">				
						<ul class="pagingBar">
							<li><a href="ongoingList.si?currentPage=1">&lt;&lt;</a></li>
							<c:choose>
								<c:when test="${pi.currentPage eq 1 }">
									<li><a href="#" class="pageNoClick">&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="ongoingList.si?currentPage=${pi.currentPage -1 }">&lt;</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
								<c:choose>
									<c:when test="${pi.currentPage eq p }">
										<li><span>${p}</span>
									</c:when>
									<c:otherwise>
										<li><a href="ongoingList.si?currentPage=${p}">${p}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
	
							<c:choose>
								<c:when test="${pi.currentPage eq pi.maxPage }">
									<li><a href="#" class="pageNoClick">&gt;</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="ongoingList.si?currentPage=${pi.currentPage + 1 }">&gt;</a></li>
								</c:otherwise>
							</c:choose>
							<li><a href="ongoingList.si?currentPage=${pi.maxPage }">&gt;&gt;</a></li>
						</ul>
					<!-- 페이징바 -->
			</c:if>
			<!-- 페이징바 -->
		</div>
	</div>
</body>
</html>