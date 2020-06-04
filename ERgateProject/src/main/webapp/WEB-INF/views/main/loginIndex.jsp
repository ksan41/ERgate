<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();

	boolean saveId = false;
	String userIdSaved = "";
	Cookie[] cookies = request.getCookies();	
	

	if(cookies != null){
		for(Cookie c : cookies){
			if("saveId".equals(c.getName())){
				userIdSaved = c.getValue();
				saveId = true;
			}
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginIndex</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
    .loginTd a{
    	text-decoration: none;
    	color: black;
    }
    .loginTd a:hover{
    	cursor: pointer;
    }
    #loginId, #loginPwd{
    	padding: 5px;
		width: 280px;
		height: 25px;
		border: 1px solid lightgray;
		border-radius: 3px;
		font-size: 16px;
		margin-right: 60px;
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
		width: 280px;
	}
	#loginEnrollBtn{
		background: rgba(22, 160, 133, 0.39);
		width: 120px;
		border-radius: 30px;
	}
	/* 로그인 / 계정등록 버튼 */
	
    /* 로그인폼 테이블 */
    
    
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

	<c:if test="${ !empty msg }">
		<script>
			alert('${ msg }');
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>

	<div id="loginOuter">
	    <form action="login.ma" method="post">
	        <table id="loginTable">
	            <tr>
	                <td colspan="2" style="text-align: center;"><img src="${ pageContext.servletContext.contextPath }/resources/siteImgs/logo.png"></td>
	            </tr>
	            <tr>
	                <td class="loginTd" style="font-size: 20px;">ID</td>
	                <td><input id="loginId" name="empId" type="text" required value="<%= saveId ? userIdSaved : "" %>"></td>
	            </tr>
	            <tr>
	                <td class="loginTd" style="font-size: 20px;">PW</td>
	                <td><input id="loginPwd" name="empPwd" type="password"></td>
	            </tr>
	            <tr>
	            	<td></td>
	            	<td>
	            		<input id="loginSaveId" type="checkbox" name="saveId" <% if(saveId){ %> checked="checked"<%} %>>
	            		<label id="loginSaveIdLabel" for="loginSaveId">아이디 저장 &nbsp;</label>
	            	</td>
	            </tr>
	            <tr>
	                <td colspan="2" class="loginTd"><button type="submit" id="loginBtn" class="bigBtn">로그인</button></td>
	            </tr>
	            <tr>
	                <td colspan="2" class="loginTd"><button type="button" id="loginEnrollBtn" onclick="location.href='accountForm.ma'" class="bigBtn">계정등록</button></td>
	            </tr>
	            <tr>
	            	<td colspan="2" class="loginTd">
	            		<a href="findIdForm.ma">아이디 찾기</a> | 
	            		<a href="findPwdForm.ma">비밀번호 찾기</a>
	            	</td>
	            </tr>
	        </table>
	    </form>
	</div>
	
</body>
</html>