<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice Update Form</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
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
#noticeDetail {
	padding-top: 20px;
    padding-left: 30px;
	background: white;
	width: 1300px;
	height: 600px;
	border-collapse: separate;
    border-spacing: 0 20px;
    font-size:18px;
}

/* input창 스타일(가로크기는 자유) */
.inputs {
	height: 30px;
	border: 1px solid lightgray;
	border-radius: 3px;
	width:1065px;
}
/* input창 스타일 */

/* textarea스타일 */
.textArea {
	border: 1px solid lightgray;
	border-radius: 3px;
	resize: none;
}
/* textarea스타일 */



/* 큰버튼 스타일 */
.bigBtn {
	width: 140px;
	height: 40px;
	border: 0px;
	border-radius: 5px;
	background: rgb(190, 190, 190);
	color: white;
	font-size: 18px;
}

.bigBtn:hover {
	cursor: pointer;
}
/* 큰버튼 스타일 */
#btnArea {
	margin-left: 420px;
	width: 500px;
	display: flex;
	justify-content: center;
	align-items: center;
}

#btnArea button {
	display: inline-block;
	margin: 5px;
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
			<span>공지</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
				<li><button class="subBtn subActive">공지사항</button></li>
			</ul>
		</div>
		<div class="contentArea">
			<h4 style="margin-left: 1200px;">공지사항 수정</h4>
			<form name="noticeUpdate" action="#" method="post">
				<table id="noticeDetail">
					<tr>
						<th colspan="2">제목</th>
						<td colsapn="6"><input name="noticeTitle" class="inputs" type="text" value="제목입니다"></td>
					</tr>
					<tr>
						<th colspan="2">첨부파일</th>
						<td colspan="6"><button type="button" class="bigBtn" onclick="addFile();">추가</button>
							&nbsp;&nbsp;<a href="#">첨부파일.jpg</a>
							<input id="addFiles" type="file" name="noticeFile" multiple style="display:none;">
						</td>
					</tr>
					<tr>
						<td colspan="8" rowspan="20">
							<textarea class="textArea" cols="160" rows="25">공지사항내용~~~~
							</textarea>
						</td>
					</tr>
				</table>
			</form>
			<br>
			<div id="btnArea">
				<button id="submitNotice" class="bigBtn" style="background: rgb(26, 188, 156);">수정</button>
				<button class="bigBtn">취소</button>
			</div>
			<br> <br><br>
		</div>
	</div>
	
	<script>
		function addFile(){
			$("#addFiles").click();
		}
		
		$("#submitNotice").click(function(){
			$("form[name=noticeUpdate]").submit();
		});
	</script>
</body>
</html>