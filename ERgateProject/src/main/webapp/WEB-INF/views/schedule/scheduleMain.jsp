<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
		rel="stylesheet">
<!-- 이곳에 메뉴바 include -->
<jsp:include page="../common/menubar.jsp" />
<!-- 이곳에 메뉴바 include -->		
<!-- 모달 사용페이지에 복사해주세요 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<!-- 모달 사용페이지에 복사해주세요 -->

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
	/* ==== 켈린더 api ==== */
	
	.calender{
		border:1px solid black;
		width:1200px;
		height:500px;
	}
	
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
	
	/* 체크박스 스타일 */
	.checkBox {
		zoom: 1.7;
	}
	
	/* 스케줄관련 아이콘스타일 */
	.schedule_icons {
		fill: rgb(190, 190, 190); /* 검은색 : rgb(94, 94, 94)*/
		width: 35px;
		vertical-align: bottom;
	}
	/* 스케줄관련 아이콘스타일 */
	.material-icons {
		font-size: 40px;
		vertical-align: middle;
	}
	
	.material-icons:hover {
		cursor: pointer;
	}
	
		/* 모달팝업 스타일 */
	.open-modal{
			width:90px;
            height:35px;
            border: 0px;
            border-radius: 5px;
            background: rgb(26, 188, 156); /* 회색 : rgb(190, 190, 190) */
            color:white;
            font-size: 15px;
	}
	.modal {
		max-width: 2000px;
		height: 800px; /* 모달 크기지정 */
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
</style>

</head>
<body>

	
		<div class="outer">
			<div class="topBar">
				<!-- 메뉴명 -->
				<span>일정</span>
			</div>
			<div class="subMenuArea">
				<ul id="subMenuList">
					<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
					<li><button class="subBtn subActive">일정조회</button></li>
				</ul>
			</div>
			<div class="contentArea">
				
				<!-- 모달팝업 (head부분에 링크들도 복사해주셔야합니다)-->

				<!-- 모달 타겟. href의 #xxx와 모달영역의 id(xxx)가 한셋트입니다.
				     용도에 따라 href와 id는 변경해주세요.(여러개 가능)
				     모달타겟으로 쓸 요소에 class와 href 복사해주세요.
				-->
				<a class="open-modal" href="#modal-form">일정등록</a>
				
				<br>
				
				
				<div id="modal-form" class="modal">
					
					<div class="modal-title">일정등록</div>
					
						<div class="modal-content">
							
							<!-- 개인일정 -->
							<div class="subMenuArea">
								<ul id="subMenuList">
									<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
									<li><button class="subBtn subActive">개인일정</button></li>
									<li><button class="subBtn">업무일정</button></li>
									<li><button class="subBtn">공유일정</button></li>
								</ul>
								
								<br><br><br><br><br>
								 
								<div>
								        제목 <input type="text"><br>
								        시작일시 <input type="date"> - <input type="date"><br>
								        종료일시 <input type="date"> - <input type="date"><br>
								        내용 <textarea cols="50px;" ></textarea>								
								 </div>
								
							 </div>
							 
							 <!-- 업무일정 -->
							 <div class="subMenuArea">
								<ul id="subMenuList">
									<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
									<li><button class="subBtn">개인일정</button></li>
									<li><button class="subBtn subActive">업무일정</button></li>
									<li><button class="subBtn">공유일정</button></li>
								</ul>
								
								<br><br><br><br><br>
								 
								<div>
								        제목 <input type="text"><br>
								        시작일시 <input type="date"> - <input type="date"><br>
								        종료일시 <input type="date"> - <input type="date"><br>
								        참석재(내부) <button>참석지지정</button> <input type="text"> <br>
								        참석자(외부) <input type="text" placeholder="내용을 입력해주세요"> <br>
								        수신자 <button>수신자지정</button> <input type="text"> <br>
								        회의장소 <input type="radio"> 지정회의실 
								        <select>
								            <option>회의실 선택</option>
								            <option>1번회의실</option>
								            <option>2번회의실</option>
								        </select>
								        <br>
								        <input type="radio">외부회의실 <br>
								        <input type="radio">지정안함 <br>
								        내용 <textarea cols="50px;" rows="10px;"></textarea>
								        
								  </div>
							  </div>
							  
							 	 <!-- 공유일정 -->
								<div class="subMenuArea">
									<ul id="subMenuList">
										<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
										<li><button class="subBtn">개인일정</button></li>
										<li><button class="subBtn">업무일정</button></li>
										<li><button class="subBtn subActive">공유일정</button></li>
									</ul>
									
									<br><br><br><br><br>
									 
									<div>
									        제목 <input type="text"><br>
									        시작일시 <input type="date"> - <input type="date"><br>
									        종료일시 <input type="date"> - <input type="date"><br>
									        내용 <textarea cols="50px;" span="50px;"></textarea><br><br>
									        <input type="checkbox">부서만 공유
									
									 </div>
									
								 </div>		
						</div>
				</div>
				
				<h2 style="display: inline-block; margin-left: 530px;">
					<span class="material-icons"> arrow_left </span> 2020년 5월
					<svg class="schedule_icons" xmlns="http://www.w3.org/2000/svg"
						viewBox="0 0 24 24" fill="black" width="48px" height="48px">
					<path
							d="M20 3h-1V1h-2v2H7V1H5v2H4c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 18H4V8h16v13z" />
					<path d="M0 0h24v24H0z" fill="none" /></svg>
					<span class="material-icons"> arrow_right </span>
				</h2>
				<br><br>
                
			
				<div class="calender">
					
				</div>	
			</div>
		</div>
</body>
<script>
<!-- 모달용 스크립트 -->
	$('.open-modal').click(function() {
		$(this).modal({
			fadeDuration : 150
		});

	});
</script>

<!-- 모달팝업 -->

</html>