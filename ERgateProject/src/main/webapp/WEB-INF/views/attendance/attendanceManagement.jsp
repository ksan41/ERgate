<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attendanceManagement</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/icons/fontello_tree/css/fontello.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	
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
.deptList {
	cursor: pointer;
}

.deptList:hover {
	font-weight: 600;
}
/* empList_area */
.empList{
    list-style: none;
    list-style-image:url('${pageContext.servletContext.contextPath }/resources/icons/person_icon.png');
}
.empList li{
    padding-top: 10px;
    height: 35px; 
    cursor: pointer;
}
.empList li:hover {
	font-weight: 600;
	cursor: pointer;
}
.dept_rank_code1 {
	color: rgb(188, 188, 188);
	cursor: default;
}
.empList a{
    text-decoration: none;
    color: rgb(77, 77, 77);
    cursor: pointer;
}
.noEmpText {
	color: rgb(77, 77, 77);
	font-size: 17px;
	pointer-events: none;
    cursor: default;
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
.dept_rank_code1 {
	color: rgb(188, 188, 188);
	cursor: default;
}
 .empInfo1{
    border: solid 1px lightgray;
    border-bottom-left-radius: 5px;
    border-top-left-radius: 5px;
    width: 300px;
    height: 35px;
    text-align: center;
    padding-top: 10px;
    font-size: 17px;
    margin-left:30px;
    float: left;
}
.empInfo2{
    border: solid 1px lightgray;
    border-left: 0ch;
    width: 300px;
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
    width: 300px;
    height: 35px;
    text-align: center;
    padding-top: 10px;
    font-size: 17px;
    float: left;
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
.pageNoClick{
   pointer-events: none;
   cursor: default;
}
/* 게시판 스타일 */
</style>
</head>
<body>

	<div class="outer">
		<div class="topBar">
			<!-- 메뉴명 -->
			<span>근태</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<li><button class="subBtn" onclick="location.href='atList.at'">출퇴근내역</button></li>
				<li><button class="subBtn" onclick="location.href='myStatus.at'">근태현황</button></li>
				<%-- <c:if test="${loginUser.deptCode eq 'D5' }"> --%>
					<li><button class="subBtn subActive" onclick="location.href='atMgList.at'">근태관리</button></li>
				<%-- </c:if>  --%>
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
								<span class="material-icons" id="arrowLeft"> arrow_left </span> 
									   &nbsp; &nbsp;&nbsp;&nbsp;<span name="year" id="year"></span>&nbsp;&nbsp;&nbsp;&nbsp;								
								<span class="material-icons" id="arrowRight"> arrow_right </span>
								
							</h2>
							
							<script>
								$(function(){
									var date = new Date();
									var NowYear = date.getFullYear();
									
									$("#year").text(NowYear);
									
									$("#arrowLeft").click(function() {
										year = $("#year").text();
										if(year > NowYear-4){
											$("#year").text($("#year").text()-1);
											selectEmpList($("#year").text());
										}
									});	
									$("#arrowRight").click(function() {
										year = $("#year").text();
										if(year < NowYear){
											$("#year").text(Number($("#year").text())+1);
											selectEmpList($("#year").text());
										}
									});	
								});
							</script>
							
						</td>
						<td id="rightArea">
							<!-- 검색바 -->
							<div class="searchBar">
								<select id="condition" name="condition">
									<option value="empName">이름</option>
									<option value="rankTitle">직급</option>
									<option value="jobTitle">직책</option>
									<option value="deptTitle">부서</option>
								</select> <input id="keyword" type="text" placeholder="이름/직급/직책/부서 검색">
								<svg onclick="return searchEmpProfile();" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
									fill="black" width="48px" height="48px">
									<path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z" />
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
							<label for="root" class="deptList" key="all"> ERgate</label>
							<ul>
								<li class="deptList" key="D0">└ 임원</li>
								<li class="deptList" key="D1">└ 개발팀</li>
								<li class="deptList" key="D2">└ 회계팀</li>
								<li class="deptList" key="D3">└ 기술팀</li>
								<li class="deptList" key="D4">└ 총무팀</li>
								<li class="deptList" key="D5">└ 인사팀</li>
							</ul>
		                </li>
		            </ul>
		        </div>
		        <!-- 가운데 영역 -->
		        <div class="empList_area" style="overflow: auto;">
		            <ul class="empList"></ul>
		        </div>
		    </div><!-- groupMap_outer -->
		    
		    <!-- 여기아래로 모달 -->
		 
		    <br><br><br><br><br>
			<a class="open-modal" href="#modal-form" style="display:none;">모달열기</a>
			
			<div id="modal-form" class="modal">
				<div class="modal-title">근태현황조회</div>
				<div class="modal-content">
					<br>
					<div class="attendanceManagementModalOuter">
						<div class="empInfo">
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
				       	<div align="center" class="boardScroll" style="overflow: auto; width: 1320px; height: 350px; margin:auto;">
				           <table class="boardTable">
				               <thead>
				                   <tr>
				                       <th width="200">사용일수</th> <!-- 몇개 사용했는지 -->
				                       <th width="800">사용기간</th>
				                       <th width="335">구분</th> <!-- (연차/반차/병가/공가/경조사) -->
				                   </tr>
				               </thead>
				               <tbody>
				               </tbody>
				           </table>
			           </div> <!-- boardScroll -->
			        </div> <!-- attendanceManagementModalOuter -->
				</div>
			</div>

		</div><!-- contentArea -->
	</div> <!-- outer -->
	
	<script>
		
		$(function(){
			selectEmpList($("#year").text());
			
			
			/* 조직도 부서별 사원 조회 */
			$(".deptList").click(function(){
				keyword =$(this).attr("key");
				console.log(keyword);
				year = $("#year").text();
				
				$.ajax({
					url: "atMgdeptEmpList.gr",
					type: "post",
					data:{"keyword":keyword,
						  "year":year}, 
					async: false,
					success: function(eList){
					 	console.log(eList);
						var value = "";
						
						if(eList.length == 0){ // 리스트가 비어있을 경우
			            	value = '<li> 조회된 사원이 없습니다. </li>';
						}else{ // 리스트가 비어있지 않을 경우
			            	
							for(var i in eList){
								
								var empName = eList[i].empName;
								var empRank = eList[i].rankTitle;
								var empJob = eList[i].jobTitle;
								
								value += '<li>' + '<span key="'+ eList[i].empId +'" onclick="open_modal();">' + empName + '</span>' + '<span class="dept_rank_code1">(' + empRank + '/' + empJob +')</span></li>';
							}
							$(".empList").html(value);
						} 
						
					},
					error:function(){
						console.log("조직도 부서별 사원 리스트 조회 실패");
					}
				});
			});

		});
		
		
		/* 조직도 전체 리스트 조회 - 계정관리 페이지 첫 화면 */
		function selectEmpList(year){		
				
			//console.log(year);
			$.ajax({
				url: "atMgListAjax.at",
				type: "post",
				data:{"year":year},
				success: function(list){
					// console.log(list);
					var value = "";
					
					if(list.length == 0){ // 리스트가 비어있을 경우
		            	value = '<span class="noEmpText">조회된 사원이 없습니다. </span>';
					}else{ // 리스트가 비어있지 않을 경우
		            
						for(var i in list){
							
							var empName = list[i].empName;
							var empRank = list[i].rankTitle;
							var empJob = list[i].jobTitle;
							
							value += '<li>' + '<span key="'+ list[i].empId +'" onclick="open_modal();">' + empName + '</span>' + '<span class="dept_rank_code1">(' + empRank + '/' + empJob +')</span></li>';
						
						}
						$(".empList").html(value);
					}
				},
				error:function(){
					console.log("조직도 사원 리스트조회용 통신 실패");
				}
			});
		}
	
		/* 사원 검색 */
		function searchEmpProfile(){
			condition = $("#condition option:selected").val();
			keyword = $("#keyword").val();
			if(keyword==''){
				alert("키워드를 입력하세요");
				return;
			}
			$.ajax({
				url:"empListSearch.gr",
				type:"get",
				data:{"condition":condition,
					 "keyword":keyword},
				success: function(list){
				
					var value = "";
					
					if(list.length == 0){ // 리스트가 비어있을 경우
						value = '<br><span class="noEmpText">조회된 사원이 없습니다. </span>';
					}else{ // 리스트가 비어있지 않을 경우
		            
						for(var i in list){
							
							var empName = list[i].empName;
							var empRank = list[i].rankTitle;
							var empJob = list[i].jobTitle;
							
							value += '<li>' + '<span key="'+ list[i].empId +'" onclick="open_modal();">' + empName + '</span>' + '<span class="dept_rank_code1">(' + empRank + '/' + empJob +')</span></li>';
						}
					}
					$(".empList").html(value);
				},
				error:function(){
					console.log("조직도 사원 리스트조회용 통신 실패");
				}
			})
		}
		
		
		
		/* 사원별 근태 현황 - 모달 */
		function attendanceManagement(){
			
			empId = window.event.target.getAttribute("key");
			year = $("#year").text();
			console.log(empId);
			
			$.ajax({
				url:"atMgDetail.at",
				type:"get",
				data:{"empId":empId,
					 "year":year},
				success: function(list){
				console.log(list);
					
					var value0 =
						'<div class="empInfo1">'+ list[0].empName +'&nbsp;<span class="dept_rank_code1">('+ list[0].deptTitle +'/'+ list[0].rankTitle +')</span></div>'+
				        '<div class="empInfo2">생성연차 &nbsp;/&nbsp;'+ list[0].hday +'</div>'+
				        '<div class="empInfo3">잔여일수 &nbsp;/&nbsp;'+ list[0].remainDay +'</div>';
				
				    $(".empInfo").html(value0);
				    
					var value1 = "";
					
					if(list.length == 0){ // 리스트가 비어있을 경우
						value1 = '<tr class="pageNoClick"><td colspan="3"><br><span class="noEmpText">조회된 리스트가 없습니다. </span></td><td>';
					}else{ // 리스트가 비어있지 않을 경우
		            
						for(var i in list){
							
							var holidayUsecount = list[i].holidayUsecount;
							var holidayStart = list[i].holidayStart;
							var holidayEnd =  list[i].holidayEnd;
							var holidayType = list[i].holidayType;
							
							value1 += 
							 '<tr class="pageNoClick"><td>'+ holidayUsecount +'</td><td>'+ holidayStart +' ~ '+ holidayEnd +'</td><td>'+ holidayType +'</td></tr>';
						}
					
					  	for(var i=0; i<8-list.length; i++){
					  		value1 += 
					  		'<tr>'+
								'<td class="pageNoClick">&nbsp;</td>'+
								'<td class="pageNoClick">&nbsp;</td>'+
								'<td class="pageNoClick">&nbsp;</td>'
							'</tr>';
						  }
						
					}
					$(".boardTable tbody").html(value1);
				},
				error:function(){
					console.log("사원별 근태 현황용 통신 실패");
				}
				
			});
		}
		
	</script>

			<!-- 모달용 스크립트 -->
			<script>
			function open_modal(){
				$(".open-modal").click();
			};
			$('.open-modal').click(function() {
				$(this).modal({
					fadeDuration : 150
				});
				
				attendanceManagement();
			});
			</script>
			<!-- 모달팝업 -->
        
	
</body>
</html>