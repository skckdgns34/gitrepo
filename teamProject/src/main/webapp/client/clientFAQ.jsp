<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 지우지마세요ㅠㅠㅠ -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Accordion - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#accordion" ).accordion();
  } );
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
						<h3>로그인 창이 안떠요</h3>
						<div>
							<p>로그인시 창이 뜨지 않으면 껐다 다시 켜보세요.</p>
						</div>
						<h3>읽기 눌러도 창이 안떠요</h3>
						<div>
							<p>도서 창이 열리지 않는다면 프로그램을 종료 후 다시 시작해보세요.</p>
						</div>
						<h3>자동으로 로그아웃 돼요</h3>
						<div>
							<p>장시간 사용하지 않으시면 자동으로 로그아웃됩니다.</p>
						</div>
						<h3>이용권은 어디서 사나요?</h3>
						<div>
							<p>홈화면 상단에 있는 '이용권 구경하기'를 클릭하시거나 '읽기', '듣기'버튼을 누르셨을때 이용권이 없다면
							   이용권 구매 페이지로 이동합니다.</p>
						</div>
						<h3>나만의 도서가 무엇인가요?</h3>
						<div>
							<p>'나만의 도서'란 듬북담북에서 제공하는 도서변환 서비스 입니다.<br>
							    도서 작성 후 등록을 하시면 '나만의 도서' 페이지에서 누구나 해당 책을 읽을 수 있습니다.<br>
							    멋진 글 실력을 뽑내보세요.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	<script>
	$(function() {
		$("#accordion").accordion({
			collapsible : true,
			active : true

		});
	});
</script>
	
</body>
</html>