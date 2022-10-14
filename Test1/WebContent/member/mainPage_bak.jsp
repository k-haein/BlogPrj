<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.MemberBean"%>
<%@ page import="java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 빨간줄 그어지는데 jstl 설치 안해서 그럼. lib에 넣어준다. jsp 확장태그로 c로 쓴다.-->


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 시스템 관리자</title>
</head>
<body>
	        <section id="memberListArea">
		<table>
			<tr>
				<td colspan=2>
					<h1>회원 목록</h1>
				</td>
			</tr>
			<c:forEach var="postList" items="${postList}">
				<tr>
			<td>포스팅 제목</td>
			<td>${postList.POST_TITLE}</td>
		</tr>
		
		<tr>
			<td>포스트 쓴 회원 번호</td>
			<td>${postList.MEM_NO}</td>
		</tr>
			</c:forEach>

		</table>
	</section>

</body>
</html>