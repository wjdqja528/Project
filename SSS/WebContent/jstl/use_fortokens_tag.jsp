<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head><title>forTokens 태그</title></head>
<body>

콤마와 점을 구분자로 사용:<br>
<c:forTokens var="token" items="빨,주.노,초.파,남.보" delims=",.">
${token }
</c:forTokens>
</body>
</html>