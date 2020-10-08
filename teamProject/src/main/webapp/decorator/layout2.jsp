<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>test</title>
<!-- 스타일 소스들 -->
<link rel="icon"
	href="<%=request.getContextPath()%>/mainresource/img/Fevicon.png"
	type="image/png">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mainresource/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mainresource/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mainresource/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mainresource/vendors/nice-select/nice-select.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mainresource/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mainresource/vendors/owl-carousel/owl.carousel.min.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mainresource/css/style.css">
<script
		src="<%=request.getContextPath()%>/mainresource/vendors/jquery/jquery-3.2.1.min.js"></script>
	

</head>


<!--================ 메뉴바=================-->
<header class="header_area">
	<div class="main_menu">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">
				<a class="navbar-brand logo_h" href="index2.jsp"><img src="" ></a>

				<!--  아래 버튼의 용도를 모르겠음 ...ㅠㅠ -->
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<div class="collapse navbar-collapse offset"
					id="navbarSupportedContent">
					<ul class="nav navbar-nav menu_nav ml-auto mr-auto">
						<li class="nav-item active"><a class="nav-link"
							href="index2.jsp">홈</a></li>
						<li class="nav-item submenu dropdown"><a
							href="${pageContext.request.contextPath}/eBookCategory.do"
							class="nav-link" role="button" aria-haspopup="true"
							aria-expanded="false">전자책</a></li>

						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/audioBookCategory.do"
							class="nav-link" role="button" aria-haspopup="true"
							aria-expanded="false">오디오북</a></li>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/createBookMain.do"
							class="nav-link" role="button" aria-haspopup="true"
							aria-expanded="false">나만의도서</a></li>							

						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/clientNotice.do"
							class="nav-link" role="button" aria-haspopup="true"
							aria-expanded="false">공지</a></li>

						<c:if test="${sessionScope.member_id == null }">
							<li class="nav-item"><a
								href="<%=application.getContextPath()%>/memberLogin.do"
								class="nav-link" role="button" aria-haspopup="true"
								aria-expanded="false">로그인</a></li>

							<li class="nav-item"><a
								href="<%=application.getContextPath()%>/member/memberJoin.jsp"
								class="nav-link" role="button" aria-haspopup="true"
								aria-expanded="false">회원가입</a></li>
						</c:if>
						<c:if test="${sessionScope.member_id != null }">
							<li class="nav-item"><a
								href="<%=application.getContextPath()%>/memberModify.do"
								class="nav-link" role="button" aria-haspopup="true"
								aria-expanded="false">내 정보</a></li>

							<li class="nav-item"><a
								href="${pageContext.request.contextPath }/memberLogout.do"
								class="nav-link" role="button" aria-haspopup="true"
								aria-expanded="false">로그아웃</a></li>
						</c:if>
						
					</ul>

					<ul class="nav-shop">
						<li class="nav-item"><a class="button button-header"
							href="<%=application.getContextPath()%>/licenceList.do">이용권
								Go!</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<decorator:head />
</header>
<!--================ End Header Menu Area =================-->

<body>
<!--================ Main Area =================-->
	<main class="site-main">
		<decorator:body />

	</main>
	
	
	<!--================ footer Area  =================-->
<footer>
		<div class="footer-bottom">
			<div class="container">
				<div class="row d-flex">
					<p class="col-lg-12 footer-text text-center">
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						듬북담북 <i class="far fa-thumbs-up" aria-hidden="true" ></i> by <a
							href="https://github.com/skckdgns34/gitrepo" target="_blank">최창훈/ 김한범/ 손용원/ 조현주/ 한채빈</a>
				</div>
			</div>
		</div>
	</footer>
	<!--================ End footer Area  =================-->



	<script
		src="<%=request.getContextPath()%>/mainresource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/mainresource/vendors/skrollr.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/mainresource/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/mainresource/vendors/nice-select/jquery.nice-select.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/mainresource/vendors/jquery.ajaxchimp.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/mainresource/vendors/mail-script.js"></script>
	<script src="<%=request.getContextPath()%>/mainresource/js/main.js"></script>
</body>
</html>