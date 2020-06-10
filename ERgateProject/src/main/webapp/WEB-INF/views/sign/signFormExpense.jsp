<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign form expense</title>
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
/* 중간버튼 스타일 */
.middleBtn {
	width: 90px;
	height: 35px;
	border: 0px;
	border-radius: 5px;
	background: rgb(26, 188, 156); /* 회색 : rgb(190, 190, 190) */
	color: white;
	font-size: 15px;
}

.middleBtn:hover {
	cursor: pointer;
}
/* 중간버튼 스타일 */
/* 큰버튼 스타일 */
.bigBtn {
	width: 140px;
	height: 40px;
	border: 0px;
	border-radius: 5px;
	background: rgb(26, 188, 156); /* 회색 : rgb(190, 190, 190) */
	color: white;
	font-size: 18px;
	margin-right: 5px;
}

.bigBtn:hover {
	cursor: pointer;
}
/* 큰버튼 스타일 */
#btnArea {
	margin-left: 910px;
}

/* 테이블스타일 */
#signInfo1 {
	width: 1200px;
	height: 100px;
	border-width: 1px 0;
	border-collapse: collapse;
	text-align: center;
	font-size: 16px;
}

#signInfo1 th {
	background-color: #EAEAEA;
	border: 1px solid lightgray;
	height: 35px;
}

#signInfo1 td {
	border: 1px solid lightgray;
	height: 35px;
}

#signInfo2 {
	width: 1200px;
	height: 175px;
	border-width: 1px 0;
	border-collapse: collapse;
	text-align: center;
	font-size: 16px;
	border-width: 1px 0;
}

#signInfo2 th {
	background-color: #EAEAEA;
	border: 1px solid lightgray;
	height: 35px;
}

#signInfo2 td {
	border: 1px solid lightgray;
	position: relative;
}

.circle {
	color: rgb(231, 76, 60);
	font-size: 80px;
	display: inline-block;
	position: relative;
	bottom: 120px;
	opacity: 70%;
}

h2, h3 {
	margin: 0;
	padding: 0;
}

#checkArea {
	width: 1200px;
	border-width: 1px 0;
	border-collapse: collapse;
	text-align: center;
	font-size: 16px;
}

/* input창 스타일(가로크기는 자유) */
.inputs {
	height: 30px;
	border: 1px solid lightgray;
	border-radius: 3px;
}
/* input창 스타일 */

/* textarea스타일 */
.textArea {
	border: 1px solid lightgray;
	border-radius: 3px;
	resize: none;
}

#signInfo3 {
	width: 700px;
	height: 100px;
	border-width: 1px 0;
	border-collapse: collapse;
	text-align: center;
	font-size: 18px;
	border-collapse: separate;
	border-spacing: 0 10px;
}

/* textarea스타일 */

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
	margin-top: 40px;
	vertical-align: middle;
	text-align: center;
	color: lightgray;
	font-size: 16px;
}

#deleteBtn {
	width: 20px;
	height: 20px;
	border-radius: 50%;
	color: rgb(190, 190, 190);
	display: inline-block;
	vertical-align: sub;
}

#deleteBtn:hover {
	cursor: pointer;
	color: rgb(243, 156, 18);
}

#contentTable {
	width: 1200px;
	border-width: 1px 0;
	border-collapse: collapse;
	text-align: center;
	font-size: 16px;
	margin-bottom: 100px;
}

#contentTable th {
	background-color: #EAEAEA;
	border: 1px solid lightgray;
	height: 35px;
}

#contentTable td {
	border: 1px solid lightgray;
	position: relative;
}

#contentTable input {
	width: 96%;
	height: 35px;
	border: 1px solid white;
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
			<span>전자결재</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
				<li><button class="subBtn"
						onclick="location.href='waitingList.si';">결재대기함</button></li>
				<li><button class="subBtn"
						onclick="location.href='ongoingList.si';">진행결재함</button></li>
				<li><button class="subBtn subActive"
						onclick="location.href='reportList.si';">상신내역</button></li>
				<li><button class="subBtn"
						onclick="location.href='expenseList.si';">지출결의내역</button></li>
				<li><button class="subBtn">외근&휴가내역</button></li>
			</ul>
		</div>
		<div class="contentArea">
			<!-- 내용 작성 영역 입니다-->
			<h1>지출결의서</h1>
			<div id="btnArea">
				<button type="button" class="bigBtn"
					style="background: rgb(190, 190, 190);">임시저장</button>
				<button type="button" class="bigBtn" id="signSubmit"
					onclick="uploadFile();">기안등록</button>
			</div>
			<br>
			<form id="signForm" name="signForm" enctype="multipart/form-data"
				method="get">
				<input type="hidden" name="signTypeNo" value="0"> <input
					type="hidden" name="signTypeName" value="지출결의서"> <input
					type="hidden" name="empId" value="${loginUser.empId }"> <input
					type="hidden" name="empName" value="${loginUser.empName }">
				<input type="hidden" name="deptTitle"
					value="${loginUser.deptTitle }"> <input type="hidden"
					name="documentNo" value="${documentNo }">
				<table id="signInfo1">
					<tr>
						<th>기안부서</th>
						<td width="400">${loginUser.deptTitle }</td>
						<th>문서분류</th>
						<td width="400">지출결의서</td>
					</tr>
					<tr>
						<th>기안자</th>
						<td>${loginUser.empName }</td>
						<th>문서번호</th>
						<td>${documentNo}</td>
					</tr>
					<tr>
						<th>기안일시</th>
						<td><p id="toDate"></p></td>
						<th>지출기간</th>
						<td><input class="inputs" name="expenseStartDate" type="date"
							required> ~ <input name="expenseEndDate" class="inputs"
							type="date" required></td>
					</tr>
				</table>
				<br>
				<table id="signInfo2">
					<tr>
						<th rowspan="2" width="120">결재라인
							<button type="button" class="middleBtn"
								style="width: 120px; margin-top: 10px;"
								onclick="window.open('openSigner.si','signApproval','_blank');">결재라인추가</button>
						</th>
						<th id="j1"></th>
						<th id="j2"></th>
						<th id="j3"></th>
						<th id="j4"></th>
						<th id="j5"></th>
						<th id="j6"></th>
					</tr>
					<tr>
						<td width="150" id="ttt"><h2>1</h2>
							<h3 id="n1"></h3></td>
						<td width="150"><h2>2</h2>
							<h3 id="n2"></h3></td>
						<td width="150"><h2>3</h2>
							<h3 id="n3"></h3></td>
						<td width="150"><h2>4</h2>
							<h3 id="n4"></h3></td>
						<td width="150"><h2>5</h2>
							<h3 id="n5"></h3></td>
						<td width="150"><h2>6</h2>
							<h3 id="n6"></h3></td>
					</tr>
					<tr>
						<th>수신참조</th>
						<td id="refArea" colspan="6" align="left"></td>
					</tr>
				</table>


				<table id="signInfo3">
					<thead>
						<tr>
							<th width="120">제목</th>
							<td><input name="signTitle" class="inputs" type="text"
								style="width: 100%;" required></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td colspan="6"><button type="button"
									class="bigBtn fileShow" align="left"
									style="margin-right: 440px; background: rgb(190, 190, 190);">추가</button></td>
						</tr>
						<tr>
							<td colspan="8">
								<div class="fileWrap" style="display: none;">
									<div class="upload-btn-wrapper">
										<input type="file" id="input_file" multiple="multiple"
											style="height: 100%;" />
										<button class="upload-btn fileShow"
											style="margin-right: 570px;">파일선택</button>
									</div>
									<div id="dropZone"
										style="width: 700px; height: 100px; border: 1px solid lightgray; text-align: left;">
										<div id="fileDragDesc">※파일을 드래그 해주세요.</div>
										<table id="fileListTable" width="100%" border="0px">
											<tbody id="fileTableTbody">
											</tbody>
										</table>
									</div>
							</td>
						</tr>
						<tr>
							<td colspan="8"></td>
						</tr>
					</thead>
				</table>
				<button id="addTr" type="button" class="middleBtn"
					style="background: orange; width: 120px; margin-top: 10px;">행
					추가</button>
				<button id="delTr" type="button" class="middleBtn"
					style="background: rgb(190, 190, 190); width: 120px; margin-top: 10px;">행
					삭제</button>
				<br> <br> 
				<!-- <input type="hidden" name="signContent"> -->
				<table id="contentTable">
					<thead>
						<tr>
							<th width="150">사용일시</th>
							<th width="280">사용처</th>
							<th>지출사유</th>
							<th width="150">사용금액(원)</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input class="inputVal" type="text"></td>
							<td><input class="inputVal" type="text"></td>
							<td><input class="inputVal" type="text"></td>
							<td><input class="inputVal" type="text"></td>
						</tr>
					</tbody>
				</table>

			</form>
		</div>
	</div>

	<script>
		
		
	
		/* function openApproval(){
			childWin = window.open('openSigner.si','signApproval','_blank');
		} */
		var signerId = new Array();
		var signerName = new Array();
		
		// 결재자아이디 받아오기
		function getSid(data){
			signerId = data;
		}
		
		// 결재자이름 받아오기
		function getSname(data){
			signerName = data;
		}
		
		var refId = new Array();
		var refName = new Array();
		
		// 수신자 아이디 받아오기
		function getRefId(data){
			refId = data;
		}
		
		// 수신자 이름 받아오기
		function getRefName(data){
			refName = data;
		}
		
		
		//오늘날짜 표시
		$(document).ready(function(){
			var n =  new Date();
			var y = n.getFullYear();
			var m = n.getMonth() + 1;
			var d = n.getDate();
			
			$("#toDate").text(y+"/"+m+"/"+d);
			
		});
		
		
	</script>
	<script>
	
	
	//테이블 행추가
	$("#addTr").click(function(){
		$("#contentTable tbody:last").append('<tr><td><input class="inputVal" type="text"></td><td><input class="inputVal" type="text"></td><td><input class="inputVal" type="text"></td><td><input class="inputVal" type="text"></td></tr>');
	});
	
	//테이블 행삭제
	$("#delTr").click(function(){
		$('#contentTable tbody tr:last').remove();
	});
	
	//테이블input 값 입력시 input value에 값 입력
	$(document).on("keyup",".inputVal",function(){
		var index = $(".inputVal").index(this);
		var inputVal = $(".inputVal:eq("+index+")").val();		
		$(".inputVal:eq("+index+")").attr("value",inputVal);
		
	});

	//기안등록 눌렀을 시 처리되는 스크립트 
	/* $(document).on("click","#signSubmit",function(){
		//테이블에 입력된 값들 html로 묶어서 input태그에 전달
		
	}); */
	
	
    $(document).ready(function() {
        $("#input_file").bind('change', function() {
            selectFile(this.files);
            //this.files[0].size gets the size of your file.
            //alert(this.files[0].size);
        });
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
    };

    // 파일 선택시
    function selectFile(fileObject) {
        var files = null;

        if (fileObject != null) {
            // 파일  등록시
            files = fileObject;
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
                if ($.inArray(ext, [ 'hwp', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'pdf', 'jpeg', 'gif', 'zip' , 'jpg' , 'png' ]) <= 0) {
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
             }else {
            alert("ERROR");
        	 }
      
        };
    
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
    };

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
    };
	
    
    // 파일 등록
    function uploadFile() {
        
    	var contentTable = "<table id='contentTable'>" + $("#contentTable").html() + "</table>";
		 //$("input[name=contentTable]").attr("value",contentTable);
		 
    	// 등록할 파일 리스트
        
        
        var uploadFileList = Object.keys(fileList);
        	
           var form = $('#signForm');
           console.log(form[0]);
           var formData = new FormData(form[0]);
           formData.append('documentNo', form[0].documentNo.innerText);
           formData.append('signTypeNo', form[0].signTypeNo.innerText);
           formData.append('empId', form[0].empId.innerText);
           formData.append('signTypeName', form[0].signTypeName.innerText);
           formData.append('empName', form[0].empName.innerText);
           formData.append('deptTitle', form[0].deptTitle.innerText);
           formData.append('signTitle', form[0].signTitle.innerText);
           formData.append('signContent', contentTable);
           formData.append('expenseStartDate', form[0].expenseStartDate.innerText);
           formData.append('expenseEndDate', form[0].expenseEndDate.innerText);
           formData.append('signerId',signerId);
           formData.append('signerName',signerName);
           formData.append('refId',refId);
           formData.append('refName',refName);
           for (var i = 0; i < uploadFileList.length; i++) {
               formData.append('files', fileList[uploadFileList[i]]);
           }
           //console.log(formData.getAll('documentNo'));
           //console.log(formData.getAll('signContent'));
           //console.log(formData.getAll('files'));
           
           $.ajax({
               url : "insertDoc.si",
               data : formData,
               type : 'POST',
               enctype : 'multipart/form-data',
               processData : false,
               contentType : false,
               dataType : 'json',
               cache : false,
               success : function(result) {
                   if (result>0) {
                       alert("기안서가 제출되었습니다.");
                       location.href="reportList.si?currentPage=1";	                       
                   } else {
                       alert("문서 등록에 실패했습니다. 다시 시도해주세요.");
                       location.reload();
                   }
                   
               },
               error:function(){	// error : ajax 통신실패시 처리할 함수 지정
					console.log("ajax 통신 실패!");
				}
           });
           
    };
	
	</script>
</body>
</html>