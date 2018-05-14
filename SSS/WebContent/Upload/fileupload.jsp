<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<html>
<head><title>���ε� ����</title></head>
<body>
<%
	//1.multipart/form-data ���� Ȯ��
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if(isMultipart){
		//2. �޸𸮳� ���Ϸ� ���ε� ���� �����ϴ� FileItem�� Factory ����
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		//3. ���ε� ��û�� ó���ϴ� ServletFileUpload����
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		//4. ���ε� ��û �Ľ��ؼ� FileItem ��� ����
		List<FileItem> items = upload.parseRequest(request);
		
		Iterator<FileItem> iter = items.iterator();
		while(iter.hasNext()){
			FileItem item = iter.next();
			//5. FileItem�� �� �Է� �׸����� ���ο� ���� �˸��� ó��
			if(item.isFormField()){
				String name = item.getFieldName();
				String value = item.getString("euc-kr");
%>
��û �Ķ����: <%=name %>=<%=value %><br/>
<%
	}else{
		String name = item.getFieldName();
		String fileName = item.getName();
		String contentType = item.getContentType();
		boolean isInMemory = item.isInMemory();
		long sizeInBytes = item.getSize();
%>
���� : <%=name %>, <%=fileName %>,<%=sizeInBytes %>
<%= isInMemory ? "�޸�����" : "�ӽ���������"  %>
<br/>
<%
			}
		}
	} else{
		// multipart/form �ƴ�
%>
multipart/form ��û�� �ƴ�.
<%
	}
%>
</body>
</html>