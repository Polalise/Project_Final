<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../ready.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result >0 }">
	<script type="text/javascript">
		alert("탈퇴 되었습니다.")
		location.href="loginForm.do";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("탈퇴 되지 않았습니다.")
		history.back();
	</script>
</c:if>
</body>
</html>