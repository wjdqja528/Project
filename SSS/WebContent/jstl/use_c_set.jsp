<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="jstl.Member"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Member member = new Member();
	HashMap<String,String> pref = new HashMap<String, String>();
%>
<html>
<body>
<%--
set�±״� ������ �����Ҷ� ����Ѵ�. �׸��� �⺻��ü�� ������ �Ӽ��������� �Ѵ�.
<c:set var="member" value="<%=member%>" scope="request"/>
<c:set target="${member}" property="name" value="�ֹ���"/>

Member member = new Member();
member.setName("�ֹ���");
pageContext.setAttribute("member",member);

${member.name}
Member member=(Member)pageContext.getAttribute("member");
member.getName();
 --%>
 
<c:set var="member" value="<%= member %>" scope="page" />
<c:set target="${member}" property="name" value="�ֹ���" />
 
 
<c:set var="pref" value="<%=pref %>" />
<c:set var="favoriteColor" value="#{pref.color }"/>

ȸ�� �̸�:${member.name },
�����ϴ� ��: ${favoriteColor }

<br/>
<c:set target="${pref }" property="color" value="red"/>
���� ���� �����ϴ� ��: ${favoriteColor }
</body>
</html>