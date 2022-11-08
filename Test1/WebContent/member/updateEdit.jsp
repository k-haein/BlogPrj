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
                <a class="navbar-brand" href="#!">N Blog - 게시글 수정</a>
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
                    <!-- Naver SmartEditor 2.8.2를 사용하였습니다. -->
                    <!-- 파일 전송을 위해 encType = "multipart/form-data" -->
				    <form action="insertStudentInfoForm" id="form"  enctype="multipart/form-data" method="post">
				    	<!-- 제목 -->
				    	
				      <input type="text" placeholder="제목을 입력하세요" id="title" style='width: 600px' value='${postinfo.POST_TITLE}' >
				      
				      <div id="smarteditor">
				      <!-- 우선 멤버와 썸네일은 정적으로 데이터를 넣어둠.-->
				        <textarea name="editorTxt" id="editorTxt" 
				                  rows="20" cols="10" 
				                  placeholder="내용을 입력하세요"
				                  style='width: 600px'>${postinfo.POST_CONTENT}</textarea>
				                  
				      </div>
				      <img id="preview" src="../resources/img/thumbnail/${postinfo.POST_THUMBNAIL}" alt="image" style="width:100px" />
				      <input type="file" name="fileName" id='fileName' onchange="readURL(this);">
				      <!-- 파일쪽엔 기본경로 불가(https://okky.kr/articles/260830) -->
				      
				     <input type='hidden' id='postno' value='${postinfo.POST_NO}' >
				      <input type="button" value ="저장" onclick="submitPost()"/>
				    </form>
              <!-- 포스트 추가하는 곳-->
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
	     
	     /* 에디터 설정 */
	    let oEditors = [];
	
	    smartEditor = function() {
	      nhn.husky.EZCreator.createInIFrame({
	        oAppRef: oEditors,
	        elPlaceHolder: "editorTxt",
	        sSkinURI: "../resources/static/smarteditor/SmartEditor2Skin.html",
	        fCreator: "createSEditor2"
	      })
	    }
	
	    $(document).ready(function() {
	      smartEditor()
	    })
	    
	    
	    
	    //첨부한 파일 내용 전역변수로 가지고 있기
	    let fileObject = null;
	    //파일 선택 시 파일 내용 변수에 넣기
 	    $(document).ready(function() {
			$("#fileName").bind('change', function() {
				fileObject = this.files;
				//this.files[0].size gets the size of your file.
				//alert(this.files[0].size);
			});
		}); 
	    
 	   
	    /* 버튼 클릭 이벤트 */
	    function submitPost(){
	    	console.log(fileCheck);
		  oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
		  //content Text 가져오기
		  let content = document.getElementById("editorTxt").value;
		
		  if(content == '<p>&nbsp;</p>') { //비어있는 경우
		    alert("내용을 입력해주세요.")
		    oEditors.getById["editorTxt"].exec("FOCUS")
		    return;
		  } else {
			 
				// 등록할 파일 리스트를 formData로 데이터 입력
				var form = $('#form');
				var formData = new FormData(form[0]);
				
				//파일을 새로 첨부한 경우에만 파일명을 컨트롤러에 보내준다.
			 	   var fileCheck = $("#fileName").val();
					if(fileCheck != ''){ //파일 첨부를 했을경우에만
					formData.append('files',fileObject[0]);
					}else{
						console.log("사진파일 변경이 없으므로 기존 썸네일을 유지합니다.")
					}
					
					formData.append('title', $("#title")[0].value);

					console.log($("#title")[0].value)
					formData.append('content', content);
					formData.append('postno', $("#postno")[0].value);
			
			
			 
			 
			 if(confirm('게시글을 수정하시겠습니까?')){
			 
			    //ajax 통신으로 서버로 보내 데이터 저장함
			    $.ajax({
		          url: "postUpdateAjax"
		          , data: formData
		          , type: 'POST'
		          , enctype : 'multipart/form-data'
		          , contentType : false //false 로 선언 시 content-type 헤더가 multipart/form-data로 전송되게 함
		          , processData : false //false로 선언 시 formData를 string으로 변환하지 않음
		          , success: function(data) {
		            console.log('success')
		            alert('저장되었습니다.')
		            location.href='./myBlogAction.me'
		          }
		          , error: function(jqXHR, textStatus, errorThrown) {
		            console.log(jqXHR)
		            alert('오류가 발생하였습니다.')
		          }
		        })
			}else{
				alert('취소되었습니다.');
			}
		  }
		}
	    
	    
	    /* 이미지 미리보기 */
	    function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function (e) {
		      $('#preview')
		      .attr('src', e.target.result);
		    };
		    reader.readAsDataURL(input.files[0]);
		  }
		}
	    
	    
	  </script>
     
    </body>
</html>
