<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link rel="stylesheet" href='../resources/css/member.css' />

</head>
<body>
<div id="wrap">

	<!-- 스킵네비게이션 : 웹접근성대응-->
<div id="u_skip">
    <a href="#content" onclick="document.getElementById('content').tabIndex=-1;document.getElementById('content').focus();return false;"><span>본문으로 바로가기</span></a>
</div>
<!-- //스킵네비게이션 -->
<!-- header -->
<div id="header" class="join_membership" role="banner">
    <h1><a href="#" class="h_logo"><span class="blind">NAVER</span></a></h1>
</div>
<!-- // header -->

<form name="joinform" action="./memberJoinAction.me" method="post">
  <!--  <input type="hidden" id="token_sjoin" name="token_sjoin" value="cKVHbTTyCMCAj2s3">
    <input type="hidden" id="encPswd" name="encPswd" value="">
    <input type="hidden" id="encKey" name="encKey" value="">
    <input type="hidden" id="birthday" name="birthday" value="">
    <input type="hidden" id="joinMode" name="joinMode" value="unreal">
    <input type="hidden" id="pbirthday" name="pbirthday" value="">
    <input type="hidden" id="ipinFlag" name="ipinFlag" value="">
    <input type="hidden" id="nid_kb2" name="nid_kb2" value=""> -->  

    <!-- container -->
    <div id="container" role="main">
        <div id="content">
            <!-- tg-text=title -->
            <h2 class="blind">네이버 회원가입</h2>
            <div class="join_content">
                <!-- 아이디, 비밀번호 입력 -->
                <div class="row_group">
                    <div class="join_row">
                        <h3 class="join_title"><label for="id">아이디</label></h3>
                        	
                        <span class="ps_box int_id">
                        	<!-- ID 입력 및 포커스아웃되면 중복검사도 함. -->
							<input type="text" id="id" name="MEMBER_ID" class="int" title="ID" maxlength="20">
                            <span class="step_url">@naver.com</span></span>
                        <span class="error_next_box" id="idMsg" style="display:none" aria-live="assertive"></span>
                    </div>

                    <div class="join_row">
                        <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                        <span class="ps_box int_pass" id="pswd1Img">
							<input type="password" id="pswd1" name="MEMBER_PW" class="int" title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20">
                            <span class="lbl"><span id="pswd1Span" class="step_txt"></span></span>
						</span>
                        <span class="error_next_box" id="pswd1Msg" style="display:none" aria-live="assertive">5~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.</span>

                        <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                        <span class="ps_box int_pass_check" id="pswd2Img">
							<input type="password" id="pswd2" name="MEMBER_PW_cfm" class="int" title="비밀번호 재확인 입력" aria-describedby="pswd2Blind" maxlength="20">
							<span id="pswd2Blind" class="wa_blind">설정하려는 비밀번호가 맞는지 확인하기 위해 다시 입력 해주세요.</span>
						</span>
                        <span class="error_next_box" id="pswd2Msg" style="display:none" aria-live="assertive"></span>
                    </div>
                </div>
                <!-- // 아이디, 비밀번호 입력 -->

                <!-- 이름, 생년월일 입력 -->
                <div class="row_group">

                    <!-- lang = ko_KR -->
                    <div class="join_row">
                        <h3 class="join_title"><label for="name">이름</label></h3>
                        <span class="ps_box box_right_space">
							<input type="text" id="name" name="MEMBER_NAME" title="이름" class="int" maxlength="40">
						</span>
                        <span class="error_next_box" id="nameMsg" style="display:none" aria-live="assertive"></span>
                    </div>
                    <!-- lang = ko_KR -->

                    <div class="join_row join_birthday">
                        <h3 class="join_title"><label for="yy">생년월일</label></h3>
                        <div class="bir_wrap">
                            <div class="bir_yy">
								<span class="ps_box">
									<input type="text" name="MEMBER_BIR_YY" id="yy" placeholder="년(4자)" aria-label="년(4자)" class="int" maxlength="4">
								</span>
                            </div>
                            <div class="bir_mm"> 
								<span class="ps_box">
									<select id="mm" name="MEMBER_BIR_MM" class="sel" aria-label="월">
										<option value="">월</option>
										  	 			<option value="01">
                                                            1
                                                        </option>
										  	 			<option value="02">
                                                            2
                                                        </option>
										  	 			<option value="03">
                                                            3
                                                        </option>
										  	 			<option value="04">
                                                            4
                                                        </option>
										  	 			<option value="05">
                                                            5
                                                        </option>
										  	 			<option value="06">
                                                            6
                                                        </option>
										  	 			<option value="07">
                                                            7
                                                        </option>
										  	 			<option value="08">
                                                            8
                                                        </option>
										  	 			<option value="09">
                                                            9
                                                        </option>
										  	 			<option value="10">
                                                            10
                                                        </option>
										  	 			<option value="11">
                                                            11
                                                        </option>
										  	 			<option value="12">
                                                            12
                                                        </option>
									</select>
								</span>
                            </div>
                            <div class=" bir_dd">
								<span class="ps_box">
									<input type="text" id="dd" name="MEMBER_BIR_DD" placeholder="일" aria-label="일" class="int" maxlength="2">
									<label for="dd" class="lbl"></label>
								</span>
                            </div>
                        </div>
                        <span class="error_next_box" id="birthdayMsg" style="display:none" aria-live="assertive"></span>
                    </div>

                    <div class="join_row join_sex">
                        <h3 class="join_title"><label for="gender">성별</label></h3>
                        <div class="ps_box gender_code">
                            <select id="gender" name="MEMBER_GENDER" class="sel" aria-label="성별">
                                <option value="" selected>성별</option>
                                        <option value="M">남자</option>
                                        <option value="F">여자</option>
                                        <option value="U">선택 안함</option>
                            </select>
                        </div>
                    </div>
                    <span class="error_next_box" id="genderMsg" style="display:none" aria-live="assertive"></span>

                    <div class="join_row join_email">
                        <h3 class="join_title"><label for="email">본인 확인 이메일<span class="terms_choice"></span></label></h3>
                        <span class="ps_box int_email box_right_space">
							<input type="text" id="email" name="MEMBER_MAIL" placeholder="이메일" aria-label="이메일" class="int" maxlength="100">
						</span>
                    </div>
                    <span class="error_next_box" id="emailMsg" style="display:none" aria-live="assertive"></span>
                </div>
                <!-- // 이름, 생년월일 입력 -->

                <!-- 휴대전화 번호, 인증번호 입력 -->
                <div class="join_row join_mobile" id="mobDiv">
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <div class="ps_box country_code">
                        <select id="nationNo" name="nationNo" class="sel" aria-label="전화번호 입력">
                                        <option value="233" >
                                            가나 +233
                                        </option>
                                        <option value="241" >
                                            가봉 +241
                                        </option>
                                        <option value="592" >
                                            가이아나 +592
                                        </option>
                                        <option value="220" >
                                            감비아 +220
                                        </option>
                                        <option value="502" >
                                            과테말라 +502
                                        </option>
                                        <option value="1671" >
                                            괌 +1 671
                                        </option>
                                        <option value="1473" >
                                            그레나다 +1 473
                                        </option>
                                        <option value="30" >
                                            그리스 +30
                                        </option>
                                        <option value="224" >
                                            기니 +224
                                        </option>
                                        <option value="245" >
                                            기니비사우 +245
                                        </option>
                                        <option value="264" >
                                            나미비아 +264
                                        </option>
                                        <option value="674" >
                                            나우루 +674
                                        </option>
                                        <option value="234" >
                                            나이지리아 +234
                                        </option>
                                        <option value="672" >
                                            남극,오스트레일리아의외 +672
                                        </option>
                                        <option value="27" >
                                            남아프리카공화국 +27
                                        </option>
                                        <option value="31" >
                                            네덜란드 +31
                                        </option>
                                        <option value="599" >
                                            네덜란드령보네르 +599
                                        </option>
                                        <option value="297" >
                                            네덜란드령아루바 +297
                                        </option>
                                        <option value="977" >
                                            네팔 +977
                                        </option>
                                        <option value="47" >
                                            노르웨이 +47
                                        </option>
                                        <option value="64" >
                                            뉴질랜드 +64
                                        </option>
                                        <option value="683" >
                                            뉴질랜드령니우에 +683
                                        </option>
                                        <option value="690" >
                                            뉴질랜드령토켈라우제도 +690
                                        </option>
                                        <option value="227" >
                                            니제르 +227
                                        </option>
                                        <option value="505" >
                                            니카라과 +505
                                        </option>
                                        <option value="82" selected>
                                            대한민국 +82
                                        </option>
                                        <option value="45" >
                                            덴마크 +45
                                        </option>
                                        <option value="299" >
                                            덴마크령그린란드 +299
                                        </option>
                                        <option value="298" >
                                            덴마크령페로제도 +298
                                        </option>
                                        <option value="1809" >
                                            도미니카공화국 +1 809
                                        </option>
                                        <option value="1829" >
                                            도미니카공화국 2 +1 829
                                        </option>
                                        <option value="1849" >
                                            도미니카공화국 3 +1 849
                                        </option>
                                        <option value="49" >
                                            독일 +49
                                        </option>
                                        <option value="670" >
                                            동티모르 +670
                                        </option>
                                        <option value="856" >
                                            라오스 +856
                                        </option>
                                        <option value="231" >
                                            라이베리아 +231
                                        </option>
                                        <option value="371" >
                                            라트비아 +371
                                        </option>
                                        <option value="7" >
                                            러시아/카자흐스탄 +7
                                        </option>
                                        <option value="961" >
                                            레바논 +961
                                        </option>
                                        <option value="266" >
                                            레소토 +266
                                        </option>
                                        <option value="40" >
                                            루마니아 +40
                                        </option>
                                        <option value="352" >
                                            룩셈부르크 +352
                                        </option>
                                        <option value="250" >
                                            르완다 +250
                                        </option>
                                        <option value="218" >
                                            리비아 +218
                                        </option>
                                        <option value="370" >
                                            리투아니아 +370
                                        </option>
                                        <option value="423" >
                                            리히텐슈타인 +423
                                        </option>
                                        <option value="261" >
                                            마다가스카르 +261
                                        </option>
                                        <option value="692" >
                                            마셜제도공화국 +692
                                        </option>
                                        <option value="691" >
                                            마이크로네시아연방 +691
                                        </option>
                                        <option value="853" >
                                            마카오 +853
                                        </option>
                                        <option value="389" >
                                            마케도니아공화국 +389
                                        </option>
                                        <option value="265" >
                                            말라위 +265
                                        </option>
                                        <option value="60" >
                                            말레이시아 +60
                                        </option>
                                        <option value="223" >
                                            말리 +223
                                        </option>
                                        <option value="52" >
                                            멕시코 +52
                                        </option>
                                        <option value="377" >
                                            모나코 +377
                                        </option>
                                        <option value="212" >
                                            모로코 +212
                                        </option>
                                        <option value="230" >
                                            모리셔스 +230
                                        </option>
                                        <option value="222" >
                                            모리타니아 +222
                                        </option>
                                        <option value="258" >
                                            모잠비크 +258
                                        </option>
                                        <option value="382" >
                                            몬테네그로 +382
                                        </option>
                                        <option value="373" >
                                            몰도바 +373
                                        </option>
                                        <option value="960" >
                                            몰디브 +960
                                        </option>
                                        <option value="356" >
                                            몰타 +356
                                        </option>
                                        <option value="976" >
                                            몽골 +976
                                        </option>
                                        <option value="1" >
                                            미국/캐나다 +1
                                        </option>
                                        <option value="1670" >
                                            미국령북마리아나제도 +1 670
                                        </option>
                                        <option value="95" >
                                            미얀마 +95
                                        </option>
                                        <option value="678" >
                                            바누아투 +678
                                        </option>
                                        <option value="973" >
                                            바레인 +973
                                        </option>
                                        <option value="1246" >
                                            바베이도스 +1 246
                                        </option>
                                        <option value="1242" >
                                            바하마 +1 242
                                        </option>
                                        <option value="880" >
                                            방글라데시 +880
                                        </option>
                                        <option value="229" >
                                            베냉 +229
                                        </option>
                                        <option value="58" >
                                            베네수엘라 +58
                                        </option>
                                        <option value="84" >
                                            베트남 +84
                                        </option>
                                        <option value="32" >
                                            벨기에 +32
                                        </option>
                                        <option value="375" >
                                            벨라루스 +375
                                        </option>
                                        <option value="501" >
                                            벨리즈 +501
                                        </option>
                                        <option value="387" >
                                            보스니아헤르체고비나 +387
                                        </option>
                                        <option value="267" >
                                            보츠와나 +267
                                        </option>
                                        <option value="591" >
                                            볼리비아 +591
                                        </option>
                                        <option value="257" >
                                            부룬디 +257
                                        </option>
                                        <option value="226" >
                                            부르키나파소 +226
                                        </option>
                                        <option value="975" >
                                            부탄 +975
                                        </option>
                                        <option value="359" >
                                            불가리아 +359
                                        </option>
                                        <option value="55" >
                                            브라질 +55
                                        </option>
                                        <option value="673" >
                                            브루나이 +673
                                        </option>
                                        <option value="685" >
                                            사모아 +685
                                        </option>
                                        <option value="966" >
                                            사우디아라비아 +966
                                        </option>
                                        <option value="378" >
                                            산마리노 +378
                                        </option>
                                        <option value="239" >
                                            상투메프린시페 +239
                                        </option>
                                        <option value="221" >
                                            세네갈 +221
                                        </option>
                                        <option value="381" >
                                            세르비아 +381
                                        </option>
                                        <option value="248" >
                                            세이셀 +248
                                        </option>
                                        <option value="1784" >
                                            세인트빈센트그레나딘 +1 784
                                        </option>
                                        <option value="252" >
                                            소말리아 +252
                                        </option>
                                        <option value="677" >
                                            솔로몬제도 +677
                                        </option>
                                        <option value="249" >
                                            수단 +249
                                        </option>
                                        <option value="597" >
                                            수리남 +597
                                        </option>
                                        <option value="94" >
                                            스리랑카 +94
                                        </option>
                                        <option value="268" >
                                            스와질랜드 +268
                                        </option>
                                        <option value="46" >
                                            스웨덴 +46
                                        </option>
                                        <option value="41" >
                                            스위스 +41
                                        </option>
                                        <option value="34" >
                                            스페인 +34
                                        </option>
                                        <option value="421" >
                                            슬로바키아 +421
                                        </option>
                                        <option value="386" >
                                            슬로베니아 +386
                                        </option>
                                        <option value="963" >
                                            시리아 +963
                                        </option>
                                        <option value="232" >
                                            시에라리온 +232
                                        </option>
                                        <option value="65" >
                                            싱가포르 +65
                                        </option>
                                        <option value="971" >
                                            아랍에미리트 +971
                                        </option>
                                        <option value="374" >
                                            아르메니아 +374
                                        </option>
                                        <option value="54" >
                                            아르헨티나 +54
                                        </option>
                                        <option value="1684" >
                                            아메리칸사모아 +1 684
                                        </option>
                                        <option value="354" >
                                            아이슬란드 +354
                                        </option>
                                        <option value="509" >
                                            아이티 +509
                                        </option>
                                        <option value="353" >
                                            아일랜드 +353
                                        </option>
                                        <option value="994" >
                                            아제르바이잔 +994
                                        </option>
                                        <option value="93" >
                                            아프가니스탄 +93
                                        </option>
                                        <option value="376" >
                                            안도라 +376
                                        </option>
                                        <option value="355" >
                                            알바니아 +355
                                        </option>
                                        <option value="213" >
                                            알제리 +213
                                        </option>
                                        <option value="244" >
                                            앙골라 +244
                                        </option>
                                        <option value="251" >
                                            에디오피아 +251
                                        </option>
                                        <option value="291" >
                                            에리트레아 +291
                                        </option>
                                        <option value="372" >
                                            에스토니아 +372
                                        </option>
                                        <option value="593" >
                                            에콰도르 +593
                                        </option>
                                        <option value="503" >
                                            엘살바도르 +503
                                        </option>
                                        <option value="44" >
                                            영국 +44
                                        </option>
                                        <option value="290" >
                                            영국령세인트헬레나 +290
                                        </option>
                                        <option value="246" >
                                            영국령인도양지역 +246
                                        </option>
                                        <option value="350" >
                                            영국령지브롤터 +350
                                        </option>
                                        <option value="500" >
                                            영국령포클랜드제도 +500
                                        </option>
                                        <option value="967" >
                                            예멘 +967
                                        </option>
                                        <option value="968" >
                                            오만 +968
                                        </option>
                                        <option value="43" >
                                            오스트리아 +43
                                        </option>
                                        <option value="504" >
                                            온두라스 +504
                                        </option>
                                        <option value="962" >
                                            요르단 +962
                                        </option>
                                        <option value="256" >
                                            우간다 +256
                                        </option>
                                        <option value="598" >
                                            우루과이 +598
                                        </option>
                                        <option value="998" >
                                            우즈베키스탄 +998
                                        </option>
                                        <option value="380" >
                                            우크라이나 +380
                                        </option>
                                        <option value="964" >
                                            이라크 +964
                                        </option>
                                        <option value="98" >
                                            이란 +98
                                        </option>
                                        <option value="972" >
                                            이스라엘 +972
                                        </option>
                                        <option value="20" >
                                            이집트 +20
                                        </option>
                                        <option value="39" >
                                            이탈리아 +39
                                        </option>
                                        <option value="91" >
                                            인도 +91
                                        </option>
                                        <option value="62" >
                                            인도네시아 +62
                                        </option>
                                        <option value="81" >
                                            일본 +81
                                        </option>
                                        <option value="1876" >
                                            자메이카 +1 876
                                        </option>
                                        <option value="260" >
                                            잠비아 +260
                                        </option>
                                        <option value="240" >
                                            적도기니 +240
                                        </option>
                                        <option value="995" >
                                            조지아 +995
                                        </option>
                                        <option value="86" >
                                            중국 +86
                                        </option>
                                        <option value="236" >
                                            중앙아프리카공화국 +236
                                        </option>
                                        <option value="253" >
                                            지부티 +253
                                        </option>
                                        <option value="263" >
                                            짐바브웨 +263
                                        </option>
                                        <option value="235" >
                                            차드 +235
                                        </option>
                                        <option value="420" >
                                            체코 +420
                                        </option>
                                        <option value="56" >
                                            칠레 +56
                                        </option>
                                        <option value="237" >
                                            카메룬 +237
                                        </option>
                                        <option value="238" >
                                            카보베르데 +238
                                        </option>
                                        <option value="974" >
                                            카타르 +974
                                        </option>
                                        <option value="855" >
                                            캄보디아왕국 +855
                                        </option>
                                        <option value="254" >
                                            케냐 +254
                                        </option>
                                        <option value="269" >
                                            코모로,마요트 +269
                                        </option>
                                        <option value="506" >
                                            코스타리카 +506
                                        </option>
                                        <option value="225" >
                                            코트디부아르 +225
                                        </option>
                                        <option value="57" >
                                            콜롬비아 +57
                                        </option>
                                        <option value="242" >
                                            콩고 +242
                                        </option>
                                        <option value="243" >
                                            콩고민주공화국 +243
                                        </option>
                                        <option value="53" >
                                            쿠바 +53
                                        </option>
                                        <option value="965" >
                                            쿠웨이트 +965
                                        </option>
                                        <option value="682" >
                                            쿡제도 +682
                                        </option>
                                        <option value="385" >
                                            크로아티아 +385
                                        </option>
                                        <option value="996" >
                                            키르기스스탄 +996
                                        </option>
                                        <option value="686" >
                                            키리바시 +686
                                        </option>
                                        <option value="357" >
                                            키프로스 +357
                                        </option>
                                        <option value="886" >
                                            타이완 +886
                                        </option>
                                        <option value="992" >
                                            타지키스탄 +992
                                        </option>
                                        <option value="255" >
                                            탄자니아 +255
                                        </option>
                                        <option value="66" >
                                            태국 +66
                                        </option>
                                        <option value="90" >
                                            터키 +90
                                        </option>
                                        <option value="228" >
                                            토고 +228
                                        </option>
                                        <option value="676" >
                                            통가 +676
                                        </option>
                                        <option value="993" >
                                            투르크메니스탄 +993
                                        </option>
                                        <option value="216" >
                                            튀니지 +216
                                        </option>
                                        <option value="1868" >
                                            트리니다드토바고 +1 868
                                        </option>
                                        <option value="507" >
                                            파나마 +507
                                        </option>
                                        <option value="595" >
                                            파라과이 +595
                                        </option>
                                        <option value="92" >
                                            파키스탄 +92
                                        </option>
                                        <option value="675" >
                                            파푸아뉴기니 +675
                                        </option>
                                        <option value="680" >
                                            팔라우 +680
                                        </option>
                                        <option value="970" >
                                            팔레스타인 +970
                                        </option>
                                        <option value="51" >
                                            페루 +51
                                        </option>
                                        <option value="351" >
                                            포르투갈 +351
                                        </option>
                                        <option value="48" >
                                            폴란드 +48
                                        </option>
                                        <option value="1787" >
                                            푸에르토리코 +1 787
                                        </option>
                                        <option value="33" >
                                            프랑스 +33
                                        </option>
                                        <option value="590" >
                                            프랑스령과들루프 +590
                                        </option>
                                        <option value="594" >
                                            프랑스령기아나 +594
                                        </option>
                                        <option value="687" >
                                            프랑스령뉴칼레도니아 +687
                                        </option>
                                        <option value="262" >
                                            프랑스령레위니옹 +262
                                        </option>
                                        <option value="596" >
                                            프랑스령마르티니크 +596
                                        </option>
                                        <option value="508" >
                                            프랑스령생피에르미클롱 +508
                                        </option>
                                        <option value="681" >
                                            프랑스령월리스푸투나제 +681
                                        </option>
                                        <option value="689" >
                                            프랑스령폴리네시아 +689
                                        </option>
                                        <option value="679" >
                                            피지 +679
                                        </option>
                                        <option value="358" >
                                            핀란드 +358
                                        </option>
                                        <option value="63" >
                                            필리핀 +63
                                        </option>
                                        <option value="36" >
                                            헝가리 +36
                                        </option>
                                        <option value="61" >
                                            호주 +61
                                        </option>
                                        <option value="852" >
                                            홍콩 +852
                                        </option>
                        </select>
                    </div>
                    <div class="int_mobile_area">
						<span class="ps_box int_mobile">
							<input type="tel" id="phoneNo" name="MEMBER_PHONE" placeholder="전화번호 입력" aria-label="전화번호 입력" class="int" maxlength="16">
							<label for="phoneNo" class="lbl"></label>
						</span>
                        <a href="#" class="btn_verify btn_primary" id="btnSend" role="button">
                            <span class="">인증번호 받기</span>
                        </a>
                    </div>
                    <div class="ps_box_disable box_right_space" id="authNoBox">
                        <input type="tel" id="authNo" name="authNo" placeholder="인증번호 입력하세요" aria-label="인증번호 입력하세요" aria-describedby="wa_verify" class="int" disabled maxlength="4">
                        <label id="wa_verify" for="authNo" class="lbl">
                            <span class="wa_blind">인증받은 후 인증번호를 입력해야 합니다.</span>
                            <span class="input_code" id="authNoCode" style="display:none;"></span>
                        </label>
                    </div>

                    <span class="error_next_box" id="phoneNoMsg" style="display:none" aria-live="assertive"></span>
                    <span class="error_next_box" id="authNoMsg" style="display:none" aria-live="assertive"></span>
                    <span class="error_next_box" id="joinMsg" style="display:none" aria-live="assertive"></span>
                </div>
                <!-- // 휴대전화 번호, 인증번호 입력 -->

                <!-- tg-display=>{"보호자 모바일 인증": [], "오류 메시지": []} -->
                <div class="join_minor tab" id="pmobDiv" style="display:none">
                    <ul class="tab_m" role="tablist">
                        <li class="m1" role="presentation"><a href="#" onclick="return false;" class="on" role="tab" aria-selected="true" aria-controls="wa_tab_phone">휴대전화인증</a></li>
                        <li class="m2" role="presentation"><a href="#" id="tabPrtsIpin" role="tab" aria-selected="false" aria-controls="wa_tab_ipin">아이핀 인증</a></li>
                    </ul>
                    <div id="wa_tab_phone" role="tabpanel">
                        <div class="agree_check_wrap">
                            <div class="terms_chk_all">
                                <span class="input_chk">
                                    <input type="checkbox" id="pagree_all" class="chk_all">
                                    <label for="pagree_all">
                                        <span class="chk_all_txt">아래 약관에 모두 동의합니다.</span>
                                    </label>
                                </span>
                            </div>
                            <div class="small_check_box">
                                <span class="input_chk">
                                    <input type="checkbox" id="pagree_01" class="chk">
                                    <label for="pagree_01">
                                        <a href="https://nid.naver.com/user2/common/terms/terms?m=viewPersonalInfoTerms" target="_blank"><span>개인정보 이용</span></a>
                                    </label>
                                </span>
                                <span class="input_chk">
                                    <input type="checkbox" id="pagree_02" class="chk">
                                    <label for="pagree_02">
                                        <a href="https://nid.naver.com/user2/common/terms/terms?m=viewUniqInfoTerms" target="_blank"><span>고유식별정보 처리</span></a>
                                    </label>
                                </span>
                                <span class="input_chk">
                                    <input type="checkbox" id="pagree_03" class="chk">
                                    <label for="pagree_03">
                                        <a href="https://nid.naver.com/user2/common/terms/terms?m=viewCellPhoneCarriersTerms" target="_blank"><span>통신사 이용약관</span></a>
                                    </label>
                                </span>
                                <span class="input_chk">
                                    <input type="checkbox" id="pagree_04" class="chk">
                                    <label for="pagree_04">
                                        <a href="https://nid.naver.com/user2/common/terms/terms?m=viewServiceTerms" target="_blank"><span>인증사 이용약관</span></a>
                                    </label>
                                </span>
                                <span class="input_chk">
                                    <input type="checkbox" id="pagree_05" class="chk">
                                    <label for="pagree_05">
                                        <a href="https://nid.naver.com/user2/common/terms/terms?m=viewNaverTerms" target="_blank"><span>네이버 개인정보 수집</span></a>
                                    </label>
                                </span>
                            </div>
                            <span class="error_next_box" id="pagreeMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                        </div>
                        <div class="row_group">
                            <div class="join_row">
                                <h3 class="join_title"><label for="pname">보호자 이름</label></h3>
                                <span class="ps_box box_right_space">
                                    <input type="text" id="pname" name="pname" title="보호자 이름" class="int" maxlength="40">
                                </span>
                                <span class="error_next_box" id="pnameMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                            </div>
                            <div class="join_row join_birthday">
                                <h3 class="join_title"><label for="pyy">보호자 생년월일</label></h3>
                                <div class="bir_wrap">
                                    <div class="bir_yy">
                                        <span class="ps_box">
                                            <input type="text" id="pyy" placeholder="년(4자)" aria-label="년(4자)" class="int" maxlength="4">
                                        </span>
                                    </div>
                                    <div class="bir_mm">
                                        <span class="ps_box">
                                            <select id="pmm" name="pmm" class="sel" aria-label="월">
                                                <option>월</option>
                                                <option>1</option><option>2</option><option>3</option>
                                                <option>4</option><option>5</option><option>6</option>
                                                <option>7</option><option>8</option><option>9</option>
                                                <option>10</option><option>11</option><option>12</option>
                                            </select>
                                        </span>
                                    </div>
                                    <div class="bir_dd">
                                        <span class="ps_box">
                                            <input type="text" id="pdd" placeholder="일" aria-label="일" class="int" maxlength="2">
                                            <label for="pdd" class="lbl"></label>
                                        </span>
                                    </div>
                                </div>
                                <span class="error_next_box" id="pbirthdayMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                            </div>
                            <div class="join_row">
                                <h3 class="join_title"><label for="pgender">보호자 성별/국적</label></h3>
                                <div class="join_guardian">
                                    <div class="gender_nationality">
                                        <div class="ps_box gender_code">
                                            <select id="pgender" name="pgender" class="sel" aria-label="성별">
                                                <option value="" selected="">성별</option>
                                                <option value="0">남자</option>
                                                <option value="1">여자</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="gender_nationality">
                                        <div class="ps_box gender_code">
                                            <select id="pforeign" name="pforeign" class="sel" aria-label="내국인여부">
                                                <option value="0" selected="">내국인</option>
                                                <option value="1">외국인</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <span class="error_next_box" id="pgenderMsg" style="display:none" aria-live="assertive"></span>
                            </div>
                        </div>
                        <div class="join_row join_mobile">
                            <h3 class="join_title"><label for="ptelecom">통신사</label></h3>
                            <div class="ps_box country_code">
                                <select id="ptelecom" name="ptelecom" class="sel" aria-label="통신사">
                                    <option value="SKT" >SKT</option>
                                    <option value="KTF" >KT</option>
                                    <option value="LGT" >LG U+</option>
                                    <option value="SKR" >SKT 알뜰폰</option>
                                    <option value="KTR" >KT 알뜰폰</option>
                                    <option value="LGR" >LG U+ 알뜰폰</option>
                                </select>
                            </div>
                        </div>
                        <div class="join_row join_mobile">
                            <h3 class="join_title"><label for="pphoneNo">휴대전화</label></h3>
                            <div class="int_mobile_area">
                                <span class="ps_box int_mobile">
                                    <input type="tel" id="pphoneNo" name="pphoneNo" placeholder="전화번호 입력" aria-label="전화번호 입력" class="int" maxlength="16">
                                </span>
                                <a href="#" class="btn_verify btn_primary" id="btnPrtsSend" role="button">
                                    <span class="">인증번호 받기</span>
                                </a>
                            </div>
                            <div class="ps_box_disable box_right_space" id="pauthNoBox">
                                <input type="tel" id="pauthNo" name="pauthNo" placeholder="인증번호 입력하세요" aria-label="인증번호 입력하세요" aria-describedby="pwa_verify" class="int" disabled maxlength="6">
                                <label id="pwa_verify" for="pauthNo" class="lbl">
                                    <span class="wa_blind">인증받은 후 인증번호를 입력해야 합니다.</span>
                                    <span class="input_code" id="pauthNoCode" style="display:none;"></span>
                                </label>
                            </div>
                            <span class="error_next_box" id="pphoneNoMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                            <span class="error_next_box" id="pauthNoMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                            <span class="error_next_box" id="pjoinMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                        </div>
                    </div>
                </div>
                <!-- tg-display -->

                <!-- tg-display=>{"보호자 아이핀 인증": [], "오류 메시지": []} 
                <div class="join_minor tab" id="pipinDiv" style="display:none">
                    <ul class="tab_m" role="tablist">
                        <li class="m1" role="presentation"><a href="#" id="tabPrtsMobile" role="tab" aria-selected="false" aria-controls="wa_tab_phone">휴대전화인증</a></li>
                        <li class="m2" role="presentation"><a href="#" onclick="return false;" class="on" role="tab" aria-selected="true" aria-controls="wa_tab_ipin">아이핀 인증</a></li>
                    </ul>
                    <div id="wa_tab_ipin" role="tabpanel">
                        <div class="terms_chk_all">
                            <span class="input_chk">
                                <input type="checkbox" id="iagree_all" class="chk">
                                <label for="iagree_all" class="ipin_label">
                                    <span class="txt">보호자 인증이 완료되면 보호자 이름, 생년월일, 성별, 중복가입확인정보(DI)가 보호자 동의 확인을 위하여 아동의 정보와 함께 저장되며, <strong class="point">아동이 성년이 되는 시점에 파기됩니다.</strong></span>
                                </label>
                            </span>
                            <span class="error_next_box" id="iagreeMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                        </div>
                        <div class="ipin_box">
                            <p class="ipin_certify_txt">보호자 명의의 아이핀으로 인증 후<br> 가입이 가능 합니다.</p>
                            <button type="button" id="btnIpinPopup" class="ipin_certify_btn" title="새 창">
                                <span>아이핀 인증하기</span>
                            </button>
                            <span class="error_next_box" id="ipopupMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                        </div>
                        <div class="join_row join_mobile">
                            <h3 class="join_title"><label for="iphoneNo">휴대전화</label></h3>
                            <div class="int_mobile_area">
                                <span class="ps_box int_mobile">
                                    <input type="tel" id="iphoneNo" name="iphoneNo" placeholder="전화번호 입력" aria-label="전화번호 입력" class="int" maxlength="16">
                                </span>
                                <a href="#" class="btn_verify btn_primary" id="btnIpinSend" role="button">
                                    <span class="">인증번호 받기</span>
                                </a>
                            </div>
                            <div class="ps_box_disable box_right_space" id="iauthNoBox">
                                <input type="tel" id="iauthNo" name="iauthNo" placeholder="인증번호 입력하세요" aria-label="인증번호 입력하세요" aria-describedby="iwa_verify" class="int" disabled maxlength="4">
                                <label id="iwa_verify" for="iauthNo" class="lbl">
                                    <span class="wa_blind">인증받은 후 인증번호를 입력해야 합니다.</span>
                                    <span class="input_code" id="iauthNoCode" style="display:none;"></span>
                                </label>
                            </div>
                            <span class="error_next_box" id="iphoneNoMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                            <span class="error_next_box" id="iauthNoMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                            <span class="error_next_box" id="ijoinMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                        </div>
                    </div>
                </div>-->

                <div class="btn_area">
                <!--  type="button" id="btnJoin" 제거함 -->
                    <button class="btn_type btn_primary" type="button" onclick="emptyCheck()"><span>가입하기</span></button>
                </div>
            </div>
        </div>
    </div>
    <!-- // container -->
</form>

<!--가상주민번호-아이핀 팝업페이지 호출시 필요한 form
<form name="form_ipin" method="post" action="">
    <input type="hidden" name="m" value="pubmain">
    <input type="hidden" name="enc_data" value="AgEER0Q0NijBa68qzwbPgFHU41bMd0AOfMnULaZopngC3L0vP99NVDcwpU7+LXl1tLkx5LnMBvCt17uIDUrPEcu66CpyIz4qyNlzs1VhI9/FfUp7WxVUUFlilSQZB3tNcIF4QUi03yyW8oSG9K7xNGagQHlpqxbnDeMh7uLAcLJ04XhV/crngCMaIISO3lPtJgke1NY9G8xFn1RvuDUzLzlFEjmcf3OrViOoEbH6BV4v1rh6dGRRPJTJ3ndBhtHOihMh0API0kz/dxOK1ZZhIDMKhUi/8JRW9tcrcmeEgNSji3LMwYoCmzGV8aMl23bsxb2xHCUtMA==">
</form>
-->
	<!-- footer -->        

	<div id="footer" role="contentinfo">	
		<div class="all_r">
           <span class="text">디자인 저작권은 네이버에 있고 저는 따라 만들었습니다.*^_^*</span>
         </div>
		<ul>
			<li><a href="#">이용약관</a></li>
			<li><strong><a href="#">개인정보처리방침</a></strong></li>
			<li><a href="#">책임의 한계와 법적고지</a></li>
			<li><a href="#" >회원정보 고객센터 </a></li>
		</ul>
		<address>
			<em><a href="#" class="logo"><span class="blind">naver</span></a></em>
			<em class="copy">Copyright</em>
			<em class="u_cri">&copy;</em>
			<a href="#" class="u_cra">NAVER Corp.</a>
			<span class="all_r">All Rights Reserved.</span>
		</address>
	</div>
	<!-- //footer -->
</div>
<!-- 
<script type="text/javascript" src="https://nid.naver.com/inc/common/js/rsaAll.js"></script>
<script type="text/javascript" src="/inc/common/js/lua.js?r=20220411"></script>
<script type="text/javascript" src="/inc/common/js/jquery.min.js"></script>
<script type="text/javascript" src="/inc/common/js/bvsd.1.3.6.js"></script> -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/JavaScript">
//221214 추가) form에 빈값 있는지 확인 : https://do-study.tistory.com/5
function emptyCheck() {
	var is_empty = false;
	for(i=0;i<11;i++){
		if(joinform[i].value == ''){
			alert("값을 전부 입력해주세요.")
			return;
		}
	}
	
	document.joinform.submit();
	alert("가입이 완료되었습니다.")

}

//region define, setter
//필요한 플래그들을 세운다.
var idFlag = false;
var pwFlag = false;
var authFlag = false;
var submitFlag = false;

/*================ 공통 작용 부분 ================*/

//유효성 검증을 하고 전송 플래그를 조절한다. 완료 후 다시 input에 포커스.
function setFocusToInputObject(obj) {
 if(submitFlag) {
     submitFlag = false;
     obj.focus();
 }
}

//경고 메시지 숨기는 함수
function hideMsg(obj) {
 obj.hide();
}


//에러 메시지 발생
function showErrorMsg(obj, msg) {
 obj.attr("class", "error_next_box");
 obj.html(msg);
 obj.show();
}

//성공 메시지 발생
function showSuccessMsg(obj, msg) {
 obj.attr("class", "error_next_box green");
 obj.html(msg);
 obj.show();
}

/*=================================================
 	id 필수입력 / 유효성검사 / 중복체크 기능 (220928 id 완료)
=================================================*/

//id = 'id' 인 input에 플래그가 있다. checkId 함수를 시행한다.
$("#id").blur(function() {
    idFlag = false;
    checkId("first");
});


//id 체크 함수 시행
function checkId(event) {
    if (idFlag) 
        return true;
    
    var id = $("#id").val();
    var oMsg = $("#idMsg");
    var oInput = $("#id");
	
  	//============ [id 필수입력] ============
    if (id == "") {
        showErrorMsg(oMsg, "필수 정보입니다."); //에러메시지 출력
        setFocusToInputObject(oInput); //전송 플래그 조절
        return false;
    }
	
  //============ [id 유효성검사] ============
    var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
    if (!isID.test(id)) {
        showErrorMsg(oMsg, "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다."); //에러메시지 출력
        setFocusToInputObject(oInput); //전송 플래그 조절
        return false;
    }

  //============ [id 중복체크] ============
   /* 
   //기존 네이버 방식 : get
   	idFlag = false;
      var key = $("#token_sjoin").val();
     기존 Naver에서는 맨 상단에 숨겨져있는 input 들에 value 값이 있다. 해당 값을 포함해서 ajax로 서버에 전송해준다.
    	id의 경우 토큰키를 포함해서 보내는 모양. 하지만 나는 그렇게는 하지 않을 예정.

    	//기존 get 방식으로 보내는 naver 중복검사
    	$.ajax({
            type:"GET",
            url: "/user2/joinAjax?m=checkId&id=" + id + "&key=" + key,
            success : function(data) {
                var result = data.substr(4);

                if (result == "Y") {
                    if (event == "first") {
                        showSuccessMsg(oMsg, "멋진 아이디네요!");
                    } else {
                        hideMsg(oMsg);
                    }
                    idFlag = true;
                } else {
                    showErrorMsg(oMsg, "이미 사용중이거나 탈퇴한 아이디입니다.");
                    setFocusToInputObject(oInput);
                }
            }
        });

    	*/
	
    // 추가) ajax 통신으로 DB 데이터 조회해서 중복확인하기!!!(post 방식) 
    idFlag = false; //검사 flag
    let userId = $('input[name=MEMBER_ID]').val(); // input_id에 입력되는 값
    console.log("입력한 id값 : " + userId);
	
  	//id 중복체크를 위해 input에 입력한 id값을 가져와서 ajax data로 반드시 보내줘야한다.
    $.ajax({
        url: "IdCheckService/idcheckAjax",
        type: "post",
        data: {
            userId: userId 
        },
        dataType: 'json',
        success: function (result) {
            //Action에서 받은 result값 : 1이면 사용가능, 0이면 중복됨
            if (result == 0) { //돌려받은 결과가 중복이 존재한다는 0이면

                showErrorMsg(oMsg, "이미 사용중이거나 탈퇴한 아이디입니다."); //에러메시지 출력
                setFocusToInputObject(oInput); //전송 플래그 조절

            } else { //돌려받은 결과가 중복이 없다는 false이면

                if (event == "first") { //그리고 #id라면
                    showSuccessMsg(oMsg, "멋진 아이디네요!"); //에러메시지 출력
                } else {
                    hideMsg(oMsg); //메시지 숨김
                }
                idFlag = true; //id 플래그 1로 변경. 더이상 id alert 발생 x
            }
        },
        error: function () {
            alert("서버요청실패");
        }
    })
    return true;
} //function checkId(event) { 끝






/*================ 제이쿼리 ================*/

// 비밀번호 체크 제이쿼리
$(document).ready(function() {
        defaultScript(); //span 영역 클릭하면 포커스 가게 하는 함수

        if ($("#yy").val() != "") { //년도 비어있는지 먼저 체크
        	
            checkBirthday();
        }

        
		//비밀번호 1 체크 함수 시행
        $("#pswd1").blur(function() {
            pwFlag = false;
            checkPswd1();
        }).keyup(function(event) {
            checkShiftUp(event);
        }).keypress(function(event) {
            checkCapslock(event);
        }).keydown(function(event) {
            checkShiftDown(event);
        });

        $("#pswd2").blur(function() {
            checkPswd2();
        }).keyup(function(event) {
            checkShiftUp(event);
        }).keypress(function(event) {
            checkCapslock2(event);
        }).keydown(function(event) {
            checkShiftDown(event);
        });

        $("#name").blur(function() {
            checkName();
        });

        $("#name1").blur(function() {
            checkName();
        });

        $("#name2").blur(function() {
            checkName();
        });

        $("#yy").blur(function() {
            checkBirthday();
        });

        $("#mm").change(function() {
            checkBirthday();
        });

        $("#dd").blur(function() {
            checkBirthday();
        });

        $("#gender").change(function() {
            checkGender();
        });

        $("#email").blur(function() {
            checkEmail();
        });

        $("#phoneNo").blur(function() {
            checkPhoneNo();
        });

        $("#btnSend").click(function() {
            sendSmsButton(); //이게 핸드폰 인증 버튼 클릭
            return false;
        });

        $("#authNo").blur(function() {
            authFlag = false;
            checkAuthNo();
        });

        $("#tabPrtsMobile").click(function() {
            showJuniverMobileTab();
            return false;
        });

        $("#tabPrtsIpin").click(function() {
            showJuniverIpinTab();
            return false;
        });
        //endregion

        //region prts mobile
        $("#pagree_all").click(function() {
            setPrtsTerms();
        })
        $("#pagree_01").click(function() {
            viewPrtsTerms();
        })
        $("#pagree_02").click(function() {
            viewPrtsTerms();
        })
        $("#pagree_03").click(function() {
            viewPrtsTerms();
        })
        $("#pagree_04").click(function() {
            viewPrtsTerms();
        })
        $("#pagree_05").click(function() {
            viewPrtsTerms();
        })

        $("#pname").blur(function() {
            checkPrtsName();
        });

        $("#pyy").blur(function() {
            checkPrtsBirthday();
        });

        $("#pmm").change(function() {
            checkPrtsBirthday();
        });

        $("#pdd").blur(function() {
            checkPrtsBirthday();
        });

        $("#pgender").change(function() {
            checkPrtsGender();
        });

        $("#pphoneNo").blur(function() {
            checkPrtsPhoneNo();
        });

        $("#btnPrtsSend").click(function() {
            sendPrtsSmsButton(); //얜 아님 모바일이네.
          //  return false;
        })

        $("#pauthNo").blur(function() {
            authFlag = false;
            checkPrtsAuthNo();
        });
        //endregion

        //region ipin popup
        $("#iagree_all").click(function() {
            checkIpinAgree();
        });

        $("#btnIpinPopup").click(function() {
            openIpinPopup();
        });

        $("#iphoneNo").blur(function() {
            checkIpinPhoneNo();
        });

        $("#btnIpinSend").click(function() {
            sendIpinSmsButton();
            return false;
        })

        $("#iauthNo").blur(function() {
            authFlag = false;
            checkIpinAuthNo();
        });
        //endregion

        $("#btnJoin").click(function(event) {
            clickcr(this, 'sup.signup', '', '', event);
            submitClose();
            if(idFlag && pwFlag && authFlag) {
                mainSubmit();
            } else {
                setTimeout(function() {
                    mainSubmit();
                }, 700);
            }
        });

    });
    //endregion

    
 function defaultScript() {
        $('.ps_box').click(function() {
            $(this).children('input').focus();
            $(this).addClass('focus');
        }).focusout(function() {
            var welInputText = $('.ps_box');
            welInputText.removeClass('focus');
        });
    }
/*================ 비밀번호 ================*/    
/*=================================================
 	비밀번호 필수입력 / 유효성검사 / 중복체크 기능
=================================================*/    

//비밀번호1 체크 함수 시행 
   function checkPswd1() {
        if(pwFlag) return true;

        var id = $("#id").val();
        var pw = $("#pswd1").val();
        var oImg = $("#pswd1Img");
        var oSpan = $("#pswd1Span");
        var oMsg = $("#pswd1Msg");
        var oInput = $("#pswd1");

      	//============ [pwd1 필수입력] ============
        if (pw == "") { //공백제한
            showErrorMsg(oMsg,"필수 정보입니다.");
            setFocusToInputObject(oInput); //유효성 검증을 하고 전송 플래그를 조절한다.
            return false;
        }
      	
      	//============ [pwd1 기본 유효성검사] ============
        if (isValidPasswd(pw) != true) { //유효성검사
            showPasswd1ImgByStep(oImg, oSpan, 1); //비밀번호 괜찮은지 오른쪽 자물쇠 이미지
            showErrorMsg(oMsg,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
            setFocusToInputObject(oInput); //유효성 검증을 하고 전송 플래그를 조절한다.
            return false;
        }else if(checkpswd1_sameNum(pw) == true){ //비밀번호 연속동일숫자가 맞으면
        	showPasswd1ImgByStep(oImg, oSpan, 2); //비밀번호 괜찮은지 오른쪽 자물쇠 이미지
            showErrorMsg(oMsg,"보안상 연속된 숫자는 제한합니다.");
            setFocusToInputObject(oInput); //유효성 검증을 하고 전송 플래그를 조절한다.
            return false;
        }
        	
        
      	//============ [pwd1 중복체크] ============
       /*  pwFlag = false;
        $.ajax({
            type:"GET",
            url: "/user2/joinAjax?m=checkPswd&id=" + escape(encodeURIComponent(id)) + "&pw=" + escape(encodeURIComponent(pw)) ,
            success : function(data) {
                var result = data.substr(4);
                if (result == 1) {
                    showPasswd1ImgByStep(oImg, oSpan, 1); //비밀번호 괜찮은지 오른쪽 자물쇠 이미지
                    showErrorMsg(oMsg,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
                    setFocusToInputObject(oInput);//유효성 검증을 하고 전송 플래그를 조절한다.
                    return false;
                } else if (result == 2) {
                    showPasswd1ImgByStep(oImg, oSpan, 2);//비밀번호 괜찮은지 오른쪽 자물쇠 이미지
                    showErrorMsg(oMsg,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
                    setFocusToInputObject(oInput);
                } else if (result == 3) {
                    showPasswd1ImgByStep(oImg, oSpan, 3);//비밀번호 괜찮은지 오른쪽 자물쇠 이미지
                    oMsg.hide();
                } else if (result == 4) {
                    showPasswd1ImgByStep(oImg, oSpan, 4);//비밀번호 괜찮은지 오른쪽 자물쇠 이미지
                    oMsg.hide();
                } else {
                    showPasswd1ImgByStep(oImg, oSpan, 0);//비밀번호 괜찮은지 오른쪽 자물쇠 이미지
                    oMsg.hide();
                }
                pwFlag = true;
                createRsaKey(); //보안키 생성
            }
        });
        return true; */
        
        
     // 추가) ajax 통신으로 컨트롤러단에서 비밀번호 유효성검사하기!(post 방식) 
        pwFlag = false; //검사 flag
        let userPwd = $('input[name=MEMBER_PW]').val(); // input_id에 입력되는 값
        console.log("입력한 Pwd값 : " + userPwd);
     	
      	
        $.ajax({
            url: "PwdCheckService/pwdcheckAjax",
            type: "post",
            data: {
            	userPwd: userPwd 
            },
            dataType: 'json',
            success: function (result) {
            	

               //===========================================
            	  
            	  //왜 굳이 컨트롤러로 보내나? 이유는 보안상의 이유.
            		// 백단에서 1004 이런거 안되게 한다던지, 그런 비밀번호 검증 쿼리가 있을듯.
            		//그리고 감추기도 좋으니까. controller에서 직접 하려는데 안되면 action으로 보내자.
            		//https://lky1.tistory.com/17
                if (result == 1) { //사용불가
                    showPasswd1ImgByStep(oImg, oSpan, 1); //비밀번호 괜찮은지 오른쪽 자물쇠 이미지
                    showErrorMsg(oMsg,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
                    setFocusToInputObject(oInput);//유효성 검증을 하고 전송 플래그를 조절한다.
                    return false;
                } else if (result == 2) { //위험
                    showPasswd1ImgByStep(oImg, oSpan, 2);//비밀번호 괜찮은지 오른쪽 자물쇠 이미지
                    showErrorMsg(oMsg,"보안상 특정문구 및 숫자는 사용불가합니다.(1004, 8282, iloveyou, abc123 등)");
                    setFocusToInputObject(oInput);
                } else if (result == 3) { //보통
                    showPasswd1ImgByStep(oImg, oSpan, 3);//비밀번호 괜찮은지 오른쪽 자물쇠 이미지
                    showErrorMsg(oMsg,"영문자, 숫자, 특수문자 2가지 이상 섞어서 사용하세요.");
                    setFocusToInputObject(oInput);
                } else if (result == 4) { //안전
                    showPasswd1ImgByStep(oImg, oSpan, 4);//비밀번호 괜찮은지 오른쪽 자물쇠 이미지
                    oMsg.hide();
                } else { //빈 자물쇠
                    showPasswd1ImgByStep(oImg, oSpan, 0);//비밀번호 괜찮은지 오른쪽 자물쇠 이미지
                    oMsg.hide();
                }
                pwFlag = true;
                        
            //===========================================
            
            	
            }, 
            error: function () {
                alert("서버요청실패");
            }
        })
        return true;
        
        
        
        
        
    } //function checkPswd1() { 끝
    
 

  	//============ [비밀번호 괜찮은지 오른쪽 자물쇠 이미지] ============

   function showPasswd1ImgByStep(oImg, oSpan, step) {
       if("IE8" == "") {
           return false;
       }
       if(step == 1) {
           oImg.attr("class", "ps_box int_pass_step1");
           oSpan.attr("class", "step_txt txt_red");
           oSpan.html("사용불가");
       } else if(step == 2) {
           oImg.attr("class", "ps_box int_pass_step2");
           oSpan.attr("class", "step_txt txt_orange");
           oSpan.html("위험");
       } else if(step == 3) {
           oImg.attr("class", "ps_box int_pass_step3");
           oSpan.attr("class", "step_txt txt_yellow");
           oSpan.html("보통");
       } else if(step == 4) {
           oImg.attr("class", "ps_box int_pass_step4");
           oSpan.attr("class", "step_txt txt_green");
           oSpan.html("안전");
       } else {
           oImg.attr("class", "ps_box int_pass");
           oSpan.attr("class", "step_txt");
           oSpan.html("");
       }
   }

 	//============ [비밀번호2 체크 함수 시행 -> 자물쇠 말고 아래 글씨로만 표현] ============
    function checkPswd2() {
        var pswd1 = $("#pswd1");
        var pswd2 = $("#pswd2");
        var oMsg = $("#pswd2Msg");
        var oImg = $("#pswd2Img");
        var oBlind = $("#pswd2Blind");
        var oInput = $("#pswd2");

        if (pswd2.val() == "") {
     
            showErrorMsg(oMsg,"필수 정보입니다.");
            oBlind.html("설정하려는 비밀번호가 맞는지 확인하기 위해 다시 입력 해주세요.");
            setFocusToInputObject(oInput);
            return false;
        }
        if (pswd1.val() != pswd2.val()) {
            showErrorMsg(oMsg,"비밀번호가 일치하지 않습니다.");
            setFocusToInputObject(oInput);
            return false;
        } else {
            showSuccessMsg(oMsg,"일치합니다");
            oBlind.html("일치합니다");
            
            //2초뒤 천천히 사라지게 하기
            setTimeout(() => hideMsg(oMsg), 2000);
            
            return true;
        }

        return true;
    }
   

  //============ [비밀번호2 체크 함수 시행 끝] ============
    
    
     
/*=================================================
					키보드 관련 이벤트들
=================================================*/    
     
    //region 공통 함수
    function getLenChar(texts) {
        texts = texts + '';
        return String.fromCharCode(texts.length);
    }



    function checkSpace(str) { //스페이스 제거
        if (str.search(/\s/) != -1) {
            return true;
        } else {
            return false;
        }
    }

  	//============ [pwd1 패스워드 검증] ============
    function isValidPasswd(str) {
    	console.log("입력한 Pwd값 검증1 : " + str);
        if (str == "") {
            return false;
        }

        // 공백 걸러내기
        var retVal = checkSpace(str);
        if (retVal) {
            return false;
        }
        
     	// 8자리 미만 불가
        if (str.length < 8) {
            return false;
        }
     	
     
     	
        //8~12자의 영문 소문자, 숫자, 특수문자만 사용 가능
        var isPW = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{8,16}$/;
        if (!isPW.test(str)) {
            return false;
        }

        return true;
    }
    	
	//  연속된 숫자 불가
  	function checkpswd1_sameNum(str){
  		
	
    	var cnt = 0;
  		 //연속된 숫자 불가
        for (var i = 0; i < str.length; ++i) {
            if (str.charAt(0) == str.substring(i, i + 1))
                ++cnt;
        }
        if (cnt == str.length) {
        	console.log("연속된 숫자");
        	console.log("입력한 Pwd값 검증2 : " + str);
           return true;
        }
    }//============ [pwd1 패스워드 검증 끝] ============	   

	  
	
  	//============ [pwd1,2 패스워드 키보드 제한] ============	
    var isShift = false;
    function checkShiftUp(e) {
        if (e.which && e.which == 16) {
            isShift = false;
        }
    }

    function checkShiftDown(e) {
        if (e.which && e.which == 16) {
            isShift = true;
        }
    }

    function checkCapslock(e) {
        var myKeyCode = 0;
        var myShiftKey = false;
        if (window.event) { // IE
            myKeyCode = e.keyCode;
            myShiftKey = e.shiftKey;
        } else if (e.which) { // netscape ff opera
            myKeyCode = e.which;
            myShiftKey = isShift;
        }

        var oMsg = $("#pswd1Msg");
        if ((myKeyCode >= 65 && myKeyCode <= 90) && !myShiftKey) {
            showErrorMsg(oMsg,"Caps Lock이 켜져 있습니다.");
        } else if ((myKeyCode >= 97 && myKeyCode <= 122) && myShiftKey) {
            showErrorMsg(oMsg,"Caps Lock이 켜져 있습니다.");
        } else {
            hideMsg(oMsg);
        }
    }

    function checkCapslock2(e) {
        var myKeyCode = 0;
        var myShiftKey = false;
        if (window.event) { // IE
            myKeyCode = e.keyCode;
            myShiftKey = e.shiftKey;
        } else if (e.which) { // netscape ff opera
            myKeyCode = e.which;
            myShiftKey = isShift;
        }

        var oMsg = $("#pswd2Msg");
        if ((myKeyCode >= 65 && myKeyCode <= 90) && !myShiftKey) {
            showErrorMsg(oMsg,"Caps Lock이 켜져 있습니다.");
        } else if ((myKeyCode >= 97 && myKeyCode <= 122) && myShiftKey) {
            showErrorMsg(oMsg,"Caps Lock이 켜져 있습니다.");
        } else {
            hideMsg(oMsg);
        }
    }//============ [pwd1,2 패스워드 키보드 제한 끝] ============	
    	
    	
    	
    
    /* 이름, 생일, 성별, 이메일, 휴대전화 */
    

/*================ 이름 빈값, 유효성검사 ================*/
    //이름 체크 함수 시행 
    function checkName() {
        var oMsg = $("#nameMsg");
        var nonchar = /[^가-힣a-zA-Z0-9]/gi;

        var name = $("#name").val();
        var oInput = $("#name");
        if (name == "") {
            showErrorMsg(oMsg,"필수 정보입니다.");
            setFocusToInputObject(oInput);
            return false;
        }
        if (name != "" && nonchar.test(name)) { //이름 유효성검사
            showErrorMsg(oMsg,"한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
            setFocusToInputObject(oInput);
            return false;
        }

        hideMsg(oMsg);
        return true;
    }
    
    
    

    /*================ 생일 ================*/
    //생일 체크 함수 시행 
    function checkBirthday() {
        var birthday;
        var yy = $("#yy").val();
        var mm = $("#mm option:selected").val();
        var dd = $("#dd").val();
        var oMsg = $("#birthdayMsg");
        var lang = "ko_KR";

        var oyy = $("#yy");
        var omm = $("#mm");
        var odd = $("#dd");

        if (yy == "" && mm == "" && dd == "") {
            showErrorMsg(oMsg,"태어난 년도 4자리를 정확하게 입력하세요.");
            setFocusToInputObject(oyy);
            return false;
        }

        if (mm.length == 1) {
            mm = "0" + mm;
        }
        if (dd.length == 1) {
            dd = "0" + dd;
        }

        if(yy == "") {
            showErrorMsg(oMsg,"태어난 년도 4자리를 정확하게 입력하세요.");
            setFocusToInputObject(oyy);
            return false;
        }
        if(yy.length != 4 || yy.indexOf('e') != -1 || yy.indexOf('E') != -1) {
            showErrorMsg(oMsg,"태어난 년도 4자리를 정확하게 입력하세요.");
            setFocusToInputObject(oyy);
            return false;
        }
        if(mm == "") {
            showErrorMsg(oMsg,"태어난 월을 선택하세요.");
            setFocusToInputObject(omm);
            return false;
        }
        if(dd == "") {
            showErrorMsg(oMsg,"태어난 일(날짜) 2자리를 정확하게 입력하세요.");
            setFocusToInputObject(odd);
            return false;
        }
        if(dd.length != 2 || dd.indexOf('e') != -1 || dd.indexOf('E') != -1) {
            showErrorMsg(oMsg,"태어난 일(날짜) 2자리를 정확하게 입력하세요.");
            setFocusToInputObject(odd);
            return false;
        }

        birthday = yy + mm + dd;
        if (!isValidDate(birthday)) {
            showErrorMsg(oMsg,"생년월일을 다시 확인해주세요.");
            setFocusToInputObject(oyy);
            return false;
        }
        $("#birthday").val(birthday);

        var age = calcAge(birthday);
        if (age < 0) {
            showErrorMsg(oMsg,"미래에서 오셨군요. ^^");
            setFocusToInputObject(oyy);
            return false;
        } else if (age >= 100) {
            showErrorMsg(oMsg,"정말이세요?");
            setFocusToInputObject(oyy);
            return false;
        } else if (age < 14) {
            showErrorMsg(oMsg,"만 14세 미만의 어린이는 보호자 동의가 필요합니다.");
            if(lang == "ko_KR") {
                if ($("#joinMode").val() == "unreal") {
                    showJuniverMobileTab();
                }
                return true;
            } else {
                hideJuniverTab();
                return false;
            }
        } else {
            hideMsg(oMsg);
            hideJuniverTab();
            return true;
        }
        return true;
    }

    //성별 체크 함수 시행 
    function checkGender() {
        var gender = $("#gender").val();
        var oMsg = $("#genderMsg");
        var oInput = $("#gender");

        if (gender == "") {
            showErrorMsg(oMsg,"필수 정보입니다.");
            setFocusToInputObject(oInput);
            return false;
        }
        hideMsg(oMsg);
        return true;
    }

    //메일 체크 함수 시행 
    function checkEmail() {
        var id = $("#id").val();
        var email = $("#email").val();
        var oMsg = $("#emailMsg");

        if (email == "") {
            hideMsg(oMsg);
            return true;
        }

        var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        var isHan = /[ㄱ-ㅎ가-힣]/g;
        if (!isEmail.test(email) || isHan.test(email)) {
            showErrorMsg(oMsg,"이메일 주소를 다시 확인해주세요.");
            return false;
        }
        if (email == id + "@naver.com") {
            showErrorMsg(oMsg,"가입중인 아이디는 사용하실 수 없습니다.");
            return false;
        }

        hideMsg(oMsg);
        return true;
    }

    //핸드폰 체크 함수 시행 
    function checkPhoneNo() {
        var phoneNo = $("#phoneNo").val();
        var oMsg = $("#phoneNoMsg");
        var oInput = $("#phoneNo");

        if (phoneNo == "") {
            showErrorMsg(oMsg,"필수 정보입니다.");
            setFocusToInputObject(oInput);
            return false;
        }

        hideMsg(oMsg);
        return true;
    }
	

    //인증번호받기 버튼 함수 시행
    function sendSmsButton() {
   	 var userName = prompt("인증번호를 입력하세요.", "0000");
   	 document.getElementById('authNo').value = userName;
    }


    //인증 함수 시행
    function checkAuthNo() {
     /*    var authNo = $("#authNo").val();
        var oMsg = $("#authNoMsg");
        var oBox = $("#authNoBox");
        var oCode = $("#authNoCode");
        var oInput = $("#authNo");

        if (authNo == "") {
            showErrorMsg(oMsg,"인증이 필요합니다.");
            setFocusToInputObject(oInput);
            return false;
        }

        if(authFlag) {
            showSuccessMsg(oMsg,"인증이 성공했습니다.");
            showAuthSuccessBox(oBox, oCode, "일치");
            $("#phoneNoMsg").hide();
            return true;
        } else {
            checkAuthnoByAjax();
        }
        return true; */
    }

    //인증 함수 시행
    function checkAuthnoByAjax() {
       /*  var authNo = $("#authNo").val();
        var key = $("#token_sjoin").val();
        var oMsg = $("#authNoMsg");
        var oBox = $("#authNoBox");
        var oCode = $("#authNoCode");
        var oInput = $("#authNo");

        $.ajax({
            type:"GET",
            url: "/user2/joinAjax?m=checkAuthno&authno=" + authNo + "&key=" + key ,
            success : function(data) {
                var result = data.substr(4);
                if (result == "S") {
                    showSuccessMsg(oMsg,"인증이 성공했습니다.");
                    showAuthSuccessBox(oBox, oCode, "일치");
                    $("#phoneNoMsg").hide();
                    authFlag = true;
                } else if (result == "Cnt") {
                    showErrorMsg(oMsg,"인증을 다시 진행해주세요.");
                    showAuthErrorBox(oBox, oCode, "불일치");
                    setFocusToInputObject(oInput);
                } else {
                    showErrorMsg(oMsg,"인증번호를 다시 확인해주세요.");
                    showAuthErrorBox(oBox, oCode, "불일치");
                    setFocusToInputObject(oInput);
                }
            }
        });
        return true; */
    }    
    
    
    
    /* 메인함수? */
    //region mainSubmit
    function mainSubmit() {
        var joinMode = $("#joinMode").val();

        if(joinMode == "juniverMobile") {
            if (!checkPrtsMobileInput()) {
                submitOpen();
                return false;
            }
        } else if(joinMode == "juniverIpin") {
            if (!checkPrtsIpinInput()) {
                submitOpen();
                return false;
            }
        } else {
            if (!checkUnrealInput()) {
                submitOpen();
                return false;
            }
        }

        if(idFlag && pwFlag && authFlag) {
            try {
                desk.f(function(a) {
                    $("#nid_kb2").val(a);
                    $("#join_form").submit();
                });
            } catch (e) {
                $("#nid_kb2").val("join v2 error: " + e.name + ", " + e.message);
                $("#join_form").submit();
            }
        } else {
            submitOpen();
            return false;
        }
    }
    
    
    //메인 아래 뭐 필요한 체크사항들
    
    
    function checkUnrealInput() {
        if (checkId('join')
                & checkPswd1()
                & checkPswd2()
                & checkName()
                & checkBirthday()
                & checkGender()
                & checkEmail()
                & checkPhoneNo()
                & checkAuthNo()
        ) {
            return true;
        } else {
            return false;
        }
    }

    function checkPrtsMobileInput() {
        if (checkId('join')
                & checkPswd1()
                & checkPswd2()
                & checkName()
                & checkBirthday()
                & checkGender()
                & checkEmail()
                & checkPrtsAgree()
                & checkPrtsName()
                & checkPrtsBirthday()
                & checkPrtsGender()
                & checkPrtsPhoneNo()
                & checkPrtsAuthNo()
        ) {
            return true;
        } else {
            return false;
        }
    }

    function checkPrtsIpinInput() {
        if (checkId('join')
                & checkPswd1()
                & checkPswd2()
                & checkName()
                & checkBirthday()
                & checkGender()
                & checkEmail()
                & checkIpinAgree()
                & checkIpinPopup()
                & checkIpinPhoneNo()
                & checkIpinAuthNo()
        ) {
            return true;
        } else {
            return false;
        }
    }
    //endregion
    
    /*======================== 기타 등등 유효성검사 ================================*/
    
    
    
    //이름 체크
    function checkPrtsName() {
      /*   var pname = $("#pname").val();
        var oMsg = $("#pnameMsg");
        if (pname == "") {
            showErrorMsg(oMsg,"필수 정보입니다.");
            return false;
        }
        hideMsg(oMsg);
        return true; */
    }
    //생일 체크
    function checkPrtsBirthday() {
      /*   var birthday = $("#birthday").val();
        var pyy = $("#pyy").val();
        var pmm = $("#pmm").val();
        var pdd = $("#pdd").val();
        var oMsg = $("#pbirthdayMsg");

        if (pyy == "" && pmm == "" && pdd == "") {
            showErrorMsg(oMsg,"필수 정보입니다.");
            return false;
        }
        if (pyy == "" || pmm == "" || pdd == "" || pdd.indexOf('e') != -1 || pdd.indexOf('E') != -1) {
            showErrorMsg(oMsg,"생년월일을 다시 확인해주세요.");
            return false;
        }
        if (pmm.length == 1) {
            pmm = "0" + pmm;
        }
        if (pdd.length == 1) {
            pdd = "0" + pdd;
        }

        var pbirthday = pyy + pmm + pdd;
        if (!isValidDate(pbirthday)) { //윤년 등 날짜체크
            showErrorMsg(oMsg,"생년월일을 다시 확인해주세요.");
            return false;
        }
        $("#pbirthday").val(pbirthday);
		
        
        //나이에 따라 메시지 출력
        var age = calcAge(birthday);
        var page = calcAge(pbirthday);
        if (page < 0) {
            showErrorMsg(oMsg,"미래에서 오셨군요. ^^");
            return false;
        } else if (page >= 100) {
            showErrorMsg(oMsg,"정말이세요?");
            return false;
        } else if (page - age < 19) {
            showErrorMsg(oMsg,"보호자(법정대리인) 동의 기준이 맞지 않습니다.");
            return false;
        } else {
            hideMsg(oMsg);
            return true;
        }
        return true; */
    }
    //성별 체크
    function checkPrtsGender() {
/*         var pgender = $("#pgender").val();
        var oMsg = $("#pgenderMsg");

        if (pgender == "") {
            showErrorMsg(oMsg,"필수 정보입니다.");
            return false;
        }
        hideMsg(oMsg);
        return true; */
    }
    //폰번호 체크
    function checkPrtsPhoneNo() {
    /*     var pphoneNo = $("#pphoneNo").val();
        var oMsg = $("#pphoneNoMsg");
        if (pphoneNo == "") {
            showErrorMsg(oMsg,"필수 정보입니다.");
            return false;
        }
        hideMsg(oMsg);
        return true; */
    }
    //인증번호 받기 누르기
    function sendPrtsSmsButton() {
    	
   
       /*  var pname = $("#pname").val();
        var pForeign;
        if($("#pforeign").val() == 0) {
            pForeign = "N";
        } else {
            pForeign = "Y";
        }
        var pGender;
        if( $("#pgender").val() == 0) {
            pGender = "M";
        } else {
            pGender = "F";
        }
        var pbirthday = $("#pbirthday").val();
        var ptelecom = $("#ptelecom").val();
        var pphoneNo = $("#pphoneNo").val();
        var key = $("#token_sjoin").val();
        var oMsg = $("#pphoneNoMsg");

        $("#pauthNoMsg").hide();
        $.ajax({
            type:"GET",
            url: "/user2/joinAjax?m=sendPrtsAuthno&psex=" + pGender + "&pForeign=" + pForeign
                                    + "&pbirthday=" + pbirthday + "&ptelecom=" + ptelecom
                                    + "&pmobno=" + pphoneNo
                                    + "&key=" + key + "&pnm=" + escape(encodeURIComponent(pname)) ,
            success : function(data) {
                var result = data.substr(4);
                if (result == "S") {
                    showSuccessMsg(oMsg,"인증번호를 발송했습니다.(유효시간 30분)<br>인증번호가 오지 않으면 입력하신 정보가 정확한지 확인하여 주세요.<br>이미 가입된 번호이거나, 가상전화번호는 인증번호를 받을 수 없습니다.");
                    $("#pauthNo").attr("disabled", false);
                    var oBox = $("#pauthNoBox");
                    var oCode = $("#pauthNoCode");
                    showAuthDefaultBox(oBox, oCode);
                } else {
                    showErrorMsg(oMsg,"전화번호를 다시 확인해주세요.");
                }
            }
        });
        return false; */
    }

    //인증번호 입력하세요 란
    function checkPrtsAuthNo() {
      /*   var pauthNo = $("#pauthNo").val();
        var oMsg = $("#pauthNoMsg");
        var oBox = $("#pauthNoBox");
        var oCode = $("#pauthNoCode");

        if (pauthNo == "") {
            showErrorMsg(oMsg,"인증이 필요합니다.");
            return false;
        }

        if(authFlag) {
            showSuccessMsg(oMsg,"인증이 성공했습니다.");
            showAuthSuccessBox(oBox, oCode, "일치");
            $("#pphoneNoMsg").hide();
            return true;
        } else {
            checkPrtsAuthnoByAjax();
        }
        return true; */
    }

    // 인증번호 입력하세요 란
    function checkPrtsAuthnoByAjax() {
      /*   var pname = $("#pname").val();
        var pForeign;
        if($("#pforeign").val() == 0) {
            pForeign = "N";
        } else {
            pForeign = "Y";
        }
        var pGender;
        if( $("#pgender").val() == 0) {
            pGender = "M";
        } else {
            pGender = "F";
        }
        var pbirthday = $("#pbirthday").val();
        var ptelecom = $("#ptelecom").val();
        var pphoneNo = $("#pphoneNo").val();
        var pauthNo = $("#pauthNo").val();
        var key = $("#token_sjoin").val();
        var oMsg = $("#pauthNoMsg");
        var oBox = $("#pauthNoBox");
        var oCode = $("#pauthNoCode");

        $.ajax({
            type:"GET",
            url: "/user2/joinAjax?m=checkPrtsAuthno&psex=" + pGender + "&pForeign=" + pForeign
                                        + "&pbirthday=" + pbirthday + "&ptelecom=" + ptelecom
                                        + "&pmobno=" + pphoneNo
                                        + "&pauthno=" + pauthNo
                                        + "&key=" + key + "&pnm=" + escape(encodeURIComponent(pname)) ,
            success : function(data) {
                var result = data.substr(4);
                if (result == "S") {
                    showSuccessMsg(oMsg,"인증이 성공했습니다.");
                    showAuthSuccessBox(oBox, oCode, "일치");
                    $("#pphoneNoMsg").hide();
                    authFlag = true;
                } else if (result == "Cnt") {
                    showErrorMsg(oMsg,"인증을 다시 진행해주세요.");
                    showAuthErrorBox(oBox, oCode, "불일치");
                } else {
                    showErrorMsg(oMsg,"인증번호를 다시 확인해주세요.");
                    showAuthErrorBox(oBox, oCode, "불일치");
                }
            }
        });
        return true; */
    }
    //endregion

    
/* 여기서부터 인증번호 받기 전에 아이핀인지 뭔지 따지는거 */    
    
    //region joinPrtsIpin
    function checkIpinAgree() {
     /*    var oMsg = $("#iagreeMsg");
        if (!$("#iagree_all").is(":checked")) {
            showErrorMsg(oMsg, "동의사항에 체크해 주세요.");
            return false;
        }
        hideMsg(oMsg);
        return true; */
    }

    function openIpinPopup() {
        /* var ua = window.navigator.userAgent.toLowerCase();

        if ((/crios/.test(ua) || (navigator.userAgentData && navigator.userAgentData.platform.indexOf('iOS') !== -1 && (navigator.userAgentData.brands.some(function(v) { return /Chrome/i.test(v.brand) })))) && /ipad/.test(ua)) {
            alert("접속하신 브라우저에서는 아이핀 인증이 진행되지 않습니다.");
            return false;
        }

        winOpenAtCenter('', 'popup', 448, 500, "auto");
        document.form_ipin.target = "popup";
        document.form_ipin.action = "https://cert.vno.co.kr/ipin.cb";
        document.form_ipin.submit();
        return true; */
    }

    function checkIpinPopup() {
      /*   var ipinFlag = $("#ipinFlag").val();
        var oMsg = $("#ipopupMsg");

        if(ipinFlag != "Y") {
            showErrorMsg(oMsg, "아이핀 인증이 필요합니다.");
            return false;
        }
        hideMsg(oMsg);
        return true; */
    }

    function checkIpinPhoneNo() {
       /*  var phoneNo = $("#iphoneNo").val();
        var oMsg = $("#iphoneNoMsg");

        if (phoneNo == "") {
            showErrorMsg(oMsg,"필수 정보입니다.");
            return false;
        }
        hideMsg(oMsg);
        return true; */
    }

    function sendIpinSmsButton() {
/*         var nationNo = "82";
        var phoneNo = $("#iphoneNo").val();
        var key = $("#token_sjoin").val();
        var oMsg = $("#iphoneNoMsg");
        var lang = "ko_KR";

        phoneNo = phoneNo.replace(/ /gi, "").replace(/-/gi, "");
        $("#iphoneNo").val(phoneNo);
        authFlag = false;

        $("#iauthNoMsg").hide();
        if(nationNo == "82" && !isCellPhone(phoneNo)) {
            showErrorMsg(oMsg,"형식에 맞지 않는 번호입니다.");
            return false;
        }
        $.ajax({
            type:"GET",
            url: "/user2/joinAjax?m=sendAuthno&nationNo=" + nationNo + "&mobno=" + phoneNo + "&lang=" + lang + "&key=" + key ,
            success : function(data) {
                var result = data.substr(4);
                if (result == "S") {
                    showSuccessMsg(oMsg,"인증번호를 발송했습니다.(유효시간 30분)<br>인증번호가 오지 않으면 입력하신 정보가 정확한지 확인하여 주세요.<br>이미 가입된 번호이거나, 가상전화번호는 인증번호를 받을 수 없습니다.");
                    $("#iauthNo").attr("disabled", false);
                    var oBox = $("#iauthNoBox");
                    var oCode = $("#iauthNoCode");
                    showAuthDefaultBox(oBox, oCode);
                } else {
                    showErrorMsg(oMsg,"전화번호를 다시 확인해주세요.");
                }
            }
        });
        return true; */
    }

    function checkIpinAuthNo() {
      /*   var authNo = $("#iauthNo").val();
        var oMsg = $("#iauthNoMsg");
        var oBox = $("#iauthNoBox");
        var oCode = $("#iauthNoCode");

        if (authNo == "") {
            showErrorMsg(oMsg,"인증이 필요합니다.");
            return false;
        }

        if(authFlag) {
            showSuccessMsg(oMsg,"인증이 성공했습니다.");
            showAuthSuccessBox(oBox, oCode, "일치");
            hideMsg(oMsg);
            return true;
        } else {
            checkIpinAuthnoByAjax();
        }
        return true; */
    }

    function checkIpinAuthnoByAjax() {
      /*   var authNo = $("#iauthNo").val();
        var key = $("#token_sjoin").val();
        var oMsg = $("#iauthNoMsg");
        var oBox = $("#iauthNoBox");
        var oCode = $("#iauthNoCode");

        $.ajax({
            type:"GET",
            url: "/user2/joinAjax?m=checkAuthno&authno=" + authNo + "&key=" + key ,
            success : function(data) {
                var result = data.substr(4);
                if (result == "S") {
                    showSuccessMsg(oMsg,"인증이 성공했습니다.");
                    showAuthSuccessBox(oBox, oCode, "일치");
                    $("#iphoneNoMsg").hide();
                    authFlag = true;
                } else if (result == "Cnt") {
                    showErrorMsg(oMsg,"인증을 다시 진행해주세요.");
                    showAuthErrorBox(oBox, oCode, "불일치");
                } else {
                    showErrorMsg(oMsg,"인증번호를 다시 확인해주세요.");
                    showAuthErrorBox(oBox, oCode, "불일치");
                }
            }
        });
        return true; */
    }

    function setIpinFlag(val) {
      /*   var oMsg = $("#ipopupMsg");

        $("#ipinFlag").val(val);
        if (val == "Y") {
            showSuccessMsg(oMsg,"인증이 성공했습니다.");
            return true;
        } else {
            showErrorMsg(oMsg,"인증에 실패했습니다.");
            return false;
        } */
    }
    //endregion



   

    function submitClose() { // 가입하기 누르고 mainsubmit 보내고
        submitFlag = true;
        $("#btnJoin").attr("disabled",true);
    }

    function submitOpen() { //뭐 창을 여나본데
        $("#btnJoin").attr("disabled",false);
    }



   

    function showAuthDefaultBox(oBox, oCode) { //인증번호받기 박스
      /*   oBox.attr("class", "ps_box");
        oCode.html("");
        oCode.hide(); */
    }

    function showAuthSuccessBox(oBox, oCode, msg) { //인증 성공
      /*   oBox.attr("class", "ps_box accord");
        oCode.html(msg);
        oCode.show(); */
    }

    function showAuthErrorBox(oBox, oCode, msg) { //인증 실패
        /* oBox.attr("class", "ps_box discord");
        oCode.html(msg);
        oCode.show(); */
    }

  

    
    

    /*================ 기타 계산 로직 ================*/
    

   
	//나이 계산하는 함수
    function calcAge(birth) {
        var date = new Date();
        var year = date.getFullYear();
        var month = (date.getMonth() + 1);
        var day = date.getDate();
        if (month < 10)
            month = '0' + month;
        if (day < 10)
            day = '0' + day;
        var monthDay = month + '' + day;

        birth = birth.replace('-', '').replace('-', '');
        var birthdayy = birth.substr(0, 4);
        var birthdaymd = birth.substr(4, 4);

        var age = monthDay < birthdaymd ? year - birthdayy - 1 : year - birthdayy;
        return age;
    }
	
	
	
	//날짜 유효성
    function isValidDate(param) {
        try {
            param = param.replace(/-/g, '');

            // 자리수가 맞지않을때
            if (isNaN(param) || param.length != 8) {
                return false;
            }

            var year = Number(param.substring(0, 4));
            var month = Number(param.substring(4, 6));
            var day = Number(param.substring(6, 8));

            if (month < 1 || month > 12) {
                return false;
            }

            var maxDaysInMonth = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
            var maxDay = maxDaysInMonth[month - 1];

            // 윤년 체크
            if (month == 2 && (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)) {
                maxDay = 29;
            }

            if (day <= 0 || day > maxDay) {
                return false;
            }
            return true;

        } catch (err) {
            return false;
        }
        ;
    }

	
	//휴대폰 번호 유효성검사
    function isCellPhone(p) {
        var regPhone = /^((01[1|6|7|8|9])[1-9][0-9]{6,7})$|(010[1-9][0-9]{7})$/;
        return regPhone.test(p);
    }

    function winOpenAtCenter(sURL, sWindowName, w, h, sScroll) {
        // 화면 중앙으로 Popup 띄우기.. 스크롤바는 옵션..
        // ex)
        // openWin("test.asp", "winTest", 400, 300); ☞ 스크롤바 없음
        // openWin("test.asp", "winTest", 400, 300, "yes"); ☞ 스크롤바 있음
        // openWin("test.asp", "winTest", 400, 300, "auto"); ☞ 스크롤바 자동

        var x = (screen.width - w) / 2;
        var y = (screen.height - h) / 2;

        if (sScroll == null)
            sScroll = "no";

        var sOption = "";
        sOption = sOption + "toolbar=no, channelmode=no, location=no, directories=no, resizable=no, menubar=no";
        sOption = sOption + ", scrollbars=" + sScroll + ", left=" + x + ", top=" + y + ", width=" + w + ", height=" + h;

        var win = window.open(sURL, sWindowName, sOption);
        return win;
    }
    //endregion
    
    
    
    /* 모바일들 관련사항 같음 */
    
    function hideJuniverTab() {
        $("#joinMode").val("unreal");
        $("#mobDiv").show();
        $("#pmobDiv").hide();
        $("#pipinDiv").hide();
        return true;
    }

    function showJuniverMobileTab() {
        $("#joinMode").val("juniverMobile");
        $("#mobDiv").hide();
        $("#pmobDiv").show();
        $("#pipinDiv").hide();
        return true;
    }

    function showJuniverIpinTab() {
        $("#joinMode").val("juniverIpin");
        $("#mobDiv").hide();
        $("#pmobDiv").hide();
        $("#pipinDiv").show();
        return true;
    }
    //endregion

    //region joinPrtsMobile
    function checkPrtsAgree() {
        var oMsg = $("#pagreeMsg");
        if (!$("#pagree_all").is(":checked")) {
            showErrorMsg(oMsg, "약관에 모두 동의해주세요.");
            return false;
        }
        hideMsg(oMsg);
        return true;
    }

    function setPrtsTerms() {
        if ($("#pagree_all").is(":checked")) {
            $("#pagree_01").prop("checked",true);
            $("#pagree_02").prop("checked",true);
            $("#pagree_03").prop("checked",true);
            $("#pagree_04").prop("checked",true);
            $("#pagree_05").prop("checked",true);
        } else {
            $("#pagree_01").prop("checked",false);
            $("#pagree_02").prop("checked",false);
            $("#pagree_03").prop("checked",false);
            $("#pagree_04").prop("checked",false);
            $("#pagree_05").prop("checked",false);
        }
        checkPrtsAgree();
        return true;
    }

    function viewPrtsTerms() {
        if( !$("#pagree_01").is(":checked")
                || !$("#pagree_02").is(":checked")
                || !$("#pagree_03").is(":checked")
                || !$("#pagree_04").is(":checked")
                || !$("#pagree_05").is(":checked")) {
            $("#pagree_all").prop("checked",false);
        }
        if( $("#pagree_01").is(":checked")
                && $("#pagree_02").is(":checked")
                && $("#pagree_03").is(":checked")
                && $("#pagree_04").is(":checked")
                && $("#pagree_05").is(":checked")) {
            $("#pagree_all").prop("checked",true);
        }
        checkPrtsAgree();
        return true;
    }
    
/* ===========================================================================================
    //region define, setter
    var idFlag = false;
    var pwFlag = false;
    var authFlag = false;
    var submitFlag = false;

    var properties = {
        keyboard: [{id:"id"}, {id:"pswd1", secureMode:true}, {id:"pswd2", secureMode:true}],
        modeProperties: {
            mode: 4
        }
    };
    var desk = new sofa.Koop(properties);

  */
  
  
</script>
</body>

<!-- ------------------- 메모 부분 ------------------- 


1. 라벨값은 id 값과 같은걸 쓴다. label for=
2. DB와 소통하는 것은 name값이다.
3. 아이디 입력란에는 키보드 입력시 발생하는 onkeydown 이벤트를 추가했다. 
이 이벤트를 사용하는 것은 만약 사용자가 중복체크를 하고 난 뒤 아이디 입력란에 사용 가능한 아이디를 지우고 
새로운 아이디를 입력했을 경우에 대처하기 위함이다. 이렇게 하면 중복체크가 되지 않은 것으로 처리되도록 한다.

















  ------------------- 메모 부분 ------------------- -->

</html>