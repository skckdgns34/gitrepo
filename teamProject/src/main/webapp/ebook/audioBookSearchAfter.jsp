<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function imgClick(book_no) {
		if(book_no != null){
			if(confirm("해당 책 상세페이지로 이동하시겠습니까?")){			
				location.href="${pageContext.request.contextPath}/audioBookDetail.do?book_no="+book_no;
			}
		}
	}
</script>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<td>북넘버</td>
				<td>제목</td>
				<td>저자</td>
				<td>출판일</td>
				<td>북이미지</td>
				<td>출판사</td>
				<td>소개글</td>
				<td>줄거리</td>
				<td>조회수</td>
				<td>별점</td>
				<td>장르</td>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${list}" var="book">
					<tr>
						<td>${book.book_no}</td>
						<td>${book.title}</td>
						<td>${book.writer}</td>
						<td><fmt:parseDate value="${book.publication_date}" pattern="yyyy-MM-dd HH:mm:ss" var="publication_date"/>
							<fmt:formatDate value="${publication_date}"  pattern="yyyy/MM/dd"/> </td>
						<c:if test="${not empty book.book_img}">
						<td>
							<img onclick="imgClick(${book.book_no})" src="filenameDownload.do?filename=${book.book_img}" style="width:500px">
						</td>
						</c:if>
						<td>${book.company_name}</td>
						<td>${book.introduction}</td>
						<td>${book.summary}</td>
						<td>${book.views}</td>
						<td>${book.score}</td>
						<td>${book.genre}</td>
					</tr>
				
			</c:forEach>
		</tbody>
	</table>
</body>
</html>