<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>


<link rel="stylesheet" href='../resources/css/login.css' />


</head>
<body>
	<div id="wrap" class="wrap">
    <div class="u_skip"><a href="">본문 바로가기</a></div>
    <header class="header" role="banner" >
        <div class="header_inner">
            <a   href="#" class="logo">
                <h1 class="blind">NAVER</h1>
            </a>
            <div class="lang" id="show_locale_switch">
                <select id="locale_switch" name="locale_switch" title="언어선택" class="sel">
                    <option value="ko_KR">한국어</option>
                    <option value="en_US">English</option>
                    <option value="zh-Hans_CN">中文(简体)</option>
                    <option value="zh-Hant_TW">中文(台灣)</option>
                </select>
            </div>
        </div>
    </header>

    <div id="container" class="container">
        <!-- content -->
        <div class="content">
            <div class="login_wrap">
                <ul class="menu_wrap" role="tablist">
                    <li class="menu_item" role="presentation">
                        <!--[주] 탭메뉴 활성화시(=선택시) "on"을 추가해주세요. 접근성: aria-selected는 탭 선택시 true, 미선택시 false로 적용-->
                        <!--[주:접근성] 탭메뉴의 id 값과 탭내용의 aria-controls를 연결하고 있습니다. -->
                        <a href="#none" id="loinid" class="menu_id on" role="tab" aria-selected="true">
                            <span class="menu_text"><span class="text">ID 로그인</span></span>
                        </a>
                    </li>
                    <li class="menu_item" role="presentation">
                        <a href="#none" id="ones" class="menu_ones" role="tab" aria-selected="false">
                            <span class="menu_text"><span class="text">일회용 번호</span></span>
                        </a>
                    </li>
                    <li class="menu_item" role="presentation">
                        <a href="#none" id="qrcode" class="menu_qr" role="tab" aria-selected="false">
                            <span class="menu_text"><span class="text">QR코드</span></span>
                        </a>
                        <!--넛지배너-->
                        <div class="nudge_banner" id="nudge_tooltip">
                            <span class="nudge_text">PC방 등 공용PC라면 QR코드 로그인이 더 안전해요.</span>
                            <button type="button" id="nudge_close" class="nudge_close"><span
                                        class="icon_nudge_close"></span></button>
                        </div>
                    </li>
                </ul>
                
                <form id="loginform" name="loginform" target="_top" AUTOCOMPLETE="off"
                      action="./memberLoginAction.me" method="POST">
                      



                    <ul class="panel_wrap">
                        <li class="panel_item" style="display: block;">
                            <div class="panel_inner" role="tabpanel" aria-controls="loinid">
                                <div class="id_pw_wrap">
                                    <div class="input_row" id="id_line">
                                        <div class="icon_cell" id="id_cell">
                                            <span class="icon_id">
                                                <span class="blind">아이디</span>
                                            </span>
                                        </div>
                                        <input type="text" id="MEMBER_ID" name="MEMBER_ID" placeholder="아이디" title="아이디"
                                               class="input_text" maxlength="41"
                                               value="">
                                        <span role="button" class="btn_delete" id="id_clear" style="display: none;">
                                            <span class="icon_delete">
												<span class="blind">삭제</span>
                                            </span>
                                        </span>
                                    </div>
                                    <div class="input_row" id="pw_line">
                                        <div class="icon_cell" id="pw_cell">
                                            <span class="icon_pw">
                                                <span class="blind">비밀번호</span>
                                            </span>
                                        </div>
                                        <input type="password" id="MEMBER_PW" name="MEMBER_PW" placeholder="비밀번호" title="비밀번호"
                                               class="input_text" maxlength="16">
                                        <span role="button" class="btn_delete" id="pw_clear" style="display: none;">
                                            <span class="icon_delete">
                                                <span class="blind">삭제</span>
                                            </span>
                                        </span>
                                    </div>
                                </div>
                                <div class="login_keep_wrap" id="login_keep_wrap">
                                    <div class="keep_check">
                                        <input type="checkbox" id="keep" name="nvlong"
                                               class="input_keep"  value="off">
                                        <label for="keep" class="keep_text">로그인 상태 유지</label>
                                    </div>
                                    <div class="ip_check">
                                        <a href="#" id="ipguide" title="IP보안"><span class="ip_text">IP보안</span></a>
                                        <span class="switch">
                                            <input type="checkbox" id="switch"
                                                   class="switch_checkbox" value="off">
                                            <label for="switch" class="switch_btn">
                                                <span class="blind" id="switch_blind">OFF</span>
                                            </label>
                                        </span>
                                    </div>
                                </div>

                                <div class="login_error_wrap" id="err_capslock" style="display: none;">
                                    <div class="error_message">
                                        <strong>CapsLock</strong>이 켜져 있습니다.
                                    </div>
                                </div>

                                <div class="login_error_wrap" id="err_empty_id" style="display: none;">
                                    <div class="error_message">
                                        <strong>아이디</strong>를 입력해 주세요.
                                    </div>
                                </div>

                                <div class="login_error_wrap" id="err_empty_pw" style="display: none;">
                                    <div class="error_message">
                                        <strong>비밀번호</strong>를 입력해 주세요.
                                    </div>
                                </div>
                                <div class="login_error_wrap" id="err_common"  style="display:none;">
                                    <div class="error_message"
                                         style="width:90%">
                                        
                                    </div>
                                </div>
                                <div class="btn_login_wrap">
									<a href="javascript:loginform.submit()">
                                    <button type="submit" class="btn_login" id="log.login">
                                        <span class="btn_text">로그인</span>
                                    </button>
									</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </form>
            </div>
            <ul class="find_wrap" id="find_wrap">

                <li><a  href="#"
                       class="find_text">비밀번호 찾기</a></li>
                <li><a  href="#"
                       class="find_text">아이디 찾기</a></li>
                <li><a  href="./memberJoin.me" class="find_text">회원가입</a>
                </li>

            </ul>
            <!--배너-->
            <div id="gladbanner" class="banner_wrap">
                &nbsp;
            </div>
        </div>
        <!-- //content -->
    </div>

    <!-- footer -->
    <div class="footer">
        <div class="footer_inner">
            <!--[주]고객센터,제휴문의,서비스안내-->
            <ul class="footer_link" id="footer_link">
                <li><a  class="footer_item" href="#"
                       id="fot.agreement"><span class="text">이용약관</span></a></li>
                <li><a  class="footer_item" href="#"
                       id="fot.privacy"><span class="text"><strong>개인정보처리방침</strong></span></a></li>
                <li><a  class="footer_item" href="#"
                       id="fot.disclaimer"><span class="text">책임의 한계와 법적고지</span></a></li>
                <li><a  class="footer_item"
                       href="#" id="fot.help"><span
                                class="text">회원정보 고객센터</span></a></li>
            </ul>
            <div class="footer_copy">
                <a id="fot.naver"  href="#">
                    <span class="footer_logo"><span class="blind">네이버</span></span>
                </a>
                <span class="text">Copyright</span>
                <span class="corp">© NAVER Corp.</span>
                <span class="text">All Rights Reserved.</span>
            </div>
        </div>
    </div>

</div>

</body>
</html>
