<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attendanceMyStatus</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

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
	/* 게시판 위에 들어가는 휴가 정보 */
	 .empInfo1{
        border: solid 1px lightgray;
        border-bottom-left-radius: 5px;
        border-top-left-radius: 5px;
        width: 230px;
        height: 35px;
        text-align: center;
        padding-top: 10px;
        font-size: 17px;
        float: left;
    }
    .empInfo2{
        border: solid 1px lightgray;
        border-left: 0ch;
        width: 230px;
        height: 35px;
        text-align: center;
        padding-top: 10px;
        font-size: 17px;
        float: left;
    }
    .empInfo3{
        border: solid 1px lightgray;
        border-left: 0ch;
        border-bottom-right-radius: 5px;
        border-top-right-radius: 5px;
        width: 230px;
        height: 35px;
        text-align: center;
        padding-top: 10px;
        font-size: 17px;
        float: left;
    }	
	/* 게시판 위에 들어가는 휴가 정보 */
	/* 게시판 스타일 */

	.boardTable {
		width: 1400px;
		height: auto;
	}
	
 	/* .boardScroll {
		overflow-x:hidden;
		overflow-y:scroll;
		width:1400px;
		height:450px;	
	} */
	.boardTable, .boardTable th, .boardTable td {
		border-width: 1px 0;
		border-collapse: collapse;
		text-align: center;
		font-size: 16px;
	}
	
	.boardTable th {
		color: rgb(182, 179, 179);
		height: 40px;
	}
	
	.boardTable td {
		border-color: lightgray;
		border-style: solid;
		height: 40px;   
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
</style>

</head>
<body>
		<!-- 이곳에 메뉴바 include -->
		<jsp:include page="../common/menubar.jsp" />
		<!-- 이곳에 메뉴바 include -->
	
		<div class="outer">
			<div class="topBar">
				<!-- 메뉴명 -->
				<span>근태</span>
			</div>
			<div class="subMenuArea">
				<ul id="subMenuList">
					<li><button class="subBtn" onclick="location.href='atList.at'">출퇴근내역</button></li>
					<li><button class="subBtn subActive" onclick="location.href='myStatus.at'">근태현황</button></li>
					<c:if test="${loginUser.deptCode eq 'D5' }">
						<li><button class="subBtn" onclick="location.href='atMgList.at'">근태관리</button></li>
					</c:if>
				</ul>
			</div>
			<div class="contentArea">
				<h2 style="display: inline-block; margin-left: 530px;">
					<span class="material-icons"> arrow_left </span> 2020년 5월
					<svg class="schedule_icons" xmlns="http://www.w3.org/2000/svg"
						viewBox="0 0 24 24" fill="black" width="48px" height="48px">
					<path
							d="M20 3h-1V1h-2v2H7V1H5v2H4c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 18H4V8h16v13z" />
					<path d="M0 0h24v24H0z" fill="none" /></svg>
					<span class="material-icons"> arrow_right </span>
				</h2>
				<br><br>
				<div class="holidayInfo">
			        <div class="empInfo1">발생 휴가일 </div>
			        <div class="empInfo2">16 </div>
			        <div class="empInfo2">총 사용일수 </div>
			        <div class="empInfo2">16 </div>
			        <div class="empInfo2">잔여휴가일 </div>
			        <div class="empInfo3">14.5 </div>
			    </div>
				<br><br><br><br>  <br><br>
				<div >
				<div class="boardScroll" style="overflow: auto; width: 1400px; height: 400px;">
					<table class="boardTable">
						<thead>
							<tr>
								<th>해당연도</th>
								<th>근태유형</th>
								<th>사용일수</th>
                                <th>시작일</th>
                                <th>종료일</th>
                                <th>사용일자</th>
							</tr>
						</thead>
                        <tbody>
                        	<c:forEach var="list" items="${uhlist}">
	                        <tr>
								<td>2020</td>
								<td>${list.holidayType}</td>
								<td>${list.holidayCount}</td>
	                            <td>${list.holidayStart}</td>
	                            <td>${list.holidayEnd}</td>
	                            <td>${list.holidayStart}</td>
	                        </tr>
	                      </c:forEach>
						</tbody>
					</table>
				</div>	
			</div>
		</div>
	</div>
</body>
</html>