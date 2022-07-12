<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원상세정보</title>
</head>
<body>
	<table>
		<tr>
			<td>아이디:</td>
			<td>${member.MEMBER_ID}</td>
		</tr>
		
		<tr>
			<td>비밀번호:</td>
			<td>${member.MEMBER_PW}</td>
		</tr>
		
	
	</table>

</body>
</html>