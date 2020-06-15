<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findIdSuccess</title>
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

    .findIdTd{
    	height: 100px;
    	text-align: center;
    }

	#findIdSuccess{
		height: 230px;
		font-size: 28px;
		text-align: center;
		line-height: 200%;
	}

	/* 로그인 하기 버튼 */
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
	/* 로그인 하기 버튼 */

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
    
     #logoClick:hover{
    	cursor: pointer;
    }

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
	
	<div id="findIdOuter">
        <table id="findIdTable">
            <tr>
                <td style="text-align: center; height: 60px;">
                	<img src="${ pageContext.servletContext.contextPath }/resources/siteImgs/logo.png" id="logoClick" onclick="location.href='returnLogin.ma';">
                </td>
            </tr>
            <tr>
                <td id="findIdDescript">
					<ul id="subMenuList">
						<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
						<li><button class="subBtn subActive" type="button" onclick="location.href='findIdForm.ma'">아이디 찾기</button></li>
						<li><button class="subBtn" type="button" onclick="location.href='findPwdForm.ma'">비밀번호 찾기</button></li>
					</ul>
				</td>
            </tr>
            <tr>
				<td id="findIdSuccess">
					${ loginUser.empName }님의 아이디는 <br>
					<span style="color: orange;">${ loginUser.empId }</span>입니다.
				</td>
            </tr>
            <tr>
                <td colspan="2" class="findIdTd">
                	<button onclick="location.href='logout.ma'" id="findIdBtn" class="bigBtn">로그인하기</button>
                </td>
            </tr>
        </table>
	</div>
</body>
</html>