<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin</title>

<!-- Custom fonts for this template-->
<link href="/app/resourse/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/app/resourse/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="/app/resourse/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<!-- Bootstrap core JavaScript-->
<script src="/app/resourse/vendor/jquery/jquery.min.js"></script>


</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- 세로 메뉴바 -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand 메인로고 부분 (클릭시 adminPage 메인으로 이동하게 만들어야 함.) -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="adminMain.ad">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					Admin Page<sup></sup>
				</div>
			</a>

			<!-- 구분선 -->
			<hr class="sidebar-divider my-0">

			<!-- Dashboard 이건뭐죠??
      <li class="nav-item active">
        <a class="nav-link" href="adminIndex.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>이건 오ㅑ있는건지 모르겠고</span></a>
      </li>
 -->

			<!-- 구분선 -->
			<hr class="sidebar-divider">

			<!-- 카테고리명1 -->
			<div class="sidebar-heading">매·출입 관리</div>

			<!-- 하위 카테고리1-1 -->
			<li class="nav-item"><a class="nav-link collapsed"
				href="★매출관리 url 넣어주세요!" data-toggle="collapse"
				data-target="#collapseTwo" aria-expanded="true"
				aria-controls="collapseTwo"> <i class="fas fa-fw fa-chart-area"></i>
					<span> 매·출입 관리</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">매·출입 관리</h6>
						<a class="collapse-item" href="moneyOutListForm.ad">매출관리</a> <a
							class="collapse-item" href="moneyInList.ad">매입관리</a>
					</div>
				</div></li>

			<!-- 구분선-->
			<hr class="sidebar-divider">
			<!-- 카테고리명2 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-book"></i> <span>도서관리</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">도서관리</h6>
						<a class="collapse-item" href="bookList.ad">도서조회</a> <a
							class="collapse-item" href="bookManage.ad">E-Book 등록</a> <a
							class="collapse-item" href="bookManageAudio.ad">A-Book 등록</a>

					</div>
				</div></li>

			<!-- 구분선-->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">회원관리</div>

			<!--하위 카테고리3-1 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities1"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-folder"></i> <span>회원관리</span>
			</a>
				<div id="collapseUtilities1" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header"></h6>
						<a class="collapse-item" href="memberManageMain.ad">회원조회</a> <a
							class="collapse-item" href="memberManageBlackList.ad">블랙리스트관리</a>
						<a class="collapse-item" href="memberManageReportList.ad">신고관리</a> <a
							class="collapse-item" href="memberManageQuestion.ad">문의관리</a> <a
							class="collapse-item" href="memberManageNotice.ad">공지사항관리</a>
							<a class="collapse-item" href="memberHopebooksList.ad">희망도서 목록</a>
					</div>
				</div></li>

			<!-- 구분선-->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">직원관리</div>

			<!--하위 카테고리3-1 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities2"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-user-cog"></i> <span>직원관리</span>
			</a>
				<div id="collapseUtilities2" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header"></h6>
						<a class="collapse-item" href="empManageList.ad">직원조회</a>


					</div>
				</div></li>

			<!-- 구분선-->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">출판사관리</div>

			<!--하위 카테고리3-1 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo2"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="far fa-building"></i> <span>출판사관리</span>
			</a>
				<div id="collapseTwo2" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header"></h6>
						<a class="collapse-item" href="companyMain.ad">출판사 목록</a> <a
							class="collapse-item" href="companyManage.ad">출판사 등록</a>

					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>


					<!-- Nav Item - User Information -->
					<ul class="navbar-nav ml-auto">
						<li class="nav-item mx-0 mx-lg-1"><a
							class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
							href="/app/main.do">홈페이지 이동</a></li>

						<c:if test="${empty sessionScope.login}">
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
								href="loginForm.ad">로그인</a></li>

						</c:if>


						<c:if test="${not empty sessionScope.login}">


							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
								href="">${emp_id}님</a></li>

							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
								href="logout.ad">로그아웃</a></li>

							<!-- Nav Item - Alerts -->
							<li class="nav-item dropdown no-arrow mx-1"><a
								class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
									<span class="badge badge-danger badge-counter">3+</span>
							</a> <!-- Dropdown - Alerts -->
								<div
									class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
									aria-labelledby="alertsDropdown">
									<h6 class="dropdown-header">Alerts Center</h6>
									
									<a class="dropdown-item d-flex align-items-center" href="#">
										<div class="mr-3">
											<div class="icon-circle bg-warning">
												<i class="fas fa-exclamation-triangle text-white"></i>
											</div>
										</div>
										<div>
											<div class="small text-gray-500">October 22, 2020</div>
											신고가 접수 되었습니다.
										</div>
									</a> 
									<a class="dropdown-item d-flex align-items-center" href="#">
										<div class="mr-3">
											<div class="icon-circle bg-warning">
												<i class="fas fa-exclamation-triangle text-white"></i>
											</div>
										</div>
										<div>
											<div class="small text-gray-500">October 22, 2020</div>
											신고가 접수 되었습니다.
										</div>
									</a> 
									<a class="dropdown-item d-flex align-items-center" href="#">
										<div class="mr-3">
											<div class="icon-circle bg-warning">
												<i class="fas fa-exclamation-triangle text-white"></i>
											</div>
										</div>
										<div>
											<div class="small text-gray-500">October 21, 2020</div>
											신고가 접수 되었습니다.
										</div>
									</a> 
									
									<a class="dropdown-item text-center small text-gray-500"
										href="memberManageReportList.ad">신고 리스트 보기</a>
								</div></li>

						</c:if>


					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<tiles:insertAttribute name="content" />

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &듬북담북; </span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script> -->

	<script src="/app/resourse/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/app/resourse/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/app/resourse/js/sb-admin-2.min.js"></script>
	<!-- Page level plugins -->
	<script src="/app/resourse/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="/app/resourse/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/app/resourse/js/demo/datatables-demo.js"></script>
</body>

</html>
