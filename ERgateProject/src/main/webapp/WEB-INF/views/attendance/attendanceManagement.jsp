<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attendanceManagement</title>



<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- 이곳에 메뉴바 include -->
	
<!-- 이곳에 메뉴바 include -->
<jsp:include page="../common/menubar.jsp"/>
	

<!-- 모달 사용페이지에 복사해주세요 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<!-- 모달 사용페이지에 복사해주세요 -->


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
/* 검색창 스타일 */
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
	width: 220px;
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
/* 연도 선택 스타일 */
#year{
    font-size: 25px;
    text-align-last: center;
    width: 120px;
    border: 0px;
    background-color: transparent;
    -webkit-appearance : none;
    -moz-appearance: none;
    appearance: none;
}
select::-ms-expand {
    display: none;
}
/* 연도 선택 스타일 */
/* 달력 옆 화살표 스타일 */
.material-icons {
	font-size: 40px;
	vertical-align: middle;
}

.material-icons:hover {
	cursor: pointer;
}
/* 달력 옆 화살표 스타일 */

 /* 조직도 div 스타일 */
.groupMap_outer{
    border: 1px solid lightgrey;
    width: 1400px;
    height: 570px;
    margin-buttom: 50px;
    padding-left: 0px;
    color: rgb(77, 77, 77);
    font-size: 17px;
}
.depList_area, .empList_area{
    width: 49%;
    height: 100%;
    float: left;
}
.depList_area{
border-right: 1px solid lightgrey;
}
/* depList_area */
/* 조직도 tree 스타일 */
.group_tree, .group_tree ul{
    list-style: none;
    padding-left: 17px;
}
.group_tree a{
    text-decoration: none;
    color: rgb(77, 77, 77);
}
.group_tree *::before{
    width: 17px;
    height: 15px;
    display: inline-block;
}
.group_tree a:before{
    content: '└';
    font-family: fontello;
}
.group_tree label{
    cursor: pointer;
}
.group_tree label:before{
    content:'\E802';
    font-family: fontello;
    color: gray;
}
.group_tree input[type="checkbox"]{
    display: none;
}
.group_tree input[type="checkbox"]:checked~ul{
    display: none;
}
.group_tree input[type="checkbox"]:checked+label:before{
    content:'\E801';
}
.group_tree ul, .group_tree li{
    padding-top: 10px;
    height: 35px; 
}
/* empList_area */
.empList{
    list-style: none;
}
.empList li{
    padding-top: 10px;
    height: 35px; 
}
.rank_code, .job_code{
    color: rgb(188, 188, 188);
}
.empList a{
    text-decoration: none;
    color: rgb(77, 77, 77);
    cursor: pointer;
}
 /* 조직도 div 스타일 */
 /* 모달팝업 스타일 */
.modal {
	max-width: 2000px;
	width: 1400px;
	height: 600px; /* 모달 크기지정 */
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
/* 모달 내부 스타일 */
.empInfo{
    border: solid 1px lightgray;
    border-radius: 5px;
    width: 350px;
    height: 35px;
    text-align: center;
    padding-top: 10px;
    font-size: 17px;
    margin-left:30px;
}
.year{
    margin: auto; 
}
.attendanceManagementModalOuter{
	width: 100%;
	height: 100%;
}
/* 모달 내부 스타일 */
 /* 게시판 스타일 */
.boardTable {
	width: 1300px;
	height: 350px;
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

	<div class="outer">
		<div class="topBar">
			<!-- 메뉴명 -->
			<span>조직도</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
				<li><button class="subBtn">출퇴근내역</button></li>
				<li><button class="subBtn">근태현황</button></li>
				<li><button class="subBtn subActive">근태관리</button></li>
			</ul>
		</div>
		<div class="contentArea">
		<!-- 내용 작성 영역 입니다-->
			<!-- 버튼과 검색바 같이 들어가는 DIV -->
			<div btnAndSearch>
				<table class="bas">
					<tr>
						<td id="leftArea"> 
							<h2 style="display: inline-block; margin-left: 530px;">
								<span class="material-icons"> arrow_left </span> 
									    <select name="year" id="year">
									        <option value="">2020</option>
									        <option value="">2019</option>
									        <option value="">2018</option>
									        <option value="">2017</option>
									    </select>								
							
								<span class="material-icons"> arrow_right </span>
							</h2>
							
						</td>
						<td id="rightArea">
							<!-- 검색바 -->
							<div class="searchBar">
								<select>
									<option>이름</option>
									<option>직급</option>
									<option>직책</option>
									<option>부서</option>
								</select> <input type="text" placeholder="이름/직급/직책/부서 검색">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
									fill="black" width="48px" height="48px">
									<path
										d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z" />
									<path d="M0 0h24v24H0z" fill="none" /></svg>
							</div>
							<!-- 검색바 -->
						</td>
					</tr>
				</table>
			</div>
		
			<div style="height:10px;"></div>
		
			<!-- 조직도 div -->
		    <div class="groupMap_outer">
		    	<!-- 왼쪽 영역 -->
		        <div class="depList_area" style="overflow: auto;">
		            <ul class="group_tree">
		                <li>
		                    <input type="checkbox" id="root">
		                    <label for="root"> ERgate</label>
		                    <ul>
		                       <li><a href="#"> 임원</a></li>
		                       <li><a href="#"> 개발팀</a></li>
		                       <li><a href="#"> 회계팀</a></li>
		                       <li><a href="#"> 기술팀</a></li>
		                       <li><a href="#"> 총무팀</a></li>
		                       <li><a href="#"> 인사팀</a></li>
		                    </ul>
		                </li>
		            </ul>
		        </div>
		        <!-- 가운데 영역 -->
		        <div class="empList_area" style="overflow: auto;">
		            <ul class="empList">
		            	<a class="open-modal" href="#modal-form"><li><span>앨리스</span> <span class="rank_code">(임원 /</span> <span class="job_code">대표이사)</span></li></a>
		                <a class="open-modal" href="#modal-form"><li><span>리차드</span> <span class="rank_code">(임원 /</span> <span class="job_code">대표이사)</span></li></a>
		                <a class="open-modal" href="#modal-form"><li><span>케빈</span> <span class="rank_code">(임원 /</span> <span class="job_code">대표이사)</span></li></a>
		                <a class="open-modal" href="#modal-form"><li><span>김카카오</span> <span class="rank_code">(회계팀 /</span> <span class="job_code">과장)</span></li></a>
		                <a class="open-modal" href="#modal-form"><li><span>최삼성</span> <span class="rank_code">(기술팀 /</span> <span class="job_code">팀원)</span></li></a>
		                <a class="open-modal" href="#modal-form"><li><span>박다음</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">대리)</span></li></a>
		                <a class="open-modal" href="#modal-form"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		            </ul>
		        </div>
		    </div><!-- groupMap_outer -->
		    
		    <!-- 여기아래로 모달 -->
		 
		    <br><br><br><br><br>
			<!-- <a class="open-modal" href="#modal-form">모달열기</a> -->
			
			<div id="modal-form" class="modal">
				<div class="modal-title">근태현황조회</div>
				<div class="modal-content">
					<br>
					<div class="attendanceManagementModalOuter">
				        <div class="empInfo">
				            <div>김카카오 &nbsp;(개발1팀/팀장)</div>&nbsp;
				        </div>
				        <div class="year">
							<h2 align="center" style="display: inline-block; margin-left: 530px;">
								<span class="material-icons"> arrow_left </span> 
									    <select name="year" id="year">
									        <option value="">2020</option>
									        <option value="">2019</option>
									        <option value="">2018</option>
									        <option value="">2017</option>
									    </select>						
								<span class="material-icons"> arrow_right </span>
							</h2>
				        </div>
				       	<div align="center" class="boardScroll" style="overflow: auto; width: 1300px; height: 350px; margin:auto;">
				           <table class="boardTable">
				               <thead>
				                   <tr>
				                       <th>생성연차</th>
				                       <th>사용일자</th>
				                       <th>사용</th>
				                       <th>구분(연차/반차/병가/훈련)</th>
				                       <th>외근</th>
				                       <th>출장</th>
				                   </tr>
				               </thead>
				               <tbody>
				               	   <!-- 리스트 없을시 조건문 처리 -->
				                   <tr>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                   </tr>
				                    <tr>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                   </tr>
				                    <tr>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                   </tr>
				                    <tr>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                   </tr>
				                    <tr>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                   </tr>
				                   <tr>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                   </tr>
				                   <tr>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                   </tr>
				                   <tr>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                   </tr>
				                   <tr>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                   </tr>
				                   <tr>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                   </tr>
				                   <tr>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                   </tr>
				                   <tr>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                   </tr>
				                   <tr>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                       <td></td>
				                   </tr>
				               </tbody>
				           </table>
			           </div> <!-- boardScroll -->
			        </div> <!-- attendanceManagementModalOuter -->
				</div>
			</div>

			<!-- 모달용 스크립트 -->
			<script>
				$('.open-modal').click(function() {
					$(this).modal({
						fadeDuration : 150
					});
				});
			</script>
			<!-- 모달팝업 -->
        
		</div><!-- contentArea -->
	</div> <!-- outer -->

</body>
</html>