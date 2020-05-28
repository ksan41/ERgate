<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>groupRequestDetail</title>
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

/* 마이페이지 - 메인페이지에서 가져온 것. */
#mypageTable {
	width: 1100px;
	margin-bottom: 60px;
}

.mypageInnerTable th, #mypageAlramTable th {
	width: 1000px;
	height: 50px;
	font-size: 18px;
	text-align: left;
	padding-left: 10px;
	color: rgb(26, 188, 156);
}

.mypageInnerTable td, #mypageAlramTable td {
	width: 500px;
	height: 40px;
	padding-left: 10px;
}

.mypageInnerTable input {
	padding: 5px;
	width: 300px;
	height: 25px;
	border: 1px solid lightgray;
	border-radius: 3px;
	margin-right: 5px;
	font-size: 16px;
	margin-bottom: 10px;
}

.mypageInnerTable select {
    padding: 5px;
	width: 312px;
	height: 40px;
    font-size: 16px;
    border: 1px solid lightgray;
    background-color: transparent;
    -moz-appearance: none;
    appearance: none;
}

/* 프로필 영역 */
#mypageProfileArea {
	width: 250px;
	text-align: center;
}

#mypageProfileTable {
	width: 240px;
	text-align: center;
}

#mypageProfileImg {
	border-radius: 50%;
	margin-top: 10px;
	margin-bottom: 10px;
}

.smallBtn {
	width: 60px;
	height: 25px;
	border: 1px solid rgb(190, 190, 190);
	border-radius: 5px;
	color: rgb(190, 190, 190);
	background: white;
	font-size: 12px;
}

.smallBtn:hover {
	cursor: pointer;
}

#mypageDescript {
	font-size: 15px;
	color: darkgray;
	line-height: 150%;
}
/* 프로필 영역 */

/* 구분선 */
.mypageLine {
	border-bottom: 1px solid gray;
	margin-top: 15px;
	margin-bottom: 20px;
	width: 850px;
}
/* 구분선 */

/* 우편번호 찾튼 */
.middleBtn {
	width: 90px;
	height: 35px;
	border: 0px;
	border-radius: 5px;
	color: white;
	font-size: 15px;
}

.middleBtn:hover {
	cursor: pointer;
}

#mypageAddressBtn {
	background: rgb(190, 190, 190);
	width: 120px;
	margin-right: 5px;
}
/* 우편번호 찾기 버튼 */

/* 수정 / 취소 버튼 */
.bigBtn {
	width: 140px;
	height: 40px;
	border: 0px;
	border-radius: 5px;
	color: white;
	font-size: 18px;
}

.bigBtn:hover {
	cursor: pointer;
}

#mypageBtnArea {
	height: 150px;
	text-align: center;
}

#mypageSubmitBtn {
	background: rgb(26, 188, 156);
}

#mypageCancelBtn {
	background: rgb(190, 190, 190);
}
/* 수정 / 취소 버튼 */

/* 마이페이지 - 메인페이지에서 가져온 것. */
</style>
</head>
<body>
<!-- 승인대기 상세페이지 -->
	<!-- 이곳에 메뉴바 include -->
	
	<!-- 이곳에 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="outer">
		<div class="topBar">
			<!-- 메뉴명 -->
			<span>조직도</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
				<li><button class="subBtn">조직도</button></li>
				<li><button class="subBtn subActive">계정관리</button></li>
			</ul>
		</div>
		<div class="contentArea">
		<!-- 내용 작성 영역 입니다-->
	
			<!-- 마이페이지 - 메인페이지에서 가져온 것. -->
			 <form action="">
                <table id="mypageTable">
                    <tr>
                        <td rowspan="3" id="mypageProfileArea">
                            <table id="mypageProfileTable">
                                <tr>
                                    <td><img id="mypageProfileImg" src="../../resources/siteImg/profile_logo.png" width="150" height="150"></td>
                                </tr>
                                <tr>
                                    <td ><button class="smallBtn">편집</button></td>
                                </tr>
                                <tr>
                                    <td style="height:50px; font-size: 18px;">
                                    	<span style="color:rgb(26, 188, 156); font-weight: 550;">ID </span> erkevin
                                    </td>
                                </tr>
                                <tr>
                                    <td id="mypageDescript">개인정보 수정 후 <br>그룹웨어 정보 반영을 위해 <br>재로그인 해주세요.</bt></td>
                               		<tr><td><div style="height:503px;"></div></td></tr>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    

					<tr>
						
						<td>
                            <table class="mypageInnerTable jobInfo">
                                <tr>
                                    <th colspan="2">직장 정보</th>
                                </tr>
                                <tr>
                                    <td>사원번호</td>
                                    <td>부서</td>
                                </tr>
                                <tr>
                                   <td><input type="text" name="" id="" readonly></td>
                                   <td>
                                        <select name="deptTitle" id="deptTitle">
	                                        <option value="D0">임원</option>
	                                        <option value="D1">개발팀</option> 
	                                        <option value="D2">회계팀</option>
	                                        <option value="D3">기술팀</option>
	                                        <option value="D4">총무팀</option>
	                                        <option value="D5">인사팀</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>직급</td>
                                    <td>직책</td>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="rankTitle" id="rankTitle">
                                            <option value="D0">대표</option>
                                            <option value="R1">부대표</option> 
                                            <option value="R2">전무</option>
                                            <option value="R3">상무</option>
                                            <option value="R4">이사</option>
                                            <option value="R5">부장</option>
                                            <option value="R6">차장</option>
                                            <option value="R7">과장</option>
                                            <option value="R8">대리</option>
                                            <option value="R9">주임</option>
                                            <option value="R10">사원</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select name="jobTitle" id="jobTitle">
                                            <option value="J0">COO</option>
                                            <option value="J1">본부장</option> 
                                            <option value="J2">팀장</option>
                                            <option value="J3">팀원</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>내선 번호</td>
                                    <td>팩스 번호</td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="" id="" placeholder="- 을 포함하여 입력하세요."></td>
                                    <td><input type="text" name="" id="" placeholder="- 을 포함하여 입력하세요."></td>
                                </tr>
                                <tr>
                                    <td>입사일</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="" id="" value="2020/03/03" readonly></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><div class="mypageLine"></div></td>
                                </tr>
                            </table>
						</td>
					</tr>
					<tr>
						
						<td>
                            <table class="mypageInnerTable personalInfo">
                                <tr>
                                    <th colspan="2">개인 정보</th>
                                </tr>
                                <tr>
                                    <td>이름</td>
                                    <td>생년월일</td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="" id="" value="김카카오" readonly></td>
                                    <td><input type="text" value="1990/08/27" readonly></td>
                                </tr>
                                <tr>
                                    <td>휴대폰번호</td>
                                    <td>이메일</td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="" id="" value="010-7777-7777" readonly></td>
                                    <td>
                                    	<input id="mypageEmail1" type="text" style="width: 180px" readonly>
					                	<input id="mypageEmail2" name="emailDomain" type="text" value="@gmail.com" style="width: 180px" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">자택 주소</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                    	<button id="mypageAddressBtn" class="middleBtn" type="button" readonly >우편번호찾기</button>
                                    	<input type="text" style="width: 100px" readonly>
                                    	<input type="text" style="width: 370px" readonly> <br>
                                    	<input type="text" style="width: 650px" readonly>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" id="mypageBtnArea">
                        	<button id="mypageSubmitBtn" class="bigBtn" type="submit">승인</button>
                        	<button id="mypageCancelBtn" class="bigBtn">목록</button>
                        	<button id="mypageCancelBtn" class="bigBtn">승인거절</button>
                        </td>
                    </tr>
                </table>
            </form>

		</div><!-- contentArea -->
	</div><!-- outer -->
</body>
</html>