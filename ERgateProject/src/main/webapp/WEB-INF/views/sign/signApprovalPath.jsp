<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signApprovalPath</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">	
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

html, body {
	margin: 0;
	height: 100%;
	overflow-x: hidden;
	overflow-y: auto;
	font-family: "Nanum Gothic", serif;
	overflow-x: hidden;
}

/* 현재팝업창 사이즈조절 */
.popup-outer {
	width: 1250px;
	height: 860px;
	margin: 0;
	box-sizing: border-box;
}

.popup-title {
	margin: 0;
	width: 100%;
	height: 50px;
	background-color: rgba(22, 160, 133, 0.68);
	font-size: 25px;
	padding: 10px;
	color: white;
	box-sizing: border-box;
}

.popup-content {
	padding: 20px;
}

/* 검색창 스타일 */
.searchBar {
	margin-left: 15px;
}

.searchBar>select {
	height: 36px;
	width: 70px;
	border: 1px solid lightgray;
	border-radius: 3px;
	font-family: inherit;
	display: inline-block;
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
div {
	box-sizing: border-box;
}

/* 전체영역틀 */
#wrap {
	margin-top: 20px;
	margin-left: 15px; width : 1200px;
	height: 700px;
	width: 1200px;
}

#wrap>div {
	float: left;
	margin-right: 18px;
}

/* 좌측 조직도영역 */
#groupArea {
	height: 100%;
	width: 380px;
	border: 1px solid lightgray;
}

/* depList_area - 조직도 tree 스타일 */
.group_tree, .group_tree ul {
	list-style: none;
	padding-left: 17px;
}

.group_tree a {
	text-decoration: none;
	color: rgb(77, 77, 77);
}

.group_tree *::before {
	width: 17px;
	height: 15px;
	display: inline-block;
}

.group_tree a:before {
	content: '└';
	font-family: fontello;
}

.group_tree label {
	cursor: pointer;
}

.group_tree label:before {
	content: '\E802';
	font-family: fontello;
	color: gray;
}

.group_tree input[type="checkbox"] {
	display: none;
}

.group_tree input[type="checkbox"]:checked ~ul{
	display: none;
}

.group_tree input[type="checkbox"]:checked+label:before {
	content: '\E801';
}

.group_tree ul, .group_tree li {
	padding-top: 10px;
	height: 35px;
}

/* 중앙 리스트영역 */
#listArea {
	height: 100%;
	width: 380px;
	border: 1px solid lightgray;
}

/* 체크박스 스타일 */
.checkBox {
	zoom: 1.7;
}

/* 게시판 스타일 */
.boardTable {
	width: 100%;
	height: auto;
}

.boardTable, .boardTable th, .boardTable td {
	border-width: 1px 0;
	border-collapse: collapse;
	text-align: center;
	font-size: 15px;
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

/* 우측 선택영역 */
#selectArea {
	height: 100%;
	width: 380px;	
}

#selectArea>div {
	width: 100%;
	height: 50%;	
}
#selectArea>div>div{border: 1px solid lightgray;}

/* 작은버튼 스타일 */
.smallBtn {
	width: 60px;
	height: 25px;
	border: 0px;
	border-radius: 5px;
	background: rgb(26, 188, 156); /* 회색 : rgb(190, 190, 190) */
	color: white;
	font-size: 12px;
}

/* 중간버튼 스타일 */
.middleBtn {
	width: 90px;
	height: 35px;
	border: 0px;
	border-radius: 5px;
	background: rgb(26, 188, 156); /* 회색 : rgb(190, 190, 190) */
	color: white;
	font-size: 15px;
}

.middleBtn:hover {
	cursor: pointer;
}
/* 중간버튼 스타일 */

/* 큰버튼 스타일 */
.bigBtn {
	width: 140px;
	height: 40px;
	border: 0px;
	border-radius: 5px;
	background: orange; /* 회색 : rgb(190, 190, 190) */
	color: white;
	font-size: 18px;
	display: inline-block;
}

.bigBtn:hover {
	cursor: pointer;
}
/* 큰버튼 스타일 */
#btnArea {
	margin-left: 910px;
}



.btnDel{
	color:rgb(190, 190, 190);
}
</style>
</head>
<body>


	<div class="popup-outer">
		<div class="popup-title">결재라인 설정</div>
		<div class="popup-content">
			<!-- 검색바 -->
			<div class="searchBar">
				<select name="">
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
			<button class="bigBtn" id="signerSubmit" style="margin-left: 680px;">등록</button>
			</div>
			<div id="wrap">
				<!-- 좌측 조직도영역 -->
				<div id="groupArea">
					<ul class="group_tree">
						<li><input type="checkbox" id="root"> 
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

				<!-- 중앙 리스트영역 -->
				<div id="listArea">
					<div style="width:100%;height:100%;overflow:auto;">
						<table class="boardTable empList">
							<thead>
								<tr>
									<th width="40"><input class="checkBoxAll" type="checkbox" id="checkall" style="zoom: 1.7;"></th>
									<th>이름</th>
									<th>부서</th>
									<th width="120">직책/직급</th>
								</tr>
							</thead>
							<tbody>
							<!-- 조회해온 사원정보 들어갈자리 -->
							</tbody>
						</table>
					</div>	
				</div>

				<!-- 우측 선택영역 -->
				<div id="selectArea">
					<div id="signArea">
						<button class="middleBtn selSigner">선택추가</button>
						<h2 style="display:inline-block;margin:0;">결재</h2>
						<br><br>
						<div style="width:100%;height:280px;overflow:auto;">
								<table id="signList" class="boardTable signSel">
								<thead>
									<tr>
										<th width="100">이름</th>
										<th>부서</th>
										<th width="120">직책/직급</th>
										<th width="40"></th>
									</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>
						</div>	
					</div>
					
					<div id="refArea">
						<button class="middleBtn selRef">선택추가</button>
						<h2 style="display:inline-block;margin:0;">수신/참조</h2>
						<br><br>
						<div id="signSelDiv">
							<div style="width:100%;height:280px;overflow:auto;">
								<table class="boardTable refSel">
								<thead>
									<tr>
										<th width="100">이름</th>
										<th>부서</th>
										<th width="120">직책/직급</th>
										<th width="40"></th>
									</tr>
								</thead>
								<tbody>
								</tbody>
								</table>
							</div>	
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
		//최상단 체크박스 클릭
		$("#checkall").click(function(){
		     //클릭되었으면
		     if($("#checkall").prop("checked")){
		            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
		            $("input[name=chk]").prop("checked",true);
		            //클릭이 안되있으면
		     }else{
		            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
		            $("input[name=chk]").prop("checked",false);
		     }
		 });
		
		//삭제버튼 클릭시 추가된 행 삭제
		$(document).on("click",".btnDel",function(){
			$(this).parent().parent().remove();
		});
		
		
		var value1 = "";
		
		// 결재자 추가
		$(document).on("click",".selSigner",function(){
			
			 $('.checkBox:checked').each(function() {
				var id = $(this).parent().parent().children("input[name=empId]").clone().wrapAll("<div/>").parent().html();
				var name = $(this).parent().parent().children(".name").clone().wrapAll("<div/>").parent().html();
				var dept = $(this).parent().parent().children(".dept").clone().wrapAll("<div/>").parent().html();
				var jobRank = $(this).parent().parent().children(".jobRank").clone().wrapAll("<div/>").parent().html();
				
			
				var regExp = new RegExp($(this).parent().parent().children("input[name=empId]").val());
		       	
				//$(this).removeAttr("checked");
				
				if(regExp.test($(".signSel tbody").html())){
					console.log("중복");
					return false;
				}
				 
				value1 += '<tr>' +  id + name + dept + jobRank
		       			+ '<td><span class="material-icons btnDel">remove_circle</span></td>'
		       			+ '</tr>';
		       			
				$(".signSel tbody").append(value1);
				value1="";
		   });
			
			
		});
		
		
	</script>
	<script>
	
	var value2 = "";
	
	// 수신참조자 추가
	$(document).on("click",".selRef",function(){
		$('.checkBox:checked').each(function() {
			var id = $(this).parent().parent().children("input[name=empId]").clone().wrapAll("<div/>").parent().html();
			var name = $(this).parent().parent().children(".name").clone().wrapAll("<div/>").parent().html();
			var dept = $(this).parent().parent().children(".dept").clone().wrapAll("<div/>").parent().html();
			var jobRank = $(this).parent().parent().children(".jobRank").clone().wrapAll("<div/>").parent().html();
			
		
			var regExp = new RegExp($(this).parent().parent().children("input[name=empId]").val());
	       	
			//$(this).removeAttr("checked");
			
			if(regExp.test($(".refSel tbody").html())){
				console.log("중복");
				return false;
			}
			 
			value2 += '<tr>' +  id + name + dept + jobRank
	       			+ '<td><span class="material-icons btnDel">remove_circle</span></td>'
	       			+ '</tr>';
	       			
			$(".refSel tbody").append(value2);
			value2="";
		});
		
	});	
	</script>
	
	
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
				 	//console.log(eList);
					var value = "";
					
					if(eList.length == 0){ // 리스트가 비어있을 경우
		            	value = '<td colspan="4">조회된 사원이 없습니다. </td>';
					}else{ // 리스트가 비어있지 않을 경우
		            	//console.log(eList[0]);
						for(var i in eList){
							
							var empName = eList[i].empName;
							var empId = eList[i].empId;
							var empRank = eList[i].rankTitle;
							var empJob = eList[i].jobTitle;
							var empDept = eList[i].deptTitle;
							
							value += '<tr><input type="hidden" name="empId" value="'+empId+'">' + 
									 '<td><input name="chk" class="checkBox" type="checkbox"></td>' +
									 '<td class="name">'+empName + '</td>' +
									 '<td class="dept">'+ empDept + '</td>' +
									 '<td class="jobRank" width="120">'+empJob+'/'+empRank+'</td></tr>';							 
							
						}
						$(".empList tbody").html(value);
					} 
					
				},
				error:function(){
					console.log("조직도 부서별 사원 리스트 조회 실패");
				}
			});
		});

	});
	/* 조직도 전체 리스트 조회 - 조직도 페이지 첫 화면 */
	function selectNoList(){		
			
		$.ajax({
			url: "empList.gr",
			type: "post",
			
			success: function(list){
				// console.log(list);
				var value = "";
				
				if(list.length == 0){ // 리스트가 비어있을 경우
	            	value = '<td colspan="4">조회된 사원이 없습니다. </td>';
				}else{ // 리스트가 비어있지 않을 경우
	            
					for(var i in list){
						
						var empName = eList[i].empName;
						var empId = eList[i].empId;
						var empRank = eList[i].rankTitle;
						var empJob = eList[i].jobTitle;
						var empDept = eList[i].deptTitle;
						
						value += '<tr><input type="hidden" name="empId" value="'+empId+'">' + 
						 '<td><input name="chk" class="checkBox" type="checkbox"></td>' +
						 '<td>'+empName + '</td>' +
						 '<td>'+ empDept + '</td>' +
						 '<td width="120">'+empJob+'/'+empRank+'</td></tr>';	
					
					}
				
					$(".empList tbody").html(value);
				}
			},
			error:function(){
				console.log("조직도 사원 리스트조회용 통신 실패");
			}
		});
	}
	</script>
	
	
	
	<!-- 팝업창 자동 사이즈맞춤용 스크립트 -->
	<script>
		$(document)
				.ready(
						function() {
							// 팝업 창 크기를 HTML 크기에 맞추어 자동으로 크기를 조정하는 함수.
							var strWidth;
							var strHeight;

							//innerWidth / innerHeight / outerWidth / outerHeight 지원 브라우저
							if (window.innerWidth && window.innerHeight
									&& window.outerWidth && window.outerHeight) {
								strWidth = $(".popup-outer").outerWidth()
										+ (window.outerWidth - window.innerWidth);
								strHeight = $(".popup-outer").outerHeight()
										+ (window.outerHeight - window.innerHeight);
							} else {
								var strDocumentWidth = $(document).outerWidth();
								var strDocumentHeight = $(document)
										.outerHeight();

								window.resizeTo(strDocumentWidth,
										strDocumentHeight);

								var strMenuWidth = strDocumentWidth
										- $(window).width();
								var strMenuHeight = strDocumentHeight
										- $(window).height();

								strWidth = $(".popup-outer").outerWidth()
										+ strMenuWidth;
								strHeight = $(".popup-outer").outerHeight()
										+ strMenuHeight;
							}

							//resize
							window.resizeTo(strWidth, strHeight);
						});
	</script>

</body>
</html>