<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scheduleMain</title>
<jsp:include page="../common/menubar.jsp" />
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 이 부분  -->

<!-- 여기부터 달력 -->
<link href="../ergate/resources/fullcalendar/core/main.css" rel="stylesheet" />
<link href="../ergate/resources/fullcalendar/daygrid/main.css" rel="stylesheet" />
<link href="../ergate/resources/fullcalendar/timegrid/main.min.css" rel="stylesheet" />
<script src="../ergate/resources/fullcalendar/core/main.js"></script>
<script src="../ergate/resources/fullcalendar/daygrid/main.js"></script>
<script src="../ergate/resources/fullcalendar/interaction/main.min.js"></script>
<script src="../ergate/resources/fullcalendar/timegrid/main.min.js"></script></head>
<script src="../ergate/resources/fullcalendar/core/locales/ko.js"></script>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">

<script >
document.addEventListener('DOMContentLoaded', function() {
    var Calendar = FullCalendar.Calendar;
    var Draggable = FullCalendarInteraction.Draggable;

    var containerEl = document.getElementById('external-events');
    var calendarEl = document.getElementById('calendar');
    var checkbox = document.getElementById('drop-remove');
 
    // initialize the external events
    // -----------------------------------------------------------------
 
    new Draggable(containerEl, {
      itemSelector: '.fc-event',
      eventData: function(eventEl) {
        return {
          title: eventEl.innerText
        };
      }
    });
 
    // initialize the calendar
    // -----------------------------------------------------------------
 
    var calendar = new Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      editable: true,
      droppable: true, // this allows things to be dropped onto the calendar
      drop: function(info) {
        // is the "remove after drop" checkbox checked?
        if (checkbox.checked) {
          // if so, remove the element from the "Draggable Events" list
          info.draggedEl.parentNode.removeChild(info.draggedEl);
        }
      }
    });
 	var events= new Array();
 	<c:forEach var="list" items="${slist}">
 	events.push({
 		id:'${list.scheduleNo}',
 		title:'${list.scheduleTitle}',
 		start:'${list.scheduleStartDay}',
 		end:'${list.scheduleEndDay}', 
 		<c:if test="${list.scheduleKind eq '개인일정'}">
 			color : "#FF0000"
 		</c:if>
		<c:if test="${list.scheduleKind eq '업무일정'}">
			color : "#0000FF"
		</c:if>
 		<c:if test="${list.scheduleKind eq '공유일정'}">
			color : "#99CCFF"
		</c:if>
 		
 	});
 	</c:forEach>
 

    var calendar = new Calendar(calendarEl, {    
        plugins: ['interaction','dayGrid', 'timeGrid'],
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
          },
          editable: true,
          droppable: true, // this allows things to be dropped onto the calendar
        events: events,
        locale: 'ko',
        eventClick: function(event) { 
        	/*  $('#list_schedule').modal('show'); */
              	$.ajax({
        		url:"slist.sc",      		
        		type:"GET",        		
        		data:"scheduleNo="+event.event.id,
        		asyns:false,
          		success:function(data){
					
          			if(data.scheduleKind=="개인일정"){
          				$("#postForm").find('input[id=tempNo]').val(data.scheduleNo);
          			 	$("#list_schedule_Ga").find('input[name=scheduleNo]').val(data.scheduleNo);
          			 	$("#list_schedule_Ga").find('input[name=empId]').val(data.empId);
	                    $("#list_schedule_Ga").find('input[name=scheduleTitle]').val(data.scheduleTitle);
	                    $("#list_schedule_Ga").find('input[name=scheduleStartDay]').val(data.scheduleStartDay);
	                    $("#list_schedule_Ga").find('input[name=scheduleStartTime]').val(data.scheduleStartTime);
	                    $("#list_schedule_Ga").find('input[name=scheduleEndDay]').val(data.scheduleEndDay);
	                    $("#list_schedule_Ga").find('input[name=scheduleEndTime]').val(data.scheduleEndTime);
	                    $("#list_schedule_Ga").find('input[name=scheduleKind]').val(data.scheduleKind);
	                    $("#list_schedule_Ga").find('input[name=outMeetingRoom]').val(data.outMeetingRoom);
	                    $("#list_schedule_Ga").find('input[name=inMeetingRoom]').val(data.inMeetingRoom);
	                    $("#list_schedule_Ga").find('textarea[name=scheduleContent]').val(data.scheduleContent);
	                    $("#list_schedule_Ga").find('textarea[name=callPeople]').val(data.callPeople);
	                    $("#list_schedule_Ga").find('textarea[name=joinPeople]').val(data.joinPeople);
	                    $('#list_schedule_Ga').modal('show');
          			}
          			else if(data.scheduleKind=="업무일정"){
          				$("#postForm").find('input[id=tempNo]').val(data.scheduleNo);
          				$("#list_schedule_Up").find('input[name=scheduleNo]').val(data.scheduleNo);
          			 	$("#list_schedule_Up").find('input[name=empId]').val(data.empId);
	                    $("#list_schedule_Up").find('input[name=scheduleTitle]').val(data.scheduleTitle);
	                    $("#list_schedule_Up").find('input[name=scheduleStartDay]').val(data.scheduleStartDay);
	                    $("#list_schedule_Up").find('input[name=scheduleStartTime]').val(data.scheduleStartTime);
	                    $("#list_schedule_Up").find('input[name=scheduleEndDay]').val(data.scheduleEndDay);
	                    $("#list_schedule_Up").find('input[name=scheduleEndTime]').val(data.scheduleEndTime);
	                    $("#list_schedule_Up").find('input[name=scheduleKind]').val(data.scheduleKind);
	                    $("#list_schedule_Up").find('input[name=outMeetingRoom]').val(data.outMeetingRoom);
	                    $("#list_schedule_Up").find('input[name=inMeetingRoom]').val(data.inMeetingRoom);
	                    $("#list_schedule_Up").find('textarea[name=scheduleContent]').val(data.scheduleContent);
	                    $("#list_schedule_Up").find('textarea[name=callPeople]').val(data.callPeople);
	                    $("#list_schedule_Up").find('textarea[name=joinPeople]').val(data.joinPeople);
	                    $('#list_schedule_Up').modal('show');
                       
                    }else if(data.scheduleKind=="공유일정"){
                    	$("#postForm").find('input[id=tempNo]').val(data.scheduleNo);
                    	$("#list_schedule_Go").find('input[name=scheduleNo]').val(data.scheduleNo);
          			 	$("#list_schedule_Go").find('input[name=empId]').val(data.empId);
	                    $("#list_schedule_Go").find('input[name=scheduleTitle]').val(data.scheduleTitle);
	                    $("#list_schedule_Go").find('input[name=scheduleStartDay]').val(data.scheduleStartDay);
	                    $("#list_schedule_Go").find('input[name=scheduleStartTime]').val(data.scheduleStartTime);
	                    $("#list_schedule_Go").find('input[name=scheduleEndDay]').val(data.scheduleEndDay);
	                    $("#list_schedule_Go").find('input[name=scheduleEndTime]').val(data.scheduleEndTime);
	                    $("#list_schedule_Go").find('input[name=scheduleKind]').val(data.scheduleKind);
	                    $("#list_schedule_Go").find('input[name=outMeetingRoom]').val(data.outMeetingRoom);
	                    $("#list_schedule_Go").find('input[name=inMeetingRoom]').val(data.inMeetingRoom);
	                    $("#list_schedule_Go").find('textarea[name=scheduleContent]').val(data.scheduleContent);
	                    $("#list_schedule_Go").find('textarea[name=callPeople]').val(data.callPeople);
	                    $("#list_schedule_Go").find('textarea[name=joinPeople]').val(data.joinPeople);
 	                    $('#list_schedule_Go').modal('show');
                    	
                    }
                  
          		} 

        	});           	 
       }
        
       });
    calendar.render();
  });
  
 /*   var calendar = new Calendar(calendarEl, {
     plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
     header: {
       left: 'prev,next today',
       center: 'title',
       right: 'dayGridMonth,timeGridWeek,timeGridDay'
     },
     editable: true,
     droppable: true, // this allows things to be dropped onto the calendar
     drop: function(info) {
       // is the "remove after drop" checkbox checked?
       if (checkbox.checked) {
         // if so, remove the element from the "Draggable Events" list
         info.draggedEl.parentNode.removeChild(info.draggedEl);
       }
     },
     locale: 'ko'
   });
   
   var calendar = new Calendar(calendarEl, {
        dateClick: function() {
          alert('a day has been clicked!');
        }
      });
   
   calendar.on('dateClick', function(info) {
        console.log('clicked on ' + info.dateStr);
      });
 */
  


</script>
<!-- 여기까지 달력 -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<style>
/* 달력 css */
html, body {
  margin: 0;
  padding: 0;
  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  font-size: 14px;
}
#external-events {
  position: fixed;
  z-index: 2;
  top: 20px;
  left: 20px;
  width: 150px;
  padding: 0 10px;
 
  background: #eee;

}
.demo-topbar + #external-events { /* will get stripped out */
  top: 60px;
}
#external-events .fc-event {
  margin: 1em 0;
  cursor: move;
}
#calendar-container {
 /* position: relative;
  z-index: 1;
  margin-left: 200px; */
   margin-top: 50px;
   margin-left: 100px;
   width: 1400px;
   height: auto;
   float: left;
}

#calendar {
  /*max-width: 900px;
  margin: 20px auto;*/
   margin-top: 50px;
   margin-left: 100px;
   width: 1200px;
   height: auto;
   float: left;
   position:relative;
   right: 150px;    
}
/* 탭 css */
   .tabWrap { width: 900px; height: 500px; }
   .tab_Menu { margin: 0px; padding: 0px; list-style: none; }
   .tabMenu { width: 150px; margin: 0px; text-align: center; 
            padding-top: 10px; padding-bottom: 10px; float: left; }
      .tabMenu a { color: #000000; font-weight: bold; text-decoration: none; }
   .current {
            border: 1px solid blue; border-bottom:hidden; }
   .tabPage { width: 900px; height: 470px; float: left;}
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
        width: 150px;
        height: 50px;
        font-size: 19px;
        color:rgb(127, 127, 127);
        background-color: white;
        border-radius: 25px;
    }
    .subBtn:hover{cursor: pointer;}
    /* 서브메뉴바 메뉴버튼(기본) */
    /* 서브메뉴바 메뉴버튼(현재페이지일때) */
    .subActive{
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
   
   html, body {
      margin: 0;
      height: 100%;
      overflow-x: hidden;
      overflow-y: auto;
      font-family: "Nanum Gothic", serif;
      overflow-x: hidden;
   }
   #scheduleBtn {
      width: 140px;
      height: 40px;
      border: 0px;
      border-radius: 5px;
      background: rgb(26, 188, 156);
      color: white;
      font-size: 18px;
      margin-left: 50px;
   }
   #scheduleBtn:hover {
      cursor: pointer;
   }
   
   #updateBtn {
     width: 140px;
     height: 40px;
     border: 0px;
     border-radius: 5px;
     background: rgb(26, 188, 156);
     color: white;
     font-size: 18px;
     margin-left: 50px;
  }
  #updateBtn:hover {
     cursor: pointer;
  }
  
   
/* ==========예약하기 모달========== */
   
   /* 예약 모달 */
   .modal {
      max-width: 2000px;
      width: 1000px;
      min-height: 400px;
      height:auto; /* 모달 크기지정 */
      padding: 0px;
      border-radius: 0px;
   }
   .modal-title {
      margin: 0;
      width: 100%;
      height: 50px;
      background-color: rgba(22, 160, 133, 0.68);
      font-size: 25px;
      padding: 10px;
      color: white;
      box-sizing: border-box;
   }
   .modal-content {
      padding: 20px;
   }


   #minusImg{
      width: 15px;
      height: 15px;
      vertical-align: middle;
      margin-left: 10px;
      margin-right: 10px;
      margin-bottom: 5px;
   }


   #r1 {
      width: 20%;
      text-align: center;
      border-bottom: 1px ridge lightgray;
      background-color: #eeee;
   }
   #r2 {
      width: 80%;
      padding: 20px;
      border-bottom: 1px solid lightgray;
   }
   #r3 {
      text-align: center;
      background-color: #eeee;
   }
   #r4 {
      width: 80%;
      padding: 20px;
   }
   #scheduleContentBtn, #resetBtn{
      width: 140px;
      height: 40px;
      border: 0px;
      border-radius: 5px;
      color: white;
      font-size: 18px;
      margin-top: 20px;
   }
   #scheduleContentBtn{
      background: rgb(26, 188, 156);
      margin-left: 60px;
   }
   #resetBtn{
      background: rgb(190, 190, 190);
   }
   #scheduleContentBtn:hover, #resetBtn:hover{
      cursor: pointer;
   }

/* ==========예약하기 모달========== */

</style>
</head>
<body>

	<c:if test="${!empty msg1 }">
			<script>
				alert("${msg1}");
				
			</script>
		<c:remove var="msg1" scope="session"/>
	</c:if>

   <!-- 메뉴바 -->

   <div class="outer">
      <div class="topBar">
         <!-- 메뉴명 -->
         <span>일정</span>
      </div>
      <div class="subMenuArea">
         <ul id="subMenuList">
            <!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
            <li><button class="subBtn subActive">일정조회</button></li>
         </ul>
      </div>
      <div class="contentArea">

         <button id="scheduleBtn">일정등록</button>
         <a  id="schedule" class="open-modal" href="#open_schedule" style="display: none;">모달</a> <br> 
		    
	      <div id="external-events">	      
	     </div>
	      <div id='calendar'></div>

      </div>
     
      <!-- 모달 내용(예약하기 부분) -->
      <div id="open_schedule" class="modal">
         <div class="modal-title">일정등록</div>
         <div class="modal-content">
         
          <div class="tabWrap">
            <ul class="tab_Menu">
               <li class="tabMenu current">
                  <a href="#tabContent01" >개인일정</a>
               </li>
               <li class="tabMenu">
                  <a href="#tabContent02" >업무일정</a>
               </li>
               <li class="tabMenu">
                  <a href="#tabContent03" >공유일정</a>
               </li>
            </ul>
            <div class="tab_Content_Wrap">
                   
            <form action="insert.sc" method="post" onsubmit="">
               <div id="tabContent01" class="tabPage" style="height:400px; width:100%;">
      			   <input type="hidden" id="scheduleKind" name="scheduleKind" value="개인일정">
      			   <input type="hidden" id="empId" name="empId" value="${ loginUser.empId }">      			  
                   <table class="scheduleContent">
                        <tr>
                           <td id="r1">제목</td>
                           <td id="r2">
                              <input type="text" placeholder="내용을 입력해주세요." class="inputs" id="scheduleTitle" name="scheduleTitle">
                           </td>
                        </tr>
                        <tr>
                           <td id="r1">시작일시</td>
                           <td id="r2">                             
                                 <input type="date" class="inputs" style="width:140px" id="scheduleStartDay" name="scheduleStartDay">
                                 <img src="${ pageContext.servletContext.contextPath }/resources/icons/minus.png" id="minusImg">
                                 <input type="time" class="inputs" style="width:120px" id="scheduleStartTime" name="scheduleStartTime">                           
                             
                           </td>
                        </tr>
                        
                        <tr>                        
                           <td id="r1">종료일시</td>
                           <td id="r2">                              
                                 <input type="date" class="inputs" style="width:140px" id="scheduleEndDay" name="scheduleEndDay">
                                 <img src="${ pageContext.servletContext.contextPath }/resources/icons/minus.png" id="minusImg">
                                 <input type="time" class="inputs" style="width:120px" id="scheduleEndTime" name="scheduleEndTime">        
                          		 <input type="hidden" id="outmeetingroom" name="outmeetingroom" >
                          		 <input type="hidden" id="inmeetingroom" name="inmeetingroom" >
                          		 <input type="hidden" id="callPeople" name="callPeople" value="null">
                          		 <input type="hidden" id="joinPeople" name="joinPeople" value="null">	
                           </td>
                        </tr>
                        <tr>
                           <td id="r1">내용</td>
                           <td id="r2">                             
                             <textarea cols="60" rows="4" placeholder="내용을 입력해주세요." id="scheduleContent" name="scheduleContent"></textarea>
                           </td>
                        </tr>
                     </table>
                    <div class="btns">
		            <button id="scheduleBtn" type="submit">확인</button>
		            <button id="resetBtn" type="button" onClick="history.go(0)">취소</button>
		         </div>
               </div>		          
               </form>
               
               <form action="insert.sc" method="post" onsubmit=""> 
               <div id="tabContent02" class="tabPage" style="height:800px;width:100%;">
               	  <input type="hidden" id="scheduleKind" name="scheduleKind" value="업무일정">
               	  <input type="hidden" id="empId" name="empId" value="${ loginUser.empId }">	
                  <table class="scheduleContent">
                        <tr>
                           <td id="r1">제목</td>
                           <td id="r2">
                              <input type="text" placeholder="내용을 입력해주세요." class="inputs" id="scheduleTitle" name="scheduleTitle">
                           </td>
                        </tr>
                        <tr>
                           <td id="r1">시작일시</td>
                           <td id="r2">
                                 <input type="date" class="inputs" style="width:140px" id="scheduleStartDay" name="scheduleStartDay">
                                 <img src="${ pageContext.servletContext.contextPath }/resources/icons/minus.png" id="minusImg">
                                 <input type="time" class="inputs" style="width:120px" id="scheduleStartTime" name="scheduleStartTime">                           
                           </td>
                        </tr>
                        
                       <tr>
                           <td id="r1">종료일시</td>
                           <td id="r2">
                                 <input type="date" class="inputs" style="width:140px" id="scheduleEndDay" name="scheduleEndDay">
                                 <img src="${ pageContext.servletContext.contextPath }/resources/icons/minus.png" id="minusImg">
                                 <input type="time" class="inputs" style="width:120px" id="scheduleEndTime" name="scheduleEndTime">         
                           </td>
                        </tr>
                         <tr>
                           <td id="r1">참석자</td>
                           <td id="r2">
                         		<button type="button" id="" class="searchBtn" onclick="window.open('joinPeople.sc','scheduleAddJoinparticipants','_blank');">참석자 지정</button> 
                               <textarea cols="60" rows="4" id="joinArea" name="joinPeople"></textarea>  
                           	    
                           </td>
                        </tr>
                        
                        <tr>
                           <td id="r1">수신자</td>
                           <td id="r2">
                          		<button type="button" id="" class="searchBtn" onclick="window.open('callPeople.sc','scheduleAddCallparticipants','_blank');">수신자 지정</button> 
       							<textarea cols="60" rows="4" id="callArea" name="callPeople"></textarea> 
                           </td>
                        </tr> 
                       
                        <tr>
                           <td id="r1">회의장소</td>
                           <td id="r2">
                              <input type="radio"> 지정회의실
                              <select name="inMeetingRoom" id="inMeetingRoom">
                                 <option value="3층회의실">3층회의실</option>
                                 <option value="5층회의실1">5층회의실1</option>
                                 <option value="5층회의실2">5층회의실2</option>
                                 <option value="6층회의실1">6층회의실1</option>
                                 <option value="6층회의실2">6층회의실2</option>
                              </select><br>
                                 <input type="radio"> 외부회의실
                                 <input type="text" name="outMeetingRoom" id="outMeetingRoom">  <br>
                                 <input type="radio"> 지정안함 <br>
                           </td>                                                      
                        </tr> 
                        
                        <tr>
                           <td id="r1">내용</td>
                           <td id="r2">                             
                             <textarea cols="60" rows="4" id="partArea" placeholder="내용을 입력해주세요." id="scheduleContent" name="scheduleContent"></textarea>
                           </td>
                        </tr>
                     </table>
                     <!-- 예약/취소 버튼 -->
		         <div class="btns">
		            <button id="scheduleBtn" type="submit">확인</button>
		            <button id="resetBtn" type="button" onClick="history.go(0)">취소</button>
		         </div>
               		</div>

               </form>
               
                <form action="insert.sc" method="post" onsubmit="">
	               <div id="tabContent03" class="tabPage"  style="height:400px;width:100%;">
	                  <input type="hidden" id="scheduleKind" name="scheduleKind" value="공유일정">
	                  <input type="hidden" id="empId" name="empId" value="${ loginUser.empId }">
	                  <table class="scheduleContent">
	                        <tr>
	                           <td id="r1">제목</td>
	                           <td id="r2">
	                              <input type="text" placeholder="내용을 입력해주세요." class="inputs" id="scheduleTitle" name="scheduleTitle">
	                           </td>
	                        </tr>
	                        <tr>
	                           <td id="r1">시작일시</td>
	                           <td id="r2">
	                                 <input type="date" class="inputs" style="width:140px" id="scheduleStartDay" name="scheduleStartDay">
	                                 <img src="${ pageContext.servletContext.contextPath }/resources/icons/minus.png" id="minusImg">
	                                 <input type="time" class="inputs" style="width:120px" id="scheduleStartTime" name="scheduleStartTime">                           
	                           </td>
	                        </tr>
	                        
	                        <tr>                        
	                           <td id="r1">종료일시</td>
	                           <td id="r2">
	                                 <input type="date" class="inputs" style="width:140px" id="scheduleEndDay" name="scheduleEndDay">
	                                 <img src="${ pageContext.servletContext.contextPath }/resources/icons/minus.png" id="minusImg">
	                                 <input type="time" class="inputs" style="width:120px" id="scheduleEndTime" name="scheduleEndTime">         
	                           </td>
	                        </tr>
	                        <tr>
	                           <td id="r1">내용</td>
	                           <td id="r2">                             
	                             <textarea cols="60" rows="4" id="partArea" placeholder="내용을 입력해주세요." id="scheduleContent" name="scheduleContent" ></textarea>
	                             <input type="hidden" id="outmeetingroom" name="outmeetingroom" value="null">
                          		 <input type="hidden" id="inmeetingroom" name="inmeetingroom" value="null">
                          		 <input type="hidden" id="callPeople" name="callPeople" value="null">
                    			 <input type="hidden" id="joinPeople" name="joinPeople" value="null">
	                           </td>
	                        </tr>
	                        <tr>
	                           <td id="r1" >
	                            <input type="checkbox"> 부서만 공유
	                         </td>
	                         <td id="r1"></td>
	                         </tr>
	                     </table>  
	            <!-- 예약/취소 버튼 -->
		         <div class="btns">
		            <button id="scheduleBtn" type="submit">확인</button>
		            <button id="resetBtn" type="button" onClick="history.go(0)">취소</button>
		            
		         </div>                  
	              	</div>
             	</form>
            </div>
         </div>
         </div>
      </div>
 
 <!-- 수정하기 모달 -->
      
      
      
      
  <div id="list_schedule_Ga" class="modal">
   <div class="modal-title">개인일정 상세보기</div>
         <div class="modal-content">
         	
         	<form action="update.sc" method="post" onsubmit="">
        			<input type="hidden" id="scheduleKind" name="scheduleKind" value=""> 
        			<input type="hidden" id="scheduleNo" name="scheduleNo" value=""> 
      			    <input type="hidden" id="empId" name="empId" value=""> 
      			         			    			  
                   <table class="scheduleContent">
                        <tr>
                           <td id="r1">제목</td>
                           <td id="r2">
                              <input type="text" class="inputs" id="scheduleTitle" name="scheduleTitle" value="">
                           </td>
                        </tr>
                        <tr>
                           <td id="r1">시작일시</td>
                           <td id="r2">                             
                                 <input type="date" class="inputs" style="width:140px" id="scheduleStartDay" name="scheduleStartDay" value="">
                                 <img src="${ pageContext.servletContext.contextPath }/resources/icons/minus.png" id="minusImg">
                                 <input type="time" class="inputs" style="width:120px" id="scheduleStartTime" name="scheduleStartTime" value="">                           
                             
                           </td>
                        </tr>
                        
                        <tr>                        
                           <td id="r1">종료일시</td>
                           <td id="r2">                              
                                 <input type="date" class="inputs" style="width:140px" id="scheduleEndDay" name="scheduleEndDay" value="">
                                 <img src="${ pageContext.servletContext.contextPath }/resources/icons/minus.png" id="minusImg">
                                 <input type="time" class="inputs" style="width:120px" id="scheduleEndTime" name="scheduleEndTime" value="">        
                          		 <input type="hidden" id="outmeetingroom" name="outmeetingroom" value="">
                          		 <input type="hidden" id="inmeetingroom" name="inmeetingroom" value="">
                          		 <input type="hidden" id="callPeople" name="callPeople" value="">
                          		 <input type="hidden" id="joinPeople" name="joinPeople" value="">	
                           </td>
                        </tr>
                        <tr>
                           <td id="r1">내용</td>
                           <td id="r2">                             
                             <textarea cols="60" rows="4" placeholder="내용을 입력해주세요." id="scheduleContent" name="scheduleContent" value=""></textarea>
                           </td>
                        </tr>
                     </table>
                                  
                  <div class="btns">
		            <button id="updateBtn" type="submit">수정하기</button>
		            <button type="button" class="tempnn" id="updateBtn">삭제하기</button>
		            <button id="resetBtn" type="button" onClick="history.go(0)">취소</button>
		         </div> 
		      </form>   
            
            </div>                
  </div>
  
  
  <div id="list_schedule_Up" class="modal">
   <div class="modal-title">업무일정 상세보기</div>
         <div class="modal-content">
         <form action="update.sc" method="post" onsubmit="">
      			   <input type="hidden" id="scheduleKind" name="scheduleKind" value=""> 
      			   <input type="hidden" id="scheduleNo" name="scheduleNo" value="">  
      			   <input type="hidden" id="empId" name="empId" value=""> 
      			 <table class="scheduleContent">
                        <tr>
                           <td id="r1">제목</td>
                           <td id="r2">
                          	 <input type="text" class="inputs" id="scheduleTitle" name="scheduleTitle" value="">                            
                           </td>
                        </tr>
                        <tr>
                           <td id="r1">시작일시</td>
                           <td id="r2">
                                 <input type="date" class="inputs" style="width:140px" id="scheduleStartDay" name="scheduleStartDay">
                                 <img src="${ pageContext.servletContext.contextPath }/resources/icons/minus.png" id="minusImg">
                                 <input type="time" class="inputs" style="width:120px" id="scheduleStartTime" name="scheduleStartTime">                           
                           </td>
                        </tr>
                        
                       <tr>
                           <td id="r1">종료일시</td>
                           <td id="r2">
                                 <input type="date" class="inputs" style="width:140px" id="scheduleEndDay" name="scheduleEndDay">
                                 <img src="${ pageContext.servletContext.contextPath }/resources/icons/minus.png" id="minusImg">
                                 <input type="time" class="inputs" style="width:120px" id="scheduleEndTime" name="scheduleEndTime">         
                           </td>
                        </tr>
                         <tr>
                           <td id="r1">참석자</td>
                           <td id="r2">
                           		 <button type="button" id="" class="searchBtn" onclick="window.open('joinPeople.sc','scheduleAddJoinparticipantsModal','_blank');">참석자 지정</button> 
                 		   		<textarea cols="60" rows="4" id="joinAreaM" name="joinPeople"></textarea> 
                           </td>
                        </tr>
                 
               
                 
                        <tr>
                           <td id="r1">수신자</td>
                           <td id="r2">
                           		<button type="button" id="" class="searchBtn" onclick="window.open('callPeople.sc','scheduleAddCallparticipantsModal','_blank');">수신자 지정</button> 
       							<textarea cols="60" rows="4" id="callAreaM" name="callPeople"></textarea> 
                           </td>
                        </tr> 
                        
                        <tr>
                           <td id="r1">회의장소</td>
                           <td id="r2">
                              <input type="radio"> 지정회의실
                              <select name="inMeetingRoom" id="inMeetingRoom">
                                 <option value="3층회의실">3층회의실</option>
                                 <option value="5층회의실1">5층회의실1</option>
                                 <option value="5층회의실2">5층회의실2</option>
                                 <option value="6층회의실1">6층회의실1</option>
                                 <option value="6층회의실2">6층회의실2</option>
                              </select><br>
                                 <input type="radio"> 외부회의실
                                 <input type="text" name="outMeetingRoom" id="outMeetingRoom">  <br>
                                 <input type="radio"> 지정안함 <br>
                           </td>                                                      
                        </tr> 
                        
                        <tr>
                           <td id="r1">내용</td>
                           <td id="r2">                             
                             <textarea cols="60" rows="4" id="partArea" placeholder="내용을 입력해주세요." id="scheduleContent" name="scheduleContent"></textarea>
                           </td>
                        </tr>
                     </table>
                    
                  <div class="btns">
		            <button id="updateBtn" type="submit">수정하기</button>
		            <button type="button" class="tempnn" id="updateBtn">삭제하기</button>
		            <button id="resetBtn" type="button" onClick="history.go(0)">취소</button>
		         </div> 
             </form>
             
            </div>                
       </div>
          

  <div id="list_schedule_Go" class="modal">
   <div class="modal-title">공유일정 상세보기</div>
         <div class="modal-content">
         <form action="update.sc" method="post" onsubmit="">        
      			   <input type="hidden" id="scheduleKind" name="scheduleKind" value=""> 
      			   <input type="hidden" id="scheduleNo" name="scheduleNo" value=""> 
      			   <input type="hidden" id="empId" name="empId" value=""> 
      				      <table class="scheduleContent">
	                        <tr>
	                           <td id="r1">제목</td>
	                           <td id="r2">
	                              <input type="text" placeholder="내용을 입력해주세요." class="inputs" id="scheduleTitle" name="scheduleTitle">
	                           </td>
	                        </tr>
	                        <tr>
	                           <td id="r1">시작일시</td>
	                           <td id="r2">
	                                 <input type="date" class="inputs" style="width:140px" id="scheduleStartDay" name="scheduleStartDay">
	                                 <img src="${ pageContext.servletContext.contextPath }/resources/icons/minus.png" id="minusImg">
	                                 <input type="time" class="inputs" style="width:120px" id="scheduleStartTime" name="scheduleStartTime">                           
	                           </td>
	                        </tr>
	                        
	                        <tr>                        
	                           <td id="r1">종료일시</td>
	                           <td id="r2">
	                                 <input type="date" class="inputs" style="width:140px" id="scheduleEndDay" name="scheduleEndDay">
	                                 <img src="${ pageContext.servletContext.contextPath }/resources/icons/minus.png" id="minusImg">
	                                 <input type="time" class="inputs" style="width:120px" id="scheduleEndTime" name="scheduleEndTime"> 
	                                 <input type="hidden" id="outmeetingroom" name="outmeetingroom" value="null">
                          		     <input type="hidden" id="inmeetingroom" name="inmeetingroom" value="null">
                          		     <input type="hidden" id="callPeople" name="callPeople" value="">
                          		     <input type="hidden" id="joinPeople" name="joinPeople" value="">        
	                           </td>
	                        </tr>
	                        <tr>
	                           <td id="r1">내용</td>
	                           <td id="r2">                             
	                             <textarea cols="60" rows="4" id="partArea" placeholder="내용을 입력해주세요." id="scheduleContent" name="scheduleContent" ></textarea>
	                             
	                           </td>
	                        </tr>
	                        <tr>
	                           <td id="r1" >
	                            <input type="checkbox"> 부서만 공유
	                         </td>
	                         <td id="r1"></td>
	                         </tr>
	                     </table>  
                    
                  <div class="btns">
		            <button id="updateBtn" type="submit">수정하기</button>
		            <button type="button" class="tempnn" id="updateBtn">삭제하기</button>
		            <button id="resetBtn" type="button" onClick="history.go(0)">취소</button>
		         </div> 
		       </form>
          </div>      
                        
   </div>
   <script>
   
   $(document).ready(function(){
	   		
	   		
	   		$(".tempnn").on("click",function(){
	   			var thisNo = $(this).parent().parent().find('input[name=scheduleNo]').val();
	   			$.ajax({
	        		url:"delete.sc",      		
	        		type:"GET",        		
	        		data:"scheduleNo="+thisNo,
	        		asyns:false,
	          		success:function(data){
						location.href="selectList.sc";
	          		} 

	        	});   
	      	});
   });

   	
   </script>   

   <!-- 모달용 스크립트 -->
   <script>
      $('.open-modal').click(function() {
         $(this).modal({
            fadeDuration : 150
         });
      });

      /* 일정등록 모달 여는 function */
      $("#scheduleBtn").on("click",function(){
            $("#schedule").click();
      });
   </script>

   <script type="text/javascript">
   function tabSetting() {
      // 탭 컨텐츠 hide 후 현재 탭메뉴 페이지만 show
      $('.tabPage').hide();
      $($('.current').find('a').attr('href')).show();

      // Tab 메뉴 클릭 이벤트 생성
      $('li').click(function (event) {
         var tagName = event.target.tagName; // 현재 선택된 태그네임
         var selectedLiTag = (tagName.toString() == 'A') ? $(event.target).parent('li') : $(event.target); // A태그일 경우 상위 Li태그 선택, Li태그일 경우 그대로 태그 객체
         var currentLiTag = $('li[class~=current]'); // 현재 current 클래그를 가진 탭
         var isCurrent = false;  
         
         // 현재 클릭된 탭이 current를 가졌는지 확인
         isCurrent = $(selectedLiTag).hasClass('current');
         
         // current를 가지지 않았을 경우만 실행
         if (!isCurrent) {
            $($(currentLiTag).find('a').attr('href')).hide();
            $(currentLiTag).removeClass('current');

            $(selectedLiTag).addClass('current');
            $($(selectedLiTag).find('a').attr('href')).show();
         }

         return false;
      });
   }

   $(function () {
      // 탭 초기화 및 설정
      tabSetting();
   });
</script>
<script>
var joinId = new Array();
var joinName = new Array();

// 참석자 아이디 받아오기
function getJoinId(data){
	joinId = data;
}

// 참석자 이름 받아오기
function getJoinName(data){
	joinName = data;
}

var callId = new Array();
var callName = new Array();

// 수신자 아이디 받아오기
function getCallId(data){
	callId = data;
}

// 수신자 이름 받아오기
function getCallName(data){
	callName = data;	
}

var joinIdM = new Array();
var joinNameM = new Array();

// 참석자 아이디 받아오기
function getJoinIdM(data){
	joinIdM = data;
}

// 참석자 이름 받아오기
function getJoinName(data){
	joinNameM = data;
}

var callIdM = new Array();
var callNameM = new Array();

// 수신자 아이디 받아오기
function getCallIdM(data){
	callIdM = data;
}

// 수신자 이름 받아오기
function getCallNameM(data){
	callNameM = data;
}
</script>
</body>
</html>