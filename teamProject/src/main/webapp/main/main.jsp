<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
<script>

	function imgClick(book_no) {
		if (book_no != null) {
			if (confirm("해당 책 상세페이지로 이동하시겠습니까?")) {
				location.href = "${pageContext.request.contextPath}/eBookDetail.do?book_no="
						+ book_no;
			}
		}
	}
</script>
<style>
</style>
<link rel="stylesheet" href="layout/styles/slider.css">
</head>
<body>
	<section >
		<div id="slider-animation" class="carousel slide" data-ride="carousel" style="padding-left: 140px; margin-top: 30px">

			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#slider-animation" data-slide-to="0" class="active"></li>
				<li data-target="#slider-animation" data-slide-to="1"></li>
				<li data-target="#slider-animation" data-slide-to="2"></li>
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<a href="${pageContext.request.contextPath}/eBookDetail.do"> <img src="${pageContext.request.contextPath}/images/a.jpg"
						alt="슬라이드1">
						<div class="text-box">
							<h2 class="wow slideInRight" data-wow-duration="1s"></h2>
							<p class="wow slideInLeft" data-wow-duration="2s"></p>
						</div>
				</div>

				<div class="carousel-item">
					<a href="★해당 배너클릭시 이동시킬 페이지 적기~"> <img src="${pageContext.request.contextPath}/images/b.jpg"
						alt="슬라이드2">
						<div class="text-box">
							<h2 class="wow slideInUp" data-wow-duration="1s"></h2>
							<p class="wow fadeInDown" data-wow-duration="2s"></p>
						</div>
					</a>
				</div>

				<div class="carousel-item">
					<a href="★해당 배너클릭시 이동시킬 페이지 적기~"> <img src="${pageContext.request.contextPath}/images/c.jpg">
						<div class="text-box">

							<h2 class="wow fadeInUp" data-wow-duration="1s"></h2>
							<p class="wow fadeInUp" data-wow-duration="2s"></p>
						</div>
					</a>
				</div>

			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#slider-animation"
				data-slide="prev"> <span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#slider-animation"
				data-slide="next"> <span class="carousel-control-next-icon"></span>
			</a>

		</div>
	</section>
	
	
<!-- ================ Best Selling item  carousel ================= --> 
    <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>장르별</p>
          <h2>best <span class="section-intro__style">소설</span></h2>
        </div>
        <div class="owl-carousel owl-theme" id="d1Carousel">

          <div class="card text-center card-product">
            <div class="card-product__img">

              <img class="img-fluid" src="<%=request.getContextPath()%>/mainresource/img/r11.jpg"  alt="">
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <p>Accessories</p>
              <h4 class="card-product__title"><a href="single-product.html">Quartz Belt Watch</a></h4>
              <p class="card-product__price">$150.00</p>
            </div>
          </div>
 </div>
      </div>
    </section>
    <!-- ================ Best Selling item  carousel end ==========
    																		 for문 돌면서 DB에 값 받아서 넣을 수는 없는지? --> 
    																		 
    																		 
<!-- ================ 시/에세이  item  carousel ================= --> 
     <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>장르별</p>
          <h2><span class="section-intro__style">시/에세이</span></h2>
        </div>
        <div class="owl-carousel owl-theme" id="d2Carousel">
          <div class="card text-center card-product">
            
            <div class="card-product__img">
              <img class="img-fluid" src="<%=request.getContextPath()%>/mainresource/img/r11.jpg"  alt="">
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <p>Accessories</p>
              <h4 class="card-product__title"><a href="single-product.html">Quartz Belt Watch</a></h4>
              <p class="card-product__price">$150.00</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <!-- ================ 무협/판타지  item  carousel ================= --> 
     <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>장르 별</p>
          <h2><span class="section-intro__style">무협/판타지</span></h2>
        </div>
        <div class="owl-carousel owl-theme" id="d3Carousel">
          <div class="card text-center card-product">
            
            <div class="card-product__img">
              <img class="img-fluid" src="<%=request.getContextPath()%>/mainresource/img/r3.jpg"  alt="">
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <p>Accessories</p>
              <h4 class="card-product__title"><a href="single-product.html">Quartz Belt Watch</a></h4>
              <p class="card-product__price">$150.00</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <!-- ================ 인문  item  carousel ================= --> 
     <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>장르 별</p>
          <h2><span class="section-intro__style">인문</span></h2>
        </div>
        <div class="owl-carousel owl-theme" id="d4Carousel">
          <div class="card text-center card-product">
            
            <div class="card-product__img">
              <img class="img-fluid" src="<%=request.getContextPath()%>/mainresource/img/r2.jpg"  alt="">
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <p>Accessories</p>
              <h4 class="card-product__title"><a href="single-product.html">Quartz Belt Watch</a></h4>
              <p class="card-product__price">$150.00</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <!-- ================ 로맨스  item  carousel ================= --> 
     <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>장르 별</p>
          <h2><span class="section-intro__style">로맨스</span></h2>
        </div>
        <div class="owl-carousel owl-theme" id="d5Carousel">
          <div class="card text-center card-product">
            
            <div class="card-product__img">
              <img class="img-fluid" src="<%=request.getContextPath()%>/mainresource/img/r5.jpg"  alt="">
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <p>Accessories</p>
              <h4 class="card-product__title"><a href="single-product.html">Quartz Belt Watch</a></h4>
              <p class="card-product__price">$150.00</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <!-- ================ 자기계발  item  carousel ================= --> 
     <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>장르 별</p>
          <h2><span class="section-intro__style">자기계발</span></h2>
        </div>
        <div class="owl-carousel owl-theme" id="d6Carousel">
          <div class="card text-center card-product">
            
            <div class="card-product__img">
              <img class="img-fluid" src="<%=request.getContextPath()%>/mainresource/img/r6.jpg"  alt="">
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <p>Accessories</p>
              <h4 class="card-product__title"><a href="single-product.html">Quartz Belt Watch</a></h4>
              <p class="card-product__price">$150.00</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    
        <!-- ================ 경제/경영  item  carousel ================= --> 
     <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>장르 별</p>
          <h2><span class="section-intro__style">경제/경영</span></h2>
        </div>
        <div class="owl-carousel owl-theme" id="d7Carousel">
          <div class="card text-center card-product">
            
            <div class="card-product__img">
              <img class="img-fluid" src="<%=request.getContextPath()%>/mainresource/img/r7.jpg"  alt="">
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <p>Accessories</p>
              <h4 class="card-product__title"><a href="single-product.html">Quartz Belt Watch</a></h4>
              <p class="card-product__price">$150.00</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <!-- ================ 아동/유아  item  carousel ================= --> 
     <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>장르 별</p>
          <h2><span class="section-intro__style">아동/유아</span></h2>
        </div>
        <div class="owl-carousel owl-theme" id="d8Carousel">
          <div class="card text-center card-product">
            
            <div class="card-product__img">
              <img class="img-fluid" src="<%=request.getContextPath()%>/mainresource/img/r8.jpg"  alt="">
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <p>Accessories</p>
              <h4 class="card-product__title"><a href="single-product.html">Quartz Belt Watch</a></h4>
              <p class="card-product__price">$150.00</p>
            </div>
          </div>
        </div>
      </div>
    </section>
	<script src="layout/styles/slider.js"></script>
</body>
</html>