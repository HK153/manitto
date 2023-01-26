<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../frame/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="<c:url value="/static/js/pmrreg.js"/>"></script>
</head>
<body>
<jsp:include page="../frame/header.jsp" /><br>
action 등록
<form id="pmrreg-form">
<INPUT TYPE="RADIO" NAME=type id="penalty" VALUE=1> 벌칙
<INPUT TYPE="RADIO" NAME=type id="mission" VALUE=2> 미션
<INPUT TYPE="RADIO" NAME=type id="reward" VALUE=3> 보상
<input type="hidden" name="matchId" id="matchId" value=1>

 <TEXTAREA NAME="task" id="task" COLS=70 ROWS=4></TEXTAREA><br> 
 <button id="pmrreg-btn">등록</button>
</form>




</body>
</html>