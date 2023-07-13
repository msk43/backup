<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="mMgr" class="member.MemberMgr" />

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
boolean result = mMgr.checkId(id);
// 중복 체크 결과를 부모 창으로 전달
response.setContentType("text/plain");
response.getWriter().print(result);
response.getWriter().close();
%>
<html>
<head>
<title>ID 중복체크</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
    function setIdResult(result) {
        opener.document.regFrm.id.value = "<%=id%>";
        if (result) { // 중복이라 가입x
            opener.document.regFrm.idCheck.value = "true";
            opener.document.getElementById("idCheckResult");
        } else { // 중복이 아니여서 가입o
            opener.document.regFrm.idCheck.value = "false";
            opener.document.getElementById("idCheckResult");
        }
        self.close();
    }
        }
        
        
    </script>
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br /> <b><%=id%></b>
		<%
		if (result) {
			out.println("는 이미 존재하는 ID입니다.<p/>");
		} else {
			out.println("는 사용 가능합니다.<p/>");
		}
		%>
		
		<button onclick="setIdResult(<%=result%>);">선택</button>
		<button onclick="self.close();">닫기</button>
	</div>
</body>
</html>
