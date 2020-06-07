<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <jsp:forward page="WEB-INF/views/main/loginIndex.jsp"/> --%>
	
	로그인페이지요청용(loginIndex) 얘는 임의로 메소드 만들어둘게요 <br>
	<a href="loginTest.ma">로그인</a><br><br>
	메인페이지 요청용(main)<br>
	<a href="main.ma">메인페이지</a><br><br>
	 근테페이지 요청용 (attendanceList)<br>
	<a href="atList.at">근태</a><br><br>
	결재페이지 요청용(signWaitingList)<br>
	<a href="waitingList.si">결재</a><br><br>
	일정페이지 요청용(scheduleMain)<br>
	<a href="selectList.sc">일정</a><br><br>
	 회의실페이지 요청용(meetingroomCurrentStatus)<br>
	<a href="currentStatus.me">회의실</a><br><br>
	차량페이지 요청용(vehicleCurrentStatus) <br>
	<a href="currentStatus.ve">차량</a><br><br>
	공지사항요청용(noticeList)<br>
	<a href="list.no?currentPage=1">공지</a><br><br>
	사내게시판요청용(boardList)<br>
	<a href="list.bo?currentPage=1">사내게시판</a><br><br>
	조직도 요청용(groupList)
	<a href="groupList.gr">조직도</a><br><br>
	<a href="mgList.gr">계정관리</a><br><br>
	메일 요청용(mailInbox) <br>
	<a href="mailbox.ml">메일</a><br><br>
</body>
</html>