<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.MemberBean"%>
<%@ page import="java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 빨간줄 그어지는데 jstl 설치 안해서 그럼. lib에 넣어준다. jsp 확장태그로 c로 쓴다.-->


<!DOCTYPE html>
<html lang="en">
    <head>
    <!-- 참고 : https://beforb.tistory.com/53 -->
    <!-- 참고 : https://www.wrapuppro.com/programing/view/ZPLdxEBiyJG38IG -->
    <!-- 에디터 : Naver SmartEditor 2.0 -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>게시글 작성</title>
        <!-- 제이쿼리 -->
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <!-- Favicon-->
       <!-- <link rel="icon" type="image/x-icon" href="assets/favicon.ico" /> -->
        <!-- Core theme CSS (includes Bootstrap)-->
         <link href="../resources/css/mainPage.css" rel="stylesheet" />
      <script type="text/javascript" src="../resources/static/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>    </head>
    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#!">N Blog - 새 게시글 작성</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Blog</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page content-->
        <div class="container mt-5">
            <div class="row">
               
              <!-- 포스트 추가하는 곳-->
              
              <div class="upload-btn-wrapper">
				<input type="file" id="input_file" multiple="multiple" style="height: 100%;" />
				<button class="upload-btn">파일선택</button>
			</div>
			<br />

			<form name="uploadForm" id="uploadForm" enctype="multipart/form-data" method="post">
				<div id="dropZone" style="width: 500px; height: 300px; border-style: solid; border-color: black; ">
					<div id="fileDragDesc"> 파일을 드래그 해주세요. </div>
				
					<table id="fileListTable" width="100%" border="0px">
						<tbody id="fileTableTbody">
			
						</tbody>
					</table>
				</div>
			</form>
			<input type="button" onclick="uploadFile(); return false;" class="btn bg_01" value="파일 업로드">
            </div>
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
     <!--   <script src="js/scripts.js"></script>-->
	     <script>
	     $(document).ready(function() {
				$("#input_file").bind('change', function() {
					selectFile(this.files);
					//this.files[0].size gets the size of your file.
					//alert(this.files[0].size);
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


			// 파일 선택시
			function selectFile(fileObject) {
				var files = null;

				if (fileObject != null) {
					// 파일 Drag 이용하여 등록시
					files = fileObject;
				} else {
					// 직접 파일 등록시
					files = $('#multipaartFileList_' + fileIndex)[0].files;
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
						
						var fileSizeKb = fileSize / 1024; // 파일 사이즈(단위 :kb)
						var fileSizeMb = fileSizeKb / 1024;	// 파일 사이즈(단위 :Mb)
						
						var fileSizeStr = "";
						if ((1024*1024) <= fileSize) {	// 파일 용량이 1메가 이상인 경우 
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
						if ($.inArray(ext, [ 'hwp', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'png', 'pdf', 'jpg', 'jpeg', 'gif', 'zip' ]) <= 0) {
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
						
						+ "<input value='삭제' type='button' href='#' onclick='deleteFile(" + fIndex + "); return false;'>"
				html += "    </td>"
				html += "</tr>"

				$('#fileTableTbody').append(html);
			}


			// 파일 등록
			function uploadFile() {
				// 등록할 파일 리스트
				var uploadFileList = Object.keys(fileList);
				console.log("uploadFileList"+uploadFileList)
				if (confirm("등록 하시겠습니까?")) {
					// 등록할 파일 리스트를 formData로 데이터 입력
					var form = $('#uploadForm');
					var formData = new FormData(form[0]);
					for (var i = 0; i < uploadFileList.length; i++) {
						formData.append('files', fileList[uploadFileList[i]]);
						console.log(fileList)
						formData.append('title', '제목ajax 전달');
						formData.append('content', '내용 ajax 전달');
					}

					$.ajax({
						url : "postInsertAjax",
						data : formData,
						type : 'POST',
						enctype : 'multipart/form-data',
						processData : false,
						contentType : false,
						dataType : 'json',
						cache : false,
						success : function(result) {
							if (result.data.length > 0) {
								alert("성공");
								location.reload();
							} else {
								alert("실패");
								location.reload();
							}
						}
					});
				}
			}
	  </script>
     
    </body>
</html>
