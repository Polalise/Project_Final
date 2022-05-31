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
  <h2 class="text-primary">공지사항 상세</h2>
   <c:if test="${id == 'admin'}">
  <div id="privateBtn">
    <a href="noticeUpdateForm.do?num=${board.num }&pageNum=${pageNum }"  class="btn btn-warning">수정</a>
      <!-- 회원 게시판인 경우에는 폼없이 삭제 여부를 묻고 삭제 ,비회원인 경우에는 암호를 확인하기 위한 화면-->
       <a href="noticeDelete.do?num=${board.num }&pageNum=${pageNum }"  class="btn btn-danger">삭제</a></td>
       </div>
       </c:if>
  <table class="table">
  <tr><td style="width: 50%;"><b>${board.subject }</b></td><td style="text-align:right;">&nbsp;조회수&nbsp;${board.readcount }&nbsp;&nbsp;&nbsp;작성일</td><td>${board.reg_date}</td></tr>
  	<c:set var = "testStr" value = "${board.fileName }"/>
  <c:if test = "${fn:contains(testStr, 'pdf')}"><tr><td id="s1" colspan="1" style="width: 10%;">첨부파일 &nbsp;&nbsp;&nbsp;<a href="download.do?fileName=${board.fileName }">${board.fileName }</a></td><td colspan="5"><%-- ${board.fileName } --%></td></tr></c:if>
  <c:if test = "${fn:contains(testStr, 'ppt')}"><tr><td id="s2" colspan="1" style="width: 10%;">첨부파일 &nbsp;&nbsp;&nbsp;<a href="download.do?fileName=${board.fileName }">${board.fileName }</a></td><td colspan="5"><%-- ${board.fileName } --%></td></tr></c:if>
  <c:if test = "${fn:contains(testStr, 'hwp')}"><tr><td id="s3" colspan="1" style="width: 10%;">첨부파일 &nbsp;&nbsp;&nbsp;<a href="download.do?fileName=${board.fileName }">${board.fileName }</a></td><td colspan="5"><%-- <a href="download.do?fileName=${board.fileName }">${board.fileName }</a> --%></td></tr></c:if>
  <c:if test = "${fn:contains(testStr, 'txt')}"><tr><td id="s4" colspan="1" style="width: 10%;">첨부파일 &nbsp;&nbsp;&nbsp;<a href="download.do?fileName=${board.fileName }">${board.fileName }</a></td><td colspan="5"><%-- <a href="download.do?fileName=${board.fileName }">${board.fileName }</a> --%></td></tr></c:if>
  <tr colspan="5">
         <c:set var = "testStr" value = "${board.fileName }"/>
            <c:if test = "${fn:contains(testStr, 'png')}">
	     <td colspan="5"><img alt="" src="resources/upload/${board.fileName }" width="500"></c:if>
            <c:if test = "${fn:contains(testStr, 'jpg')}">
	     <td colspan="5"><img alt="" src="resources/upload/${board.fileName }" width="500"></c:if>
            <c:if test = "${fn:contains(testStr, 'jpeg')}">
	    <td colspan="5"><img alt="" src="resources/upload/${board.fileName }" width="500"></c:if>
    </td></tr> <tr><td colspan="5">${board.content }</td>
  
	
	<%-- 	<c:set var = "testStr" value = "${board.fileName }"/>
  <c:if test = "${fn:contains(testStr, 'pdf')}"><tr><td>파일</td><td>${board.fileName }</td></tr></c:if>
  <c:if test = "${fn:contains(testStr, 'ppt')}"><tr><td>파일</td><td>${board.fileName }</td></tr></c:if>
  <c:if test = "${fn:contains(testStr, 'hwp')}"><tr><td>파일</td><td> <a href="download.do?fileName=${board.fileName }">${board.fileName }</a></td></tr></c:if>
  <c:if test = "${fn:contains(testStr, 'txt')}"><tr><td>파일</td><td> <a href="download.do?fileName=${board.fileName }">${board.fileName }</a></td></tr></c:if> 
 --%>

		
	<tr><td colspan="5" align="center">
      <a href="noticeList.do?pageNum=${pageNum }" class="btn btn-info">게시글 목록</a>
<%--       <a href="noticeUpdateForm.do?num=${board.num }&pageNum=${pageNum }"  class="btn btn-warning">수정</a>
      <!-- 회원 게시판인 경우에는 폼없이 삭제 여부를 묻고 삭제 ,비회원인 경우에는 암호를 확인하기 위한 화면-->
       <a href="noticeDelete.do?num=${board.num }&pageNum=${pageNum }"  class="btn btn-danger">삭제</a> --%></td></tr>
   
  </table>
</div>
</div>
</body>
</html>