<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
</head>
<body>
	<table>
		<tr>
			<td>게시글 제목:</td>
			<td>${postObj.POST_TITLE}</td>
		</tr>
		
		<tr>
			<td>게시글 내용:</td>
			<td>${postObj.POST_CONTENT}</td>
		</tr>
		
		
		<tr>
			<td>게시글 시간:</td>
			<td>${postObj.POST_UPLOADTIME}</td>
		</tr>
		<tr>
			<td>게시글 작성자:</td>
			<td>${postObj.MEM_NO}</td>
		</tr>
		
	
	</table>

</body>
</html>