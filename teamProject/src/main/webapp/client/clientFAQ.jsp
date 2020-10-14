<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>clientFAQ</title>
<script>
	$(function() {
		$("#accordion").accordion({
			collapsible : true,
			active : true

		});
	});
</script>

<meta charset="UTF-8">
<title>공지사항 - FAQ</title>
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
							<a href="./index.html">공지사항</a> <span>FAQ</span>
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
					<div id="accordion">
						<h3>로그인 관련 문의</h3>
						<div>
							<p>로그인시 창이 뜨지 않으면 껐다 다시 켜보세요.</p>
						</div>
						<h3>도서 연람 관련 문의</h3>
						<div>
							<p>도서 창이 열리지 않는다면 프로그램을 종료 후 다시 시작해보세요.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>