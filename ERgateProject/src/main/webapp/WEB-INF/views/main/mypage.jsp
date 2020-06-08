<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 다음 주소 검색 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
		width: 150px;
		height: 150px;
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

	<c:if test="${ !empty msg }">
		<script>
			alert('${ msg }');
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
	
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

            <form id="mypageForm" action="update.ma" method="post" enctype="multipart/form-data">
                <table id="mypageTable">
                    <tr>
                        <td rowspan="2" id="mypageProfileArea">
                            <table id="mypageProfileTable">
                                <tr>
                                    <td>
	                                    <c:choose>
											<c:when test="${ empty loginUser.empImage }">
												<img id="mypageProfileImg" src="${pageContext.servletContext.contextPath }/resources/siteImgs/profile_logo.png">
											</c:when>
											<c:otherwise>
												<img id="mypageProfileImg" src="${pageContext.servletContext.contextPath }/resources/uploadFiles/${ loginUser.empImage }">
											</c:otherwise>
										</c:choose>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height:50px; font-size: 18px;">
                                    	<span style="color:rgb(26, 188, 156); font-weight: 550;">ID </span> ${ loginUser.empId }
                                    </td>
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
                                    <td>
                                    	<input name="empPwd" type="password" id="newPwd">
                                    	<div id="pwdCaution" style="font-size:0.8em;">&nbsp;</div>
                                    </td>
                                    <td>
                                    	<input type="password" id="newPwdCheck">
                                    	<div id="pwdCheckCaution" style="font-size:0.8em;">&nbsp;</div>
                                    </td>
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
                                    <td><input type="text" value="${ loginUser.empCode }" readonly></td>
                                    <td><input type="text" value="${ loginUser.deptTitle }" readonly></td>
                                </tr>
                                <tr>
                                    <td>직급</td>
                                    <td>직책</td>
                                </tr>
                                <tr>
                                    <td><input type="text" value="${ loginUser.rankTitle }" readonly></td>
                                    <td><input type="text" value="${ loginUser.jobTitle }" readonly></td>
                                </tr>
                                <tr>
                                    <td>내선 번호</td>
                                    <td>팩스 번호</td>
                                </tr>
                                <tr>
                                    <td><input name="empExtension" type="text" value="${ loginUser.empExtension }" placeholder="000-0000-0000"></td>
                                    <td><input name="empFax" type="text" value="${ loginUser.empFax }" placeholder="000-0000-0000"></td>
                                </tr>
                                <tr>
                                    <td>입사일</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="text" value="${ loginUser.hireDate }" placeholder="YYYY/MM/DD"></td>
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
                                    <td>
                                    	<input name="empName" type="text" value="${ loginUser.empName }" required>
                                    	<div id="checkResult2" style="font-size:0.8em; padding-top:5px; margin-bottom: 10px;">&nbsp;</div>
                                    </td>
                                    <td><input name="empBirthday" type="text" value="${ loginUser.empBirthday }" placeholder="YYYY/MM/DD"></td>
                                </tr>
                                <tr>
                                    <td>휴대폰번호</td>
                                    <td>이메일</td>
                                </tr>
                                <tr>
                                    <td><input name="empPhone" type="text" value="${ loginUser.empPhone }" placeholder="000-0000-0000"></td>
                                    <td>
                                    	<input name="empEmail" value="${ fn:substringBefore(loginUser.empPriEmail, '@') }" id="mypageEmail1" type="text" style="width: 180px">
					                	<input value="@gmail.com" id="mypageEmail2" type="text" readonly style="width: 180px">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">자택 주소</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                    	<button id="mypageAddressBtn" class="middleBtn" type="button" onclick="sample6_execDaumPostcode()">우편번호찾기</button>
                                    	<input name="empAddress" type="text" value="${ loginUser.empAddress }" id="sample6_address" placeholder="주소" style="width: 520px"> <br>
                                    	<input name="empAddressDetail" type="text" value="${ loginUser.empAddressDetail }" id="sample6_detailAddress" placeholder="상세주소" style="width: 650px">
                                    	<input type="hidden" id="sample6_postcode"><input type="hidden" id="sample6_extraAddress">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" id="mypageBtnArea">
                        	<button id="mypageSubmitBtn" class="bigBtn" type="submit">수정</button>
                        	<button id="mypageCancelBtn" class="bigBtn" type="button">취소</button>
                        </td>
                    </tr>
                </table>
                <input type="hidden" name="empId" value="${ loginUser.empId }">
                <div id="fileArea">
					<input type="file" name="reUploadFile" id="fileInput" onchange="loadImg(this, 1);">
				</div>
            </form>
		</div>
	</div>
	
	    
    <!-- 프로필 사진 첨부 -->
    <script>
		$(function(){
			$("#fileArea").hide();
			
			$("#mypageProfileImg").click(function(){
				$("#fileInput").click();
			});
		});
	
		function loadImg(inputFile, num){
			// inputFile : 현재 변화가 생긴 input type="file" 요소
			// num : 몇번째 input요소인지 확인 후 해당 영역에 미리보기 하기위해
			
			// [참고] https://developer.mozilla.org/ko/docs/Web/API/FileReader
			
			// file이 존재할 경우 --> input 요소의 files 속성인 배열의 0번 인덱스에 담김
			if(inputFile.files.length == 1){
				// 0번 인덱스에 파일이 담긴 경우 (file이 존재할 경우)
				
				// 파일을 읽어들일 FileReader 객체 생성
				var reader = new FileReader();
				
				// 파일을 읽어주는 메소드 --> 해당 파일을 읽어들이는 순간 해당 파일만의 고유한 url 부여 
				reader.readAsDataURL(inputFile.files[0]);
				
				// 파일 읽기가 다 완료되었을 때 실행할 메소드 
				reader.onload = function(e){
					switch(num){
						case 1: $("#mypageProfileImg").attr("src", e.target.result); break;
					}
				};
			}
		}
	</script>
	    
    <!-- 이름 중복검사 -->
    <script>
		function nameCheckValidate(num){
    		
    		if(num == 1){ // 이름 중복체크를 아직 안하는 경우 : 메세지 보여지지 않음, 버튼 비활성화
    			
    			$("#mypageSubmitBtn").attr("disabled", true);
    			
    		}else if(num == 2){ // 이름 중복체크 후 사용 불가능한 이름일 경우 : "중복 이름 존재, 사용 불가능" 메세지 보여짐, 버튼 비활성화
    			
    			$("#checkResult2").css("color", "red").text("중복되는 이름이 존재합니다. 다른 이름을 입력해주세요.");
    			$("#mypageSubmitBtn").attr("disabled", "true");
    			
    		}else{ // 이름 중복체크 후 사용 가능한 이름일 경우 : "사용 가능한 이름" 메세지 보여짐, 버튼 활성화
    			
    			$("#checkResult2").css("color", "rgb(26, 188, 156)").text("사용 가능한 이름입니다.");
    			$("#mypageSubmitBtn").removeAttr("disabled");
    		}
    	}
    
    	$(function(){
    		
    		var $idInput = $("#mypageForm input[name=empName]");
    		
    		$idInput.keyup(function(){
    			
    			if($idInput.val().length >= 2){
    				
    				$.ajax({
    					url:"nameCheck.ma",
    					data:{empName:$idInput.val()},
    					success:function(status){
    						
    						if(status == "fail"){ // 중복되는 이름 존재 == 사용 불가
    							nameCheckValidate(2);
    						}else{ // 중복되는 이름 없음 == 사용 가능
    							nameCheckValidate(3);
    						}
    						
    					},error:function(){
    						console.log("이름 중복 체크용 ajax 통신 실패");
    					}
    				});
    				
    			}else{ // 중복체크 X
    				nameCheckValidate(1);
    			}
    			
    		});
    	});
    </script>
	
	<!-- 비밀번호 유효성 검사 -->
	<script>
		var pwd1 = document.getElementById("newPwd");
		var pwd2 = document.getElementById("newPwdCheck");
		
        regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
		// 비밀번호 검사 : 특수문자(!@#$%^&*) 또는 영문자 또는 숫자 포함 총 8자~15자
            
        $(function(){
        	
            $("#newPwd").keyup(function(){
            	
            	if(!regExp.test(pwd1.value)){
	                $("#pwdCaution").css("color", "red").text("영문자, 숫자 또는 특수문자 포함 총 8자~15자 이내로 입력해 주세요.");
            	}else{
            		$("#pwdCaution").css("color", "rgb(26, 188, 156)").text("사용 가능한 비밀번호입니다.");
            	}
            });
        });
       
		$(function(){
           	
			$("#newPwdCheck").keyup(function(){
               	
				if(pwd1.value != pwd2.value){
   	                $("#pwdCheckCaution").css("color", "red").text("입력한 비밀번호와 일치하는 값을 입력하세요.");
               	}else{
            		$("#pwdCheckCaution").css("color", "rgb(26, 188, 156)").text("입력한 비밀번호와 일치합니다.");
            	}
			});
		});
    </script>
		
	<!-- 다음 주소 검색 API -->
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>
	
</body>
</html>