<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginIndex</title>
<style>
/* ==========페이지영역========== */

	/* 바깥 div */
	#loginOuter{
		border: 1px solid lightgray;
		width: 550px;
		height: auto;
		margin: auto;
		background: white;
    	margin-top: 170px;
    	margin-bottom: 100px;
    	border-radius: 10px;
	}
	/* 바깥 div */
	
    /* 로그인폼 테이블 */
    #loginTable{
        align: center;
    	margin: auto;
    	margin-top: 50px;
    	margin-bottom: 30px;
    }
    #loginTable tr td{
        height: 60px;
        font-size: 16px;
    }
    .loginTd{
    	width: 60px;
    	text-align: center;
    }
    #loginId, #loginPwd{
    	padding: 5px;
		width: 280px;
		height: 25px;
		border: 1px solid lightgray;
		border-radius: 3px;
		font-size: 16px;
    }
    #loginSaveId{
		width: 22px;
		height: 22px;
    }
    #loginSaveId, #loginSaveIdLabel{
    	vertical-align: top;
    }
	
	/* 로그인 / 계정등록 버튼 */
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
	#loginBtn{
		background: rgb(26, 188, 156);
	}
	#loginEnrollBtn{
		background: rgb(190, 190, 190);
	}
	/* 로그인 / 계정등록 버튼 */
	
    /* 로그인폼 테이블 */
    
    
    /* 배경 이미지 */
    body{
	    background-image: url('../../resources/siteImg/backgroundImage.png');
	    background-repeat: no-repeat; 
	    background-size: 99% 70%;
	    background-position: center; 
	    background-attachment: fixed; 
    }
    /* 배경 이미지 */

/* ==========페이지영역========== */
</style>   
</head>
<body>
	<div id="loginOuter">
	    <form action="">
	        <table id="loginTable">
	            <tr>
	                <td colspan="2" style="text-align: center;"><img src="../../resources/siteImg/logo.png"></td>
	            </tr>
	            <tr>
	                <td class="loginTd" style="font-size: 20px;">ID</td>
	                <td><input id="loginId" type="text"></td>
	            </tr>
	            <tr>
	                <td class="loginTd" style="font-size: 20px;">PW</td>
	                <td><input id="loginPwd" type="password"></td>
	            </tr>
	            <tr>
	            	<td colspan="2" class="loginTd"><input id="loginSaveId" type="checkbox"><label id="loginSaveIdLabel" for="">아이디 저장 &nbsp;</label></td>
	            </tr>
	            <tr>
	                <td colspan="2" class="loginTd"><button id="loginBtn" class="bigBtn">로그인</button></td>
	            </tr>
	            <tr>
	                <td colspan="2" class="loginTd"><button id="loginEnrollBtn" class="bigBtn">계정등록</button></td>
	            </tr>
	            <tr>
	            	<td colspan="2" class="loginTd"><a>아이디 찾기</a> | <a>비밀번호 찾기</a></td>
	            </tr>
	        </table>
	    </form>
	</div>
</body>
</html>