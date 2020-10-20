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
$(function(){
	$(".img-fluid").on("click",function(){
		if (confirm("해당 책 상세페이지로 이동하시겠습니까?")) {
			var book_no = $(this).next().val()
			var epubyn = $(".epubyn").val()
			if(epubyn != null && epubyn != ("")){
				location.href = "${pageContext.request.contextPath}/eBookDetail.do?book_no="+book_no;	
			}else{
				location.href = "${pageContext.request.contextPath}/audioBookDetail.do?book_no="+book_no;	
			}
			
		}
	})
	$(".ti-heart").on("click",function(){
		console.log($(this))
		 /* $.post(".do", {: '${}'
	    	},function(data){
	            window.close();
		}); */
	})
})
	
</script>
<style>
.carousel-item{
margin-left: 45px;
}
</style>
<link rel="stylesheet" href="layout/styles/slider.css">

<style>

span{
    font-weight: bold;
}

a{
    font-weight: bold;
    color: #002347;
}
</style>
</head>
<body>
	<section id="hhh">
		<div id="slider-animation" class="carousel slide" data-ride="carousel" style="margin-top: 50px">

			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#slider-animation" data-slide-to="0" class="active"></li>
				<li data-target="#slider-animation" data-slide-to="1"></li>
				<li data-target="#slider-animation" data-slide-to="2"></li>
				<li data-target="#slider-animation" data-slide-to="3"></li>
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<a href="${pageContext.request.contextPath}/eBookCategory.do"> <img src="${pageContext.request.contextPath}/images/4.jpg"
						alt="슬라이드1">
						<div class="text-box">
							<h2 class="wow slideInRight" data-wow-duration="1s"></h2>
							<p class="wow slideInLeft" data-wow-duration="2s"></p>
						</div>
				</div>

				<div class="carousel-item">
					<a href="${pageContext.request.contextPath}/eBookCategory.do"> <img src="${pageContext.request.contextPath}/images/3.jpg"
						alt="슬라이드2">
						<div class="text-box">
							<h2 class="wow slideInUp" data-wow-duration="1s"></h2>
							<p class="wow fadeInDown" data-wow-duration="2s"></p>
						</div>
					</a>
				</div>

				<div class="carousel-item">
					<a href="${pageContext.request.contextPath}/eBookCategory.do"> <img src="${pageContext.request.contextPath}/images/1.jpg">
						<div class="text-box">

							<h2 class="wow fadeInUp" data-wow-duration="1s"></h2>
							<p class="wow fadeInUp" data-wow-duration="2s"></p>
						</div>
					</a>
				</div>
				<div class="carousel-item">
					<a href="${pageContext.request.contextPath}/eBookCategory.do"> <img src="${pageContext.request.contextPath}/images/2.jpg"
						alt="슬라이드2">
						<div class="text-box">
							<h2 class="wow slideInUp" data-wow-duration="1s"></h2>
							<p class="wow fadeInDown" data-wow-duration="2s"></p>
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

		<c:forEach items="${bookList }" var="book">
    		<c:if test="${book.best_book=='y' }">
    		

         <div class="card text-center card-product">
            <div class="card-product__img">

			<c:if test="${not empty book.book_img }">
				 <img class="img-fluid" src="filenameDownload.do?filename=${book.book_img}" alt="">
				 <input type="hidden" value="${book.book_no }">
				 <input class="epubyn" type="hidden" value="${book.epub_path }">
			</c:if>              
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i><input type="hidden" value="${book.book_no}"> </button></li>
              </ul>
            </div>
            <div class="card-body">
              <c:if test="${not empty book.epub_path }">
				<p>전자 책</p>
                <h4 class="card-product__title"><a href="${pageContext.request.contextPath}/eBookDetail.do?book_no=${book.book_no}">${book.title }</a></h4>
                <p class="card-product__price">${book.writer }</p>
			  </c:if>
              <c:if test="${empty book.epub_path }">
	              <p>오디오 북</p>
	              <h4 class="card-product__title"><a href="${pageContext.request.contextPath}/audioBookDetail.do?book_no=${book.book_no}">${book.title }</a></h4>
	              <p class="card-product__price">${book.writer }</p>
              </c:if>
            </div>
          </div>
      		
    	</c:if>
    </c:forEach>      
          
          
 		</div>
      </div>
    </section>
    <!-- ================ Best Selling item  carousel end ==========
    																		 
    																		 
    																		 
<!-- ================ 시/에세이  item  carousel ================= --> 
     <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>장르별</p>
          <h2><span class="section-intro__style">시/에세이</span></h2>
        </div>
        <div class="owl-carousel owl-theme" id="d2Carousel">
          
		<c:forEach items="${bookList }" var="book">
    		<c:if test="${book.genre=='d2' }">
    		

         <div class="card text-center card-product">
            <div class="card-product__img">

			<c:if test="${not empty book.book_img }">
				 <img class="img-fluid" src="filenameDownload.do?filename=${book.book_img}" alt="">
 				 <input type="hidden" value="${book.book_no }">
				 <input class="epubyn" type="hidden" value="${book.epub_path }">
			</c:if>              
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <c:if test="${not empty book.epub_path }">
				<p>전자 책</p>
                <h4 class="card-product__title"><a href="${pageContext.request.contextPath}/eBookDetail.do?book_no=${book.book_no}">${book.title }</a></h4>
                <p class="card-product__price">${book.writer }</p>
			  </c:if>
              <c:if test="${empty book.epub_path }">
	              <p>오디오 북</p>
	              <h4 class="card-product__title"><a href="${pageContext.request.contextPath}/audioBookDetail.do?book_no=${book.book_no}">${book.title }</a></h4>
	              <p class="card-product__price">${book.writer }</p>
              </c:if>
            </div>
          </div>
    	</c:if>
    </c:forEach>      
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
       <c:forEach items="${bookList }" var="book">
    		<c:if test="${book.genre=='d3' }">
    		

         <div class="card text-center card-product">
            <div class="card-product__img">

			<c:if test="${not empty book.book_img }">
				 <img class="img-fluid" src="filenameDownload.do?filename=${book.book_img}" alt="">
				 <input type="hidden" value="${book.book_no }">
				 <input class="epubyn" type="hidden" value="${book.epub_path }">
			</c:if>              
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <c:if test="${not empty book.epub_path }">
				<p>전자 책</p>
                <h4 class="card-product__title"><a href="${pageContext.request.contextPath}/eBookDetail.do?book_no=${book.book_no}">${book.title }</a></h4>
                <p class="card-product__price">${book.writer }</p>
			  </c:if>
              <c:if test="${empty book.epub_path }">
	              <p>오디오 북</p>
	              <h4 class="card-product__title"><a href="${pageContext.request.contextPath}/eBookDetail.do?book_no=${book.book_no}">${book.title }</a></h4>
	              <p class="card-product__price">${book.writer }</p>
              </c:if>
            </div>
          </div>
    	</c:if>
    </c:forEach>      
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
         <c:forEach items="${bookList }" var="book">
    		<c:if test="${book.genre=='d4' }">
    		

         <div class="card text-center card-product">
            <div class="card-product__img">

			<c:if test="${not empty book.book_img }">
				 <img class="img-fluid" src="filenameDownload.do?filename=${book.book_img}" alt="">
				 <input type="hidden" value="${book.book_no }">
				 <input class="epubyn" type="hidden" value="${book.epub_path }">
			</c:if>              
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <c:if test="${not empty book.epub_path }">
				<p>전자 책</p>
                <h4 class="card-product__title"><a href="${pageContext.request.contextPath}/eBookDetail.do?book_no=${book.book_no}">${book.title }</a></h4>
                <p class="card-product__price">${book.writer }</p>
			  </c:if>
              <c:if test="${empty book.epub_path }">
	              <p>오디오 북</p>
	              <h4 class="card-product__title"><a href="${pageContext.request.contextPath}/eBookDetail.do?book_no=${book.book_no}">${book.title }</a></h4>
	              <p class="card-product__price">${book.writer }</p>
              </c:if>
            </div>
          </div>
    	</c:if>
    </c:forEach>      
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
          <c:forEach items="${bookList }" var="book">
    		<c:if test="${book.genre=='d5' }">
    		

         <div class="card text-center card-product">
            <div class="card-product__img">

			<c:if test="${not empty book.book_img }">
				 <img class="img-fluid" src="filenameDownload.do?filename=${book.book_img}" alt="">
				 <input type="hidden" value="${book.book_no }">
				 <input class="epubyn" type="hidden" value="${book.epub_path }">
			</c:if>              
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <c:if test="${not empty book.epub_path }">
				<p>전자 책</p>
                <h4 class="card-product__title"><a href="${pageContext.request.contextPath}/eBookDetail.do?book_no=${book.book_no}">${book.title }</a></h4>
                <p class="card-product__price">${book.writer }</p>
			  </c:if>
              <c:if test="${empty book.epub_path }">
	              <p>오디오 북</p>
	              <h4 class="card-product__title"><a href="${pageContext.request.contextPath}/eBookDetail.do?book_no=${book.book_no}">${book.title }</a></h4>
	              <p class="card-product__price">${book.writer }</p>
              </c:if>
            </div>
          </div>
    	</c:if>
    </c:forEach>      
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
         <c:forEach items="${bookList }" var="book">
    		<c:if test="${book.genre=='d6' }">
    		

         <div class="card text-center card-product">
            <div class="card-product__img">

			<c:if test="${not empty book.book_img }">
				 <img class="img-fluid" src="filenameDownload.do?filename=${book.book_img}" alt="">
				 <input type="hidden" value="${book.book_no }">
				 <input class="epubyn" type="hidden" value="${book.epub_path }">
			</c:if>              
			<ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <c:if test="${not empty book.epub_path }">
				<p>전자 책</p>
                <h4 class="card-product__title"><a href="${pageContext.request.contextPath}/eBookDetail.do?book_no=${book.book_no}">${book.title }</a></h4>
                <p class="card-product__price">${book.writer }</p>
			  </c:if>
              <c:if test="${empty book.epub_path }">
	              <p>오디오 북</p>
	              <h4 class="card-product__title"><a href="${pageContext.request.contextPath}/eBookDetail.do?book_no=${book.book_no}">${book.title }</a></h4>
	              <p class="card-product__price">${book.writer }</p>
              </c:if>
            </div>
          </div>
    	</c:if>
    </c:forEach>      
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
         <c:forEach items="${bookList }" var="book">
    		<c:if test="${book.genre=='d7' }">
    		

         <div class="card text-center card-product">
            <div class="card-product__img">
			<c:if test="${not empty book.book_img }">
				 <img class="img-fluid" src="filenameDownload.do?filename=${book.book_img}" alt="">
				 <input type="hidden" value="${book.book_no }">
				 <input class="epubyn" type="hidden" value="${book.epub_path }">
			</c:if>
             
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <c:if test="${not empty book.epub_path }">
				<p>전자 책</p>
                <h4 class="card-product__title"><a href="${pageContext.request.contextPath}/eBookDetail.do?book_no=${book.book_no}">${book.title }</a></h4>
                <p class="card-product__price">${book.writer }</p>
			  </c:if>
              <c:if test="${empty book.epub_path }">
	              <p>오디오 북</p>
	              <h4 class="card-product__title"><a href="${pageContext.request.contextPath}/eBookDetail.do?book_no=${book.book_no}">${book.title }</a></h4>
	              <p class="card-product__price">${book.writer }</p>
              </c:if>
            </div>
          </div>
    	</c:if>
    </c:forEach>      
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
          <c:forEach items="${bookList }" var="book">
    		<c:if test="${book.genre=='d8'||boo.genre=='d9' }">
    		

         <div class="card text-center card-product">
            <div class="card-product__img">
			<c:if test="${not empty book.book_img }">
				 <img class="img-fluid" src="filenameDownload.do?filename=${book.book_img}" alt="">
				 <input type="hidden" value="${book.book_no }">
				 <input class="epubyn" type="hidden" value="${book.epub_path }">
			</c:if>              
			<ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <c:if test="${not empty book.epub_path }">
				<p>전자 책</p>
                <h4 class="card-product__title"><a href="${pageContext.request.contextPath}/eBookDetail.do?book_no=${book.book_no}">${book.title }</a></h4>
                <p class="card-product__price">${book.writer }</p>
			  </c:if>
              <c:if test="${empty book.epub_path }">
	              <p>오디오 북</p>
	              <h4 class="card-product__title"><a href="${pageContext.request.contextPath}/eBookDetail.do?book_no=${book.book_no}">${book.title }</a></h4>
	              <p class="card-product__price">${book.writer }</p>
              </c:if>
            </div>
          </div>
    	</c:if>
    </c:forEach>      
        </div>
      </div>
    </section>
	<script src="<%=request.getContextPath()%>/layout/styles/slider.js"></script>
</body>
</html>