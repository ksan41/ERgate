<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>accountRequest</title>
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
	#enrollAddress2, #enrollAddress3{
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
	    background-image: url('../../resources/siteImg/backgroundImage.png');
	    background-repeat: no-repeat; 
	    background-size: 100% 70%;
	    background-position: center; 
	    background-attachment: fixed; 
    }
    /* 배경 이미지 */

/* ==========페이지영역========== */
</style>   
</head>
<body>
	<div id="enrollOuter">
	    <form action="">
	        <table id="enrollTable">
	            <tr>
	                <td colspan="2" style="text-align: center;"><img src="../../resources/siteImg/logo.png"></td>
	            </tr>
	            <tr>
	                <td colspan="2" id="enrollDescript">계정 등록을 위해 필요한 정보를 입력해 주세요.</td>
	            </tr>
	            <tr>
	                <td class="enrollLabel">아이디</td>
	                <td><input id="enrollId" type="text"><button id="enrollIdCheckBtn" class="middleBtn">중복검사</button></td>
	            </tr>
	            <tr>
	                <td class="enrollLabel">비밀번호</td>
	                <td>
	                	<input id="enrollPwd" type="password">
	                	<p style="font-size: 14px; color: gray;">8~15자 이내로 영문(대소문자 구분), 숫자, 특수기호 사용 가능</p>
	                </td>
	            </tr>
	            <tr>
	                <td class="enrollLabel">비밀번호 확인</td>
	                <td><input id="enrollPwdCheck" type="password"></td>
	            </tr>
	            <tr>
	                <td class="enrollLabel">이름</td>
	                <td><input id="enrollName" type="text"></td>
	            </tr>
	            <tr>
	                <td class="enrollLabel">프로필 사진</td>
	                <td><img id="enrollImg" src="../../resources/siteImg/profile_logo.png" width="150" height="150"></td>
	            </tr>
	            <tr>
	                <td class="enrollLabel">생년월일</td>
	                <td><input id="enrollBirth" type="text"></td>
	            </tr>
	            <tr>
	                <td class="enrollLabel">휴대폰 번호</td>
	                <td><input id="enrollPhone" type="text"></td>
	            </tr>
	            <tr>
	                <td class="enrollLabel">이메일 주소</td>
	                <td>
	                	<input id="enrollEmail1" type="text">
	                	<input id="enrollEmail2" name="emailDomain" type="text" list="emailDomain" placeholder="직접입력">
					        <datalist id="emailDomain">
					            <option>@naver.com</option>
					            <option>@gmail.com</option>
					            <option>@hanmail.net</option>
					        </datalist>
	                </td>
	            </tr>
	            <tr>
	                <td class="enrollLabel">자택 주소</td>
	                <td><button id="enrollAddressBtn" class="middleBtn">우편번호 찾기</button>
	                	<input id="enrollAddress1" type="text" style="width: 100px"><br>
	                    <input id="enrollAddress2" type="text" style="width: 450px"><br>
	                    <input id="enrollAddress3" type="text" style="width: 450px" placeholder="나머지 주소">
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2" align="center">
	                	<button id="enrollSubmit" class="bigBtn">계정등록요청</button> &nbsp;&nbsp;
	                	<button id="enrollCancel" class="bigBtn">취소</button>
	                </td>
	            </tr>
	        </table>
	
	    </form>
    </div>

</body>
</html>