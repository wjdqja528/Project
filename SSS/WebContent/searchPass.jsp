<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "util.LogonDataBean" %>
<%@ page import = "util.LogonDBBean" %>
<%@ include file = "/jj/color.jsp" %>

 

<html>
<head><title>아이디 찾기</title></head>
<link href = "style.css" rel = "stylesheet" type = "text/css">


<% request.setCharacterEncoding("euc-kr"); %>


<%

      String id = request.getParameter("id");
      String jumin1 = request.getParameter("jumin1");
      String jumin2 = request.getParameter("jumin2");
 
      LogonDBBean manager = LogonDBBean.getInstance();
      LogonDataBean c = manager.searchPass(id, jumin1, jumin2); 
 
      try
      {
%>

 

<body bgcolor = "<%= bodyback_c %>">
<center>
<form method = "post" action = "main.jsp">
<%
            if(c != null)
            {
%>
                  <%=id %>님에 비밀번호는 <b><%=c.getPasswd()%></b>입니다.<p>
                  <input type = "submit" value = "메인으로..">
<%
            }
            else
            {
%>
                  아이디 또는 주민등록번호가 틀렸습니다.<p>
                  <input type = "button" value = "다시 입력하기" onclick = 
                        "javascript:window.location='main.jsp'">
<%
            }
%>
</form>
</center>
</body>
<%
            }catch(Exception e) {}
%>
</html>