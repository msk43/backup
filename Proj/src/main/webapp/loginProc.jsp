<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="member.MemberMgr" %>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String url = "login.jsp";
    String msg = "로그인에 실패하였습니다.";

    MemberMgr memberMgr = new MemberMgr();
    String role = memberMgr.loginMember(id, pwd);
    if (role != null) {
        // 로그인 성공
        session.setAttribute("idKey", id);
        session.setAttribute("role", role);
        if (role.equals("admin")) {
            msg = "관리자로 로그인하였습니다.";
            url = "admin.jsp";
        } else if (role.equals("user")) {
            msg = "사용자로 로그인하였습니다.";
            url = "user.jsp";
        } else {
        	msg = "게스트로 로그인하였습니다.";
            url = "guest.jsp";

        }
    }
%>
<script>
    alert("<%=msg%>");
    location.href="<%=url%>";
</script>
