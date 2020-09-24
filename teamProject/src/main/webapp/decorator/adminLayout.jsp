<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
	<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>DumBookDamBook Admin Page</title>

<%-- Custom fonts for this template css 적용 되는 곳 --%>
<link
	href="<%=request.getContextPath()%>/resourse/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
	
	<!-- Bootstrap core JavaScript-->
  <script src="<%=request.getContextPath()%>/resourse/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/resourse/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<%-- Custom styles for this template css 적용 되는 곳 --%>
<link href="<%=request.getContextPath()%>/resourse/css/sb-admin-2.min.css" rel="stylesheet">
<title><decorator:title /></title>
<decorator:head />
</head>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- 세로 메뉴바 -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand 메인로고 부분 (클릭시 adminPage 메인으로 이동하게 만들어야 함.) -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Admin Page <sup>2</sup></div>
      </a>

      <!-- 구분선 -->
      <hr class="sidebar-divider my-0">

      <!-- Dashboard 이건뭐죠?? -->
      <li class="nav-item active">
        <a class="nav-link" href="index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>이건 오ㅑ있는건지 모르겠고</span></a>
      </li>

      <!-- 구분선 -->
      <hr class="sidebar-divider">

      <!-- 카테고리명1 -->
      <div class="sidebar-heading">
        매·출입 관리
      </div>

      <!-- 하위 카테고리1-1 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="★매출관리 url 넣어주세요!" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>매출 관리</span>
        </a>
      </li>

      <!-- 하위 카테고리1-2-->
      <li class="nav-item">
        <a class="nav-link collapsed" href="★매입관리 url 넣어주세요" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>매입 관리</span>
        </a>
      </li>
     
 

      <!-- 구분선-->
      <hr class="sidebar-divider">

      <!-- 카테고리명2 -->
      <div class="sidebar-heading">
        도서관리
      </div>

      <!-- 하위 카테고리2-2 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="★도서등록 url 넣어주세요!" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-book"></i>
          <span>도서등록</span>
        </a>
      </li>
       <!--하위 카테고리2-2 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="★도서수정 url 넣어주세요!" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-book"></i>
          <span>도서수정</span>
        </a>
      </li>
	<!-- 구분선-->
      	<hr class="sidebar-divider">

      <!-- 카테고리명-->
    	  <div class="sidebar-heading">회원관리 </div>
    	  
     <!--하위 카테고리3-1 -->
      <li class="nav-item">
        <a class="nav-link collapsed"  href="${pageContext.request.contextPath}/memberManageMain.ad" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>회원조회</span>
        </a>
      </li>
        <!--하위 카테고리3-2 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="★블랙리스트관리 url 넣어주세요!" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>블랙리스트관리</span>
        </a>
      </li>
       <!--하위 카테고리3-3 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="★문의관리 url 넣어주세요!" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>문의관리</span>
        </a>
      </li>
      
      <!-- 구분선-->
      	<hr class="sidebar-divider">

      <!-- 카테고리명-->
    	  <div class="sidebar-heading">직원관리 </div>
    	  
     <!--하위 카테고리4-1 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/empManageList.ad" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-user-cog"></i>
          <span>직원관리</span>
        </a>
      </li>
        <!--하위 카테고리4-2 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="★계정관리 url 넣어주세요!" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-user-cog"></i>
          <span>계정관리</span>
        </a>
      </li>
    	  
    	  <!-- 구분선-->
      	<hr class="sidebar-divider">

      <!-- 카테고리명-->
    	  <div class="sidebar-heading">거래처관리 </div>
    	  
     <!--하위 카테고리5-1 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="★거래처관리 url 넣어주세요!" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
        <i class="far fa-building"></i>
          <span>거래처관리</span>
        </a>
      </li>
           <!--하위 카테고리5-2 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="★거래관리 url 넣어주세요!" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
        <i class="far fa-building"></i>
          <span>거래관리</span>
        </a>
      </li>
     	  
    </ul>
    <!-- End of Sidebar -->

    <!-- 메인 부분(?)-->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- 우와!? -->
      <div id="content">


        <!-- 상단(가로)메뉴바 -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- 상단바 Toggle?? 이건 뭘까요? -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search(이건 없애야 하는거 아닐까? 회의 후 지우기~! ) -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">
           
            <!-- 관리자 정보? -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">로그인 </span>
                <span>   |  </span>
                <!-- 로그인 시에 아래의 내용 출력 되게 바꾸기~ -->
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"> ${emp_id}님</span>
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">로그아웃</span>
                 <img class="img-profile rounded-circle" src="<%=request.getContextPath()%>/resourse/img/사람아이콘.jpg">
                 <span class="mr-2 d-none d-lg-inline text-gray-600 small">다른계정으로 로그인</span>
             </a>
            </li>
          </ul>
        </nav>
        <!-- End of 상단(가로) 메뉴바 -->

        <!-- 메인메인? -->
        <div class="container-fluid">
          

   <decorator:body />
			여기는 핳! 메인 부분인거 같아! 하하!
        

      </div>
      <!-- End of 메인 끝 -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &우리팀명; 팀이름 넣을까?</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->
</body>



</html>