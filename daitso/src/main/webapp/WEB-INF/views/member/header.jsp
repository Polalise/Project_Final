<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initialscale=1">
<style>
	caption { font-size: 30px; }
	.err { color: red; font-weight: bold; }
	th { background: green; color: white; }
</style>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<%-- ${path }를 사용하면 경로가 절대경로로 변경됨 --%>