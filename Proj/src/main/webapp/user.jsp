user.jsp
<%@ page contentType="text/html; charset=UTF-8" %>
<%
// 현재 로그인한 사용자의 권한 가져오기
String role = (String) session.getAttribute("role");

// 권한에 따른 페이지 접근 제어
if (role == null) {
    // 로그인하지 않은 경우, 로그인 페이지로 이동
    response.sendRedirect("login.jsp");
} else if (role.equals("user") || role.equals("admin")) {
    // user 및 admin 권한의 경우 접속 가능
    %>
    <!DOCTYPE html>
    <html>
    <head>
        <title>사용자 페이지</title>
    </head>
    <body>
        <div align="center">
            <br/><br/>
            <h1>사용자 페이지</h1>
            <p>제한된 기능을 사용할 수 있습니다.<p/>
            <a href="logout.jsp">로그아웃</a>&nbsp;&nbsp;
            <a href="update.jsp">회원정보 수정</a>
        </div>
    </body>
    </html>
    <%
} else {
    // admin,user의외에 권한을 가진 계정은 접속불가 페이지로 이동
    response.sendRedirect("access-denied.jsp");
}
%>
