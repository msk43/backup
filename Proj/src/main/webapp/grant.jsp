<%@ page import="java.util.List" %>
<%@ page import="member.MemberMgr" %>
<%@ page import="member.MemberBean" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
// 현재 로그인한 사용자의 권한 가져오기
String role = (String) session.getAttribute("role");

// 권한에 따른 페이지 접근 제어
if (role == null) {
    // 로그인하지 않은 경우, 로그인 페이지로 이동
    response.sendRedirect("login.jsp");
} else if (role.equals("admin")) {
    // admin 권한의 경우에만 접속 가능
    %>
    <!DOCTYPE html>
    <html>
    <head>
        <title>관리자 페이지</title>
    </head>
    <body> 
        <h2>권한 부여</h2>
        <form method="post" action="grant-permission.jsp">
            <label for="username">계정 아이디:</label>
            <input type="text" id="username" name="username" required><br>
            
            <label for="permission">새로운 권한:</label>
            <select id="permission" name="permission" required>
                <option value="user">일반 사용자</option>
                <option value="guest">게스트</option>
            </select><br>    
            <input type="submit" value="권한 부여">
        </form>
        
        <h2>회원 목록</h2>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>이름</th>
                <th>Email</th>
                <th>권한</th>
            </tr>
            <% 
            // 모든 회원 조회
            List<MemberBean> memberList = new MemberMgr().getAllMembers();
            for (MemberBean member : memberList) {
            %>
            <tr>
                <td><%= member.getId() %></td>
                <td><%= member.getName() %></td>
                <td><%= member.getEmail() %></td>
                <td><%= member.getRole() %></td>
            </tr>
            <% 
            }
            %>
        </table>
        
    </body>
    </html>
    <%
} else {
    // admin 권한이 아닌 경우 접속불가 페이지로 이동
    response.sendRedirect("access-denied.jsp");
}
%>
