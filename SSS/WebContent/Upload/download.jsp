<%@ page pageEncoding="euc-kr"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="upload.IncreaseDownloadCountService"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="upload.PdsItemNotFoundException"%>
<%@ page import="upload.FileDownloadHelper"%>
<%@ page import="upload.PdsItem"%>
<%@ page import="upload.GetPdsItemService"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	try{
		PdsItem item = GetPdsItemService.getInstance().getPdsItem(id);
		
		response.reset();
		
		String fileName = new String(item.getFileName().getBytes("euc-kr"), "iso-8859-1");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setContentLength((int)item.getFileSize());
		response.setHeader("pragma","no-cache;");
		response.setHeader("Expires","-1;");
		
		FileDownloadHelper.copy(item.getRealPath(), response.getOutputStream());
		
		response.getOutputStream().close();
		
		IncreaseDownloadCountService.getInstance().increaseCount(id);
	} catch(PdsItemNotFoundException ex) {
		response.setStatus(HttpServletResponse.SC_NOT_FOUND);
	}
%>