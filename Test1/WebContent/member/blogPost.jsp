<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.MemberBean"%>
<%@ page import="java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 빨간줄 그어지는데 jstl 설치 안해서 그럼. lib에 넣어준다. jsp 확장태그로 c로 쓴다.-->


<!DOCTYPE html>
<html lang="en">
    <head>
    <!-- 부트스트랩 출처 : https://startbootstrap.com/template/blog-home -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>${postObj.POST_TITLE}</title>
        <!-- Favicon-->
       <!-- <link rel="icon" type="image/x-icon" href="assets/favicon.ico" /> -->
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
                        <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Blog</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
                <!-- 블로그 헤더 및 블로그 배경화면 -->
        <header class="py-5 bg-light border-bottom mb-4" style="background-image: url('https://www.urbanbrush.net/web/wp-content/uploads/edd/2022/01/urbanbrush-20220105101328484351.jpg')">
            <div class="container">
                <div class="text-center my-5">
                    <h1 class="fw-bolder"> ${postObj.MEM_ID} 회원님의 블로그입니다.</h1>
                    <p class="lead mb-0">내가 쓴 글을 자세히 볼 수 있습니다.</p>
                </div>
            </div>
        </header>
        
        <!-- Page content-->
        <div class="container mt-5">
            <div class="row">
            
            <!-- 왼쪽 블로그 소개 위젯-->
                <div class="col-lg-3">
                <!-- Side widget-->
                    <div class="card mb-4">
                    	<img class="card-img-top" src="../resources/img/blog/${postObj.MEM_PIC}" alt="..." />
                        <div class="card-header">${postObj.MEM_ID}</div>
                        <div class="card-body">블로그 소개글 쓰는 곳.맛집을 좋아하는 ㅇㅇ의 블로그입니다! 이미지는 일단 고정으로 박아뒀지롱...</div>
                    </div>
                    <!-- Categories widget-->
                    <div class="card mb-4">
                        <div class="card-header">카테고리?</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="postEdit.jsp">내 블로그</a></li>
                                        <li><a href="#">오늘 ??명 방문 ></a></li>
                                        <li></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="postInsert.me">새글작성</a></li>
                                        <li><a href="logout">로그아웃</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Search widget-->
                    <div class="card mb-4">
                        <div class="card-header">내 블로그에서 검색</div>
                        <div class="card-body">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="검색어를 입력하세요" aria-label="Enter search term..." aria-describedby="button-search" />
                                <button class="btn btn-primary" id="button-search" type="button">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <!-- Post content-->
                    <article>
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <h1 class="fw-bolder mb-1">${postObj.POST_TITLE}</h1>
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2">${postObj.POST_UPLOADTIME} by <b id="memId">${postObj.MEM_ID}</b> 조회수 : ${postObj.visit_cnt}</div>
                            
                            <!-- 수정 삭제 버튼 - 내 게시글에만 보이게 -->
                            <a class="badge bg-secondary text-decoration-none link-light" href="postUpdateAction.me?writer=${postObj.MEM_ID}&postno=${postObj.POST_NO}" id="post_update">수정</a>
                            <a class="badge bg-secondary text-decoration-none link-light" href="postDeleteAction.me?writer=${postObj.MEM_ID}&postno=${postObj.POST_NO}" id="post_delete">삭제</a>
                        </header>
                        <!-- Preview image figure-->
                        <figure class="mb-4"><img class="img-fluid rounded" src="../resources/img/thumbnail/${postObj.POST_THUMBNAIL}" alt="..." /></figure>
                        <!-- Post content-->
                        <section class="mb-5">
                            <p class="fs-5 mb-4">${postObj.POST_CONTENT}</p>
                                </section>
                    </article>
                    <!-- Comments section-->
                    <section class="mb-5">
                        <div class="card bg-light">
                            <div class="card-body">
                                <!-- Comment form-->
                                <form class="mb-4"><textarea class="form-control" rows="3" placeholder="Join the discussion and leave a comment!"></textarea></form>
                                <!-- Comment with nested comments-->
                                <div class="d-flex mb-4">
                                    <!-- Parent comment-->
                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                    <div class="ms-3">
                                        <div class="fw-bold">Commenter Name</div>
                                        If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
                                        <!-- Child comment 1-->
                                        <div class="d-flex mt-4">
                                            <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                            <div class="ms-3">
                                                <div class="fw-bold">Commenter Name</div>
                                                And under those conditions, you cannot establish a capital-market evaluation of that enterprise. You can't get investors.
                                            </div>
                                        </div>
                                        <!-- Child comment 2-->
                                        <div class="d-flex mt-4">
                                            <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                            <div class="ms-3">
                                                <div class="fw-bold">Commenter Name</div>
                                                When you put money directly to a problem, it makes a good headline.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Single comment-->
                                <div class="d-flex">
                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                    <div class="ms-3">
                                        <div class="fw-bold">Commenter Name</div>
                                        When I look at the universe and all the ways the universe wants to kill us, I find it hard to reconcile that with statements of beneficence.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script>
        
        //세션 id와 게시글 작성자 비교해서 수정/삭제권한 부여하기
        var sessionId = '<%=(String)session.getAttribute("id")%>';
        var post_writer = document.getElementById('memId').innerText;
        
        if (sessionId != post_writer){
        	 document.getElementById("post_update").style.display ='none';
        	 document.getElementById("post_delete").style.display ='none';
        	 console.log("내 게시글 아님. 수정 불가");
        };
		
        </script>
        <!-- Core theme JS-->
     <!--   <script src="js/scripts.js"></script>-->
    </body>
</html>
