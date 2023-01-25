<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="frame/header.jsp" /><br>
pmr lookup
<form action="">
<INPUT TYPE=RADIO NAME=rdo VALUE=penalty CHECKED> 벌칙
<INPUT TYPE=RADIO NAME=rdo VALUE=mission> 미션
<INPUT TYPE=RADIO NAME=rdo VALUE=reward> 보상


 <TEXTAREA NAME=txtComment COLS=70 ROWS=4></TEXTAREA><br> 
 <button>등록</button>
</form>




</body>
</html>