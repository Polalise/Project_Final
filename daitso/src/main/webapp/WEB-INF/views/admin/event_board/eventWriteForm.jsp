<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("resources/css/main2.css");
.container{
  margin-top: 100px;
  
}
.sideMenu{
  /*   margin-left: 300px; */
/*   position: relative;
    left: 270px;
    top: 100px; */
}
#total{
    display: flex;
   /*  margin-top: 200px; */
}
#sub{
  /*  width: 90%; */
   padding: 20px;
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
/* drop & drag */
.drag-over {
	background: yellow;
}

.thumb {
	width: 200px;
	padding: 5px;
	float: left;
}

.thumb>img {
	width: 50%;
}

.thumb>.close {
	position: absolute;
	background: red;
	cursor: pointer;
}

#drop {
	border: 1px solid black;
	width: 300px;
	height: 200px;
	padding: 3px;
}
</style>
<script type="text/javascript">
 	$(document).on(
			"drop",
			function(e) {
				// 태그에 파일 넣기
				$('input[type="file"]').prop("files",
						e.originalEvent.dataTransfer.files);
			}); 
	$(function() {
		/* drop & drag */
		var uploadfiles = []; // 복수의 파일도 가능
		var $drop = $('#drop');
		$drop.on("dragenter", function(e) { // 드래그 해서 그림이 들어오면
			$('#thumbnails').text(""); // '그림을 올려 놓으세요'라는 글자를 삭제
			$(this).addClass("drag-over"); // 배경색 노랑색으로 변경경경
		}).on("dragleave", function(e) { // 드래그를 취소하면 원위치
			$('#thumbnails').text("그림을 올려 놓으세요");
			$(this).removeClass("drag-over");
		}).on("dragover", function(e) { // 그림을 떨어뜨리려고 올려 놨을 때
			e.stopPropagation(); // 이벤트를 전달하지 마라
			e.preventDefault(); // 원애 기능을 하지 마라
		}).on("drop", function(e) { // 그림을 떨어뜨려 놓으면
			e.preventDefault();
			$(this).removeClass("drag-over");
			var files = e.originalEvent.dataTransfer.files; // 드래그 그림들
			for (var i = 0; i < files.length; i++) {
				var file = files[i];
				var size = uploadfiles.push(file); // 업로드 파일 목록배열에 추가
				preview(file, size - 1); // 미리보기
			}
		});
	

		//x를 클릭한 그림 삭제
		$("#thumbnails").on('click', function(e) {
			var $target = $(e.target);
			var idx = $target.attr('data-idx');
			$target.parent().remove(); // x를 클릭한 그림 삭제
		});
	});
	function preview(file, idx) {
		var reader = new FileReader();
		reader.onload = (function(f) {
			return function(e) {
				var div = "<div class='thumb'><div class='close' data-idx='"+idx+
				"'>X</div><img src='"
						+ e.target.result
						+ "' title='"
						+ escape(f.name)
						+ "'/></div>'";
				e.target.result + "'/></div>'";
				$('#thumbnails').append(div);
			}
		})(file);
		reader.readAsDataURL(file, idx); // readAsDataURL : 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할을 합니다
	}
</script>
</head>
<body>
<div class="intro_bg">
			<a href="p_list.do"><img alt="" id="Im2g" src="${path }/resources/images/logo.png"
				style="width: 190px; margin-left: 0px; position: relative; top: 35px; left: 310;"></a>

			<div class="header1">
				<div class="search_area">
					<input type="checkbox" id="icon" style="display: none;"> <label
						for="icon"> <span></span> <span></span> <span></span>
					</label>
					<div id="header">
						<ul>
							<li><a href="p_list.do">◾메인</a></li>
							<br>
							<c:if test="${id != 'admin' }">
								<li><a href="myProfileForm.do">◾마이페이지</a></li>
								<br>
							</c:if>
							<c:if test="${id == 'admin' }">
								<li><a href="adminMemberList.do">◾회원관리</a></li>
								<br>
							</c:if>
							<li><a href="noticeList.do">◾공지사항</a></li>
							<br>
							<li><a href="eventList.do">◾이벤트</a></li>
							<br>
							
						</ul>
					</div>

					<form action="list.do?pageNum=1">
						<div class="searchs">
							<select name="search" style="height: 63px;">
								<!-- select바 한글화 -->
								<c:forTokens var="sh" items="subcon,p_writer,p_name,p_content"
									delims="," varStatus="i">
									<c:if test="${sh == product.search }">
										<option value="${sh }" selected="selected">${title[i.index] }</option>
									</c:if>
									<c:if test="${sh != product.search }">
										<option value="${sh }">${title[i.index] }</option>
									</c:if>
								</c:forTokens>
							</select><input class="searchr" type="text" name="keyword"
								value="${product.keyword }" placeholder="검색어 입력"> <input
								class="input" type="submit" value="검색" style="margin-right: 65;">
						</div>
					</form>
				</div>
				<button class="chats">
					<img src="${path }/resources/images/main2.png" width="15"
						height="16" alt="번개톡버튼 이미지">다있톡
				</button>
				<a class="shop" href="myProfileForm.do"><img
					src="${path }/resources/images/main1.png" width="15" height="16"
					alt="내상점버튼 이미지">내상점</a> <a class="products"><img
					src="${path }/resources/images/main3.png" width="15" height="16"
					alt="판매하기버튼 이미지"
					onclick="location.href='p_insertForm.do?p_num=0&pageNum=1'">글등록</a>
				<c:if test="${id != 'admin' }">
					<a class="links" href='adminMain2.do'>고객센터</a>
				</c:if>
				<c:if test="${id == 'admin' }">
					<a class="links" href="adminMain.do">관리자페이지</a>
				</c:if>
				<a class="links" href='logout.do'>로그아웃</a>
			</div>
		</div>
		<div id="total" style="display: flex;">
  <div class="sideMenu" style="border-left: 1px solid; border-top: 1px solid white;  background-color: #FBE0C4; height: 900px;">
    <!-- <strong>메뉴</strong> -->
    <div class="snb">
        <ul class="mylist" style=" background-color: #FBE0C4;  ">
            <li class='' ><a href="noticeList.do" style="color: white; font-weight: 200px; text-align: center;">공지사항<i></i></a></li>
            <li class='' ><a href="eventList.do" style="color: white; font-weight: 200px; text-align: center;">이벤트<i></i></a></li>
            <c:if test="${id != 'admin'}">
            <li class='' ><a href="reportmyList.do" style="color: white; font-weight: 200px; text-align: center;">신고문의<i></i></a></li>
            </c:if>
            <c:if test="${id == 'admin'}">
            <li class='' ><a href="reportList.do" style="color: white; font-weight: 200px; text-align: center;">신고문의<i></i></a></li>
            </c:if>
            <c:if test="${id == 'admin'}">
            <li class='' ><a href="adminMemberList.do" style="color: white; font-weight: 200px; text-align: center;"><b>회원관리</b><i></i></a></li>    
            </c:if>           
        </ul>
    </div>
    </div>
	<div class=""  style="">

		<form action="eventWrite.do" method="post"
			enctype="multipart/form-data" name="frm">
			<input type="hidden" name="e_num" value="${e_num }"> 
			<input	type="hidden" name="pageNum" value="${pageNum }">
			<input	type="hidden" name="id" value="${id }">
			<h5 style="font-size: xx-large; ">이벤트 작성</h5>
			<table class="table table-bordered" style="margin-left: 250px;  margin-top: 150px;">
			<!--<tr>
					<td>아이디 <span class="glyphicon glyphicon-user"></span></td>
					<td><input type="text" name="id" required="required"
						autofocus="autofocus"></td>
				</tr> -->
				<tr>
					<td>제목</td>
					<td><textarea rows="1" cols="100" name="e_subject" required="required"></textarea>
					<!-- <input type="text" name="e_subject" required="required"> --></td>
				</tr>
				<tr>
					<td>시작일
					<td><input type="date" name="e_start_date" required="required">&nbsp;&nbsp;
					 종료일
					<input type="date" name="e_end_date" required="required"></td>
				</tr>
				<tr>
					<td>사진 <span class="glyphicon glyphicon-picture"></span></td>
					<td><input type="file" name="file" ></td>
				</tr>
				<!-- <tr>
					<td>종료일</td>
					<td><input type="date" name="e_end_date" required="required"></td>
				</tr> -->
				<tr>
					<td>내용</td>
					<td><textarea rows="10" cols="100" name="e_content" required="required"></textarea>
					<!-- <input type="text" name="e_content" required="required"> --></td>
				</tr>
				
				<!-- <tr>
					<td>사진 <span class="glyphicon glyphicon-picture"></span></td>
					<td><input type="file" name="file" ></td>
				</tr> -->
				<!-- multiple="multiple" -->
				<!-- drag & drop -->
				<!--  <tr>
					<td>사진 <span class="glyphicon glyphicon-picture"></span></td>
					<td>
						<div id="drop">
							<div id="thumbnails">그림을 올려 놓으세요</div>
						</div>
					</td>
				</tr> -->
				<tr> 
					<td colspan="2" align="center"><input type="submit"
						id="submit" class="btn btn-success" value="확인">
						<input type="button" onclick="location.href='eventList.do'"
						id="cancle" class="btn btn-danger" value="취소"></td>
				</tr>
			</table>
		</form>
		<div id="disp"></div>
	</div>
	</div>
</body>
</html>