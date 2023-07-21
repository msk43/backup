<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="member.MemberMgr"%>
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("idKey");
String role = null;
if (id != null) {
	// 로그인한 경우
	MemberMgr memberMgr = new MemberMgr();
	role = memberMgr.getRole(id);
}
%>
<html>
<head>
<title>로그인</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function loginCheck() {
		if (document.loginFrm.id.value == "") {
			alert("아이디를 입력해 주세요.");
			document.loginFrm.id.focus();
			return;
		}
		if (document.loginFrm.pwd.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.loginFrm.pwd.focus();
			return;
		}
		document.loginFrm.submit();
	}
</script>
</head>
<body bgcolor="">
	<div align="center">
		<br /> <br />
		<%
		if (id != null) {
			if (role != null && role.equals("admin")) {
				response.sendRedirect("admin.jsp");
			} else if (role != null && role.equals("user")){
				response.sendRedirect("user.jsp");
			} else {
				response.sendRedirect("guest.jsp");
			}
		} else {
		%>
		<form name="loginFrm" method="post" action="loginProc.jsp">
			<table>
				<tr>
					<td align="center" colspan="2"><h4>로그인</h4></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input name="id"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="right">
							<input type="button" value="로그인" onclick="loginCheck()">&nbsp;
							<input type="button" value="회원가입"
								onClick="javascript:location.href='member.jsp'">
						</div>
					</td>
				</tr>
			</table>
		</form>
		<%
		}
		%>

	</div>
</body>
</html>
