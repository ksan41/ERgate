<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>accountRequest</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 다음 주소 검색 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
/* ==========페이지영역========== */

	#enrollOuter{
		border: 1px solid lightgray;
		width: 800px;
		margin: auto;
		background: white;
    	margin-top: 100px;
    	margin-bottom: 100px;
    	border-radius: 10px;
	}
	
	/* 계정등록폼 테이블 */
    #enrollTable{
    	align: center;
    	margin: auto;
    	margin-top: 50px;
    }
    #enrollTable>tr>td{
    	heigth: 160px;
    }
    #enrollDescript{
    	color: gray;
    	font-size: 16px;
    	height: 70px;
    	text-align: center;
    }
    .enrollLabel{
    	text-align: right;
    	font-size: 16px;
    	padding-right: 30px;
    	height: 60px;
    	width: 130px;
    }
    
    /* input 요소 */
    #enrollTable input{
    	padding: 5px;
		width: 200px;
		height: 25px;
		border: 1px solid lightgray;
		border-radius: 3px;
		margin-right: 5px;
		font-size: 16px;
    }
	#enrollPwd{
		margin-top: 10px;
	}
	#enrollImg{
		border-radius: 50%;
		margin-top: 10px;
		margin-bottom: 10px;
	}
    #enrollEmail2{
    	padding: 5px;
		width: 200px;
		height: 37px;
		border: 1px solid lightgray;
		border-radius: 3px;
		font-size: 16px;
    }
    #enrollAddressBtn{
    	margin-top: 10px;
    }
    /* input 요소 */
	
	/* 아이디중복 / 주소검색버튼 */
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
	#enrollIdCheckBtn, #enrollAddressBtn{
		background: rgb(190, 190, 190);
	}
	#enrollAddressBtn{
		width: 120px;
	}
	.enrollAddress{
		margin-top: 10px;
	}
	/* 아이디중복 / 주소검색버튼 */
	
	/* 등록 / 취소 버튼 */
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
	#enrollSubmit{
		background: rgb(26, 188, 156);
	}
	#enrollCancel{
		background:  rgb(190, 190, 190);
	}
	#enrollSubmit, #enrollCancel{
		margin-top: 50px;
		margin-bottom: 50px;
	}
	/* 등록 / 취소 버튼 */
	
    /* 계정등록폼 테이블 */
    
    
    /* 배경 이미지 */
    body{
	    background-image: url('${ pageContext.servletContext.contextPath }/resources/siteImgs/backgroundImage.png');
	    background-repeat: no-repeat; 
	    background-size: 100% 70%;
	    background-position: center; 
	    background-attachment: fixed; 
    }
    /* 배경 이미지 */
    
    #logoClick:hover{
    	cursor: pointer;
    }

/* ==========페이지영역========== */
</style>   
</head>
<body>
	<div id="enrollOuter">
	    <form id="enrollForm" action="insertRequest.ma" method="post" enctype="multipart/form-data">
	        <table id="enrollTable">
	            <tr>
	                <td colspan="2" style="text-align: center;">
	                	<img src="${ pageContext.servletContext.contextPath }/resources/siteImgs/logo.png" id="logoClick" onclick="location.href='returnLogin.ma';">
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2" id="enrollDescript">계정 등록을 위해 필요한 정보를 입력해 주세요.</td>
	            </tr>
	            <tr>
	                <td class="enrollLabel">아이디</td>
	                <td>
	                	<input name="empId" id="enrollId" type="text" required> <br>
	                	<div id="checkResult" style="font-size:0.8em; padding-top:5px;">&nbsp;</div>
	                </td>
	            </tr>
	            <tr>
	                <td class="enrollLabel">비밀번호</td>
	                <td>
	                	<input name="empPwd" id="enrollPwd" type="password" required>
	                	<div id="pwdCaution" class="caution" style="font-size:0.8em; padding-top:5px; margin-bottom: 10px;">&nbsp;</div>
	                </td>
	            </tr>
	            <tr>
	                <td class="enrollLabel">비밀번호 확인</td>
	                <td>
	                	<input id="enrollPwdCheck" type="password" required>
	                	<div id="pwdCheckCaution" style="font-size:0.8em; padding-top:5px; margin-bottom: 10px;">&nbsp;</div>
	                </td>
	            </tr>
	            <tr>
	                <td class="enrollLabel">이름</td>
	                <td>
	                	<input name="empName" id="enrollName" type="text" required> <br>
	                	<div id="checkResult2" style="font-size:0.8em; padding-top:5px; margin-bottom: 10px;">&nbsp;</div>
	                </td>
	            </tr>
	            <tr>
	                <td class="enrollLabel">프로필 사진</td>
	                <td><img id="enrollImg" src="${ pageContext.servletContext.contextPath }/resources/siteImgs/profile_logo.png" width="150" height="150"></td>
	            </tr>
	            <tr>
	                <td class="enrollLabel">생년월일</td>
	                <td><input name="empBirthday" id="enrollBirth" type="text" placeholder="YYYY/MM/DD"></td>
	            </tr>
	            <tr>
	                <td class="enrollLabel">휴대폰 번호</td>
	                <td><input name="empPhone" id="enrollPhone" type="text" placeholder="000-0000-0000"></td>
	            </tr>
	            <tr>
	                <td class="enrollLabel">이메일 주소</td>
	                <td>
	                	<input name="empEmail" id="enrollEmail1" type="text" style="width: 180px;">
						<input id="enrollEmail2" name="emailDomain" type="text" value="@gmail.com" readonly style="width: 180px">
	                </td>
	            </tr>
	            <tr>
	                <td class="enrollLabel">자택 주소</td>
	                <td>
                    	<button id="enrollAddressBtn" class="middleBtn" type="button" onclick="sample6_execDaumPostcode()">우편번호찾기</button>
                    	<input name="empAddress" class="enrollAddress" type="text" id="sample6_address" placeholder="주소" style="width: 300px"> <br>
                    	<input name="empAddressDetail" class="enrollAddress" type="text" id="sample6_detailAddress" placeholder="상세주소" style="width: 430px">
                    	<input type="hidden" id="sample6_postcode"><input type="hidden" id="sample6_extraAddress">
                    </td>
	            </tr>
	            <tr>
	                <td colspan="2" align="center">
	                	<button id="enrollSubmit" type="submit" class="bigBtn">계정등록요청</button> &nbsp;&nbsp;
	                	<button id="enrollCancel" type="button" onclick="location.href='returnLogin.ma'" class="bigBtn">취소</button>
	                </td>
	            </tr>
	        </table>
			<div id="fileArea">
				<input type="file" name="uploadFile" id="fileInput" onchange="loadImg(this, 1);">
			</div>
	    </form>
    </div>
    
    
    <!-- 프로필 사진 첨부 -->
    <script>
		$(function(){
			$("#fileArea").hide();
			
			$("#enrollImg").click(function(){
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
						case 1: $("#enrollImg").attr("src", e.target.result); break;
					}
				};
			}
		}
	</script>
    
	<!-- 아이디 중복검사 -->
    <script>
		function idCheckValidate(num){
    		
    		if(num == 1){ // 아이디 중복체크를 아직 안하는 경우 : 메세지 보여지지 않음, 버튼 비활성화
    			
    			$("#enrollSubmit").attr("disabled", true);
    			
    		}else if(num == 2){ // 아이디 중복체크 후 사용 불가능한 아이디일 경우 : "중복 아이디 존재, 사용 불가능" 메세지 보여짐, 버튼 비활성화
    			
    			$("#checkResult").css("color", "red").text("중복되는 아이디가 존재합니다. 다른 아이디를 입력해주세요.");
    			$("#enrollSubmit").attr("disabled", "true");
    			
    		}else{ // 아이디 중복체크 후 사용 가능한 아이디일 경우 : "사용 가능한 아이디" 메세지 보여짐, 버튼 활성화
    			
    			$("#checkResult").css("color", "rgb(26, 188, 156)").text("사용 가능한 아이디입니다.");
    			$("#enrollSubmit").removeAttr("disabled");
    		}
    	}
    
    	$(function(){
    		
    		var $idInput = $("#enrollForm input[name=empId]");
    		
    		$idInput.keyup(function(){
    			
    			if($idInput.val().length >= 3){
    				
    				$.ajax({
    					url:"idCheck.ma",
    					data:{empId:$idInput.val()},
    					success:function(status){
    						
    						if(status == "fail"){ // 중복되는 아이디 존재 == 사용 불가
    							idCheckValidate(2);
    						}else{ // 중복되는 아이디 없음 == 사용 가능
    							idCheckValidate(3);
    						}
    						
    					},error:function(){
    						console.log("아이디 중복 체크용 ajax 통신 실패");
    					}
    				});
    				
    			}else{ // 중복체크 X
    				idCheckValidate(1);
    			}
    			
    		});
    	});
    </script>
    
    <!-- 이름 중복검사 -->
    <script>
		function nameCheckValidate(num){
    		
    		if(num == 1){ // 이름 중복체크를 아직 안하는 경우 : 메세지 보여지지 않음, 버튼 비활성화
    			
    			$("#enrollSubmit").attr("disabled", true);
    			
    		}else if(num == 2){ // 이름 중복체크 후 사용 불가능한 이름일 경우 : "중복 이름 존재, 사용 불가능" 메세지 보여짐, 버튼 비활성화
    			
    			$("#checkResult2").css("color", "red").text("중복되는 이름이 존재합니다. 다른 이름을 입력해주세요.");
    			$("#enrollSubmit").attr("disabled", "true");
    			
    		}else{ // 이름 중복체크 후 사용 가능한 이름일 경우 : "사용 가능한 이름" 메세지 보여짐, 버튼 활성화
    			
    			$("#checkResult2").css("color", "rgb(26, 188, 156)").text("사용 가능한 이름입니다.");
    			$("#enrollSubmit").removeAttr("disabled");
    		}
    	}
    
    	$(function(){
    		
    		var $idInput = $("#enrollForm input[name=empName]");
    		
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
		var pwd1 = document.getElementById("enrollPwd");
		var pwd2 = document.getElementById("enrollPwdCheck");
		
        regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
		// 비밀번호 검사 : 특수문자(!@#$%^&*) 또는 영문자 또는 숫자 포함 총 8자~15자
            
        $(function(){
        	
            $("#enrollPwd").keyup(function(){
            	
            	if(!regExp.test(pwd1.value)){
	                $("#pwdCaution").css("color", "red").text("영문자, 숫자 또는 특수문자 포함 총 8자~15자 이내로 입력해 주세요.");
            	}else{
            		$("#pwdCaution").css("color", "rgb(26, 188, 156)").text("사용 가능한 비밀번호입니다.");
            	}
            });
        });
       
		$(function(){
           	
			$("#enrollPwdCheck").keyup(function(){
               	
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