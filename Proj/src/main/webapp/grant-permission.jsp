<%@ page import="member.MemberMgr" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
String targetUsername = request.getParameter("username");
String newPermission = request.getParameter("permission");

MemberMgr memberMgr = new MemberMgr();
boolean success = memberMgr.changePermission(targetUsername, newPermission);

if (success) {
    response.sendRedirect("admin.jsp?grantSuccess=true");
} else {
    response.sendRedirect("admin.jsp?grantSuccess=false");
}
%>
