<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Enroll Form</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style>
/* ==========페이지영역========== */
.outer {
	padding-left: 320px;
	float: left;
	width: 100%;
	min-height: 100%;
	background-color: rgba(224, 224, 224, 0.12);
}

.topBar {
	background-color: rgba(22, 160, 133, 0.39);
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
.subMenuArea {
	background-color: white;
	width: 100%;
	height: 70px;
}

#subMenuList {
	margin: 0;
	list-style: none;
	padding-left: 0;
}

#subMenuList li {
	margin-top: 10px;
	margin-left: 20px;
	float: left;
	text-decoration-style: none;
}
/* 서브메뉴바 영역 */

/* 서브메뉴바 메뉴버튼(기본) */
.subBtn {
	border: 0;
	width: 150px;
	height: 50px;
	font-size: 19px;
	color: rgb(127, 127, 127);
	background-color: white;
	border-radius: 25px;
}

.subBtn:hover {
	cursor: pointer;
}
/* 서브메뉴바 메뉴버튼(기본) */
/* 서브메뉴바 메뉴버튼(현재페이지일때) */
.subActive {
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
#noticeDetail, #boardDetail {
	padding-top: 20px;
    padding-left: 30px;
	background: white;
	width: 1300px;
	height: 600px;
	border-collapse: separate;
    border-spacing: 0 20px;
    font-size:18px;
}

/* input창 스타일(가로크기는 자유) */
.inputs {
	height: 30px;
	border: 1px solid lightgray;
	border-radius: 3px;
	width:1065px;
}
/* input창 스타일 */

/* textarea스타일 */
.textArea {
	border: 1px solid lightgray;
	border-radius: 3px;
	resize: none;
}
/* textarea스타일 */



/* 큰버튼 스타일 */
.bigBtn {
	width: 140px;
	height: 40px;
	border: 0px;
	border-radius: 5px;
	background: rgb(190, 190, 190);
	color: white;
	font-size: 18px;
}

.bigBtn:hover {
	cursor: pointer;
}
/* 큰버튼 스타일 */
#btnArea {
	margin-left: 420px;
	width: 500px;
	display: flex;
	justify-content: center;
	align-items: center;
}

#btnArea button {
	display: inline-block;
	margin: 5px;
}

/* 파일 첨부 관련 */
 .upload-btn-wrapper {
    position: relative;
    overflow: hidden;
    display: inline-block;
}
        
.upload-btn {
    border: 2px solid gray;
    color: gray;
    background-color: white;
    padding: 8px 20px;
    border-radius: 8px;
    font-size: 20px;
    font-weight: bold;
}
        
.upload-btn-wrapper input[type=file] {
    font-size: 100px;
    position: absolute;
    left: 0;
    top: 0;
    opacity: 0;
}
        
#fileDragDesc {
    margin-top:40px;
    vertical-align:middle;
    text-align: center; 
    color:lightgray;
    font-size:16px;
}

#deleteBtn{
	width: 20px;
	height: 20px;
	border-radius: 50%;
	color: rgb(190, 190, 190);
	display: inline-block;
	vertical-align: sub;
}

#deleteBtn:hover{
	cursor:pointer;
	color:rgb(243, 156, 18);
}

</style>
</head>
<body>
	<!-- 이곳에 메뉴바 include -->
	<jsp:include page="../common/menubar.jsp" />
	<!-- 이곳에 메뉴바 include -->

	<div class="outer">
		<div class="topBar">
			<!-- 메뉴명 -->
			<span>사내게시판</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
				<li><button class="subBtn subActive">사내게시판</button></li>
			</ul>
		</div>
		<div class="contentArea">
			<h4 style="margin-left: 1180px;">사내게시판 작성</h4>
			<form name="uploadForm" id="uploadForm" enctype="multipart/form-data" method="get">
			<!-- <form name="boardEnroll" action="enroll.bo" method="get"> -->
				<table id="boardDetail">
					<tr>
						<th colspan="2" style="text-align:left;">글제목</th>
						<td colsapn="6"><input name="boardTitle" class="inputs" type="text" value="${b.boardTitle}"></td>
					</tr>
					<tr>
						<th colspan="2" style="text-align:left;">첨부파일</th>
						<td colspan="6">
							<button type="button" class="bigBtn fileShow">추가</button>
							<c:if test="${b.boardFileFlag eq 'Y' }">
								※현재 파일 <span><b>${fn:length(btList)}</b></span>개
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="8">
									<div class="fileWrap" style="display:none;">
									<div class="upload-btn-wrapper">
										<input type="file" id="input_file" multiple="multiple" style="height: 100%;" />
										<button class="upload-btn fileShow">파일선택</button>
									</div>
							        <div id="dropZone" style="width: 1140px; height: 100px; border: 1px solid lightgray;">
							            <div id="fileDragDesc"> ※파일을 드래그 해주세요. </div>
							            <table id="fileListTable" width="100%" border="0px">
							                <tbody id="fileTableTbody">
							                	
							                </tbody>
							            </table>
							        </div>
							        <input type="hidden" id="bff" name="boardFileFlag" value="${b.boardFileFlag }">
							        <input type="hidden" id="fileListSize" name="fileListSize" value="${fn:length(btList)}">
							        <div class="fileNameList" style="display:none;">
							        	<table class="fnoTable" border="1">
							        	<tr>
							        	<c:forEach items="${ btList }" var="bt">
							        		<td><input type="hidden" name="fno" value="${bt.attachmentNo}">${bt.attachmentNo}</td>
							        	</c:forEach>
							        	</tr>
							        	</table>
							        </div>
						</td>
					</tr>
					
					<tr>
						<td colspan="8" rowspan="20">
							<textarea name="boardContent" class="textArea" cols="160" rows="25" value="">${b.boardContent }</textarea>
						</td>
					</tr>
				</table>
				<input type="hidden" name="boardWriter" value="${ loginUser.empName }">
				<input type="hidden" name="empId" value="${ loginUser.empId }">
				<input type="hidden" id="boardNo" name="boardNo" value="${b.boardNo }">
				<div class="ffnos" style="display:none;">
				<c:forEach items="${ btList }" var="bt">
					<input type="file" id="ffno" name="ffno" value="">
				</c:forEach>
				</div>
			</form>
			<br>
			<div id="btnArea">
				<c:choose>
					<c:when test="${empty b }">
						<button id="submitBoard" class="bigBtn" onclick="uploadFile();" style="background: rgb(26, 188, 156);">등록</button>
					</c:when>
					<c:otherwise>
						<button id="submitBoard" class="bigBtn" onclick="updateLoadFile();" style="background: rgb(26, 188, 156);">수정</button>
					</c:otherwise>
				</c:choose>
				<button class="bigBtn">취소</button>
			</div>
			<br> <br><br>
		</div>
	</div>
	
	<script>

		/* $("#submitBoard").click(function(){
			$("form[name=boardEnroll]").submit();
		}); */
		
	     $(document).ready(function() {
             $("#input_file").bind('change', function() {
                 selectFile(this.files);
                 //this.files[0].size gets the size of your file.
                 //alert(this.files[0].size);
             });
           var bno = $("#boardNo").val();
           var fl = $("#bff").val();
           var flsize = $("#fileListSize").val();
           var fno = new Array();
           var fname = 1;
           var fileNum = 0;
           
           
           
           if(fl == 'Y'){
        	   for (var i = 0; i < flsize; i++) {
        		   
				   fno[i] = $(".fnoTable tr td:nth-child("+ fname +")").find('input').val();
				   fname = fname + 1;
        		   $.ajax({
                       url : "nowFile.bo",
                       traditional : true,
                       data : {fno:fno[i]},
                       type : 'POST',
                       success : function(result) {
                    	   
                    	   var fileSizeKb = result.boardFileSize / 1024;
                           var fileSizeMb = fileSizeKb / 1024;
                    	   var nowfileSizeStr = "";
                           if ((1024*1024) <= result.boardFileSize) {    // 파일 용량이 1메가 이상인 경우 
                               console.log("fileSizeMb="+fileSizeMb.toFixed(2));
                               nowfileSizeStr = fileSizeMb.toFixed(2) + " Mb";
                           } else if ((1024) <= result.boardFileSize) {
                               console.log("fileSizeKb="+parseInt(fileSizeKb));
                               nowfileSizeStr = parseInt(fileSizeKb) + " kb";
                           } else {
                               console.log("fileSize="+parseInt(fileSize));
                               nowfileSizeStr = parseInt(fileSize) + " byte";
                           }
                           
                    	   var html = "";
                           html += "<tr id='nowfileTr_" + fileNum + "'>";
                           html += "    <td id='dropZone' class='left' >";
                           html += result.originName + " (" + nowfileSizeStr +") " 
                                   + "<span id='deleteBtn' class='material-icons' onclick='deleteFile(" + fileNum + "); return false;'>highlight_off</span>"
                           html += "    </td>"
                           html += "</tr>"
               
                           $('#fileTableTbody').append(html);
                    	   $("#fileDragDesc").hide(); 
                           $("#fileListTable").show();
                           
                           fileNum = fileNum + 1;
                       },error:function(){	// error : ajax 통신실패시 처리할 함수 지정
    	 					console.log("ajax 통신 실패!");
    	 			   }
                   });
               }
           }
             
         });
	     
	     $(document).ready(function() {
				$(".fileShow").click(function(e) {
					e.preventDefault();
					if($(".fileWrap").is(":visible")){
						$(".fileWrap").slideUp(100);
					}else {
						$(".fileWrap").slideDown(100);
					}
				});
		 });
         // 파일 리스트 번호
         var fileIndex = 0;
         // 등록할 전체 파일 사이즈
         var totalFileSize = 0;
         // 파일 리스트
         var fileList = new Array();
         // 파일 사이즈 리스트
         var fileSizeList = new Array();
         // 등록 가능한 파일 사이즈 MB
         var uploadSize = 50;
         // 등록 가능한 총 파일 사이즈 MB
         var maxUploadSize = 500;
 
         $(function() {
             // 파일 드롭 다운
             fileDropDown();
         });
 
         // 파일 드롭 다운
         function fileDropDown() {
             var dropZone = $("#dropZone");
             //Drag기능 
             dropZone.on('dragenter', function(e) {
                 e.stopPropagation();
                 e.preventDefault();
                 // 드롭다운 영역 css
                 dropZone.css('background-color', '#E3F2FC');
             });
             dropZone.on('dragleave', function(e) {
                 e.stopPropagation();
                 e.preventDefault();
                 // 드롭다운 영역 css
                 dropZone.css('background-color', '#FFFFFF');
             });
             dropZone.on('dragover', function(e) {
                 e.stopPropagation();
                 e.preventDefault();
                 // 드롭다운 영역 css
                 dropZone.css('background-color', '#E3F2FC');
             });
             dropZone.on('drop', function(e) {
                 e.preventDefault();
                 // 드롭다운 영역 css
                 dropZone.css('background-color', '#FFFFFF');
 
                 var files = e.originalEvent.dataTransfer.files;
                 if (files != null) {
                     if (files.length < 1) {
                         /* alert("폴더 업로드 불가"); */
                         console.log("폴더 업로드 불가");
                         return;
                     } else {
                         selectFile(files)
                     }
                 } else {
                     alert("ERROR");
                 }
             });
         }
 
         // 파일 선택시
         function selectFile(fileObject) {
             var files = null;
 			 console.log(fileObject);
             if (fileObject != null) {
                 // 파일  등록시
                 files = fileObject;
                 console.log(files);
             }
 
             // 다중파일 등록
             if (files != null) {
                 
                 if (files != null && files.length > 0) {
                     $("#fileDragDesc").hide(); 
                     $("fileListTable").show();
                 } else {
                     $("#fileDragDesc").show(); 
                     $("fileListTable").hide();
                 }
                 
                 for (var i = 0; i < files.length; i++) {
                     // 파일 이름
                     var fileName = files[i].name;
                     var fileNameArr = fileName.split("\.");
                     // 확장자
                     var ext = fileNameArr[fileNameArr.length - 1];
                     
                     var fileSize = files[i].size; // 파일 사이즈(단위 :byte)
                     console.log("fileSize="+fileSize);
                     if (fileSize <= 0) {
                         console.log("0kb file return");
                         return;
                     }
                     
                     var fileSizeKb = fileSize / 1024;
                     var fileSizeMb = fileSizeKb / 1024;
                     
                     var fileSizeStr = "";
                     if ((1024*1024) <= fileSize) {    // 파일 용량이 1메가 이상인 경우 
                         console.log("fileSizeMb="+fileSizeMb.toFixed(2));
                         fileSizeStr = fileSizeMb.toFixed(2) + " Mb";
                     } else if ((1024) <= fileSize) {
                         console.log("fileSizeKb="+parseInt(fileSizeKb));
                         fileSizeStr = parseInt(fileSizeKb) + " kb";
                     } else {
                         console.log("fileSize="+parseInt(fileSize));
                         fileSizeStr = parseInt(fileSize) + " byte";
                     }
 
                     /* if ($.inArray(ext, [ 'exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml' ]) >= 0) {
                         // 확장자 체크
                         alert("등록 불가 확장자");
                         break; */
                     if ($.inArray(ext, [ 'hwp', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'pdf','PNG', 'png', 'jpeg', 'gif', 'zip' ]) <= 0) {
                         // 확장자 체크
                         /* alert("등록이 불가능한 파일 입니다.");
                         break; */
                         alert("등록이 불가능한 파일 입니다.("+fileName+")");
                     } else if (fileSizeMb > uploadSize) {
                         // 파일 사이즈 체크
                         alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
                         break;
                     } else {
                         // 전체 파일 사이즈
                         totalFileSize += fileSizeMb;
 
                         // 파일 배열에 넣기
                         fileList[fileIndex] = files[i];
 
                         // 파일 사이즈 배열에 넣기
                         fileSizeList[fileIndex] = fileSizeMb;
 
                         // 업로드 파일 목록 생성
                         addFileList(fileIndex, fileName, fileSizeStr);
 
                         // 파일 번호 증가
                         fileIndex++;
                     }
                 }
             } else {
                 alert("ERROR");
             }
         }
         
         // 업로드 파일 목록 생성
         function addFileList(fIndex, fileName, fileSizeStr) {
             /* if (fileSize.match("^0")) {
                 alert("start 0");
             } */
 
             var html = "";
             html += "<tr id='fileTr_" + fIndex + "'>";
             html += "    <td id='dropZone' class='left' >";
             html += fileName + " (" + fileSizeStr +") " 
                     //+ "<a href='#' onclick='deleteFile(" + fIndex + "); return false;' class='btn small bg_02'> 삭제</a>"
                     + "<span id='deleteBtn' class='material-icons' onclick='deleteFile(" + fIndex + "); return false;'>highlight_off</span>"
             html += "    </td>"
             html += "</tr>"
 
             $('#fileTableTbody').append(html);
         }
 
         // 업로드 파일 삭제
         function deleteFile(fIndex) {
             console.log("deleteFile.fIndex=" + fIndex);
             // 전체 파일 사이즈 수정
             totalFileSize -= fileSizeList[fIndex];
 
             // 파일 배열에서 삭제
             delete fileList[fIndex];
 
             // 파일 사이즈 배열 삭제
             delete fileSizeList[fIndex];
 
             // 업로드 파일 테이블 목록에서 삭제
             $("#fileTr_" + fIndex).remove();
             
             console.log("totalFileSize="+totalFileSize);
             
             if (totalFileSize > 0) {
                 $("#fileDragDesc").hide(); 
                 $("fileListTable").show();
             } else {
                 $("#fileDragDesc").show(); 
                 $("fileListTable").hide();
             }
         }
 
         // 파일 등록
         function uploadFile() {
             // 등록할 파일 리스트
             var uploadFileList = Object.keys(fileList);
             	
                var form = $('#uploadForm');
                console.log(form[0]);
                var formData = new FormData(form[0]);
                formData.append('boardTitle', form[0].boardTitle.innerText);
                formData.append('boardContent', form[0].boardContent.innerText);
                formData.append('boardWriter', form[0].boardWriter.innerText);
                formData.append('empId', form[0].boardWriter.innerText);
                for (var i = 0; i < uploadFileList.length; i++) {
                    formData.append('files', fileList[uploadFileList[i]]);
                }
                /* console.log(formData.getAll('boardTitle'));
                console.log(formData.getAll('boardContent'));
                console.log(formData.getAll('boardWriter'));
                console.log(formData.getAll('empId'));
                console.log(formData.getAll('files')); */
                
                $.ajax({
                    url : "insert.bo",
                    data : formData,
                    type : 'POST',
                    enctype : 'multipart/form-data',
                    processData : false,
                    contentType : false,
                    dataType : 'json',
                    cache : false,
                    success : function(result) {
                        if (result >= 1) {
                            alert("게시글이 등록되었습니다.");
                            location.href="list.bo?currentPage=1";
                        } else {
                            alert("게시글 등록에 실패하였습니다.");
                            location.href="list.bo?currentPage=1";
                        }
                        
                    },
                    error:function(){	// error : ajax 통신실패시 처리할 함수 지정
	 					console.log("ajax 통신 실패!");
	 				},
	 				complete:function(){// complete : ajax 통신 성공여부와 상관없이 실행
	 					console.log("무조건 호출!!");
	 				}
                });
         }
		 
         
         
         function updateLoadFile() { // 수정
             // 등록할 파일 리스트
              var uploadFileList = Object.keys(fileList);
             	
                var form = $('#uploadForm');
                console.log(form[0]);
                var formData = new FormData(form[0]);
                formData.append('boardTitle', form[0].boardTitle.innerText);
                formData.append('boardContent', form[0].boardContent.innerText);
                formData.append('boardWriter', form[0].boardWriter.innerText);
                formData.append('empId', form[0].boardWriter.innerText);
                formData.append('boardNo', form[0].boardNo.innerText);
                for (var i = 0; i < uploadFileList.length; i++) {
                    formData.append('files', fileList[uploadFileList[i]]);
                }
                
                $.ajax({
                    url : "realUpdate.bo",
                    data : formData,
                    type : 'POST',
                    enctype : 'multipart/form-data',
                    processData : false,
                    contentType : false,
                    dataType : 'json',
                    cache : false,
                    success : function(result) {
                        if (result >= 1) {
                            alert("게시글이수정되었습니다.");
                            location.href="list.bo?currentPage=1";
                        } else {
                            alert("게시글 수정에 실패하였습니다.");
                            location.href="list.bo?currentPage=1";
                        }
                        
                    },
                    error:function(){	// error : ajax 통신실패시 처리할 함수 지정
	 					console.log("ajax 통신 실패!");
	 				},
	 				complete:function(){// complete : ajax 통신 성공여부와 상관없이 실행
	 					console.log("무조건 호출!!");
	 				}
                });
         }
         
	</script>
</body>
</html>