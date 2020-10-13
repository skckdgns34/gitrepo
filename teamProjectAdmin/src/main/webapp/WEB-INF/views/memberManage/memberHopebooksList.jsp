<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function insertpage() //문의사항 등록 ㅡ
	{
		window.document.location.href = "${pageContext.request.contextPath}/clientHopeBookWriteForm.do"
		return;
	}
</script>
</head>
<body>
	<!-- Breadcrumb Section End -->
	<section class="section-margin--small mb-5">

		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="table-responsive">
						 <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작가</th>
									<th>출판사</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="hopebooks">
									<tr>
										<td>${hopebooks.hopebooks_no}</td>
										<td>${hopebooks.title}</td>
										<td>${hopebooks.writer}</td>
										<td>${hopebooks.company}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>