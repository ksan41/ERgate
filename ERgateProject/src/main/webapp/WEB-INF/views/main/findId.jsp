<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findId</title>
<style>
/* ==========페이지영역========== */

	/* 바깥 div */
	#findIdOuter{
		border: 1px solid lightgray;
		width: 600px;
		height: 600px;
		margin: auto;
		background: white;
    	margin-top: 170px;
    	margin-bottom: 100px;
    	border-radius: 10px;
	}
	/* 바깥 div */
	
	/* 아이디 찾기 테이블 */
    #findIdTable{
    	width: 510px;
        align: center;
    	margin: auto;
    	margin-top: 50px;
    	margin-bottom: 30px;
    }
    
    /* 서브메뉴바 메뉴버튼(기본) */
    #findIdDescript{
    	height: 50px;
    	align: center;
    	padding-bottom: 30px;
    	margin: 0;
    	list-style:none;
    	padding-left: 30px;
    }
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
    #findIdDescript li{
        margin-top: 10px;
        margin-left: 20px;
        float:left;
        text-decoration-style: none;
        list-style-type: none;
    }
    /* 서브메뉴바 메뉴버튼(현재페이지일때) */
    
    .findIdLabel{
    	text-align: right;
    	font-size: 16px;
    	padding-right: 10px;
    	height: 60px;
    	width: 100px;
    }
    #findIdTable input{
    	padding: 5px;
		width: 180px;
		height: 25px;
		border: 1px solid lightgray;
		border-radius: 3px;
		font-size: 16px;
    }
    .findIdTd{
    	height: 100px;
    	text-align: center;
    }

	/* 인증번호 발송 버튼 */
	.middleBtn {
		width: 90px;
		height: 35px;
		border: 0px;
		border-radius: 5px;
		background: rgb(190, 190, 190);
		color: white;
		font-size: 15px;
	}
	.middleBtn:hover {
		cursor: pointer;
	}
	#findIdSendNoBtn{
		width: 120px;
	}
	/* 인증번호 발송 버튼 */

	/* 아이디 찾기 버튼 */
    .bigBtn {
		width: 140px;
		height: 40px;
		border: 0px;
		border-radius: 5px;
		background: rgb(26, 188, 156);
		color: white;
		font-size: 18px;
	}
	.bigBtn:hover {
		cursor: pointer;
	}
	/* 아이디 찾기 버튼 */

	/* 아이디 찾기 테이블 */
    
    
    /* 배경 이미지 */
    body{
	    background-image: url('${ pageContext.servletContext.contextPath }/resources/siteImgs/backgroundImage.png');
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
	<div id="findIdOuter">
	    <form action="">
	        <table id="findIdTable">
	            <tr>
	                <td colspan="2" style="text-align: center; height: 60px;"><img src="${ pageContext.servletContext.contextPath }/resources/siteImgs/logo.png"></td>
	            </tr>
	            <tr>
	                <td colspan="2" id="findIdDescript">
						<ul id="subMenuList">
							<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
							<li><button class="subBtn subActive">아이디 찾기</button></li>
							<li><button class="subBtn">비밀번호 찾기</button></li>
						</ul>
					</td>
	            </tr>
	            <tr>
	                <td class="findIdLabel">이름</td>
	                <td><input id="findIdName" type="text"></td>
	            </tr>
	            <tr>
	                <td class="findIdLabel">이메일 주소</td>
	                <td>
	                	<input id="findIdEmail1" type="text">
	                	<input id="findIdEmail2" name="emailDomain" type="text" list="emailDomain" placeholder="직접입력">
					        <datalist id="emailDomain">
					            <option>@naver.com</option>
					            <option>@gmail.com</option>
					            <option>@hanmail.net</option>
					        </datalist>
	                </td>
	            </tr>
	            <tr>
		        	<td colspan="2" class="findIdTd">
			        	<button id="findIdSendNoBtn" class="middleBtn">인증번호 발송</button>
		                <input id="findIdNo" type="text" placeholder="인증번호 입력">
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2" class="findIdTd"><button id="findIdBtn" class="bigBtn">아이디 찾기</button></td>
	            </tr>
	        </table>
	    </form>
	</div>
</body>
</html>