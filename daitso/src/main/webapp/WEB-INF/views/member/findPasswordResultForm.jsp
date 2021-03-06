<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../ready.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("resources/css/login.css");</style>
<script type="text/javascript">

	//ajax로 비밀번호 일치 여부 판단
	$(function () {
		$("#password2").blur(function () {
			if($('#password').val() != $('#password2').val()) {
				$('#passwordChk1').text("비밀번호가 일치하지 않습니다. 다시 입력 하세요");
				frm.password.focus();
				frm.password.value = "";
				frm.password2.value = "";
			} else if ($('#password').val() == "" || $('#password2').val() == "") {
				$('#passwordChk1').text("필수 입력사항 입니다.");
			} else {
				$('#passwordChk1').text("비밀번호가 일치 합니다.");
			}
		});
	});
	
	
/* 	function chk() {
		if (frm.password.value != frm.password2.value){
			alert("암호와 암호확인이 다릅니다.")
			frm.password.focus();
			frm.password.value = "";
			frm.password2.value = "";
			return false;
		} else {
			frm.action = "findPasswordUpdate.do";
			frm.submit();
		}
	} */
</script>
</head>
<body>
	<div class="container" align="center">
		<h2 class="metion">새로운 비밀번호 설정</h2>
		<div class="wap">
		<form method="post" name="frm" onsubmit="return chk()" action="findPasswordUpdate.do">
		<input type="hidden" name ="id" value="${member.id }">
			<table>
				<tr>
					<td><input type="password" name="password" id="password" required="required" autofocus="autofocus" class="form-control glyphicon" placeholder="&#xe033비밀번호"></td>
				</tr>
				<tr>
					<td><input type="password" name="password2" id="password2" required="required" class="form-control glyphicon" placeholder="&#xe033비밀번호확인"></td>
				</tr>
				<tr>
					<td><div id="passwordChk1" class="err"></div></td>
				</tr>			
				<tr>
					<td colspan="2" align="center">
					<input type="submit" id="login" value="비밀번호변경" class="btn btn-warning"></td>
				</tr>
			</table>
		</form>
			<div>
				<a href="login.do" class="btn">로그인</a> 
				<a href="findIdForm.do" class="btn">아이디찾기</a> 
				<a href="findPasswordForm.do" class="btn">비밀번호찾기</a>
			</div>
		</div>
	</div>
</body>
</html>