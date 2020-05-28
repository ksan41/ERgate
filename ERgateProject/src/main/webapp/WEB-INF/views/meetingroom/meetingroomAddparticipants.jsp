<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>meetingroomAddparticipants</title>
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
	height: 600px;
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

.btnDel{
	color:rgb(190, 190, 190);
}

.resetBtn{
	width: 140px;
	height: 40px;
	border: 0px;
	border-radius: 5px;
	background: rgb(190, 190, 190);
	color: white;
	font-size: 18px;
}

.resetBtn:hover {
	cursor: pointer;

}

.submitBtn{
	width: 140px;
	height: 40px;
	border: 0px;
	border-radius: 5px;
	background: rgb(26, 188, 156);
	color: white;
	font-size: 18px;
}

.submitBtn:hover {
	cursor: pointer;

}

.btns{
	margin-left:850px;

}
</style>
</head>
<body>


	<div class="popup-outer">
		<div class="popup-title">참석자 추가</div>
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
			</div>

			<div id="wrap">
				<!-- 좌측 조직도영역 -->
				<div id="groupArea">
					<ul class="group_tree">
						<li><input type="checkbox" id="root"> <label
							for="root"> ERgate</label>
							<ul>
								<li><a href="#"> 임원</a></li>
								<li><a href="#"> 기술팀</a></li>
								<li><a href="#"> 인사팀</a></li>
								<li><a href="#"> 회계팀</a></li>
								<li><a href="#"> 기술팀</a></li>
							</ul></li>
					</ul>
				</div>

				<!-- 중앙 리스트영역 -->
				<div id="listArea">
					<div style="width:100%;height:100%;overflow:auto;">
						<table class="boardTable">
							<thead>
								<tr>
									<th width="40"><input class="checkBox" type="checkbox" id="checkall"></th>
									<th>이름</th>
									<th>부서</th>
									<th width="120">직책/직급</th>
								</tr>
							</thead>
							<tr>
								<td><input name="chk" class="checkBox" type="checkbox"></td>
								<td>써니</td>
								<td>인사부</td>
								<td>팀장/차장</td>
							</tr>
							<tr>
								<td><input name="chk" class="checkBox" type="checkbox"></td>
								<td>써니</td>
								<td>인사부</td>
								<td>팀장/차장</td>
							</tr>
							<tr>
								<td><input name="chk" class="checkBox" type="checkbox"></td>
								<td>써니</td>
								<td>인사부</td>
								<td>팀장/차장</td>
							</tr>
						</table>
					</div>	
				</div>

				<!-- 우측 선택영역 -->
				<div id="selectArea">
					<div id="signArea">
						<button class="middleBtn">선택추가</button>
						<h2 style="display:inline-block;margin:0;">참석자</h2>
						<br><br>
						<div style="width:100%;height:200px;overflow:auto;">
								<table id="signList" class="boardTable signSel">
								<thead>
									<tr>
										<th width="100">이름</th>
										<th>부서</th>
										<th width="120">직책/직급</th>
										<th width="40"></th>
									</tr>
								</thead>
								<tr>
									<td>써니</td>
									<td>인사부</td>
									<td>팀장/차장</td>
									<td><span class="material-icons btnDel">remove_circle</span></td>
								</tr>
								<tr>
									<td>써니</td>
									<td>인사부</td>
									<td>팀장/차장</td>
									<td><span class="material-icons btnDel">remove_circle</span></td>
								</tr>
							</table>
						</div>	
					</div>
					
					<!-- 예약/취소 버튼 -->
				
				</div>
					<div class=btns>
						<button class="resetBtn" type="reset">초기화</button>
						<button class="submitBtn" type="reset">등록</button>
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