<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "ib.Theme" %>
<%@ page import = "ib.ThemeManagerDao" %>
<%@ page import = "ib.ThemeManagerException" %>
<%
   String themeId = request.getParameter("id");

   ThemeManagerDao manager = ThemeManagerDao.getInstance();
   Theme theme = manager.select(Integer.parseInt(themeId));
%>
<c:set var="theme" value="<%= theme %>" />
<c:if test="${empty theme}">
존재하지 않는 테마 이미지입니다.
</c:if>
<c:if test="${! empty theme}">
<table width="100%" border="1" cellpadding="1" cellspacing="0">
   <tr>
      <td>제목</td>
      <td>${theme.title}</td>
   </tr>
   <tr>
      <td>작성자</td>
      <td>
      ${theme.name}
      <c:if test="${empty theme.email}">
      <a href="mailto:${theme.email}">[이메일]</a>
      </c:if>
      </td>
   </tr>
   <c:if test="${! empty theme.image}">
   <tr>
      <td colspan="2" align="center">
         <a href="javasript:pop('/SSS/image/${theme.image}')">   
         <br>[크게보기]
         </a>
         <!-- <img src="/SSS/image/${theme.image}" width="150" border="0"/> -->
         <img id="i1" width="200" height="120" src='/SSS/image/${theme.image}'  onError="this.style.visibility='hidden'"  style="cursor:hand" onclick="pop(this)">
         
      </td>
   </tr>
   </c:if>
   <tr>
      <td>내용</td>
      <td><pre>${theme.content}</pre></td>
   </tr>
   <tr>
      <td colspan="2">
      <a href="javascript:goReply()">[답변]</a>
      <a href="javascript:goModify()">[수정]</a>
      <a href="javascript:goDelete()">[삭제]</a>
      <a href="javascript:goList()">[목록]</a>
      </td>
   </tr>
</table>
</c:if>

<script language="JavaScript">
function goReply(){
   document.move.action = "writeForm.jsp";
   document.move.submit();
}
function goModify(){
   document.move.action = "updateForm.jsp";
   document.move.submit();
}
function goDelete(){
   document.move.action = "deleteForm.jsp";
   document.move.submit();
}
function goList(){
   document.move.action = "list.jsp";
   document.move.submit();
}
function pop(img) {
	 var win = window.open('', 'Detail', 'width=0, height=0, menubar=0, toolbar=0, directories=0, scrollbars=1, status=0, location=0, resizable=1');
	 op="<html><head><title>크게 보기</title></head>";
	 op+="<body leftmargin='0' topmargin='0'>";
	 op+="<img src='"+ img.src +"' border='0' style='cursor:pointer' onclick='window.close();' onload='window.resizeTo(this.width+30, this.height+90); window.moveTo( (screen.width-this.width)/2 ,  (screen.height-this.height)/2-50 )'>";
	 op+="</body></html>";

	 win.document.write(op);
	}
</script>

<form name="move" method="post">
   <input type="hidden" name="id" value="${theme.id}">
   <input type="hidden" name="parentId" value="${theme.id}">
   <input type="hidden" name="groupId" value="${theme.groupId}">
   
   <input type="hidden" name="page" value="${param.page}">
   <c:forEach var="searchCond" items="${paramValues.search_cond}">
      <c:if test="${searchCond == 'title'}">
      <input type="hidden" name="search_cond" value="title">
      </c:if>
      <c:if test="${searchCond == 'name'}">
      <input type="hidden" name="search_cond" value="name">
      </c:if>
   </c:forEach>
   
   <c:if test="${! empty param.serach_key}">
   <input type="hidden" name="search_key" value="${param.search_key}">
   </c:if>
</form>