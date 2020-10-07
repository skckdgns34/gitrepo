<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="review_item">
	<div class="media">
		<div class="d-flex"></div>
		<div class="media-body" data-id="${review.member_no}" data-seqno="${review.review_no}" data-bookno="${review.book_no}">
			<h4>${nickname}</h4>
		</div>
		<p>${review.review_date}</p>
	</div>
	<p>${review.contents}</p>
</div>





