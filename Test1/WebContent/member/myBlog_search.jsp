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
        <title>myBlog</title>
        <!-- Favicon-->
      <!--   <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />  -->
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/mainPage.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">N Blog</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="postListAction.me">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="../index.html">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="../index.html#contact">Contact</a></li>
                        <li class="nav-item"><a class="nav-link active" href="myBlogAction.me?id=${sessionScope.id}">MyBlog</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- 블로그 헤더 및 블로그 배경화면 -->
        <header class="py-5 bg-light border-bottom mb-4" style="background-image: url('https://www.urbanbrush.net/web/wp-content/uploads/edd/2022/01/urbanbrush-20220105101328484351.jpg')">
            <div class="container">
                <div class="text-center my-5">
                    <h1 class="fw-bolder"> 검색결과를 확인합니다.</h1>
                    <p class="lead mb-0">내 게시글을 검색합니다.</p>
                </div>
            </div>
        </header>
        <!-- Page content-->
        <div class="container">
       
            <div class="row">
            <!-- 왼쪽 블로그 소개 위젯-->
                <div class="col-lg-3">
                <!-- Side widget-->
                    <div class="card mb-4">
                    	<img class="card-img-top" src="../resources/img/blog/${mySearchList[0].MEM_PIC}" alt="..." />
                        <div class="card-header">${mySearchList[0].MEM_ID}</div>
                        <div class="card-body">블로그 소개글 쓰는 곳.맛집을 좋아하는 ㅇㅇ의 블로그입니다! 이미지는 일단 고정으로 박아뒀지롱...</div>
                    </div>
                    <!-- Categories widget-->
                    <div class="card mb-4">
                        <div class="card-header">카테고리</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="myBlogAction.me?id=${sessionScope.id}">내 블로그</a></li>
                                        <li><a href="myBlogAction.me?id=${sessionScope.id}">오늘 ??명 방문 ></a></li>
                                        <li></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="postInsert.me">새 게시물 작성</a></li>
                                        <li><a href="logout">로그아웃</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 오른쪽 Blog 게시글 내용-->
                <div class="col-lg-9">
                  <form method="get" action="searchWordMyAction.me">
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
                        <c:forEach var="mySearchList" items="${mySearchList}">
                    <!-- Featured blog post -->
                    <div class="card mb-4">
                        <div class="card-body">
                           <a href="#!"><img class="card-img-top" src="../resources/img/thumbnail/${mySearchList.POST_THUMBNAIL}" alt="..." /></a>
                          
                          <div class="small text-muted">${mySearchList.POST_UPLOADTIME} / 조회수 : ${mySearchList.visit_cnt}</div>
                            <h2 class="card-title">${mySearchList.POST_TITLE} -----  ${mySearchList.MEM_NO}</h2>
                            <p class="card-text"> ${mySearchList.POST_CONTENT} </p>
                            <a class="btn btn-primary" href="postViewAction.me?&postno=${mySearchList.POST_NO}">Read more →</a>
                        </div>
                    </div>
                    </c:forEach>

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
    </body>
</html>
