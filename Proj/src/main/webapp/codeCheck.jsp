<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:useBean id="mMgr" class="member.MemberMgr" />

<%
request.setCharacterEncoding("UTF-8");
String code = request.getParameter("code");
boolean result = mMgr.checkCode(code);
// 중복 체크 결과를 부모 창으로 전달
response.setContentType("text/plain");
response.getWriter().print(result);
response.getWriter().close();
%>

<html>
<head>
    <title>Code 중복체크</title>
    <link href="style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" >
    function setCodeResult(result) {
        opener.document.regFrm.code.value = "<%=code%>";
        if (result) {
            opener.document.regFrm.codeCheck.value = "true";
            opener.document.getElementByCode("codeCheckResult").innerHTML = "<font color='red'>이미 존재하는 Code입니다.</font>";
        } else {
            opener.document.regFrm.codeCheck.value = "false";
            opener.document.getElementByCode("codeCheckResult").innerHTML = "<font color='green'>사용 가능한 Code입니다.</font>";
        }
        self.close();
    }
        }
        function closeWindow() {
            window.close(); // 현재 창 닫기
        }
    </script>
</head>
<body bgcolor="#FFFFCC">
<div align="center">
    <br/><b><%= code %></b>
    <%
        if (result) {
            out.println("는 이미 존재하는 Code입니다.<p/>");
        } else {
            out.println("는 사용 가능합니다.<p/>");
        }
    %>
    <a href="#" onClick="closeWindow()">닫기</a>
</div>
</body>
</html>
