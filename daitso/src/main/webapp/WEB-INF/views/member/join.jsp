<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../ready.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0}">
		<script type="text/javascript">
			alert("회원 가입을 축하합니다.")
			location.href="loginForm.do";
		</script>
	</c:if>
	<c:if test="${result == 0}">
		<script type="text/javascript">
			alert("로그인 실패!")
			history.back();
		</script>
	</c:if>
	<c:if test="${result == -1}">
		<script type="text/javascript">
			alert("이미 있는 아이디 입니다.")
			history.back();
		</script>
	</c:if>
</body>
</html>