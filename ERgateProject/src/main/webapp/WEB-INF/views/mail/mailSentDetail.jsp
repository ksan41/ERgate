<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 메일상세페이지 -->
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
	
	.smallBtn:hover {
		cursor: pointer;
	}
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
	.importantIcon {
		margin:auto;
		padding-top:13px;
		padding-left:10px;
		float:left;
	}
	.attachFileList {
		margin:auto;
		padding-top:20px;
		padding-left:10px;
		float:left;
	}
	.titleZone {
		margin:auto;
		padding-top:20px;
		padding-left:10px;
		float:left;
	}
	.fileZone {
		margin:auto;
		padding-top:20px;
		padding-left:10px;
		float:left;
	}
	.mailTitleZone, .mailAttachFile {
		height:60px; 
		background-color:rgba(211, 211, 211, 0.226);
		width:80%;
	}
	.mailContentZone {
		width:80%;
	}
	.wrap {
		margin-left:-50px;
	}
	#btnArea {
	margin-left: 370px;
	width: 500px;
	display: flex;
	justify-content: center;
	align-items: center;
	}
	
	#btnArea button {
		display: inline-block;
		margin: 5px;
	}
	.infoBar {
		margin-top:7px;
		height:70px;
		font-size:12px;
		font-weight:700;
	}
	.infoBar tr td:nth-child(2n) {
		padding-left:20px;
		width:300px;
		text-align:left;
	}
	.onlyContent {
		min-height:300px;
		width:80%;
	}
	.contentPre {
		margin-left:10px;
	}
/* ==========페이지영역========== */
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
				<li><button class="subBtn">받은메일함</button></li>
				<li><button class="subBtn subActive">보낸메일함</button></li>
				<li><button class="subBtn">중요메일함</button></li>
				<li><button class="subBtn">메일작성</button></li>
			</ul>
		</div>
		<div class="contentArea">
			<!-- 내용 작성 영역 입니다-->
			<br>
			
			<div class="wrap">
				<table class="bas">
					<tr>
						<td id="leftArea">
							<button class="smallBtn">전달</button>&nbsp;
							<button class="smallBtn" style="background:gray;">메일수거</button>&nbsp;
							<button class="smallBtn takeManyBtn" style="background:rgb(190, 190, 190);">삭제</button>
						</td>
					</tr>
				</table>
				<br>
				<div class="mailTitleZone">
					<div>
						<div class="importantIcon"><img src="../../resources/icons/star_border-black-48dp.svg"></div>
						<div class="titleZone" name="mailTitle">안녕하세요, 개발팀 케빈입니다.</div>
					</div>
				</div>
				
				<div class="mailContentZone">
				<table class="infoBar">
					<tr>
						<td>보낸사람</td>
						<td>kevin166@ergate.com</td>
					</tr>
					<tr>
						<td>받는사람</td>
						<td>lessmoni@ergate.com</td>
					</tr>
					<tr>
						<td>보낸날짜</td>
						<td>2020-05-05 19:22</td>
					</tr>
				</table>
				<div style="height:1px;"></div>
				<hr>
				<div class="onlyContent">
					<pre class="contentPre" name="mailContent">
피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이

피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀
					
이 없으면 
					
인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 
					
찾아다녀도 목숨이 있는 때까지 방황하여
					
도 보이는 것은
					</pre>
				</div>
				<div style="height:1px;"></div>
				<hr>
				</div>
				
				<div class="mailAttachFile">
					<div>
						<div class="attachFileList">첨부파일 : </div>
						<div class="fileZone"><a href="">4월 생일자 명단.xlsx</a></div>
					</div>
				</div>
			</div>
			<br><br>
			<div id="btnArea">
				<button class="bigBtn listBtn">목록으로</button>
			</div>
			
			<br><br><br><br>
		</div>
	</div>
		</div>
	</div>
</body>
</html>