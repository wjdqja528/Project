<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "util.LogonDBBean" %>
<%@ page import="util.CookieBox" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String id_kim = request.getParameter("id_kim");


	LogonDBBean manager = LogonDBBean.getInstance();
	int check= manager.userCheck(id,passwd);
	
if(check==1){
session.setAttribute("memId",id);
if(request.getParameter("save") == null)
{
   response.addCookie(CookieBox.createCookie("ID","","/",-1));
}
else
{
   response.addCookie(CookieBox.createCookie("ID", id, "/", -1));
}

response.sendRedirect("main.jsp");
}else if(check==0){%>
<script>
	alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
</script>
<% }else{ %>
<script>
	alert("아이디가 맞지 않습니다..");
	history.go(-1);
</script>
<% } %>