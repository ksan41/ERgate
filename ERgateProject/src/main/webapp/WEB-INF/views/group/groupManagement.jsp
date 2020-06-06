<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>groupManagement</title>  
<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/icons/fontello_tree/css/fontello.css">

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
    width: 641px;
    height: 100%;
    float: left;
}
div{
	box-sizing:auto;
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

.deptList{
    cursor: pointer;
}
.deptList:hover{
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
.empList li:hover{
	font-weight: 600;
    cursor: pointer;
}
.dept_rank_code1{
    color: rgb(188, 188, 188);
    cursor: default;
}
.empList a{
    text-decoration: none;
    color: rgb(77, 77, 77);
    cursor: pointer;
}
.noEmpText{
    color: rgb(77, 77, 77);
    font-size: 17px;
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
    cursor: pointer;
}
.dept_mail:hover{
    font-weight: 600;
    color:grey;
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
 /* 버튼 스타일 body 영역으로 옮김 - 스타일 우선순위 - 커서 디폴트 하기위해 */
.smallBtnGreyUpdate{
	border: 1px solid rgb(190, 190, 190);
	background: rgb(190, 190, 190);
	color: white;
	width: 70px;
	height: 25px;
	border-radius: 5px;
	font-size: 12px;
}
	
/* .smallBtn:hover {
	cursor: pointer;
} */
/* 작은버튼 스타일 */
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
</style>
</head>
<body>
	<!-- 이곳에 메뉴바 include -->
	
	<!-- 이곳에 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp"/>
	<style>
		 /* 작은버튼 스타일 */
		.smallBtn{
			width: 70px;
			height: 25px;
			border: 1px solid rgb(26, 188, 156);
			border-radius: 5px;
			background: white; /* 회색 : rgb(190, 190, 190) */
			color: rgb(26, 188, 156);
			font-size: 12px; 
			cursor:default !important;
		}
		
		.smallBtnGrey{
			width: 70px;
			height: 25px;
			border: 1px solid rgb(188, 188, 188);
			border-radius: 5px;
			background: white; /* 회색 : rgb(190, 190, 190) */
			color: rgb(188, 188, 188);
			font-size: 12px;
			cursor:default !important;
		}
		
		/* .smallBtn:hover {
			cursor: pointer;
		} */
		/* 작은버튼 스타일 */

	</style>
	<div class="outer">
		<div class="topBar">
			<!-- 메뉴명 -->
			<span>조직도</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
				<li><button class="subBtn" onclick="location.href='groupList.gr'">조직도</button></li>
				<c:if  test="${loginUser.deptCode eq 'D5' }">
					<li><button class="subBtn subActive" onclick="location.href='mgList.gr'">계정관리</button></li>
				</c:if>
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
							<button class="bigBtn" onclick="location.href='requestList.gr';">승인대기</button>&nbsp;
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
		        <div class="empList_area" style="overflow: auto;">
		            <ul class="empList">
		                <!-- <li>앨리스 <span class="dept_rank_code">(임원/대표이사)</span></li> -->
		            </ul>
		        </div>
		        <div class="profile_area" style="overflow: auto;">
		            <div class="profile_up">
		                <%-- <div class="profile_img">
		                    <img id="mypageProfileImg" src="${pageContext.servletContext.contextPath }/resources/siteImgs/profile_logo.png" width="140" height="140">
		                </div>
		                <div class="profile_name">
		                    <div class="dept_name">앨리스</div>
		                    <button class="smallBtn">회의중</button><br><br>
		                    <button id="profile_update" class="smallBtn">수정하기</button><br><br>
		                    <div> <span class="rank_code">(회계팀 /</span> <span class="job_code">과장)</span></div>
		                    <div class="dept_mail">qwertyadsf@gmail.com</div>
		                </div> --%>
		            </div><br><br>
		            <div class="profile_down" align="center">
		                <table id="profile_list" align="center">
		                   <!--  <tr>
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
		                    </tr> -->
		                </table>
		            </div>
		        </div> <!-- 오른쪽 영역 끝 -->
		    </div> <!-- groupMap_outer -->
		</div> <!-- contentArea -->
	</div> <!-- outer -->
	
	
	
	<!-- empList - 사원리스트 조회 -->
	<script>
	$(function(){
		selectNoList();

		/* 조직도 부서별 사원 조회 */
		$(".deptList").click(function(){
			keyword =$(this).attr("key");
			
			$.ajax({
				url: "deptEmpList.gr",
				type: "post",
				data:{"keyword":keyword}, 
				async: false,
				success: function(eList){
				 	console.log(eList);
					var value = "";
					
					if(eList.length == 0){ // 리스트가 비어있을 경우
		            	value = '<span class="noEmpText">조회된 사원이 없습니다. </span>';
					}else{ // 리스트가 비어있지 않을 경우
		            	console.log(eList[0]);
						for(var i in eList){
							
							var empName = eList[i].empName;
							var empRank = eList[i].rankTitle;
							var empJob = eList[i].jobTitle;
							
							value += '<li>' + '<span key="'+ eList[i].empId +'" onclick="empPrf();">' + empName + '</span>' + '<span class="dept_rank_code1">(' + empRank + '/' + empJob +')</span></li>';
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
	
	
	/* 조직도 사원 프로필 조회 */
	function empPrf(){
		console.log(window.event.target.getAttribute("key"));
		empId = window.event.target.getAttribute("key");
		
		$.ajax({
			url: "empProfile.gr",
			type: "post",
			data:{"empId":empId}, 
			async: false,
			success: function(empPrf){
				console.log(empPrf.empImage);
				var valueUp="";
				valueUp +=
					
						'<div class="profile_img">';
							
						if(empPrf.empImage == undefined){
								valueUp += '<img id="mypageProfileImg" src="${pageContext.servletContext.contextPath }/resources/siteImgs/profile_logo.png" width="140" height="140">';
							}else{
									
								valueUp += '사진 샘플데이터 넣으면 수정하기';
							/* '<img id="mypageProfileImg" src="${pageContext.servletContext.contextPath }/resources/siteImgs/profile_logo.png" width="140" height="140">';
							 */
							} 
						
						valueUp +=
			            '</div>' +
			            '<div class="profile_name">' +
			                '<div class="dept_name">'+ empPrf.empName +'</div>'; 
			                
			                switch(empPrf.empStatus){
			                case 0 : valueUp += '<button class="smallBtnGrey">'+ '비접속' +'</button>'; break;
			                case 1 : valueUp += '<button class="smallBtnGrey">'+ '휴가중' +'</button>'; break;
			                case 2 : valueUp += '<button class="smallBtnGrey">'+ '휴직' +'</button>'; break;
			                case 3 : valueUp += '<button class="smallBtnGrey">'+ '외근중' +'</button>'; break;
			                case 4 : valueUp += '<button class="smallBtnGrey">'+ '회의중' +'</button>'; break;
			                case 5 : valueUp += '<button class="smallBtn">'+ '접속중' +'</button>'; break;
			                default : ''; 
			                } 
			                
							valueUp +=
							'&nbsp; <button id="profile_update" class="smallBtnGreyUpdate" onclick="empUpdate();">수정하기</button><br><br>' +
			                '<div class="dept_rank_code1">(' + empPrf.deptTitle + '/'+ empPrf.rankTitle + ')</div>' +
			                '<div style="margin-top: 5px;""><span style="vertical-align:middle;"><img src="${pageContext.servletContext.contextPath}/resources/icons/mail.png" width="20px;"></span>'+
			                '<span class="dept_mail">&nbsp;' + empPrf.empComEmail + '</span></div>' +
			            '</div>'
							
				$(".profile_up").html(valueUp);
				
			 	var valueDown="";
			 	valueDown +=
		 				 '<tr><th>사원번호</th><td>'+ empPrf.empCode + '</td></tr>' +
			             '<tr><th>입사일</th><td>'+ empPrf.hireDate + '</td></tr>' +
			             '<tr><th>아이디</th><td>' + empPrf.empId + '</td></tr>' +
			             '<tr><th>생년월일</th><td>' + empPrf.empBirthday + '</td></tr>' + 
			             '<tr><th>휴대폰 번호</th><td>' + empPrf.empPhone + '</td></tr>' +
			             '<tr><th>내선번호</th><td>' + empPrf.empExtension + '</td></tr>' +
						 '<tr><th>팩스번호</th><td>' + empPrf.empFax + '</td></tr>' +	                    
			             '<tr><th>부서명</th><td>' + empPrf.deptTitle + '</td></tr>' +
			             '<tr><th>직급/직책</th><td>' + empPrf.rankTitle + '/' + empPrf.jobTitle + '</td></tr>' +
			         	 '<tr><th>자택주소</th><td>' + empPrf.empAddress + '</td></tr>'
			 	
				$("#profile_list").html(valueDown);
				
			},
			error:function(){
				console.log("조직도 사원 프로필 조회 실패");
			}
		});
	}

	
	/* 조직도 전체 리스트 조회 - 조직도 페이지 첫 화면 */
	function selectNoList(){		
			
		$.ajax({
			url: "empList.gr",
			type: "post",
			
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
						
						value += '<li>' + '<span key="'+ list[i].empId +'" onclick="empPrf();">' + empName + '</span>' + '<span class="dept_rank_code1">(' + empRank + '/' + empJob +')</span></li>';
					
					}
					$(".empList").html(value);
				}
			},
			error:function(){
				console.log("조직도 사원 리스트조회용 통신 실패");
			}
		});
	}
	
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
			console.log(list);
				var value = "";
				
				if(list.length == 0){ // 리스트가 비어있을 경우
					value = '<br><span class="noEmpText">조회된 사원이 없습니다. </span>';
				}else{ // 리스트가 비어있지 않을 경우
	            
					for(var i in list){
						
						var empName = list[i].empName;
						var empRank = list[i].rankTitle;
						var empJob = list[i].jobTitle;
						
						value += '<li>' + '<span key="'+ list[i].empId +'" onclick="empPrf();">' + empName + '</span>' + '<span class="dept_rank_code1">(' + empRank + '/' + empJob +')</span></li>';
					}
				}
				$(".empList").html(value);
			},
			error:function(){
				console.log("조직도 사원 리스트조회용 통신 실패");
			}
			
		})
		
	}
	
	function empUpdate(){
		location.href="empUpdate.gr"
	}
    </script>
</body>
</html>