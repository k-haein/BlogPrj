<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.MemberBean"%>
<%@ page import="java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 빨간줄 그어지는데 jstl 설치 안해서 그럼. lib에 넣어준다. jsp 확장태그로 c로 쓴다.-->


<!DOCTYPE html>
<html lang="ko">
    <head>
    <!-- 부트스트랩 출처 : https://startbootstrap.com/template/blog-home -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Blog Home</title>
        <!-- Favicon-->
      <!--   <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />  -->
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/mainPage.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#!">N Blog</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" href="myBlogAction.me?id=${sessionScope.id}">MyBlog</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page header with logo and tagline-->
        <header class="py-5 bg-light border-bottom mb-4">
            <div class="container">
                <div class="text-center my-5">
                    <h1 class="fw-bolder"> 검색결과를 확인합니다.</h1>
                    <p class="lead mb-0">내 게시글을 포함한 모든 포스팅을 검색합니다.</p>
                </div>
            </div>
        </header>
        <!-- Page content-->
        <div class="container">
            <div class="row">
                <!-- Blog entries-->
                <div class="col-lg-8">	 
                <br>
               <form method="get" action="searchWordAction.me">
                 <div class="input-group">
                       <select name="option">
						<option value="01" selected="selected">제목</option>
						<option value="02">내용</option>
						</select>
                        <input class="form-control" type="text" id="searchWord" name="searchWord" placeholder="검색어를 입력하세요" aria-label="Enter search term..." aria-describedby="button-search" />
                        <button class="btn btn-primary" id="button-search" type="submit">검색</button>
                 </div>
                </form>
	        	
	        	<br>
                  <c:forEach var="postSearchList" items="${postSearchList}">
                    <!-- Featured blog post -->
                    <div class="card mb-4">
                        <div class="card-body">
                           <a href="#!"><img class="card-img-top" src="../resources/img/thumbnail/${postSearchList.POST_THUMBNAIL}" alt="..." /></a>
                          
                          <div class="small text-muted">${postSearchList.POST_UPLOADTIME} / 조회수 : ${postSearchList.visit_cnt}</div>
                            <h2 class="card-title">${postSearchList.POST_TITLE} -----  ${postSearchList.MEM_NO}</h2>
                            <p class="card-text">${postSearchList.POST_CONTENT}</p>
                            <a class="btn btn-primary" href="postViewAction.me?postno=${postSearchList.POST_NO}">Read more →</a>
                        </div>
                    </div>
                    </c:forEach>
                    
                    <!-- Pagination-->
                    <nav aria-label="Pagination">
                        <hr class="my-0" />
                        <ul class="pagination justify-content-center my-4">
                            <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Newer</a></li>
                            <li class="page-item active" aria-current="page"><a class="page-link" href="#!">1</a></li>
                            <li class="page-item"><a class="page-link" href="#!">2</a></li>
                            <li class="page-item"><a class="page-link" href="#!">3</a></li>
                            <li class="page-item disabled"><a class="page-link" href="#!">...</a></li>
                            <li class="page-item"><a class="page-link" href="#!">15</a></li>
                            <li class="page-item"><a class="page-link" href="#!">Older</a></li>
                        </ul>
                    </nav>
                </div>
                <!-- Side widgets-->
                <div class="col-lg-4">
                <br>
                    <!-- Categories widget-->
                    <div class="card mb-4">
                        <div class="card-header">${sessionScope.id} 님</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a class="btn btn-primary" href="myBlogAction.me?id=${sessionScope.id}">내 블로그</a></li>
                                        <li><a href="myBlog.jsp">오늘 ??명 방문 ></a></li>
                                        <li></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a class="btn btn-primary" href="postInsert.me">새 게시물 작성</a></li>
                                        <li><a href="logout">로그아웃</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
       <!-- <script src="js/scripts.js"></script> -->
       
       <script>
       //여기서 ajax 통신으로 searchWord 를 찾는 구문을 만들어줄 것임.그러고 페이지 이동해서 다시 찾아줘야할듯?
    	//기회가 되면 기간 설정도 해보자.
       
       
       
       </script>
       
       
    </body>
</html>
