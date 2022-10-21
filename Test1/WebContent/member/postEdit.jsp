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
                    <!-- Naver SmartEditor 2.8.2를 사용하였습니다. -->
                    
				    <h3>Naver Smart Editor 2.0</h3>
				    <form action="insertStudentInfoForm" method="post">
				      <div id="smarteditor">
				        <textarea name="editorTxt" id="editorTxt" 
				                  rows="20" cols="10" 
				                  placeholder="내용을 입력해주세요"
				                  style="width: 500px"></textarea>
				      </div>
				      <input type="button" value ="내용콘솔에" onclick="submitPost()"/>
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
	      console.log("Naver SmartEditor")
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
	    
	    
	    /* 버튼 클릭 이벤트 */
	    submitPost = function() {
		  oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", [])
		  let content = document.getElementById("editorTxt").value
		
		  if(content == '') {
		    alert("내용을 입력해주세요.")
		    oEditors.getById["editorTxt"].exec("FOCUS")
		    return
		  } else {
		    console.log(content)
		  }
		}
	    
	  </script>
     
    </body>
</html>
