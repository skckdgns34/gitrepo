<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta charset="UTF-8">
<title>공지사항</title>



<style >
	li {list-style-type: none; float: left; margin-left: 20px;}
	
</style>
</head>
<body>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Menu</h4>
                        <div class="breadcrumb__links">
                            <a href="">Home</a>
                            <span>공지사항</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
	
	  <section class="section-margin--small mb-5">
	
	<div class="container">
      <div class="row">
       <div class="col-lg-12">
	<div class="table-responsive">
	<form action="${pageContext.request.contextPath }/clientNotice.do"
		method="get" nane="searchFrm">
		<table id="exampleTable" class="table table-bordered">

  <thead>
    <tr>
				<td>게시물 번호</td>
				<td>제목</td>
				<td>등록일</td>
			</tr>

  </thead>

  <tbody>
    <c:forEach items="${list }" var="notice">
				<tr>
					<td>${notice.notice_no }</td>
					<td><a href="javascript:void(window.open('clientNoticeSelect.do?notice_no=${notice.notice_no}', '공지사항 상세보기', 'width=#, height=#'))">${notice.notice_title }</a></td>
					<td>${notice.notice_date }</td>
				</tr>
			</c:forEach>
  </tbody>

</table>
</form>
</div>
</div>
</div>
</div>
</section>
<script type="text/javascript">
jQuery(function($){ 
	$("#exampleTable").DataTable(); 
}); 

$("#exampleTable").DataTable({
	
	// 표시 건수를 10건 단위로 설정
	lengthMenu: [ 10, 20, 30, 40, 50 ]
});
</script>
</body>
</html>