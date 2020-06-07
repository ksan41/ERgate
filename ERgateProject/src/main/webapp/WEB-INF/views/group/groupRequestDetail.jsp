<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
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
	width: 140px;
	height: 140px;
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
	
	<c:if test="${ !empty msg }">
		<script>
			alert('${ msg }');
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>

<!-- 승인대기 상세페이지 -->
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
					<c:if test="${loginUser.deptCode eq 'D5' }">
						<li><button class="subBtn subActive" onclick="location.href='mgList.gr'">계정관리</button></li>
		        </c:if> 
			</ul>
		</div>
		<div class="contentArea">
		<!-- 내용 작성 영역 입니다-->
			<!-- 마이페이지 - 메인페이지에서 가져온 것. -->
			 <form action="requestEmp.gr">
			 	<input type="hidden" name="empId" value="${empPrf.empId}">
                <table id="mypageTable">
                    <tr>
                        <td rowspan="3" id="mypageProfileArea">
                            <table id="mypageProfileTable">
                                <tr>
                                    <td>
                                    	 <c:choose>
											<c:when test="${ empty loginUser.empImage }">
												<img id="mypageProfileImg" src="${pageContext.servletContext.contextPath }/resources/siteImgs/profile_logo.png">
											</c:when>
											<c:otherwise>
												<img id="mypageProfileImg" src="${pageContext.servletContext.contextPath }/resources/uploadFiles/${empPrf.empImage}">
											</c:otherwise>
										</c:choose>
                                    </td>
                                </tr>
                                <tr>
                                    <td ><button class="smallBtn">편집</button></td>
                                </tr>
                                <tr>
                                    <td style="height:50px; font-size: 18px;">
                                    	<span style="color:rgb(26, 188, 156); font-weight: 550;">ID </span> ${empPrf.empId}
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
                                   <td><input type="text" name="empCode" id="empCode" value="${empPrf.empCode}" readonly></td>
                                   <td>
                                        <select name="deptCode" id="deptTitle">
	                                        <option value="D0">임원</option>
	                                        <option value="D1">개발팀</option> 
	                                        <option value="D2">회계팀</option>
	                                        <option value="D3">기술팀</option>
	                                        <option value="D4">총무팀</option>
	                                        <option value="D5" selected>인사팀</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>직급</td>
                                    <td>직책</td>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="rankCode" id="rankTitle">
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
                                            <option value="R10" selected>사원</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select name="jobCode" id="jobTitle">
                                            <option value="J0">COO</option>
                                            <option value="J1">본부장</option> 
                                            <option value="J2">팀장</option>
                                            <option value="J3" selected>팀원</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>내선 번호</td>
                                    <td>팩스 번호</td>
                                </tr>
                                <tr>
                                    <td><input type="text"  name="empExtension" id="empExtension" placeholder="- 을 포함하여 입력하세요."></td>
                                    <td><input type="text" name="empFax" id="empFax" placeholder="- 을 포함하여 입력하세요."></td>
                                </tr>
                                <tr>
                                    <td>입사일</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="hireDate" id="hireDate" value="${empPrf.hireDate}" readonly></td>
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
                                    <td><input type="text" name="empName" id="empName" value="${empPrf.empName}" readonly></td>
                                    <td><input type="text" value="${empPrf.empBirthday}" readonly></td>
                                </tr>
                                <tr>
                                    <td>휴대폰번호</td>
                                    <td>이메일</td>
                                </tr>
                                <tr>
                                    <td><input type="text" value="${empPrf.empPhone}" readonly></td>
                                    <td>
                                    	<input id="mypageEmail1" type="text" style="width: 180px" value="${fn:substringBefore(empPrf.empPriEmail,'@')}" readonly>
					                	<input id="mypageEmail2" name="emailDomain" type="text" value="@gmail.com" style="width: 180px" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">자택 주소</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                    	<button id="mypageAddressBtn" class="middleBtn" type="button" onclick="sample6_execDaumPostcode()">우편번호찾기</button>
                                    	<input name="empAddress" type="text" value="${empPrf.empAddress}" id="sample6_address" readonly style="width: 520px"> <br>
                                    	<input name="empAddressDetail" type="text" value="${empPrf.empAddressDetail}" id="sample6_detailAddress" readonly style="width: 650px">
                                    	<input type="hidden" id="sample6_postcode"><input type="hidden" id="sample6_extraAddress">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" id="mypageBtnArea">
                        	<button id="mypageSubmitBtn" class="bigBtn" type="submit">승인</button>
                        	<button id="mypageCancelBtn" class="bigBtn" onclick="location.href='requestList.gr';">목록</button>
                        	<button id="mypageCancelBtn" class="bigBtn" type="button" >승인거절</button>
                        </td>
                    </tr>
                </table>
            </form>

		</div><!-- contentArea -->
	</div><!-- outer -->
</body>
</html>