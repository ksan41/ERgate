<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 받은메일함 페이지 -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.pagingBar li>span {
	color: rgb(26, 188, 156);
	border: 1px solid rgb(26, 188, 156);
}

.pagingBar li a:hover {
	color: rgb(26, 188, 156);
	border: 1px solid rgb(26, 188, 156);
}

/* 페이징바 스타일 */
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

/* 체크박스 모양 변경 */

.importbox {
	display:none;
}

/* 변경된 체크박스 이미지 위치 조정 */
.mailTable tr td label img, .mailTable tr th label img {
	 margin-top:3.5px;
}

/* 계정 주소 표시를 위한 ToolTip 설정 */
[data-tooltip-text]:hover {
	position: relative;
}

[data-tooltip-text]:hover:after {
	background-color: #000000;
	background-color: rgba(0, 0, 0, 0.8);

	-webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	-moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);

	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;

	color: #FFFFFF;
	font-size: 12px;
	content: attr(data-tooltip-text);

  margin-bottom: 10px;
	top: 130%;
	left: 0;    
	padding: 7px 12px;
	position: absolute;
	width: 150px;
	min-width: 100px;
	max-width: 300px;
	word-wrap: break-word;

	z-index: 9999;
}

</style>   
</head>
<body>
	<!-- 이곳에 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp"/>
	<!-- 이곳에 메뉴바 include -->
	
	<div class="outer">
		<div class="topBar">
			<!-- 메뉴명 -->
			<span>사내메일</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
				<li><button class="subBtn subActive">받은메일함</button></li>
				<li><button class="subBtn">보낸메일함</button></li>
				<li><button class="subBtn">중요메일함</button></li>
				<li><button class="subBtn">메일작성</button></li>
			</ul>
		</div>
		<div class="contentArea">
			<!-- 내용 작성 영역 입니다-->
			<br>
			<!-- 버튼과 검색바 같이 들어가는 DIV -->
			<div btnAndSearch>
				<table class="bas">
					<tr>
						<td id="leftArea">
							<button class="middleBtn">답장</button>&nbsp;
							<button class="middleBtn" style="background:gray;">전달</button>&nbsp;
							<button class="middleBtn takeManyBtn" style="background:rgb(190, 190, 190);">삭제</button>
						</td>
						<td id="rightArea">
							<!-- 검색바 -->
							<div class="searchBar">
								<select>
									<option>제목</option>
									<option>내용</option>
									<option>주소</option>
								</select> <input type="text">
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
			<!-- 게시판 -->
			<table class="boardTable mailTable">
				<thead>
					<tr>
						<th width="80">
							<div class="">
					    		<label><input class="checkbox" type="checkbox" id="checkall" value="" style="vertical-align: middle; transform: scale(1.6);"></label>
					        </div>
   						</th>
						<th width="80">
								<label><input type="checkbox" class="importbox" id="importAll" name="ichk"><img src="../../resources/icons/star_border-black-48dp.svg"></label>
						</th>
						<th width="220">계정</th>
						<th>제목</th>
						<th width="150">받은날짜</th>
					</tr>
				</thead>
				<tr>
					<td>
						<label><input class="checkbox chk" type="checkbox" name="chk" value="" style="vertical-align: middle; transform: scale(1.5);"></label>
   					</td>
					<td>
						<label><input type="checkbox" class="importbox" name="ichk"><img src="../../resources/icons/star_border-black-48dp.svg"></label>
					</td>
					<td><span data-tooltip-text="kevin76@ergate.com">케빈</span></td>
					<td>메일 제목입니다. 좀 말려주세요</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td>
						<label><input class="checkbox chk" type="checkbox" name="chk" value="" style="vertical-align: middle; transform: scale(1.5);"></label>
   					</td>
					<td>
						<label><input type="checkbox" class="importbox" name="ichk"><img src="../../resources/icons/star_border-black-48dp.svg"></label>
					</td>
					<td><span data-tooltip-text="kevin76@ergate.com">케빈</span></td>
					<td>메일 제목입니다. 좀 말려주세요</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td>
						<label><input class="checkbox chk" type="checkbox" name="chk" value="" style="vertical-align: middle; transform: scale(1.5);"></label>
   					</td>
					<td>
						<label><input type="checkbox" class="importbox" name="ichk"><img src="../../resources/icons/star_border-black-48dp.svg"></label>
					</td>
					<td><span data-tooltip-text="kevin76@ergate.com">케빈</span></td>
					<td>메일 제목입니다. 좀 말려주세요</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td>
						<label><input class="checkbox chk" type="checkbox" name="chk" value="" style="vertical-align: middle; transform: scale(1.5);"></label>
   					</td>
					<td>
						<label><input type="checkbox" class="importbox" name="ichk"><img src="../../resources/icons/star_border-black-48dp.svg"></label>
					</td>
					<td><span data-tooltip-text="kevin76@ergate.com">케빈</span></td>
					<td>메일 제목입니다. 좀 말려주세요</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td>
						<label><input class="checkbox chk" type="checkbox" name="chk" value="" style="vertical-align: middle; transform: scale(1.5);"></label>
   					</td>
					<td>
						<label><input type="checkbox" class="importbox" name="ichk"><img src="../../resources/icons/star_border-black-48dp.svg"></label>
					</td>
					<td><span data-tooltip-text="kevin76@ergate.com">케빈</span></td>
					<td>메일 제목입니다. 좀 말려주세요</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td>
						<label><input class="checkbox chk" type="checkbox" name="chk" value="" style="vertical-align: middle; transform: scale(1.5);"></label>
   					</td>
					<td>
						<label><input type="checkbox" class="importbox" name="ichk"><img src="../../resources/icons/star_border-black-48dp.svg"></label>
					</td>
					<td><span data-tooltip-text="kevin76@ergate.com">케빈</span></td>
					<td>메일 제목입니다. 좀 말려주세요</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td>
						<label><input class="checkbox chk" type="checkbox" name="chk" value="" style="vertical-align: middle; transform: scale(1.5);"></label>
   					</td>
					<td>
						<label><input type="checkbox" class="importbox" name="ichk"><img src="../../resources/icons/star_border-black-48dp.svg"></label>
					</td>
					<td><span data-tooltip-text="kevin76@ergate.com">케빈</span></td>
					<td>메일 제목입니다. 좀 말려주세요</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td>
						<label><input class="checkbox chk" type="checkbox" name="chk" value="" style="vertical-align: middle; transform: scale(1.5);"></label>
   					</td>
					<td>
						<label><input type="checkbox" class="importbox" name="ichk"><img src="../../resources/icons/star_border-black-48dp.svg"></label>
					</td>
					<td><span data-tooltip-text="kevin76@ergate.com">케빈</span></td>
					<td>메일 제목입니다. 좀 말려주세요</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td>
						<label><input class="checkbox chk" type="checkbox" name="chk" value="" style="vertical-align: middle; transform: scale(1.5);"></label>
   					</td>
					<td>
						<label><input type="checkbox" class="importbox" name="ichk"><img src="../../resources/icons/star_border-black-48dp.svg"></label>
					</td>
					<td><span data-tooltip-text="kevin76@ergate.com">케빈</span></td>
					<td>메일 제목입니다. 좀 말려주세요</td>
					<td>2020/05/10</td>
				</tr>
				<tr>
					<td>
						<label><input class="checkbox chk" type="checkbox" name="chk" value="" style="vertical-align: middle; transform: scale(1.5);"></label>
   					</td>
					<td>
						<label><input type="checkbox" class="importbox" name="ichk"><img src="../../resources/icons/star_border-black-48dp.svg"></label>
					</td>
					<td><span data-tooltip-text="kevin76@ergate.com">케빈</span></td>
					<td>메일 제목입니다. 좀 말려주세요</td>
					<td>2020/05/10</td>
				</tr>
				
				
				
				
				
				
			</table>
			<!-- 게시판 -->
			
			<!-- 페이징바 -->
			<ul class="pagingBar">
				<li><a href="#">&lt;&lt;</a></li>
				<li><a href="#">&lt;</a></li>
				<li><span>1</span></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">6</a></li>
				<li><a href="#">7</a></li>
				<li><a href="#">8</a></li>
				<li><a href="#">9</a></li>
				<li><a href="#">10</a></li>
				<li><a href="#">&gt;</a></li>
				<li><a href="#">&gt;&gt;</a></li>
			</ul>
			<!-- 페이징바 -->

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
	//최상단 중요메일 클릭
	$("#importAll").click(function(){
	     //클릭되었으면
	     if($("#importAll").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=ichk]").prop("checked",true);
	            $("input[name=ichk]").parent().find('img').attr('src','../../resources/icons/star-black-48dp.svg');
	            //클릭이 안되있으면
	     }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=ichk]").prop("checked",false);
	            $("input[name=ichk]").parent().find('img').attr('src','../../resources/icons/star_border-black-48dp.svg');
	     }
	 });
	$(document).ready(function() { 
		$(".importbox").on('click', function() { 
			if ( $(this).prop('checked') ) {
				$(this).parent().find('img').attr('src','../../resources/icons/star-black-48dp.svg');
			}else { 
				$(this).parent().find('img').attr('src','../../resources/icons/star_border-black-48dp.svg');
			} 
		}); 
	});

	
	
	
	$(".takeManyBtn").click(function(){
		 var delchk = []; // key 값을 담을 배열
		 $('.chk:checked').each(function(){
		    delchk.push($(this).val());
		 });
		 
		 location.href="";
	})
	</script>
</body>
</html>









