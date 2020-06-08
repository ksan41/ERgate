<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>groupRequestList</title>
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
/* 상단 검색창 영역 스타일 */
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
.pageNoClick{
   pointer-events: none;
   cursor: default;
}
/* 게시판 스타일 */
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
	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="outer">
		<div class="topBar">
			<!-- 메뉴명 -->
			<span>조직도</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
					<li><button class="subBtn" onclick="location.href='groupList.gr'">조직도</button></li>
				<c:if  test="${loginUser.deptCode eq 'D5'}">
					<li><button class="subBtn subActive" onclick="location.href='mgList.gr'">계정관리</button></li>
				</c:if>
			</ul>
		</div>
		<div class="contentArea">
		<!-- 내용 작성 영역 입니다-->
			<!-- 버튼과 검색바 같이 들어가는 DIV -->
			<div class="btnAndSearch">
				<table class="bas">
					<tr>
						<td id="leftArea"> 
							<!-- 인사팀만 보이는 버튼 -->
							<button class="bigBtn" onclick="location.href='mgList.gr';" style="background:rgb(26, 188, 156);">목록으로</button>&nbsp;
						</td>
						<td id="rightArea">
							<!-- 화면 구조 맞추기 위해 td 비워둠 -->
						</td>
					</tr>
				</table>
			</div>
			<div style="height:10px;"></div>
			<!-- btnAndSearch - 버튼과 검색바 같이 들어가는 DIV 끝-->
			<!-- 승인 대기 목록 게시판 -->
			<div class="boardScroll" style="overflow: auto; width: 1400px; height: 400px;">
			<table class="boardTable">
				<thead>
					<tr>
						<th>신청 일시</th>
						<th>계정명</th>
						<th>이름</th>
						<th>휴대폰 번호</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${empty requestList}">
						<tr><td colspan="5" class="pageNoClick">승인 신청 대기 리스트가 없습니다.</td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="list" items="${requestList}">
							<tr style="height:35px;">
								<td>${list.hireDate}</td>
								<td>${list.empId}</td>
								<td>${list.empName}</td>
								<td>${list.empPhone}</td>
							</tr>
							</c:forEach>
							<c:forEach var="b" begin="1" end="${9-fn:length(requestList)}">
	    						<tr>
									<td class="pageNoClick">&nbsp;</td>
									<td class="pageNoClick">&nbsp;</td>
									<td class="pageNoClick">&nbsp;</td>
									<td class="pageNoClick">&nbsp;</td>
								</tr>
							</c:forEach>
							<script>
								 $(function(){
					                 $(".boardTable tbody tr").click(function(){
					                    location.href="requestDetail.gr?empId=" + $(this).children().eq(1).text();
					                 })
					              });
							</script>
							
						</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			

			
			</div>
		</div>
	</div>
</body>
</html>