<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminMain</title>
<style >
.nav-pills>li.active>a, .nav-pills>li.active>a:focus {
    color: #fff;
    background-color: #6600cc;
}
</style>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

<decorator:head />
</head>
<body>
		  <nav class="navbar navbar-default" role="navigation">
    	  <div class="container" style="min-width: 85%;">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      
		      <a href="adminIndex.jsp"><img src="${pageContext.request.contextPath}/images/ㄹ고a.png"></a>
		    </div>

		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="navbar-brand-centered">
		      
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="#">홈페이지(사용자 홈페이지로 이동?)</a></li>
		        <li><a href="#">Link</a></li>
		        <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">${emp_id}님 <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">로그아웃</a></li>
                    <li><a href="#">다른 계정으로 로그인</a></li>
                    
                  </ul>
                </li>		        
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
<div class="container" style="padding-top: 100px;  min-width: 90%;" >

<div class="row">

	<div class="col-md-2">
		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="${pageContext.request.contextPath}/adminMain/login.jsp"><i
					class="fa fa-home fa-fw"></i>Home</a></li>
			<li><a href="http://www.jquery2dotnet.com"><i
					class="fa fa-file-o fa-fw"></i>매출관리</a></li>
			<li><a href="http://www.jquery2dotnet.com"><i
					class="fa fa-bar-chart-o fa-fw"></i>도서관리</a></li>
			<li><a href="http://www.jquery2dotnet.com"><i
					class="fa fa-table fa-fw"></i>회원관리</a></li>
			<li><a href="${pageContext.request.contextPath}/empManageList.ad">
			<i
					class="fa fa-list-alt fa-fw"></i>사원관리</a></li>
			<li><a href="http://www.jquery2dotnet.com"><i
					class="fa fa-tasks fa-fw"></i>거래처관리</a></li>
		</ul>
	</div>
	<div class="col-md-10">
	<decorator:body/>
	</div>
	</div>
	</div>
</body>
</html>