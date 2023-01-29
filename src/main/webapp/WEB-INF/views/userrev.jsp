<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${param.page} 페이지의 게시물 출력</h1>

<table border=3>
	<tr><td>유저네임</td><td>이름</td><td>역활</td><td>관리자 유무</td></tr>
	<c:forEach items="${list}" var = "board"> <!-- list라는 이름의 모델 -->
		<tr><td>${board.username}</td><td>${board.name}</td><td>${board.role}</td><td>${board.isAdmin}</td></tr>
	</c:forEach>
</table>
<% 
	int totalcount = (Integer)request.getAttribute("totalboard"); /* totalboard라는 이름의 모델 */
	int totalpage = 0;
	if(totalcount % 5 == 0){
		totalpage = totalcount / 5;
	}
	else{
		totalpage = totalcount / 5 + 1;
	}
	for(int i = 1; i <= totalpage; i++){
	%>
	<a href = "userrev?page=<%=i %>"><%=i %>페이지</a>	
	<%}%>

</body>
</html>