<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="frame/common.jsp" %>
<html>
<head>
    <title>Manitto | Admin</title>
    <script src="<c:url value="/static/js/admin.js"/>"></script>
</head>
<body>

<jsp:include page="frame/header.jsp" /><br>
<h1>관리자 페이지 입니다.반갑습니다.</h1>


<h3>
	<ul>
		<li><a href="<%=request.getContextPath()%>/user/pmrreg">벌칙, 미션, 보상 등록 </a></li>
		<li><a href="<%=request.getContextPath()%>/user/pmr">벌칙, 미션, 보상 조회 </a></li>
		<li><a href="<%=request.getContextPath()%>/user/userrev">전체 유저 조회 </a></li>
		<li><a href="<%=request.getContextPath()%>/user/currentmani">현재 마니또 참여 그룹 </a></li>	
	</ul>
</h3>



</body>
</html>
