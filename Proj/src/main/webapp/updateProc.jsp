<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="member.MemberBean" %>
<%@ page import="member.MemberMgr" %>
<%
    request.setCharacterEncoding("UTF-8");
    javax.servlet.http.HttpSession httpSession = request.getSession();
    
    String loggedInId = (String) httpSession.getAttribute("idKey");
    String pwd = request.getParameter("pwd");
    String tel1 = request.getParameter("tel1");
    String tel2 = request.getParameter("tel2");
    String tel3 = request.getParameter("tel3");
    String tel = tel1 + "-" + tel2 + "-" + tel3;
    String email = request.getParameter("email");
    String zipcode = request.getParameter("zipcode");
    String address = request.getParameter("address");
    String code = request.getParameter("code");

    MemberBean bean = new MemberBean();
    bean.setId(loggedInId);
    bean.setPwd(pwd);
    bean.setTel1(tel1);
    bean.setTel2(tel2);
    bean.setTel3(tel3);
    bean.setEmail(email);
    bean.setZipcode(zipcode);
    bean.setAddress(address);
    bean.setCode(code);

    MemberMgr mMgr = new MemberMgr();
    boolean result = false;
    String errorMessage = "";

    try {
        result = mMgr.updateMember(bean);
        if (result) {
            out.println("회원 정보가 성공적으로 수정되었습니다.");
        } else {
            out.println("회원 정보 수정에 실패했습니다.");
        }
    } catch (Exception e) {
        errorMessage = "회원 정보 수정 중 오류가 발생했습니다: " + e.getMessage();
        out.println(errorMessage);
        e.printStackTrace();
    }
%>
