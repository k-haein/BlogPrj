<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<style>
.joinTable { /*클래스로 설정*/
	width: 400px;
	height: 200px;
	border: 5px solid grey; /*solid는 테두리*/
	border-collapse: collapse; /*테두리 사이의 간격 없애기*/
}

#pwdConfirm { /*id로 설정하면 한번만 사용함*/
	padding: 10px;
}

th, td {
	padding: 10px !important; /*important는 0순위 의미 im>id>Class>Tag 순*/
}
</style>


</head>
<body>
	<span>회원가입</span>
	<div>
		<section id="joinformArea">
			<!-- section은 body를 나눔 -->
			<form name="joinform" action="./memberJoinAction.me" method="post">

				<table class='joinTable'> 
					<tr>
						<td>아이디</td>
						<td><input type="text" name="MEMBER_ID" id="MEMBER_ID"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="MEMBER_PW" id="MEMBER_PW"></td>
					</tr>
					<tr>
						<td id='pwdConfirm'>비밀번호 확인</td>
						<td><input type="password" name="MEMBER_PW_cfm" id="MEMBER_PW_cfm"></td>
					</tr>
					<tr>
						<td colspan="2"><button href="javascript:joinUs.submit()">회원가입</button>
						<a href="javascript:joinform.reset()">다시작성</a></td>
					</tr>
				</table>
				<br> <span><input type="checkBox"><a
					href="https://www.naver.com" target='_blank'>이용약관</a>에 동의합니다.</span>
			</form>
		</section>
	</div>
</body>

<!-- ------------------- 메모 부분 ------------------- 

1. label태그에는 <label>태그를 클릭하면, 동일한 아이디값을 가진 <input>태그에 자동으로 포커스가 되는 기능이 포함되어 있습니다. 
이 기능을 사용하기 위해서 <input>태그의 아이디값과 <label>태그의 아이디값을 "id"로 동일하게 설정했습니다.





















  ------------------- 메모 부분 ------------------- -->

</html>