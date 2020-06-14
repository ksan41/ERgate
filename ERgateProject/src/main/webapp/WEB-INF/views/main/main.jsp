<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
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
    
/* main */
	/* 영역 지정 css */    
    #mainTable{
    	width: 1400px;
    	height: 700px;
    	margin-bottom: 50px;
    }
    #mainTable img{
    	width: 30px;
    	height: 30px;
    }
    
    #mainScheduleArea, #mainNoticeArea{
    	width: 950px;
    	height: 50%;
    }
    #mainMailArea, #mainSignArea{
    	width: 450px;
    	height: 50%;
    }
    #mainScheduleArea, #mainMailArea{
    	padding-bottom: 30px;
    }
    #mainScheduleTable, #mainNoticeTable{
    	width: 90%;
    	height: 100%;
    }
    #mainMailTable, #mainSignTable{
    	width: 95%;
    	height: 100%;
    }
	/* 영역 지정 css */    

	/* 각 영역 제목, 버튼 */
    .mainLabel{
    	font-size: 24px;
    	color: gray;
    	text-align: left;
    	font-weight: 500;
    	height: 50px;
    }
    .mainNextArea{
    	text-align: right;
    	padding-right: 10px;
    }
    .mainNextBtn{
    	border: none;
    	background: none;
    	margin-top: 10px;
    }
    .cursorPointer:hover{
    	cursor:pointer;
    }
    /* 각 영역 제목, 버튼 */
    
    /* 일정관리 영역 */
    .mainRadioBtn{
    	width: 15px;
    	height: 15px;
    }
    .mainRadioLabel{
    	font-size: 20px;
    }
    #mainScheduleRadio{
    	display: inline-block;
    	width: 250px;
    	text-align: left;
    	vertical-align: top;
    	padding-top: 15px;
    }
    #mainDateArea{
    	font-size: 20px;
    	color: rgb(26, 188, 156);
    	height: 44px;
    	font-weight: 550;
    }
    /* 일정관리 영역 */
    
	/* 일정, 공지 게시판 */
	#mainScheduleBoard, #mainNoticeBoard{
		width: 100%;
		height: 200px;
	}
	/* 일정, 공지 게시판 */
	
	/* 메일, 결재 영역 */
	#mainMailDiv, #mainSignDiv{
		width: 99%;
		height: 80px;
		background: rgb(244,244,244);
		border-radius: 5px;
		margin-left: 2px;
		margin-top: 15px;
		margin-bottom: 25px;
		padding-top: 8px;
	}
	.mainSignBoard{
		width:100%;
	}
	
	
    #mainMailInnerTable, #mainSignInnerTable{
    	width: 100%;
    	height: 95%;
    }
    .mainMailInnerLabel, .mainSignInnerLabel{
    	height: 40%;
    	font-size: 15px;
    	text-align: center;
    }
    .mainMailInnerLabel{
    	width: 33%;
    }
    .mainSignInnerLabel{
    	width: 50%;
    }
    .mainMailInnerContent, .mainSignInnerContent{
    	font-size: 27px;
    	text-align: center;
    }
    .mainMailInnerContent:hover, .mainSignInnerContent:hover{
    	color: rgb(26, 188, 156);
    	font-weight: 550;
    	cursor: pointer;
    }
    #mainMailBoard, #mainSignBoard{
    	width: 100%;
    }
    #mainSignBoard{
    	overflow:hidden;
    }
    
    #mainSignThArea, #mainMailThArea{
    	text-align: center;
    }
    .thDiv{
    	display: inline-block;
    	font-size: 18px;
    	border: 2px solid white;
    	width: 120px;
    	height: 30px;
    	text-align: center;
    	margin-left: 5px;
    	margin-right: 5px;
    }
    .thDiv:hover{
    	border-bottom: 2px solid rgb(26, 188, 156);
    	cursor: pointer;
    }
	/* 메일, 결재 영역 */

    
/* main */
    
	/* 게시판 스타일 */
	/* .boardTable {
		width: 1400px;
		height: 400px;
	} */
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
.nonContent {
	cursor : default;
}
</style>   
</head>
<body>
	<c:if test="${ !empty msg }">
		<script>
			alert('${ msg }');
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
		
	<!-- 이곳에 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp" />

	<div class="outer">
		<div class="topBar"><span></span></div>
		<!-- <div class="subMenuArea"></div> -->
		<div class="contentArea">
			<!-- 내용 작성 영역 입니다-->
			<table id="mainTable">
				<tr>
					<td id="mainScheduleArea">
						<table id="mainScheduleTable">
							<tr>
								<th class="mainLabel">
									<img src="${ pageContext.servletContext.contextPath }/resources/icons/event.png" onclick="location.href='selectList.sc';" class="cursorPointer">
									<span style="vertical-align: top;" onclick="location.href='selectList.sc';" class="cursorPointer">일정관리</span>
								</th>
								<td class="mainNextArea">
									<div id="mainScheduleRadio">
										<input type="radio" id="individual" class="mainRadioBtn" checked>
										<label for="individual" class="mainRadioLabel">개인</label>&nbsp;&nbsp;
										<input type="radio" id="business" class="mainRadioBtn" checked>
										<label for="business" class="mainRadioLabel">업무</label>&nbsp;&nbsp;
										<input type="radio" id="share" class="mainRadioBtn" checked>
										<label for="share" class="mainRadioLabel">공유</label>
									</div>
									<button class="mainNextBtn cursorPointer" onclick="location.href='selectList.sc';">
										<img src="${ pageContext.servletContext.contextPath }/resources/icons/next.png">
									</button>
								</td>
							</tr>
							<tr>
								<td colspan="2" id="mainDateArea">
									<b id="calYear"></b>년 
									<b id="calMonth"></b>월 
									<b id="calDay"></b>일
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<!-- 게시판 -->
									<table id="mainScheduleBoard" class="boardTable">
										<thead>
											<tr>
												<th>시각</th>
												<th>일정 내용</th>
											</tr>
										</thead>
										<c:forEach var="list" items="${slist}" begin="1" end="5">										
										<tr>										
											<td>${list.scheduleStartTime}</td>
											<td>${list.scheduleTitle}</td>										
										</tr><br>
	
										</c:forEach>
										
									</table>
									<!-- 게시판 -->
								</td>
							</tr>
						</table>
					</td>
					<td id="mainMailArea">
						<table id="mainMailTable">
							<tr>
								<th class="mainLabel">
									<img src="${ pageContext.servletContext.contextPath }/resources/icons/mail.png" onclick="location.href='list.mil?currentPage=1&mailOwn=${loginUser.empId}';" class="cursorPointer">
									<span style="vertical-align: top;" onclick="location.href='list.mil?currentPage=1&mailOwn=${loginUser.empId}';" class="cursorPointer">전자메일</span>
								</th>
								<td class="mainNextArea">
									<button class="mainNextBtn cursorPointer" onclick="location.href='list.mil?currentPage=1&mailOwn=${loginUser.empId}';">
										<img src="${ pageContext.servletContext.contextPath }/resources/icons/next.png">
									</button>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div id="mainMailDiv">
										<table id="mainMailInnerTable">
											<tr>
												<td class="mainMailInnerLabel">안 읽은 메일</td>
												<td class="mainMailInnerLabel">받은 메일</td>
												<td class="mainMailInnerLabel">
													<svg class="star_icons" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="orange" width="20px" height="20px">
														<path d="M0 0h24v24H0z" fill="none" />
														<path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z" />
														<path d="M0 0h24v24H0z" fill="none" />
													</svg>
												</td>
											</tr>
											<tr>
												<td class="mainMailInnerContent">130</td>
												<td class="mainMailInnerContent">120</td>
												<td class="mainMailInnerContent">27</td>
											</tr>
										</table>
										<script>
										$(document).ready(function() {
											$.ajax({
									            url : "mailCount.mil",
									            data : {mailOwn:${loginUser.empId}},
									            type : 'POST',
									            success : function(result) {
									                
									            	console.log("하하");
									                
									            },error:function(){	// error : ajax 통신실패시 처리할 함수 지정
														console.log("ajax 통신 실패!");
												}
									        });
										});
										</script>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2" id="mainMailThArea">
									<div id="mainMailTh1" class="thDiv">받은 메일함</div>
									<div id="mainMailTh2" class="thDiv">보낸 메일함</div>
									<div id="mainMailTh3" class="thDiv">중요 메일함</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<!-- 게시판 -->
									<table id="mainMailBoard" class="boardTable">
										<tr>
											<td>user01</td>
											<td>메일 보냈습니다. 확인해주세요.</td>
										</tr>
										<tr>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td></td>
											<td></td>
										</tr>
									</table>
									<!-- 게시판 -->
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td id="mainNoticeArea">
						<table id="mainNoticeTable">
							<tr>
								<th class="mainLabel">
									<img src="${ pageContext.servletContext.contextPath }/resources/icons/notice.png" onclick="location.href='list.no?currentPage=1';" class="cursorPointer">
									<span style="vertical-align: top;" onclick="location.href='list.no?currentPage=1';" class="cursorPointer">공지사항</span>
								</th>
								<td class="mainNextArea">
									<button class="mainNextBtn cursorPointer" onclick="location.href='list.no?currentPage=1';">
										<img src="${ pageContext.servletContext.contextPath }/resources/icons/next.png">
									</button>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<!-- 게시판 -->
									<table id="mainNoticeBoard" class="boardTable">
									<c:choose>
										<c:when test="${empty nlist }">
											<tr>
												<td colspan="3" rowspan="7">조회된 게시글이 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="i" items="${nlist }">
												<tr>
													<input type="hidden" name="noticeNo" value="${i.noticeNo }">
													<td>No.${i.noticeNo }</td>
													<td>${i.noticeTitle }</td>
													<td>${i.noticeEnrollDate}&nbsp;|&nbsp;${i.noticeWriter}</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
									</table>
								</td>
							</tr>
						</table>
					</td>
					<td id="mainSignArea">
						<table id="mainSignTable">
							<tr>
								<th class="mainLabel">
									<img src="${ pageContext.servletContext.contextPath }/resources/icons/sign.png" onclick="location.href='waitingList.si?currentPage=1';" class="cursorPointer">
									<span style="vertical-align: top;" onclick="location.href='waitingList.si?currentPage=1';" class="cursorPointer">전자결재</span>
								</th>
								<td class="mainNextArea">
									<button class="mainNextBtn cursorPointer" onclick="location.href='waitingList.si?currentPage=1';">
										<img src="${ pageContext.servletContext.contextPath }/resources/icons/next.png">
									</button>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div id="mainSignDiv">
										<table id="mainSignInnerTable">
											<tr>
												<td class="mainSignInnerLabel">결재 대기 문서</td>
												<td class="mainSignInnerLabel">결재 진행 문서</td>
											</tr>
											<tr>
												<td class="mainSignInnerContent">${siWcount }</td>
												<td class="mainSignInnerContent">${siOcount }</td>
											</tr>
										</table>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2" id="mainSignThArea">
									<div id="mainSignTh1" class="thDiv" style="border-bottom:2px solid rgb(26, 188, 156);">결재대기함</div>
									<div id="mainSignTh2" class="thDiv">진행결재함</div>
									<div id="mainSignTh3" class="thDiv">상신내역</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<!-- 게시판 -->
									<div id="mainSignDiv1">
										<table id="mainSignBoard1" class="boardTable mainSignBoard">
										<c:choose>
											<c:when test="${empty siWlist }">
												<td colspan="4" rowspan="2" class="nonContent">
													조회된 문서가 없습니다.
												</td>
											</c:when>
											<c:otherwise>
												<c:forEach items="${siWlist}" var="w">
													<tr>
														<input type="hidden" name="documentNo" value="${w.documentNo }">
														<input type="hidden" name=signTypeNo value="${w.signTypeNo }">
														<td>${w.empName }</td>
														<td style="overflow:hidden;text-overflow:ellipsis;">${w.deptTitle }</td>
														<td>${w.signTitle }</td>
														<td>${w.draftDate }</td>
													</tr>
												</c:forEach>
												<c:forEach var="b" begin="1" end="${2-fn:length(siWlist)}">
							    					<tr>
														<td class="nonContent">&nbsp;</td>
														<td class="nonContent">&nbsp;</td>
														<td class="nonContent">&nbsp;</td>
														<td class="nonContent">&nbsp;</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
										</table>
									</div>
									<div id="mainSignDiv2" style="display:none;">
										<table id="mainSignBoard2" class="boardTable mainSignBoard">
										<c:choose>
											<c:when test="${empty siOlist }">
												<td colspan="3" rowspan="2">
													조회된 문서가 없습니다.
												</td>
											</c:when>
											<c:otherwise>
												<c:forEach items="${siOlist}" var="o">
													<tr>
														<input type="hidden" name="documentNo" value="${o.documentNo }">
														<input type="hidden" name=signTypeNo value="${o.signTypeNo }">
														<td style="overflow:hidden;text-overflow:ellipsis;">${o.signTypeName }</td>
														<td style="overflow:hidden;text-overflow:ellipsis;">${o.signTitle }</td>
														<td>${o.draftDate }</td>
													</tr>
												</c:forEach>
												<c:forEach var="b" begin="1" end="${2-fn:length(siOlist)}">
							    					<tr>
														<td class="nonContent">&nbsp;</td>
														<td class="nonContent">&nbsp;</td>
														<td class="nonContent">&nbsp;</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
										</table>
									</div>
									<div id="mainSignDiv3" style="display:none;">
										<table id="mainSignBoard3" class="boardTable mainSignBoard">
										<c:choose>
											<c:when test="${empty siRlist }">
												<td colspan="4" rowspan="2">
													조회된 문서가 없습니다.
												</td>
											</c:when>
											<c:otherwise>
												<c:forEach items="${siRlist}" var="r">
													<tr>
														<input type="hidden" name="documentNo" value="${r.documentNo }">
														<input type="hidden" name=signTypeNo value="${r.signTypeNo }">
														<c:choose>
															<c:when test="${r.signStatus eq 0}">
																<td>진행중</td>
															</c:when>
															<c:otherwise>
																<td>결재완료</td>
															</c:otherwise>
														</c:choose>
														<td>${r.signTypeName }</td>
														<td>${r.signTitle }</td>
														<td>${r.draftDate }</td>
													</tr>
												</c:forEach>
												<c:forEach var="b" begin="1" end="${2-fn:length(siRlist)}">
							    					<tr>
														<td class="nonContent">&nbsp;</td>
														<td class="nonContent">&nbsp;</td>
														<td class="nonContent">&nbsp;</td>
														<td class="nonContent">&nbsp;</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
										</table>
									</div>
									<!-- 게시판 -->
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	
	<!-- script 작성 영역 -->
	<script>
	
	$(document).ready(function() {
		// 현재날짜 출력용
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();

		$("#calYear").text(year);
		$("#calMonth").text(month);
		$("#calDay").text(day);
		
		$("#mainNoticeBoard tr").click(function(){
			var nno = $(this).children().eq(0).val();
			if($.trim(nno).length > 0){
				location.href="detail.no?nno=" + nno +"&currentPage=" + ${pi.currentPage};
			}
		});
		
		$(".mainSignBoard tr").click(function(){
			var documentNo = $(this).children().eq(0).val();
			var signTypeNo = $(this).children().eq(1).val();
			window.open("signDetail.si?documentNo="+documentNo+"&signTypeNo="+signTypeNo, "ddd",'_blank');
		});
		
	});
	
	$(function(){
		
		$('.mainMailInnerContent').click(function(){
			$(this).css("color", "rgb(26, 188, 156)");
		});;
		$('.mainMailInnerContent').click(function(){
			$(this).css("font-weight", "550");
		});
		$('.mainSignInnerContent').click(function(){
			$(this).css("color", "rgb(26, 188, 156)");
		});
		$('.mainSignInnerContent').click(function(){
			$(this).css("font-weight", "550");
		});
		
		//결재대기함 클릭시
		$("#mainSignTh1").click(function(){
			$(this).css("border-bottom", "2px solid rgb(26, 188, 156)");
			$("#mainSignTh2").css("border-bottom", "2px solid white");
			$("#mainSignTh3").css("border-bottom", "2px solid white");
			
			$("#mainSignDiv1").css("display","block");
			$("#mainSignDiv2").css("display","none");
			$("#mainSignDiv3").css("display","none");
			
		});
		
		//진행결재함 클릭시
		//결재대기함 클릭시
		$("#mainSignTh2").click(function(){
			$(this).css("border-bottom", "2px solid rgb(26, 188, 156)");
			$("#mainSignTh1").css("border-bottom", "2px solid white");
			$("#mainSignTh3").css("border-bottom", "2px solid white");
			
			$("#mainSignDiv2").css("display","block");
			$("#mainSignDiv1").css("display","none");
			$("#mainSignDiv3").css("display","none");
		});
		//상신내역 클릭시
		//결재대기함 클릭시
		$("#mainSignTh3").click(function(){
			$(this).css("border-bottom", "2px solid rgb(26, 188, 156)");
			$("#mainSignTh1").css("border-bottom", "2px solid white");
			$("#mainSignTh2").css("border-bottom", "2px solid white");
			
			$("#mainSignDiv3").css("display","block");
			$("#mainSignDiv1").css("display","none");
			$("#mainSignDiv2").css("display","none");
		});
	});
	
	</script>
	
		
</body>
</html>