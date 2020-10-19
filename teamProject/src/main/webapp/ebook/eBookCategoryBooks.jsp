<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<style>
.pagination li {
  display: inline-block;
  border : 15px solid white;
}

.pagination .active {
  color: black;
  float: center;
  padding: 8px 10px;
  text-decoration: none;
  <%--border : 10px solid lightgray;
  background-color : lightgray;--%>
}
</style>
<div class="row">
	<c:forEach items="${books}" var="book">
		<div class="col-md-6 col-lg-4">
			<div class="card text-center card-product">
			
				<div class="card-body">
					<c:if test="${not empty book.book_img}">
						<td><img src="filenameDownload.do?filename=${book.book_img}"
							style="width: 100%" onclick="imgClick(${book.book_no})"></td>
					</c:if>
					<h6>${book.title}</h6>
				</div>
			</div>
		</div>
	</c:forEach>
</div>

<p>
	<my:paging paging="${paging}" jsfunc="gopage" /> 
</p>



