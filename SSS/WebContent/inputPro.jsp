<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "util.LogonDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="member" class="util.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>

<%
	member.setReg_date(new Timestamp(System.currentTimeMillis()) );
	LogonDBBean manager = LogonDBBean.getInstance();
	manager.insertMember(member);
	
	response.sendRedirect("loginForm.jsp");
%>