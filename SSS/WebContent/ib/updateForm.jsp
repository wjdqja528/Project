<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ib.Theme"%>
<%@ page import="ib.ThemeManagerDao"%>
<%@ page import="ib.ThemeManagerException"%>
<%
   String themeId = request.getParameter("id");
   ThemeManagerDao manager = ThemeManagerDao.getInstance();
   Theme theme = manager.select(Integer.parseInt(themeId));
%>
<c:set var="theme" value="<%=theme %>"/>
<c:if test="${!empty theme }">
<script language="JavaScript">
function validate(form){
   if(form.title.value == ""){   
      alert("������ �Է��ϼ���.");
      return false;
   } else if(form.name.value == ""){
      alert("�̸��� �Է��ϼ���.");
      return false;
   } else if(form.password.value == ""){
      alert("��ȣ�� �Է��ϼ���.");
      return false;
   } else if(form.content.value == ""){
      return false;
      }
   }
</script>

<form action="update.jsp" method="post" enctype="multipart/form-data"
   onSubmit="return validate(this)">
<input type="hidden" name="id" value="${theme.id }">
<table width="100%" border="1" cellpadding="1" cellspacing="0">
<tr>
   <td>����</td>
   <td><input type="text" name="title" size="40" value="${theme.title }"></td>
</tr>
<tr>
   <td>�̸�</td>
   <td><input type="text" name="name" size="10" value="${theme.name}"></td>
</tr>
<tr>
   <td>�̸���</td>
   <td><input type="text" name="email" size="10" value="${theme.email }"></td>
</tr>
<tr>
   <td>��ȣ</td>
   <td><input type="password" name="password" size="10" value=""></td>
</tr>
<tr>
   <td>�̹���</td>
   <td><input type="file" name="imageFile">
   <c:if test="${!empty theme.image }">
   <br>
   <img src="/SSS/image/${theme.image }" width="150" border="0">
   </c:if>
   </td>
</tr>
<tr>
   <td>����</td>
   <td>
   <textarea name="content" cols="40" rows="8">${theme.content}</textarea>
   </td>
</tr>
<tr>
   <td colspan="2">
   <input type="submit" value="����">
   <input type="button" value="���" onClick="javascript:history.go(-1)">
</td>
</table>

<input type="hidden" name="page" value="${param.page }">
<c:forEach var="searchCond" items="${paramValues.search_cond }">
   <c:if test="${searchCond == 'title' }">
   </c:if>
   <c:if test="${searchCond == 'name' }">
   <input type="hidden" name="search_cond" value="name">
   </c:if>
</c:forEach>

<c:if test="${! empty param.search_key }">
<input type="hidden" name="search_key" value="${param.search_key }">
</c:if>
</form>
</c:if>
<c:if test="${empty theme }">
���� �������� �ʽ��ϴ�.
</c:if>