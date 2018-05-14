<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "ib.Theme" %>
<%@ page import = "ib.ThemeManagerDao" %>
<%@ page import = "ib.ThemeManagerException" %>
<%
   String themeId = request.getParameter("id");
   ThemeManagerDao manager = ThemeManagerDao.getInstance();
   Theme theme = manager.select(Integer.parseInt(themeId));
%>
<c:set var="theme" value="<%= theme%>" />
<c:if test="${!empty theme}">
<script language="JavaScript">
function validate(form){
   if(form.passord.value == ""){
      alert("��ȣ�� �Է��ϼ���.");
      return false;
   }
}
</script>

<form action ="delete.jsp" method="post" onSubmit="return validate(this)">
<input type="hidden" name="id" value="${theme.id}">
<table width="100%" border="1" cellpadding="1" cellspacing="0">
   <tr>
      <td>����</td>
      <td>${theme.title}</td>
   </tr>
   <tr>
      <td>�ۼ���</td>
      <td>${theme.name}</td>
   </tr>
   <tr>
      <td>��ȣ</td>
      <td><input type="password" name="password" size="10" value=""></td>
   </tr>
<c:if test="${!empty theme.image}">
   <tr>
      <td>�̹���</td>
      <td>
      <img src="/SSS/image/p${theme.image}" width="150" border="0">
      </td>
   </tr>
   </c:if>
   <tr>
      <td colspan="2">
      <input type="submit" value="����">
      <input type="button" value="���" onClick="javascript:history.go(-1)">
      </td>
   </tr>
</table>
</form>
</c:if>

<c:if test="${empty theme}">
���� �������� �ʽ��ϴ�.
</c:if>