<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="board2.ReadArticleService"%>
<%@ page import="board2.Article"%>
<%@ page import="board2.ArticleNotFoundException"%>
<%
	String viewPage = null;
	try{
		int articleId = Integer.parseInt(request.getParameter("articleId"));
		Article article = ReadArticleService.getInstance().getArticle(articleId);
		viewPage = "update_form_view.jsp";
		request.setAttribute("jb_article",article);
		}catch(ArticleNotFoundException ex){
		viewPage = "article_not_found.jsp";
	}
%>
<jsp:forward page="<%=viewPage%>"/>