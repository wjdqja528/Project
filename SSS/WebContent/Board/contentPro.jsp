<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import = "board.CommentDBBean"%>
<%@ page import = "java.sql.Timestamp"%>
<%
		request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="cmt" scope="page" class="board.CommentDataBean">
	<jsp:setProperty name="cmt" property="*"/>
</jsp:useBean>
<%
		CommentDBBean comt=CommentDBBean.getInstance();
		cmt.setReg_date(new Timestamp(System.currentTimeMillis()));
		cmt.setIp(request.getRemoteAddr());
		comt.insertComment(cmt);
		
		String content_num=request.getParameter("content_num");
		String p_num=request.getParameter("p_num");
		String url="content.jsp?num="+content_num+"&pageNum="+p_num;
		response.sendRedirect(url);
%>