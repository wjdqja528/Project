<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head><title>numberFormat�±� ���</title></head>
<body>

<c:set var="price" value="10000"/>
<fmt:formatNumber value="${price }" type="number" var="numberType"/>
<br/>
��ȭ: <fmt:formatNumber value="${price }" type="number" var="numberType"/>
<br/>
�ۼ�Ʈ: <fmt:formatNumber value="${price }" type="percent" groupingUsed="false"/>
<br/>
����: ${numberType }
<br/>
����: <fmt:formatNumber value="${price }" pattern="00000000.00"/>
</body>
</html>