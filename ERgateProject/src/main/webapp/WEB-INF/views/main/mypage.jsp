<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
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

	/* 마이페이지 */
	#mypageTable{
		width: 1100px;
		margin-bottom: 60px;
	}
	
	.mypageInnerTable th, #mypageAlramTable th{
		width: 1000px;
		height: 50px;
		font-size: 18px;
		text-align: left;
		padding-left: 10px;
		color: rgb(26, 188, 156);
	}
	.mypageInnerTable td, #mypageAlramTable td{
		width: 500px;
		height: 40px;
		padding-left: 10px;
	}
	.mypageInnerTable input{
		padding: 5px;
		width: 300px;
		height: 25px;
		border: 1px solid lightgray;
		border-radius: 3px;
		margin-right: 5px;
		font-size: 16px;
		margin-bottom: 10px;
	}
	
	/* 프로필 영역 */
	#mypageProfileArea{
		width: 250px;
		text-align: center;
	}
	#mypageProfileTable{
		width: 240px;
		text-align: center;
	}
	#mypageProfileImg{
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
	#mypageDescript{
		font-size: 15px;
		color: darkgray;
		line-height: 150%;
	}
	/* 프로필 영역 */
	
    /* 구분선 */
    .mypageLine{
        border-bottom: 1px solid gray;
        margin-top: 15px;
        margin-bottom: 20px;
        width: 850px;
    }
    /* 구분선 */
    
    /* 우편번호 찾기 버튼 */
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
	#mypageAddressBtn{
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
	#mypageBtnArea{
		height: 150px;
		text-align: center;
	}
	#mypageSubmitBtn{
		background: rgb(26, 188, 156);
	}
	#mypageCancelBtn{
		background: rgb(190, 190, 190);
	}
	/* 수정 / 취소 버튼 */
	
	/* 마이페이지 */

</style>   
</head>
<body>
	<!-- 이곳에 메뉴바 include -->
	
	<!-- 이곳에 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp" />
	
	<div class="outer">
		<div class="topBar">
			<!-- 메뉴명 -->
			<span>마이페이지</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
				<li><button class="subBtn subActive">개인정보관리</button></li>
			</ul>
		</div>
		<div class="contentArea">
            <!-- 내용 작성 영역 입니다-->

            <form action="">
                <table id="mypageTable">
                    <tr>
                        <td rowspan="2" id="mypageProfileArea">
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
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table id="mypageAlramTable">
                                <tr>
                                    <th colspan="3">알림설정</th>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox">
                                        <label for="">받은 메일</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="" id="">
                                        <label for="">결재 대기</label>
                                    </td>
                                    <td>
                                        <input type="checkbox">
                                        <label for="">결재 완료</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3"><div class="mypageLine"></div></td>
                                </tr>
                            </table>
						</td>
					</tr>
					<tr>
						<td>
                            <table class="mypageInnerTable">
                                <tr>
                                    <th colspan="2">비밀번호 변경</th>
                                </tr>
                                <tr>
                                    <td>새 비밀번호</td>
                                    <td>새 비밀번호 확인</td>
                                </tr>
                                <tr>
                                    <td><input type="password" name="" id=""></td>
                                    <td><input type="password" name="" id=""></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><div class="mypageLine"></div></td>
                                </tr>
                            </table>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
                            <table class="mypageInnerTable">
                                <tr>
                                    <th colspan="2">직장 정보</th>
                                </tr>
                                <tr>
                                    <td>사원번호</td>
                                    <td>부서</td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="" id="" readonly></td>
                                    <td><input type="text" name="" id="" readonly></td>
                                </tr>
                                <tr>
                                    <td>직급</td>
                                    <td>직책</td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="" id="" readonly></td>
                                    <td><input type="text" name="" id="" readonly></td>
                                </tr>
                                <tr>
                                    <td>내선 번호</td>
                                    <td>팩스 번호</td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="" id=""></td>
                                    <td><input type="text" name="" id=""></td>
                                </tr>
                                <tr>
                                    <td>입사일</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="" id=""></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><div class="mypageLine"></div></td>
                                </tr>
                            </table>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
                            <table class="mypageInnerTable">
                                <tr>
                                    <th colspan="2">개인 정보</th>
                                </tr>
                                <tr>
                                    <td>이름</td>
                                    <td>생년월일</td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="" id=""></td>
                                    <td><input type="text"></td>
                                </tr>
                                <tr>
                                    <td>휴대폰번호</td>
                                    <td>이메일</td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="" id=""></td>
                                    <td>
                                    	<input id="mypageEmail1" type="text" style="width: 180px">
					                	<input id="mypageEmail2" name="emailDomain" type="text" list="emailDomain" placeholder="직접입력" style="width: 180px">
									        <datalist id="emailDomain">
									            <option>@naver.com</option>
									            <option>@gmail.com</option>
									            <option>@hanmail.net</option>
					        </datalist>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">자택 주소</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                    	<button id="mypageAddressBtn" class="middleBtn">우편번호찾기</button>
                                    	<input type="text" style="width: 100px">
                                    	<input type="text" style="width: 370px"> <br>
                                    	<input type="text" style="width: 650px">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" id="mypageBtnArea">
                        	<button id="mypageSubmitBtn" class="bigBtn" type="submit">수정</button>
                        	<button id="mypageCancelBtn" class="bigBtn">취소</button>
                        </td>
                    </tr>
                </table>
            </form>
		</div>
	</div>
</body>
</html>