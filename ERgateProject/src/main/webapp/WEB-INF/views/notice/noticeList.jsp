<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList</title>
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

.boardTable tr:hover .haveContent {
	background-color : rgb(224, 224, 224);
	cursor : pointer;
}
.boardTable tr:hover .nonContent {
	cursor : default;
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

/* 검색창 스타일 */
.searchBar{
	margin-left:500px;
}

.searchBar>select {
	height: 36px;
	width: 70px;
	border: 1px solid lightgray;
	border-radius: 3px;
	font-family: inherit;
	display: inline-block;
	vertical-align: top;
}

.searchBar>input {
	padding: 5px;
	width: 280px;
	height: 25px;
	border: 1px solid lightgray;
	border-radius: 3px;
}

.searchBar>svg {
	fill: rgb(26, 188, 156);
	width: 37px;
	display: inline-block;
	vertical-align: bottom;
	height: 100%;
}

.searchBar>svg:hover {
	cursor: pointer;
	opacity: 70%;
}
/* 검색창 스타일 */

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
</style>
</head>
<body>
	<!-- 이곳에 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp" />
	<!-- 이곳에 메뉴바 include -->

	<div class="outer">
		<div class="topBar">
			<!-- 메뉴명 -->
			<span>공지</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
				<li><button class="subBtn subActive">공지사항</button></li>
			</ul>
		</div>
		<div class="contentArea">
			
			<button class="bigBtn insertBoardBtn" onclick="location.href='enrollForm.no?currentPage=${param.currentPage}'">글쓰기</button>

			<!-- 검색바 -->
			<form id="searchForm" action="search.no" method="get">
			<div class="searchBar">
				<select name="condition">
					<option value="boardTitle">제목</option>
					<option value="boardContent">내용</option>
					<option value="boardWriter">작성자</option>
				</select> 
				<input name="keyword" type="text" value="${ keyword }">
				<input type="hidden" name="currentPage" value="1">
				<svg onclick="document.getElementById('searchForm').submit();" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
					fill="black" width="48px" height="48px">
					<path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z" />
					<path d="M0 0h24v24H0z" fill="none" />
				</svg>
			</div>
			</form>
			<!-- 검색바 -->
			
			<script>
			$(function(){
				switch('${condition}'){    
				case "boardTitle" : $("#searchForm option").eq(0).attr("selected", true);  break;
				case "boardContent": $("#searchForm option").eq(1).attr("selected", true);  break;
				case "boardWriter": $("#searchForm option").eq(2).attr("selected", true);  break;
				}
			});
			</script>
			
			<br>
			<!-- 게시판 -->
			<table class="boardTable">
				<thead>
					<tr>
						<th width="150">No.</th>
						<th width="800">제목</th>
						<th width="150">작성자</th>
						<th width="150">작성일</th>
						<th width="150">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="5" rowspan="10" class="nonContent">조회된 게시글이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${ list }" var="n">
								<tr>
									<td class="haveContent">${n.noticeNo }</td>
									<td class="haveContent">${n.noticeTitle }</td>
									<td class="haveContent">${n.noticeWriter }</td>
									<td class="haveContent">${n.noticeEnrollDate }</td>
									<td class="haveContent">${n.noticeCount }</td>
								</tr>
								</c:forEach>
								<c:forEach var="b" begin="1" end="${10-fn:length(list)}">
		    					<tr>
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
			<!-- 게시판 -->
			
			<br>
	
			<!-- 페이징바 -->
			<c:choose>
				<c:when test="${sc eq 1}">
					<!-- 페이징바 -->
					<ul class="pagingBar">
						<li class="pstyle"><a class="pstyle" href="search.no?condition=${condition}&keyword=${keyword}&currentPage=1">&lt;&lt;</a></li>
						<c:choose>
							<c:when test="${ pi.currentPage eq 1 }">
								<li><a class="pstyle disabled" href="#">&lt;</a></li>
							</c:when>
			                <c:otherwise>
			                	<li class="pstyle"><a href="search.no?condition=${condition}&keyword=${keyword}&currentPage=${ pi.currentPage-1 }">&lt;</a></li>
			                </c:otherwise>
			            </c:choose>
			        
			        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			            <c:choose>
		                    <c:when test="${ p eq pi.currentPage }">
		                    	<li><a class="crt disabled" href="#">${p}</a></li>
		                    </c:when>
			                <c:otherwise>
			                    <li class="pstyle"><a href="search.no?condition=${condition}&keyword=${keyword}&currentPage=${ p }">${ p }</a></li>
			                </c:otherwise>
		                </c:choose>
					 </c:forEach>
						
						<c:choose>
			                <c:when test="${ pi.currentPage eq pi.maxPage }">
			                    <li><a class="disabled" href="#">&gt;</a></li>
							</c:when>
				            <c:otherwise>
				                <li class="pstyle"><a href="search.no?condition=${condition}&keyword=${keyword}&currentPage=${ pi.currentPage+1 }">&gt;</a></li>
				            </c:otherwise>
			            </c:choose>
					<li class="pstyle"><a href="search.no?condition=${condition}&keyword=${keyword}&currentPage=${ pi.maxPage }">&gt;&gt;</a></li>
					</ul>
					<!-- 페이징바 -->
				</c:when>
				<c:otherwise>
					<!-- 페이징바 -->
					<ul class="pagingBar">
						<li class="pstyle"><a class="pstyle" href="list.no?currentPage=1">&lt;&lt;</a></li>
						<c:choose>
							<c:when test="${ pi.currentPage eq 1 }">
								<li><a class="pstyle disabled" href="#">&lt;</a></li>
							</c:when>
			                <c:otherwise>
			                	<li class="pstyle"><a href="list.no?currentPage=${ pi.currentPage-1 }">&lt;</a></li>
			                </c:otherwise>
			            </c:choose>
			        
			        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			            <c:choose>
		                    <c:when test="${ p eq pi.currentPage }">
		                    	<li><a class="crt disabled" href="#">${p}</a></li>
		                    </c:when>
			                <c:otherwise>
			                    <li class="pstyle"><a href="list.no?currentPage=${ p }">${ p }</a></li>
			                </c:otherwise>
		                </c:choose>
					 </c:forEach>
						
						<c:choose>
			                <c:when test="${ pi.currentPage eq pi.maxPage }">
			                    <li><a class="disabled" href="#">&gt;</a></li>
							</c:when>
				            <c:otherwise>
				                <li class="pstyle"><a href="list.no?currentPage=${ pi.currentPage+1 }">&gt;</a></li>
				            </c:otherwise>
			            </c:choose>
					<li class="pstyle"><a href="list.no?currentPage=${ pi.maxPage }">&gt;&gt;</a></li>
					</ul>
					<!-- 페이징바 -->
				</c:otherwise>
			</c:choose>
			<!-- 페이징바 -->
		</div>
	</div>
	
	<script>
	$(document).ready(function() { 
		
		$(".boardTable tbody tr").click(function(){
			var nno = $(this).children().eq(0).text();
			if($.trim(nno).length > 0){
				location.href="detail.no?nno=" + nno + "&currentPage=" + ${pi.currentPage};
			}
		});
	});
	
	$('.disabled').click(function () {return false;});
	
	</script>	
	
</body>
</html>