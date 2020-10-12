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
	<!--  이건 이제 지워도 되지 않을까??? -->
	<ul>
		<li><a
			href="<%=application.getContextPath()%>/clientNotice.do">공지사항</a>
		<li><a
			href="<%=application.getContextPath()%>/clientFAQ.do">FAQ</a>
		<li><a
			href="<%=application.getContextPath()%>/clientQuestion.do">문의</a>
	</ul>
	
	
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
				<td>조회수</td>
			</tr>

  </thead>

  <tbody>

    <c:forEach items="${list }" var="notice">
				<tr>
					<td>${notice.notice_no }</td>
					<td><a href="javascript:void(window.open('clientNoticeSelect.do', '공지사항 상세보기', 'width=#, height=#'))">${notice.notice_title }</a></td>
					<td>${notice.notice_date }</td>
					<td>${notice.views }</td>
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

	<my:paging paging="${paging }" jsfunc="gopage" />
	<script>
		function gopage(p) {
			searchFrm.p.value = p;
			searchFrm.submit();

			//location.href="deptSelectAll?p=" + p;
		}
	</script>

	<input type="text">
	<button>검색</button> <!-- 이거는 기능을 하는 건지? 이것이 용도는????? -->
</body>
</html>