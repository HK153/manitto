<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="frame/common.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manitto | Matches</title>
</head>
<body>
<jsp:include page="frame/header.jsp"/>
<div class="layout bg-bottom bg-no-repeat align-middle flex justify-center"
     style="">
    <div class="bg-yellow-200 h-30 w-1/2 ">
       매치 리스트 페이지
        <div id="match-list">
           
        </div>
        <div>
        
        <button class="btn" onclick="location.href='match-detail1'"> ${match1} 번째 마니또 </button>
        <button class="btn" onclick="location.href='match-detail2'"> ${match2} 번째 마니또 </button>
        
        </div>
        
        
        <div>
        
        
      
        </div>
    </div>
</div>
<jsp:include page="frame/footer.jsp"/>
</body>
</html>