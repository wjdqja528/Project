<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "util.LogonDataBean" %>
<%@ page import = "util.LogonDBBean" %>
<%@ include file = "/jj/color.jsp" %>

 

<html>
<head><title>���̵� ã��</title></head>
<link href = "style.css" rel = "stylesheet" type = "text/css">


<% request.setCharacterEncoding("euc-kr"); %>


<%

      String name = request.getParameter("name");
      String jumin1 = request.getParameter("jumin1");
      String jumin2 = request.getParameter("jumin2");
 
      LogonDBBean manager = LogonDBBean.getInstance();
      LogonDataBean c = manager.searchId(name, jumin1, jumin2); 
 
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
                  <%=name %>�Կ� ���̵�� <b><%=c.getId()%></b>�Դϴ�.<p>
                  <input type = "submit" value = "��������..">
<%
            }
            else
            {
%>
                  �̸� �Ǵ� �ֹε�Ϲ�ȣ�� Ʋ�Ƚ��ϴ�.<p>
                  <input type = "button" value = "�ٽ� �Է��ϱ�" onclick = 
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