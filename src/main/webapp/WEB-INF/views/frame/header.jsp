<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
<a href="/"> 홈</a>
<% if(session.getAttribute("info") != null){
 %>
<a href="/user/login" id="logout" >로그아웃</a>
 <%
 }
 %>
<script type="text/javascript">
$(document).ready(function(){
	$("#logout").on("click", function(){
		<% session.removeAttribute("info");%>
		alert("로그아웃");
	})
	});
</script>
</body>
</html>