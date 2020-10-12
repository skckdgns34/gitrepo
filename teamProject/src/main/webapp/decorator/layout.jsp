<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<link rel="icon"
	href="<%=request.getContextPath()%>/resource/img/favicon.png"
	type="image/png" />
<title>test</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css1/bootstrap.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css1/flaticon.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css1/themify-icons.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/vendors1/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/vendors1/nice-select/css/nice-select.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mainresource/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mainresource/vendors/nice-select/nice-select.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mainresource/css/style.css">

<!-- main css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css1/style.css" />
	
	 <!-- Css Styles -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
	<script	src="<%=request.getContextPath()%>/mainresource/vendors/jquery/jquery-3.2.1.min.js"></script>
	<decorator:head />
</head>


<!--================ Start Header Menu Area =================-->
<header class="header_area">
	<div class="main_menu">
	<!-- 상단 남색 메뉴바 (클릭 시 이용권으로 이동 할 수 있도록 만들까 함!) -->
		<div class="search_input" id="search_input_box">
			<div class="container">
				<a class="navbar-brand logo_h" href="<%=application.getContextPath()%>/licenceList.do"><img
					src="<%=request.getContextPath()%>/resource/img/ticket.png" style="padding-top: 10px;" /></a>
			</div>
		</div>

		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">

				<!-- 로고 부분 -->
				<a class="navbar-brand logo_h" href="<%=application.getContextPath()%>/index2.jsp"><img
					src="<%=request.getContextPath()%>/resource/img/logo.jpg" alt="" /></a>
					
				<!-- 이 버튼의 용도는 무엇일까유????? 
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>-->
				
				<!-- 메뉴바 시작! -->
				<div class="collapse navbar-collapse offset"
					id="navbarSupportedContent">
					   <ul class="nav navbar-nav menu_nav ml-auto">
						<li class="nav-item active"><a class="nav-link"
							href="<%=application.getContextPath()%>/index2.jsp">홈</a></li>
							
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/eBookCategory.do">전자책</a>
						</li>
						
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/audioBookCategory.do">오디오북</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/createBookMain.do">나만의 도서</a>
						</li>
						
						<li class="nav-item submenu dropdown"><a href=""
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">고객센터</a>
							<ul class="dropdown-menu">
							<li class="nav-item"><a class="nav-link"
									href="<%=application.getContextPath()%>/clientNotice.do">공지사항</a></li>
								<li class="nav-item"><a class="nav-link"
									href="<%=application.getContextPath()%>/clientFAQ.do">FAQ</a></li>
								<li class="nav-item"><a class="nav-link"
									href="<%=application.getContextPath()%>/clientQuestion.do">문의사항</a></li>
								<li class="nav-item"><a class="nav-link"
									href="<%=application.getContextPath()%>/clientHopeBook.do">희망도서</a></li>
						
							</ul></li>
							
							<li class="nav-item"></li>
							<li class="nav-item"></li><!-- 메뉴사이 띄워주기용 li 지우지 마세요 ㅠ -->
							
					
						
						<c:if test="${sessionScope.member_id == null }">
						<li class="nav-item"><a class="nav-link" href="<%=application.getContextPath()%>/memberLogin.do">로그인</a>
						</li>
						
						<li class="nav-item"><a class="nav-link" href="<%=application.getContextPath()%>/member/memberJoin.jsp">회원가입</a>
						</li>
						</c:if>					
					</ul>
					<c:if test="${sessionScope.member_id != null }">
					<ul class="nav navbar-nav menu_nav ml-auto">
				
						<li class="nav-item submenu dropdown"><a href=""
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.member_id}</a>님
							<ul class="dropdown-menu">
							<li class="nav-item"><a class="nav-link"
									href="<%=application.getContextPath()%>/memberModify.do">내 정보수정</a></li>
								<li class="nav-item"><a class="nav-link"
									href="<%=application.getContextPath()%>/memberBookMark.do">내 서재</a></li>
									<li class="nav-item"><a class="nav-link"
									href="<%=application.getContextPath()%>/memberBookLuvList.do">찜 목록</a></li>
								<li class="nav-item"><a class="nav-link"
									href="<%=application.getContextPath()%>/memberCreateBookCk.do">나만의 도서 확인</a></li>
								<li class="nav-item"><a class="nav-link"
									href="<%=application.getContextPath()%>/memberLicense.do">이용권 내용</a></li>
							</ul></li>
							
							<li class="nav-item"></li>
							<li class="nav-item"></li><!-- 메뉴사이 띄워주기용 li 지우지 마세요 ㅠ -->
							
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/memberLogout.do">로그아웃</a>
						</li>
					
					</ul>
					</c:if>
				</div>
			</div>
		</nav>
	</div>

	
</header>
<!-- 사이드 메뉴 끝!!!!!!!!!!!! -->


<body>
	<!--================ 메인 부분~ =================-->
	<main class="site-main">
		<decorator:body />

	</main>


	<!--================ footer Area=================-->
	<footer>
		<div class="footer-bottom">
			<div class="container">
				<div class="row d-flex">
					<p class="col-lg-12 footer-text text-center">
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						듬북담북 <i class="far fa-thumbs-up" aria-hidden="true"></i> by <a
							href="https://github.com/skckdgns34/gitrepo" target="_blank">최창훈/
							김한범/ 손용원/ 조현주/ 한채빈</a>
				</div>
			</div>
		</div>
	</footer>
	<!--================ End footer Area  =================-->



	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script	src="<%=request.getContextPath()%>/resource/js1/bootstrap.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resource/vendors1/nice-select/js/jquery.nice-select.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resource/vendors1/owl-carousel/owl.carousel.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resource/js1/owl-carousel-thumb.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resource/js1/jquery.ajaxchimp.min.js"></script>
	<script src="<%=request.getContextPath()%>/resource/js1/mail-script.js"></script>
	
	<script src="<%=request.getContextPath()%>/mainresource/vendors/skrollr.min.js"></script>	
	<script src="<%=request.getContextPath()%>/mainresource/js/main.js"></script>
	<script src="<%=request.getContextPath()%>/resource/js/jquery.nicescroll.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/jquery.magnific-popup.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/jquery.countdown.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/jquery.slicknav.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/mixitup.min.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
</body>
</html>