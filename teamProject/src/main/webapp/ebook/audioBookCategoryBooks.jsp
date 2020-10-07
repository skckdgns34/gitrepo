<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<c:forEach items="${books}" var="book">
	<div class="col-md-6 col-lg-4">
		<div class="card text-center card-product">
			<div class="card-product__img">
				<img class="card-img" src="" alt="">
				<ul class="card-product__imgOverlay">
					<li onclick="imgClick(${book.book_no})"><button >
							<i class="ti-search" ></i>
						</button></li>
					<li><button>
							<i class="ti-shopping-cart"></i>
						</button></li>
					<li><button>
							<i class="ti-heart"></i>
						</button></li>
				</ul>
			</div>
			<div class="card-body">
				<c:if test="${not empty book.book_img}">
					<td><img src="filenameDownload.do?filename=${book.book_img}"
						style="width: 200px"></td>
				</c:if>
				<h5>${book.title}</h5>
			</div>
		</div>
	</div>
</c:forEach>
