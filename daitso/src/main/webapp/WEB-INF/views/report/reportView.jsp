<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>  
<%@  taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#total{
 display: flex;
 margin-top: 200px;
}
.container{
  border: 2px solid blue;
}
#sub{
  margin-right: 300px;
}
.sideMenu{
    margin-left: 300px;
}
.snb{
  font-size: 26px
}
/* 사이드 */
 ul.mylist {
          list-style-type: none;
          background-color: #fff;
          width: 200px;
          padding: 0;
          margin: 0;
          border: 2px solid;
          font-size: 20px;
     }

     li a {
          text-decoration: none;
          display: block;
          color: #000;
          padding: 8px 15px 8px 15px;
          font-weight: bold;
          border-bottom: 1px solid #fff;
     }

     li a:hover {
          background-color: tomato;
          color: #fff;
     }
     #privateBtn{
     margin-left: 950px;
     }
     #s1{
     width: 10%
     }
        #s2{
     width: 10%
     }
        #s3{
     width: 10%
     }
        #s4{
     width: 10%
     }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="total">
   <div class="sideMenu" style="border: 2px solid red;">
    <!-- <strong>메뉴</strong> -->
    <div class="snb">
        <ul class="mylist">
            <!-- <li class=''><a href="">고객센터 메인<i></i></a></li> -->
            <!-- <li class=''><a href="" title="현재선택">자주찾는 질문<i></i></a></li> -->
            <li class=''><a href="noticeList.do">공지사항<i></i></a></li>
            <li class=''><a href="eventList.do">이벤트<i></i></a></li>
            <li class=''><a href="">신고문의<i></i></a></li>
            <li class=''><a href="adminMemberList.do">회원관리<i></i></a></li>        
             
        </ul>
    </div>
    </div>
  
<div class="container" align="center" id="sub" >
  <h2 class="text-primary">신고내역 상세</h2>
   <form method="post" action="reportUpdate.do">
  <table class="table">
  <tr><td style="width: 50%;"><b>[${report.reasonChk}]</b></td><td style="text-align:right;">작성일</td><td>${board.reg_date}</td></tr>
  <tr><td>신고자</td><td>${report.reporter_id}</td><td>피신고자</td><td>${report.reporter_id}</td></tr>
  <tr><td colspan="5">${report.reasonText}</td>
  <tr><td><input type="text" name="rating"></td></tr>
  <tr><td><input type="submit" value="확인"></td></tr>
  	</form>
	<tr><td colspan="5" align="center">
      <a href="noticeList.do?pageNum=${pageNum }" class="btn btn-info">게시글 목록</a>
<%--<a href="noticeUpdateForm.do?num=${board.num }&pageNum=${pageNum }"  class="btn btn-warning">수정</a>
      <!-- 회원 게시판인 경우에는 폼없이 삭제 여부를 묻고 삭제 ,비회원인 경우에는 암호를 확인하기 위한 화면-->
       <a href="noticeDelete.do?num=${board.num }&pageNum=${pageNum }"  class="btn btn-danger">삭제</a>--%></td></tr>
   
  </table>
</div>
</div>
</body>
</html>