<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="member.MemberMgr" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원 삭제 확인</title>
    <script>
        function confirmDelete() {
            var confirmed = confirm("정말로 회원을 삭제하시겠습니까?");
            if (confirmed) {
                return true;
            } else {
                // 취소 버튼을 누른 경우, 삭제를 취소합니다.
                alert("회원 삭제가 취소되었습니다.");
                return false;
            }
        }
    </script>
</head>
<body>
    <% 
    String idToDelete = request.getParameter("username");
    String adminPassword = request.getParameter("adminPassword");

    // 관리자 비밀번호 확인
    String expectedAdminPassword = "1234"; // 실제 관리자 비밀번호로 바꿔주세요
    if (!adminPassword.equals(expectedAdminPassword)) {
        // 만약 관리자 비밀번호가 올바르지 않으면, 오류 메시지를 보여줍니다
        %>
        <h1>비밀번호 오류</h1>
        <p>관리자 비밀번호가 올바르지 않습니다.</p>
        <a href="delete.jsp">돌아가기</a>
        <%
    } else {
        // 관리자 비밀번호가 올바르면 회원 삭제를 진행합니다
        MemberMgr memberMgr = new MemberMgr();
        boolean success = memberMgr.deleteMember(idToDelete);

        if (success) {
            // 회원 삭제 성공
            %>
            <h1>회원 삭제 완료</h1>
            <p>회원이 성공적으로 삭제되었습니다.</p>
            <a href="admin.jsp">관리자 페이지로 돌아가기</a>
            <%
        } else {
            // 회원 삭제 실패
            %>
            <h1>회원 삭제 실패</h1>
            <p>회원 삭제에 실패했습니다. 다시 시도해주세요.</p>
            <a href="admin.jsp">관리자 페이지로 돌아가기</a>
            <%
        }
    }
    %>
    <script>
        // 페이지 로딩 후 confirmDelete 함수를 실행하여 한번 더 삭제 여부를 물어봅니다.
        window.onload = confirmDelete;
    </script>
</body>
</html>
