<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
		alert("발송완료 처리 되었습니다");
		history.back();
	</script>
	</c:if>
	<c:if test="${result <= 0 }">
		<script type="text/javascript">
		alert("오류가 발생하였습니다");
		history.back();
	</script>
	</c:if>
</body>
</html>