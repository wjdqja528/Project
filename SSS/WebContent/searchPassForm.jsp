<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ include file = "/jj/color.jsp" %>

<html>
<head><title>���̵� ã��</title></head>
<link href = "style.css" rel = "stylesheet" type = "text/css">
<body bgcolor = "<%= bodyback_c %>">
<form method = "post" action = "searchPass.jsp">
<table cellspacing = "1" cellpadding = "1" width = "260" border = "1" align = "center">
<tr height = "30">
      <td width = "110" bgcolor = "<%= title_c %>" align = "center">
            ���̵�
      </td>
      <td width = "150" bgcolor = "<%= value_c %>" align = "center">
            <input type = "text" name = "id"  size = "18" >
      </td>
</tr>
<tr height = "30">
      <td width = "110" bgcolor = "<%= title_c %>" align = "center">
            �ֹε�� ��ȣ
      </td>
      <td width = "150" bgcolor = "<%= value_c %>" align = "center">
            <input type = "text" name = "jumin1" size = "7" maxlength = "6"> - 
            <input type = "text" name = "jumin2" size = "7" maxlength = "7">
      </td>
</tr>
<tr height = "30">
      <td colspan = "2" align = "middle" bgcolor = "<%= title_c %>">
            <input type = "button" value = "��������.." onclick = 
                  "javascript:window.location = 'main.jsp'">
            <input type = "submit" value = "ã��">
      </td>
</tr>
</form>
</body>
</html>