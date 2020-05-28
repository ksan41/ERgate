<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>groupRequestList</title>
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
        width:150px;
        height:50px;
        font-size: 19px;
        color:rgb(127, 127, 127);
        background-color: white;
        border-radius: 25px;
    }
    .subBtn:hover{cursor: pointer;}
    /* 서브메뉴바 메뉴버튼(기본) */
    /* 서브메뉴바 메뉴버튼(현재페이지일때) */
    .subActive{
        border:4px solid rgb(26, 188, 156);
    }
    /* 서브메뉴바 메뉴버튼(현재페이지일때) */

    /* 콘텐츠영역 */
    .contentArea {
        margin-top: 50px;
        margin-left:100px;
        width:1600px;
        height:auto;
        float:left;
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
/* 상단 검색창 영역 스타일 */

.bas {
	width: 1400px;
	height: 50px;
}
#leftArea {
	text-align: left;
}
#rightArea {
	text-align: right;
}
/* 상단 검색창 영역 스타일 */
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
</style>
</head>
<body>
	<!-- 이곳에 메뉴바 include -->
	
	<!-- 이곳에 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="outer">
		<div class="topBar">
			<!-- 메뉴명 -->
			<span>조직도</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
				<li><button class="subBtn">조직도</button></li>
				<li><button class="subBtn subActive">계정관리</button></li>
			</ul>
		</div>
		<div class="contentArea">
		<!-- 내용 작성 영역 입니다-->
			<!-- 버튼과 검색바 같이 들어가는 DIV -->
			<div btnAndSearch>
				<table class="bas">
					<tr>
						<td id="leftArea"> 
							<!-- 인사팀만 보이는 버튼 -->
							<button class="bigBtn" style="background:rgb(26, 188, 156);">목록으로</button>&nbsp;
						</td>
						<td id="rightArea">
							<!-- 화면 구조 맞추기 위해 td 비워둠 -->
						</td>
					</tr>
				</table>
			</div>
			<div style="height:10px;"></div>
			<!-- btnAndSearch - 버튼과 검색바 같이 들어가는 DIV 끝-->
			<!-- 승인 대기 목록 게시판 -->
			<div class="boardScroll" style="overflow: auto; width: 1400px; height: 400px;">
			<table class="boardTable" style="overflow: auto;">
				<thead>
					<tr>
						<th>신청 일시</th>
						<th>계정명</th>
						<th>이름</th>
						<th>휴대폰 번호</th>
						<th>비고</th>
					</tr>
				</thead>
				<tr>
					<td>2020/03/02</td>
					<td>Alice</td>
					<td>앨리스</td>
					<td>010-0000-0000</td>
					<td>미승인</td>
				</tr>
				<tr>
					<td>2020/03/02</td>
					<td>Alice</td>
					<td>앨리스</td>
					<td>010-0000-0000</td>
					<td>미승인</td>
				</tr>
				<tr>
					<td>2020/03/02</td>
					<td>Alice</td>
					<td>앨리스</td>
					<td>010-0000-0000</td>
					<td>미승인</td>
				</tr>
				<tr>
					<td>2020/03/02</td>
					<td>Alice</td>
					<td>앨리스</td>
					<td>010-0000-0000</td>
					<td>미승인</td>
				</tr>
				<tr>
					<td>2020/03/02</td>
					<td>Alice</td>
					<td>앨리스</td>
					<td>010-0000-0000</td>
					<td>미승인</td>
				</tr>
				<tr>
					<td>2020/03/02</td>
					<td>Alice</td>
					<td>앨리스</td>
					<td>010-0000-0000</td>
					<td>미승인</td>
				</tr>
				<tr>
					<td>2020/03/02</td>
					<td>Alice</td>
					<td>앨리스</td>
					<td>010-0000-0000</td>
					<td>미승인</td>
				</tr>
				<tr>
					<td>2020/03/02</td>
					<td>Alice</td>
					<td>앨리스</td>
					<td>010-0000-0000</td>
					<td>미승인</td>
				</tr>
								<tr>
					<td>2020/03/02</td>
					<td>Alice</td>
					<td>앨리스</td>
					<td>010-0000-0000</td>
					<td>미승인</td>
				</tr>
								<tr>
					<td>2020/03/02</td>
					<td>Alice</td>
					<td>앨리스</td>
					<td>010-0000-0000</td>
					<td>미승인</td>
				</tr>
								<tr>
					<td>2020/03/02</td>
					<td>Alice</td>
					<td>앨리스</td>
					<td>010-0000-0000</td>
					<td>미승인</td>
				</tr>
								<tr>
					<td>2020/03/02</td>
					<td>Alice</td>
					<td>앨리스</td>
					<td>010-0000-0000</td>
					<td>미승인</td>
				</tr>
								<tr>
					<td>2020/03/02</td>
					<td>Alice</td>
					<td>앨리스</td>
					<td>010-0000-0000</td>
					<td>미승인</td>
				</tr>
								<tr>
					<td>2020/03/02</td>
					<td>Alice</td>
					<td>앨리스</td>
					<td>010-0000-0000</td>
					<td>미승인</td>
				</tr>
								<tr>
					<td>2020/03/02</td>
					<td>Alice</td>
					<td>앨리스</td>
					<td>010-0000-0000</td>
					<td>미승인</td>
				</tr>
								<tr>
					<td>2020/03/02</td>
					<td>Alice</td>
					<td>앨리스</td>
					<td>010-0000-0000</td>
					<td>미승인</td>
				</tr>
								<tr>
					<td>2020/03/02</td>
					<td>Alice</td>
					<td>앨리스</td>
					<td>010-0000-0000</td>
					<td>미승인</td>
				</tr>
								<tr>
					<td>2020/03/02</td>
					<td>Alice</td>
					<td>앨리스</td>
					<td>010-0000-0000</td>
					<td>미승인</td>
				</tr>
								<tr>
					<td>2020/03/02</td>
					<td>Alice</td>
					<td>앨리스</td>
					<td>010-0000-0000</td>
					<td>미승인</td>
				</tr>
			</table>
			</div>
			<!-- 게시판 -->
		
		
		
		</div><!-- contentArea -->
	</div><!-- outer -->
</body>
</html>