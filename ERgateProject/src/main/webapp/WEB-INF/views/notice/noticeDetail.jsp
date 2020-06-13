<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice Detail</title>
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
#noticeDetail {
	padding: 20px;
	background: white;
	min-height: 400px;
	width: 1300px;
	height: auto;
	position: relative;
}

#noticeContent {
	width: 1300px;
	min-height: 400px;
	height: auto;
	margin-bottom: 30px;
}

/* 큰버튼 스타일 */
.bigBtn {
	width: 140px;
	height: 40px;
	border: 0px;
	border-radius: 5px;
	background: rgb(190, 190, 190);
	color: white;
	font-size: 18px;
}

.bigBtn:hover {
	cursor: pointer;
}
/* 큰버튼 스타일 */
#btnArea {
	margin-left: 420px;
	width: 500px;
	display: flex;
	justify-content: center;
	align-items: center;
}

#btnArea button {
	display: inline-block;
	margin: 5px;
}

.bottomArea {
	padding: 20px;
	width: 1300px;
	height: 72px;
	background: white;
}

.material-icons {
	color: white;
	display: inline-block;
	vertical-align: text-top;
	font-size: 20px;
}

.roundIcon {
	width: 20px;
	height: 20px;
	border-radius: 50%;
	background: rgb(26, 188, 156);
	display: inline-block;
	margin-top: 5px;
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
			<span>공지</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
				<li><button class="subBtn subActive">공지사항</button></li>
			</ul>
		</div>
		<div class="contentArea">
			<h4 style="margin-left: 1240px;">공지사항 상세</h4>
			<div id="noticeDetail">
				<h3>${n.noticeTitle }</h3>
				<h4>
					No.${n.noticeNo } | ${n.noticeWriter } | ${n.noticeEnrollDate } | ${n.noticeStatus }
					</h4>
					<hr>
					<br> <br>
					<div id="noticeContent">${n.noticeContent }</div>
					<c:if test="${b.boardFileFlag eq 'Y' }">
					<table class="fileTable">
						<tr>
							<td width="65">
								<b class="fileShow">첨부파일</b>
							</td>
							<td>
								<img class="fileShow"src="${pageContext.servletContext.contextPath }/resources/icons/save_alt.png" style="transform:translate(0,-2px) scale(0.5);" class="bigBtn fileShow">
							</td>
							<td colspan="6">
							</td>
						</tr>
						<tr>
							<td colspan="8">
										<div class="fileWrap" style="display:none;" style="text-align:left;">
								        <div id="dropZone" style="width: 1140px; height: 100px; border: 1px solid lightgray;">
								            <table id="fileListTable" width="100%" border="0px">
								                <tbody id="fileTableTbody">
								                </tbody>
								            </table>
								        </div>
							</td>
						</tr>
					</table>
					</c:if>
					
					
			</div>
			<br>
			<div id="btnArea">
				<input type="hidden" name="noticeNo" value="${b.noticeNo }">
				<button class="bigBtn listBtn" style="background: rgb(26, 188, 156);">목록</button>
				<c:if test='${loginUser.empName == n.noticeWriter }'>
				<button class="bigBtn updateBtn">수정</button>
				<button class="bigBtn deleteBtn">삭제</button>
				</c:if>
			</div>
			<br> <br>
			<div class="bottomArea">
				<div class="roundIcon">
					<span class="material-icons">arrow_drop_up</span>
				</div>
				<p style="display: inline;">다음글</p>
				<p
					style="display: inline-block; width: 960px; margin: 0px; margin-left: 50px;">제목입니다.</p>
				<p align="right"
					style="display: inline-block; width: 200px; margin: 0px; margin-left: 10px;">2020/05/10
					| 김관리</p>
				<hr>
				<div class="roundIcon">
					<span class="material-icons">arrow_drop_down</span>
				</div>
				<p style="display: inline;">이전글</p>
				<p
					style="display: inline-block; width: 960px; margin: 0px; margin-left: 50px;">제목입니다.</p>
				<p align="right"
					style="display: inline-block; width: 200px; margin: 0px; margin-left: 10px;">2020/05/10
					| 김관리</p>
			</div>
			<br> <br> <br>
		</div>
	</div>
</body>
</html>