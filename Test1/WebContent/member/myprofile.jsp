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
        <title>myBlog - 프로필 수정</title>
        <!-- Favicon-->
      <!--   <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />  -->
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/mainPage.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="postListAction.me">N Blog</a>
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
                    <h1 class="fw-bolder"> ${myPostList[0].MEM_ID} 회원님의 블로그입니다.</h1>
                    <p class="lead mb-0">프로필을 수정합니다.</p>
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
                    	<img class="card-img-top" src="../resources/img/blog/${myPostList[0].MEM_PIC}" alt="..." />
                        <div class="card-header">${myPostList[0].MEM_ID}</div>
                        <div class="wrap_my_information">
						    <nav class="menu_my_blog">
						        <a class="item" alt="글쓰기" href="postInsert.me"><i class="sp_common icon_write"></i>글쓰기</a>
						        <a class="item" alt="로그아웃" href="logout">로그아웃</a>
						    </nav>
               			</div>
                        <div class="card-body">블로그 소개글 쓰는 곳.맛집을 좋아하는 ㅇㅇ의 블로그입니다! 이미지는 일단 고정으로 박아뒀지롱...</div>
                    </div>
                    
                    <!-- Search widget-->
                    <div class="card mb-4">
                        <div class="card-header">내 블로그에서 검색</div>
                        <div class="card-body">
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
                        </div>
                    </div>
                </div>
                <!-- 오른쪽 Blog 게시글 내용-->
                <div class="col-lg-9">

        <span id="wrap">
    <h1 class="content-title"><span class="blind">환경설정 &gt; </span>블로그 정보</h1>

	<table cellspacing="0" class="table1 table_bdr_line" role="presentation">
	<colgroup><col class="col1">
	<col>
	</colgroup><tbody><tr class="tr1">
		<td style="font-weight:bold;vertical-align:middle;">블로그 주소</td>
		<td style="vertical-align:middle;">
			<div class="set_domain_wrap">
				<p id="blogAdress" class="blog_address inline">https://blog.naver.com/eriin12</p>
				
					<a id="changeBlogDomain" onclick="changeBlogDomain();" class="set_domain_btn">변경</a>
				
			</div>
			
				<p class="desc1 inline">네이버ID로 자동생성된 블로그 주소를 <br>단 1회변경할 수 있습니다.</p>
			
			
		</td>

	</tr>
	<tr class="tr1">
	<td style="font-weight:bold;vertical-align:middle;"><label for="papername">블로그명</label></td>
	<td>
		<input type="text" id="papername" name="papername" class="input_text mgr1 _nclk(bas_binfo.title)" style="width:295px;" value="한푼씩 기록하는 핸냐로그">
		<p class="desc1 inline">한글, 영문, 숫자 혼용가능 (한글 기준 25자 이내)</p>
	</td>
	</tr>
	<tr class="tr1">
	<td style="font-weight:bold;vertical-align:middle;"><label for="frmNickname">별명</label></td>
	<td>
		<input type="text" id="frmNickname" name="nickname" class="input_text mgr1 _param(false|false)" style="width:295px;" value="핸냐">
		<p class="desc1 inline">한글, 영문, 숫자 혼용가능 (한글 기준 10자 이내)</p>
	</td>
	</tr>
	<tr class="tr2">
	<td style="font-weight:bold"><label for="frmIntroduce">소개글</label></td>
	<td>
		<textarea class="textarea1 _nclk(bas_binfo.intro)" cols="80" rows="3" id="frmIntroduce" name="introduce">머니머니해도 돈이 최고다. 
 
String daily=‘value’; 
일상에 가치를 담아 인생게임 수동모드중 :D</textarea>
		<div class="intro">
			<p class="desc1 mgt1">블로그 프로필 영역의<br>프로필 이미지 아래에 반영됩니다.<br><span>(한글 기준 200자 이내)</span></p>
		</div>
	</td>
	</tr>

	<tr class="tr1">
	<td style="font-weight:bold">블로그 프로필 이미지</td>
	<td class="profile_img">
		<div class="tpl"><a href="#" title="새 창"><img id="profile_161" src="https://blogpfthumb-phinf.pstatic.net/MjAyMDA3MDRfMTYx/MDAxNTkzODQxMTgxMzI2.3OGxFsb_0m1jD2kWsJdOhczxw-bMvQ6Ai9SgDq-7RdIg.vE6eC5r7YYRpQFsQ76rQ9iobKgoPu_Ov0zfBQcmcYfsg.PNG.eriin12/profileImage.png?type=s2" width="161" height="161" alt="" class="_btnViewProfileImage _param(https://blogpfthumb-phinf.pstatic.net/MjAyMDA3MDRfMTYx/MDAxNTkzODQxMTgxMzI2.3OGxFsb_0m1jD2kWsJdOhczxw-bMvQ6Ai9SgDq-7RdIg.vE6eC5r7YYRpQFsQ76rQ9iobKgoPu_Ov0zfBQcmcYfsg.PNG.eriin12/profileImage.png) _returnFalse"><span id="profile_161_span" class="_btnViewProfileImage _param(https://blogpfthumb-phinf.pstatic.net/MjAyMDA3MDRfMTYx/MDAxNTkzODQxMTgxMzI2.3OGxFsb_0m1jD2kWsJdOhczxw-bMvQ6Ai9SgDq-7RdIg.vE6eC5r7YYRpQFsQ76rQ9iobKgoPu_Ov0zfBQcmcYfsg.PNG.eriin12/profileImage.png) _returnFalse"></span></a></div><!-- 없는 이미지일때 bg_noimage_1.gif 사용 -->
		<div class="tpl_txt">
			<span class="btn btn2"><a href="#" class="_btnProfileImageUpload _returnFalse" title="새 창" onclick="clickcr(this, 'bas_binfo.bprosave','','',event);">등록</a></span> <span class="btn btn2"><a href="#" class="_btnProfileImageDelete _returnFalse" onclick="clickcr(this, 'bas_binfo.bprodel','','',event);">삭제</a></span>
			
			<p class="desc1 mgt1">
                프로필 이미지는 가로 161px 섬네일로 생성됩니다.<br>

				<a href="https://admin.blog.naver.com/Remocon.naver?blogId=eriin12&amp;loadType=admin&amp;Redirect=Remocon&amp;SelectedMenu=profile" target="_top" class="_nclk(bas_binfo.rmtcon)">세부 디자인 설정에서 조정해 보세요.</a>
                <br>
                <a href="http://blog.naver.com/blogpeople/150083262408" target="_blank" class="_nclk(bas_binfo.wnotpro)">프로필 이미지가 보이지 않는다면?</a>
			</p>
			<div style="margin:20px 0 -4px;"><input type="checkbox" id="chk1" name="notifyNaverProfile" value="true" class="input_check _nclkcb(bas_binfo.npro)" checked=""> <label for="chk1">네이버 프로필에도 적용합니다.</label></div>
		</div>
	</td>
	</tr>
	<tr class="tr1">
	<td style="font-weight:bold">모바일앱 커버 이미지</td>
	<td class="profile_img">
		<div class="tpl"><img id="mobile_title_image" src="https://mblogthumb-phinf.pstatic.net/MjAyMjA0MDdfNzQg/MDAxNjQ5MzA4ODE4MDk1.ofPlpqc0Z9bR5W7Da8GFe8lgariXuZ4S6E52XrmBAlAg.pfDF9t5tQeQApemQX_HtXkvD5zlck119_NPozfD0ZpEg.PNG.eriin12/croppedImage_VERSION2.PNG?type=w800" width="161" height="161" alt=""><span class="border"></span></div><!-- 없는 이미지일때 bg_noimage_1.gif 사용 -->
			<div class="tpl_txt">
				<span class="btn btn2"><a href="#" class="_btnMobileTitleImageUpload _returnFalse" title="새 창" onclick="clickcr(this, 'bas_binfo.appsave','','',event);">등록</a></span> <span class="btn btn2"><a href="#" class="_btnMobileTitleImageDelete _returnFalse" onclick="clickcr(this, 'bas_binfo.appdel','','',event);">삭제</a></span>
				<p class="desc1 mgt1">
                    커버 이미지는 모바일 기기의 해상도에 맞는 크기로 변환되어 보여집니다.
				<br>
                    블로그앱에서 커버 이미지가 적용된 내블로그를 확인해보세요.<br>
				<a href="https://blog.naver.com/storyphoto/viewer.html?src=https%3A%2F%2Fssl.pstatic.net%2Fstatic%2Fblog%2Fthumb_bookcover.png" target="_blank" class="_btnPopup _returnFalse" onclick="clickcr(this, 'bas_binfo.vcover','','',event);">커버 이미지 예시 보기</a>
				</p>
			<div class="app_txt3" style="display:none;">
				<p><span class="app_set"><a id="appInstallBtn" href="#" class="_nclk(bas_binfo.appdown) _installBlogAppPush _param(true) _stopIntallAppEvent"><em>블로그앱</em> 간편설치하기</a></span></p>
				<div id="installBlogAppPush" class="ly_app_set" style="display:hidden">
					<p class="set_tt"><strong>블로그앱</strong> 설치 URL을<br>네이버앱 알림으로 전송했습니다.</p>
					<p class="set_tx">알림이 오지 않는다면,<br>네이버앱을 최신버전으로 업데이트 하거나,<br>로그아웃상태인지 확인해주세요</p>
					<div class="ly_app_btn">
						<a href="#" class="btn_send _installBlogAppPushRetry _param(true) _stopIntallAppEvent">다시 보내기</a>
						<a href="#" class="btn_cfm _installBlogAppPushClose _param(true||appInstallBtn) _stopIntallAppEvent">확인</a>
					</div>
					<a href="#" class="ly_clse _installBlogAppPushClose _param(true||appInstallBtn) _stopIntallAppEvent">닫기</a>
				</div>
			</div>                  
		</div>          
	</td>
	</tr>
    
	<tr class="tr1">
		<td style="font-weight:bold"><label>사업자 확인</label></td>
		<td>
			
			
			<p class="desc1" style="padding-left:21px;">
				블로그를 상거래 목적으로 운영하는 경우, 전자상거래법에 따라 사업자 정보를 표시해야 합니다.
				<br>
				<a href="http://blog.naver.com/blogpeople/220783249279" class="preview _nclk(bas_binfo.vmore)" target="_blank">자세히 보기</a>
			</p>
			

			
			
		</td>
	</tr>

	
	
	
	</tbody></table>

	<div class="action1">
		<span class="btn btn1"><input class="_btnConfirm _returnFalse" type="button" value="확인" onclick="clickcr(this, 'bas_binfo.ok','','',event);"></span>
	</div>




<script type="text/javascript" language="javascript">
//document.domain = "naver.com"
	window.onload = function(){
		cm_paperInit();
	}
lcs_do();
var gOpenLayerd = '';
if(gOpenLayerd == 'open') {
	parent.layeredAlert._openDim();
	parent.layeredAlert._openLayered();
}

</script>



<script type="text/javascript" src="https://ssl.pstatic.net/t.static.blog/mylog/versioning/AdminBottomCommon-671418286_https.js" charset="UTF-8"></script>
<script type="text/javascript">
var nsc = "blog.admin";
var ccsrv="cc.naver.com";
var nclk_evt = 3;
new InstallBlogAppPush();
nclk_do();
</script>

</span>

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
