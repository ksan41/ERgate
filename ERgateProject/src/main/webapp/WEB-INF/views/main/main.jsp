<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</style>   
</head>
<body>
	<!-- 이곳에 메뉴바 include -->
	
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
									<img src="../../resources/icons/event.png">
									<span style="vertical-align: top;">일정관리</span>
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
									<button class="mainNextBtn"><img src="../../resources/icons/next.png"></button>
								</td>
							</tr>
							<tr>
								<td colspan="2" id="mainDateArea">2020년 05월 20일</td>
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
										<tr>
											<td>10:00</td>
											<td>일정있습니다~~~</td>
										</tr>
										<tr>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td></td>
											<td></td>
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
					<td id="mainMailArea">
						<table id="mainMailTable">
							<tr>
								<th class="mainLabel">
									<img src="../../resources/icons/mail.png">
									<span style="vertical-align: top;">전자메일</span>
								</th>
								<td class="mainNextArea">
									<button class="mainNextBtn"><img src="../../resources/icons/next.png"></button>
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
									<img src="../../resources/icons/notice.png">
									<span style="vertical-align: top;">공지사항</span>
								</th>
								<td class="mainNextArea">
									<button class="mainNextBtn"><img src="../../resources/icons/next.png"></button>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<!-- 게시판 -->
									<table id="mainNoticeBoard" class="boardTable">
										<tr>
											<td>[공지]</td>
											<td>공지사항 여기에 보일거임~~~</td>
											<td>2020.05.20 10:00</td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</table>
									<!-- 게시판 -->
								</td>
							</tr>
						</table>
					</td>
					<td id="mainSignArea">
						<table id="mainSignTable">
							<tr>
								<th class="mainLabel">
									<img src="../../resources/icons/sign.png">
									<span style="vertical-align: top;">전자결재</span>
								</th>
								<td class="mainNextArea">
									<button class="mainNextBtn"><img src="../../resources/icons/next.png"></button>
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
												<td class="mainSignInnerContent">130</td>
												<td class="mainSignInnerContent">120</td>
											</tr>
										</table>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2" id="mainSignThArea">
									<div id="mainSignTh1" class="thDiv">결재 대기 문서</div>
									<div id="mainSignTh2" class="thDiv">결재 진행 문서</div>
									<div id="mainSignTh3" class="thDiv">참조 문서</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<!-- 게시판 -->
									<table id="mainSignBoard" class="boardTable">
										<tr>
											<td>user01</td>
											<td>결제요청합니다.</td>
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
			</table>
		</div>
	</div>
	
	
	<!-- script 작성 영역 -->
	<script>
	$(function(){
		
		$('.mainMailInnerContent').click(function(){
			$(this).css("color", "rgb(26, 188, 156)");
		})
		$('.mainMailInnerContent').click(function(){
			$(this).css("font-weight", "550");
		})
		$('.mainSignInnerContent').click(function(){
			$(this).css("color", "rgb(26, 188, 156)");
		})
		$('.mainSignInnerContent').click(function(){
			$(this).css("font-weight", "550");
		})
		
		$('.thDiv').click(function(){
			$(this).css("border-bottom", "2px solid rgb(26, 188, 156)");
		})
		
	});
	
	
	</script>
	<!-- script 작성 영역 -->
	
</body>
</html>