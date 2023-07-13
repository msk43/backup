<%@ page contentType="text/html; charset=UTF-8" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String loggedInId = (String) session.getAttribute("idKey");

%> 
<html>
<head>
<title>임시 정보수정</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script2.js"></script>
<script type="text/javascript">
	
	function zipSearch() {
		url = "zipSearch.jsp?search=no";
		window.open(url, "ZipCodeSearch","width=500,height=300,scrollbars=yes");
	}
	
	function codeCheck(code) {
		frm = document.regFrm;
		if (code == "") {
			alert("사원번호를 입력해 주세요.");
			frm.code.focus();
			return;
		}
		url = "codeCheck.jsp?code=" + code;
		window.open(url, "CODECheck", "width=300,height=150");
	}
</script>
</head>
<body bgcolor="" onload="document.getElementsByName('regFrm')[0].id.focus()">
	<%
	
	if (loggedInId == null || loggedInId.isEmpty()) {
        response.sendRedirect("login.jsp"); // 로그인 페이지로 리디렉션
        return;
    }
	
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String tel = tel1 + "-" + tel2 + "-" + tel3;
	
	%>
	
	<div align="center">
		<br /> <br />
		<form id="regFrm" method="post" action="updateProc.jsp">
			<table cellpadding="5">
				<tr>
					<td bgcolor="">
						<table border="1" cellspacing="0" cellpadding="2" width="600">
							<tr bgcolor="#996600">
								<td colspan="3"><font color="#FFFFFF"><b>임시 회원정보 수정</b></font></td>
							</tr>
							<tr>
								<td width="20%">현재 로그인된 아이디</td>
								<td width="50%"><input name="id" size="15" value="<%= loggedInId %>" readonly></td>
							</tr>
							<tr>
								<td>패스워드</td>
								<td><input type="password" name="pwd" size="15"></td>

							</tr>
							<tr>
								<td>패스워드 확인</td>
								<td><input type="password" name="repwd" size="15"></td>

							</tr>
							<tr>
								<td>전화번호</td>
								<td><select name="tel1">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="012">012</option>
								</select> <input name="tel2" size="6" maxlength="4"> - <input
									name="tel3" size="6" maxlength="4"> 
									<input name="tel" type="hidden" value="<%= tel != null && !tel.isEmpty() ? tel : "" %>" />
									</td>
							</tr>
							<tr>
								<td>Email</td>
								<td><input type="email" name="email" size="20"></td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td><input name="zipcode" size="5" readonly>
									<input type="button" value="우편번호찾기" onClick="zipSearch()">
								</td>
							</tr>
							<tr>
								<td>상세주소</td>
								<td><input name="address" size="35"></td>
							</tr>
							<tr>
								<td>사원번호</td>
								<td width="50%"><input name="code" size="6" maxlength="4">
									<input type="button" value="사원번호 중복확인"
									onClick="codeCheck(this.form.code.value)"></td>
							</tr>
							<tr>
								<td colspan="3" align="center">						
								<input type="button" value="회원정보 수정" onclick="inputCheck();"> 
								&nbsp;&nbsp; 
								<input type="button" value="뒤로가기" onclick="history.back();"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
