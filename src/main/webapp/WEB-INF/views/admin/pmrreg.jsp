<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../frame/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insert title here</title>
    <script src="<c:url value="/static/js/pmrreg.js"/>"></script>
    <script>
        function checkOnlyOne(element) {
            const checkboxes
                = document.getElementsByName("matchId");

            checkboxes.forEach((cb) => {
                cb.checked = false;
            })

            element.checked = true;
        }
    </script>

</head>
<body>
<jsp:include page="../frame/header.jsp"/>
<br>
action 등록
<form id="pmrreg-form">

    <table class="table-auto">  <!-- border="1"> -->
        <th></th>
        <th></th>
        <th></th>
        <tr>
            <td>
                <div>매칭 번호<br>
                    <input type='checkbox' id='matchId' name='matchId' value="${matchList[0].id }"
                           onclick='checkOnlyOne(this)'/> ${matchList[0].id }
                    <br/>
                    <input type='checkbox' id='matchId' name='matchId' value="${matchList[1].id }"
                           onclick='checkOnlyOne(this)'/> ${matchList[1].id }
                    <br/>
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <input type="hidden" name="type1" id="type1" value="penalty">
            <td><label>벌칙<br><TEXTAREA NAME="task1" id="task1" COLS=70 ROWS=4></TEXTAREA><br></label></td>
            <input type="hidden" name="type2" id="type2" value="mission">
            <td><label>미션<br><TEXTAREA NAME="task2" id="task2" COLS=70 ROWS=4></TEXTAREA><br></label></td>
            <input type="hidden" name="type3" id="type3" value="reward">
            <td><label>보상<br><TEXTAREA NAME="task3" id="task3" COLS=70 ROWS=4></TEXTAREA><br></label></td>
        </tr>
        <tr>
            <td>
                <button id="penalty-btn">벌칙 등록</button>
            </td>
            <td>
                <button id="mission-btn">미션 등록</button>
            </td>
            <td>
                <button id="reward-btn">보상 등록</button>
            </td>
        </tr>
    </table>
</form>


</body>
</html>