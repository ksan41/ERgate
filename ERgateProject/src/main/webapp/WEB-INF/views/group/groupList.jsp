<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>groupList</title>
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

 /* 조직도 div 스타일 */
.groupMap_outer{
    border: 1px solid lightgrey;
    width: 1400px;
    height: 650px;
    padding-left: 0px;
    color: rgb(77, 77, 77);
    font-size: 17px;
}
.depList_area, .empList_area{
    border-right: 1px solid lightgrey;
    width: 27%;
    height: 100%;
    float: left;
}
.profile_area{
    width: 45%;
    height: 100%;
    float: left;
}

/* depList_area - 조직도 tree 스타일 */
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

/* profile_area */
/* .profile_area div{
    border: 1px solid tomato;
} */
.profile_up{
    width: 100%;
    height: 23%;
}
.profile_img{
	margin-left:63px;
	margin-top:20px;
    width: 30%;
    height: 100%;
    float: left;
}
.profile_name{
    margin: 20px;
    margin-top: 30px;
    width: 50%;
    height: 70%;
    float: left;

}
.dept_name{
    color: rgb(77, 77, 77);
    margin-bottom: 15px;
    font-size: 27px;
}
.dept_mail{
    color: rgb(188, 188, 188);
}
.profile_down{
    width: 100%;
    height: 75%;
}

/* profile_list 테이블 스타일 */
#profile_list{
    width: 80%;
    border-top: 2px solid gray !important;
    border-bottom: 2px solid gray !important;
}
#profile_list, #profile_list td, #profile_list th {
	border-width: 1px 0;
	border-collapse: collapse;

}
#profile_list td, #profile_list th {
	border-color: lightgray;
	border-style: solid;
	height: 50px;
}
#profile_list th{
    font-weight: 400;
    color: rgb(188, 188, 188);
    width: 40%;
}

#mypageProfileImg{
	border-radius: 50%;
	margin-top: 10px;
	margin-bottom: 10px;
}

 /* 조직도 div 스타일 */
 
 /* 작은버튼 스타일 */
.smallBtn {
	width: 60px;
	height: 25px;
	border: 1px solid rgb(26, 188, 156);
	border-radius: 5px;
	background: white; /* 회색 : rgb(190, 190, 190) */
	color: rgb(26, 188, 156);
	font-size: 12px;
}

.smallBtn:hover {
	cursor: pointer;
}
/* 작은버튼 스타일 */
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
				<li><button class="subBtn subActive">조직도</button></li>
			</ul>
		</div>
		<div class="contentArea">
		<!-- 내용 작성 영역 입니다-->
		
			<!-- 버튼과 검색바 같이 들어가는 DIV -->
			<div btnAndSearch>
				<table class="bas">
					<tr>
						<td id="leftArea">
							<!-- 화면 구조 맞추기 위해 td 만들고 비워둠 -->
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
		        <div class="empList_area" style="overflow-y:scroll;">
		            <ul class="empList">
		                <a href="#"><li><span>앨리스</span> <span class="rank_code">(임원 /</span> <span class="job_code">대표이사)</span></li></a>
		                <a href="#"><li><span>리차드</span> <span class="rank_code">(임원 /</span> <span class="job_code">대표이사)</span></li></a>
		                <a href="#"><li><span>케빈</span> <span class="rank_code">(임원 /</span> <span class="job_code">대표이사)</span></li></a>
		                <a href="#"><li><span>김카카오</span> <span class="rank_code">(회계팀 /</span> <span class="job_code">과장)</span></li></a>
		                <a href="#"><li><span>최삼성</span> <span class="rank_code">(기술팀 /</span> <span class="job_code">팀원)</span></li></a>
		                <a href="#"><li><span>박다음</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">대리)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                <a href="#"><li><span>문별</span> <span class="rank_code">(인사팀 /</span> <span class="job_code">팀장)</span></li></a>
		                
		            </ul>
		        </div>
		        <div class="profile_area" style="overflow: auto;">
		            <div class="profile_up">
		                <div class="profile_img">
		                    <img id="mypageProfileImg" src="../../resources/siteImg/profile_logo.png" width="140" height="140">
		                </div>
		                <div class="profile_name">
		                    <div class="dept_name">앨리스</div>
		                    <button class="smallBtn">회의중</button><br><br>
		                    <div> <span class="rank_code">(회계팀 /</span> <span class="job_code">과장)</span></div>
		                    <div class="dept_mail">qwertyadsf@gmail.com</div>
		                </div>
		            </div><br><br>
		            <div class="profile_down" align="center">
		                <table id="profile_list" align="center">
		                    <tr>
		                        <th>사원번호</th>
		                        <td>3456789</td>
		                    </tr>
		                    <tr>
		                        <th>입사일</th>
		                        <td>2020/03/03</td>
		                    </tr>
		                    <tr>
		                        <th>아이디</th>
		                        <td>Alice</td>
		                    </tr>
		                    <tr>
		                        <th>생년월일</th>
		                        <td>1990/08/27</td>
		                    </tr>
		                    <tr>
		                        <th>휴대폰 번호</th>
		                        <td>010-0000-0000</td>
		                    </tr>
		                    <tr>
		                        <th>내선번호</th>
		                        <td>070-0000-0000</td>
		                    </tr>
							<tr>
		                        <th>팩스번호</th>
		                        <td>070-0000-0000</td>
		                    </tr>	                    
		                    <tr>
		                        <th>부서명</th>
		                        <td>기술팀</td>
		                    </tr>
		                    <tr>
		                        <th>직급/직책</th>
		                        <td>부장/팀장</td>
		                    </tr>
		                	<tr>
		                        <th>자택주소</th>
		                        <td>서울시 마포구 서교동 홍익로 2길 35</td>
		                    </tr>
		                </table>
		            </div>
		        </div> <!-- 오른쪽 영역 끝 -->
		    </div> <!-- groupMap_outer -->
		</div> <!-- contentArea -->
	</div> <!-- outer -->
</body>
</html>