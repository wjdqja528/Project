<%@ page contentType = "text/html; charset=euc-kr"%>
<%@ page import = "java.io.IOException, java.io.FileReader"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head><title>�ҽ� ����</title></head>
<body>

<%
	FileReader reader = null;
	try{
		String path = request.getParameter("path");
		reader = new FileReader(getServletContext().getRealPath(path));
%>
<pre>
�ҽ� �ڵ� = <%=path %>
<c:out value="<%=reader %>" escapeXml="true"/>
</pre>
<%
	}catch(IOException ex){
%>
����: <%=ex.getMessage() %>
<%
	}finally{
		if(reader != null)
				try{
					reader.close();
					}catch(IOException ex){}
				}
%>
</body>
</html>