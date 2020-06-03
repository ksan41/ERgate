<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<!-- 사내 게시판 상세페이지 -->
<head>
<meta charset="UTF-8">
<title>board Detail</title>
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
#noticeDetail, #boardDetail {
	padding: 20px;
	background: white;
	min-height: 400px;
	width: 1300px;
	height: auto;
	position: relative;
}

#noticeContent, #boardContent {
	width: 1300px;
	min-height: 400px;
	height: auto;
	margin-bottom: 30px;
}

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

.bottomArea {
	padding: 20px;
	width: 1300px;
	height: 72px;
	background: white;
}

.material-icons {
	color: white;
	display: inline-block;
	vertical-align: text-top;
	font-size: 20px;
}

.roundIcon {
	width: 20px;
	height: 20px;
	border-radius: 50%;
	background: rgb(26, 188, 156);
	display: inline-block;
	margin-top: 5px;
}
/* textarea스타일 */
.textArea {
	border: 1px solid lightgray;
	border-radius: 3px;
	resize: none;
}
/* textarea스타일 */
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

/* 댓글 영역 스타일 */
.
.replyContent{
	width:100%;
	min-height:50px;
}

.replyContent tr td:nth-child(1n) {
	color:gray;
	font-weight:700;
}
#reContent {
	color:black;
	font-weight:100;
}
#reContentWrap {
	height:30px;
}
.afterBoard:hover, .beforeBoard:hover {
	color:orangered;
	cursor:pointer;
}


/* 댓글창 */
.replyShow{
	width:1300px;
	height:auto;
	min-height:110px;
	background:white;
	padding:15px;
}
#replyBtnArea{
	width:160px;
	height:20px;
	margin-left:1020px;
	margin-top:20px;
}

#replyBtnArea *{
	float:left;
	margin-right:5px;
}
#reDate {
	font-size:14px; 
	color:lightgray;
}
/*대댓글*/
.rereply{
	padding-left:50px;
}

/* 파일테이블 */
.fileTable {
	text-align:left;
}
.fileTable tr:nth-child(1) td:nth-child(1) b {
	margin-left:1px;
}
.fileTable tr:nth-child(1) td:nth-child(2) {
	width:25px;
}
.fileTable tr:nth-child(1) td:nth-child(2) img {
	margin-left:-10px;
	margin-top:8px;
}
/* 파일 첨부 관련 */

</style>
</head>
<body>
	<!-- 이곳에 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp" />
	<!-- 이곳에 메뉴바 include -->

	<div class="outer">
		<div class="topBar">
			<!-- 메뉴명 -->
			<span>사내게시판</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
				<li><button class="subBtn subActive">사내게시판</button></li>
			</ul>
		</div>
		<div class="contentArea">
			<h4 style="margin-left: 1230px;">사내게시판 상세</h4>
			<div id="boardDetail">
				<h3>${b.boardTitle }</h3>
				<h4>
					${b.boardNo } | ${b.boardWriter } | ${b.boardEnrollDate } | ${b.boardCount }
					</h4>
					<hr>
					<br> <br>
					<div id="boardContent">${b.boardContent }</div>
					<c:if test="${b.boardFileFlag eq 'Y' }">
					<table class="fileTable">
						<tr>
							<td width="65">
								<b>첨부파일</b>
							</td>
							<td>
								<img class="fileShow"src="${pageContext.servletContext.contextPath }/resources/icons/save_alt.png" style="transform:translate(0,-2px) scale(0.5);" class="bigBtn fileShow">
							</td>
							<td colspan="6">
							</td>
						</tr>
						<tr>
							<td colspan="8">
										<div class="fileWrap" style="display:none;" style="text-align:left;">
								        <div id="dropZone" style="width: 1140px; height: 100px; border: 1px solid lightgray;">
								            <table id="fileListTable" width="100%" border="0px">
								                <tbody id="fileTableTbody">
								                </tbody>
								            </table>
								        </div>
							</td>
						</tr>
					</table>
					</c:if>
					
								
					
			</div>
			<br>
			<div id="btnArea">
				<button class="bigBtn listBtn" style="background: rgb(26, 188, 156);">목록</button>
				<button class="bigBtn updateBtn">수정</button>
				<button class="bigBtn deleteBtn">삭제</button>
			</div>
			<br><br>
			<p style="margin-bottom:5px;font-weight:bold;">댓글작성</p>
			
			<!-- 답글 입력 영역 -->
			<div class="replyWrap" style="width:100%;">
			<form action="reply.bo" method="get">
				<div class="replyArea" style="float:left;">
					<!-- 텍스트에리어 -->
					<!-- 용도에 따라 cols(가로) rows(세로) 적절히 변경-->
					<textarea class="textArea" name="replyContent" cols="170" rows="5" placeholder="내용을 입력하세요."></textarea>
					<!-- 텍스트에리어 -->
				</div>
				<input type="hidden" name="userNo" value="로그인한유저번호">
				<div class="btnArea" style="float:left; height:81px;">
					<button class="smallBtn" type="submit" style="margin-left:35px; margin-top:27px; background: rgb(190, 190, 190);">등록</button>
				</div>
			</form>
			</div>
			
			<!-- 답글 표시 영역 -->
			<br><br><br><br><br>
			
			<div class="replyShow">
			
			
				
				
				
			</div>
			<br>

			
			<br> <br>
			<div class="bottomArea">
				<div class="roundIcon">
					<span class="material-icons">arrow_drop_up</span>
				</div>
				<p style="display: inline;">다음글</p>
				<p class="afterBoard" style="display: inline-block; width: 960px; margin: 0px; margin-left: 50px;">제목입니다.</p>
				<p align="right" style="display: inline-block; width: 200px; margin: 0px; margin-left: 10px; text-align:left;">2020/05/10 | 엘리스</p>
				<hr>
				
				<div class="roundIcon">
					<span class="material-icons">arrow_drop_down</span>
				</div>
				<p style="display: inline;">이전글</p>
				<p class="beforeBoard" style="display: inline-block; width: 960px; margin: 0px; margin-left: 50px;">제목입니다.</p>
				<p align="right" style="display: inline-block; width: 200px; margin: 0px; margin-left: 10px; text-align:left;">2020/05/10 | 잭슨</p>
			</div>
			<br> <br> <br>
		</div>
	</div>
	<script>
	$(document).ready(function() { 
		$(".listBtn").click(function(){
			var pno=0; // 페이지 번호가 들어갈꺼임 (나중에 돌아올때 현재 페이지로 오기 위해서)
			location.href="list.bo?currentPage=" + ${currentPage};
		});
		
		$(".updateBtn").click(function(){
			var bno=0; // 글번호가 들어갈꺼임 (무엇을 수정할지 알아야되니까)
			location.href="update.bo?pno=" + bno;
		});
		
		$(".deleteBtn").click(function(){
			var bno=0; // 글번호가 들어갈꺼임 (무엇을 삭제할지 알아야되니까)
			location.href="delete.bo?pno=" + bno;
		});
		
		$(".fileShow").click(function() {
			if($(".fileWrap").is(":visible")){
				$(".fileWrap").slideUp(100);
			}else {
				$(".fileWrap").slideDown(100);
			}
			$.ajax({
				url:"detailFile.bo",
				data:{refBoardNo:${b.boardNo}},
				success:function(list){
					var value = "";
					for(var i in list){
						value += "<tr>" +
									"<td>" + "<a href='"+"${pageContext.servletContext.contextPath }/resources/uploadFiles/board/"+list[i].changeName+"' download=" +list[i].originName+ ">"+ list[i].originName +"</a>" +"</td>" +
								 "<tr>";
					}
					$("#fileListTable tbody").html(value);
				},error:function(){
					console.log("ajax 통신 실패");
					
				}
			});
		});
		
		
		
			$.ajax({
				url:"rlist.bo",
				data:{refBno:${b.boardNo}},
				success:function(list){
					var value = "";
					var cnt = 0;
					var num = [];
					for(var i in list){
						value += "<div style='width:1300px;height:110px;'>" +
								 "<table class='replyContent'>" +
								 "<tr>" +
									"<td>" + list[i].replyWriter + "</td>" +
								 "</tr>" +
								 "<tr>" +
								 	"<td id='reContentWrap'>" + "<span id='reContent'>" + list[i].replyContent + "</span>" + "</td>" +
								 "</tr>" +
								 "<tr>" +
								 	"<td id='reDate'>" + list[i].replyEnrollDate + "</td>" +
								 "</tr>" +
								 "<tr>" +
								 "<td id='replyBtnArea'>" +
								 	"<button class='smallBtn replyUpdateBtn'>수정</button>" +
								 	"<button class='smallBtn replyDeleteBtn' style='background: rgb(190, 190, 190);'>삭제</button>" +
								 "</td>" +
								 "</tr>" +
								 "</table>" + 
								 "<hr>" +
								 "</div>" +
								 "<br>" + 
								 "<div class='rereplyShow"+list[i].replyNo+"' >"+
								 "</div>";
						num[cnt] = list[i].replyNo;
						cnt = cnt + 1;
					}
					$(".replyShow").html(value);
					
					for(var i = 0; i < num.length; i++){ // 게시글에 딸려있는 리플 갯수만큼 num[]에 리플 번호를 담아놨음. 
					    (function(i) {
					            $.ajax({
					                url: "relist.bo",
					                data:{refRno:num[i]}, // 여기로 댓글 번호를 넘김 (대댓글은 댓글 번호를 참조로 하고 있음)(num변수가 배열이니까 배열 길이만큼 반복해서 controller로 넘김)
					                success:function(relist){
					                	var value2 = "";
										for(var i in relist){ // 같은 리플에 대댓글이 여러개일수도 있으니까 for문을 돌림 (보통은 1개지만)
											value2 += "<div style='width:1300px;height:110px;'>" +
													  "<table class='replyContent rereply'>" +
													  "<tr>" +
													 	"<td>" + "└"+ relist[i].replyWriter + "</td>" +
													  "</tr>" +
													  "<tr>" +
													  	"<td id='reContentWrap'>" + "<span id='reContent'>" + relist[i].replyContent + "</span>" + "</td>" +
													  "</tr>" +
													  "<tr>" +
													  	"<td id='reDate'>" + relist[i].replyEnrollDate + "</td>" +
													  "</tr>" +
													  "<tr>" +
													  "<td id='replyBtnArea'>" +
													  	"<button class='smallBtn replyUpdateBtn'>수정</button>" +
													  	"<button class='smallBtn replyDeleteBtn' style='background: rgb(190, 190, 190);'>삭제</button>" +
													  "</td>" +
													  "</tr>" +
													  "</table>" + 
													  "<hr>" +
													  "</div>" +
													  "<br>";
											$(".rereplyShow" + relist[i].refRno).html(value2); 
											// 여기서 리소스 낭비가 좀 있음, value2에 있는 값을 뿌려주는건데, 뿌려지는 구문이 for문 안에 있기 때문에 '댓글 1개'뿌린 상태에서 
											// '댓글 2개'를 다시 덮어씌워버림, 처음부터 댓글 2개를 한꺼번에 뿌리는걸 해야되는데 그걸 못하겠음(rereplyShow + replist[i].refRno 이기 때문에..)
											// 일단 리소스는 낭비되지만, 결과는 제대로 나옴 (향후 수정해야하는 부분)
										}
					                 },error: function(){
					                    console.log("ajax 통신 실패");
					                 } 
					            });
					    })(i);
					}

					
					},error:function(){
						console.log("ajax 통신 실패");
					}
			});

	});
	
	$(document).ready(function() { 
		$(".replyUpdateBtn").click(function(){
			var replyno=0; // 댓글번호가 들어갈꺼임 (무엇을 수정할지 알아야되니까)
			location.href="replyUpdate.bo?replyno=" + replyno;
		});
		
		$(".replyDeleteBtn").click(function(){
			var replyno=0; // 댓글번호가 들어갈꺼임 (무엇을 삭제할지 알아야되니까)
			location.href="replyDelete.bo?replyno=" + replyno;
		});
	});
	
	$(document).ready(function() { 
		$(".afterBoard").click(function(){
			var bno=0; // 현재 글번호가 들어갈꺼임 (무엇을 수정할지 알아야되니까)
			location.href="detail.bo?bno=" + bno;
		});
		
		$(".beforeBoard").click(function(){
			var bno=0; // 현재 글번호가 들어갈꺼임 (무엇을 삭제할지 알아야되니까)
			location.href="detail.bo?bno=" + bno;
		});
		/*	이전글 다음글 가져오는건 아래의 쿼리문을 참조하도록 하자 (다음글 번호, 이전글 번호 를 가져오기가 복잡하니 현재 글 번호를 통해 다음, 이전글 번호 알아내자)
			SELECT * FROM BOARD
				WHERE BOARD_NO IN (
					( SELECT BOARD_NO FROM BOARD WHERE BOARD_NO < key(현재글번호) ORDER BY BOARD_NO DESC LIMIT 1), // 이전글
					( SELECT BOARD_NO FROM BOARD WHERE BOARD_NO > key(현재글번호) ORDER BY BOARD_NO LIMIT 1 ), // 다음글
				);
		*/
	});
	</script>
	
</body>
</html>