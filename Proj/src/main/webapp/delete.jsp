<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="member.MemberMgr" %>
<%
// 현재 로그인한 사용자의 권한 가져오기
String role = (String) session.getAttribute("role");

// 권한에 따른 페이지 접근 제어
if (role == null) {
    // 로그인하지 않은 경우, 로그인 페이지로 이동
    response.sendRedirect("login.jsp");
} else if (role.equals("admin")) {
    // 관리자 권한의 경우에만 접속 가능
    %>
    <!DOCTYPE html>
    <html>
    <head>
        <title>회원 삭제</title>
    </head>
    <body>
        <h1>회원 삭제</h1>
        <p>삭제하려는 회원의 아이디와 관리자 비밀번호를 입력해주세요.</p>
        <form method="post" action="deleteProc.jsp">
            <label for="username">계정 아이디:</label>
            <input type="text" id="username" name="username" required><br>   
            <label for="adminPassword">관리자 비밀번호:</label>
            <input type="password" id="adminPassword" name="adminPassword" required><br>
            <input type="submit" value="회원 삭제">
        </form>
    </body>
    </html>
    <%
} else {
    // 관리자 권한이 아닌 경우 접속불가 페이지로 이동
    response.sendRedirect("access-denied.jsp");
}
%>
