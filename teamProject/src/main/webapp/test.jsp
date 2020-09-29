<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="style.css">
<title>Product Slider</title>
<style>
/* Example data */
* {
  box-sizing: border-box;
}

html {
  height: 100vh;
  overflow: hidden;
}

body {
  margin: 0px;
   font-family: 'Quicksand', sans-serif;
   margin-top: 100px;
   background: #152836;
}
img {
   max-width: 100%;
}
.container {
   display: block;
   margin: 0 auto;
   width: 90%;
   max-width: 1000px;
}

/* END template */



/* Product */
.product-link {
  text-decoration: none;
  color: red;
  text-transform: uppercase;
  display: inline-block;
  float: left;
  margin-top: 10px;
  font-weight: bold;
  width: 100%;
  text-align: center;
}


.product-specs {
  display: inline-block;
  float: left;
  width: 100%;
  margin: 10px 0 0 0;
}

  .specs-row > div {
    float: left;
    width: 50%;

  }
  .specs-row > div:first-child {
    font-weight: bold;
  }
  .specs-row > div:last-child {
    text-align: right;
  }




/* Slider */
.slick-slider {
   width: 100%;
   background-color: transparent;
   padding: 0;
}
.slick-slider .slick-track {
  display: flex;
  align-items: center;
  flex-wrap: nowrap;
  justify-content: center;
}
.slick-slider .slick-slide {
  float: none;
  display: inline-block;
  vertical-align: middle;
  padding: 30px;
  margin: 10px;
  background-color: white;
  transition: all 0.3s ease;
  height: auto;
  border-radius: 20px;
}
.slick-slider .slick-slide img {
   float: left; 
   display: inline-block;
}

/*.slick-slider .slick-slide.slick-current, .slick-slider .slick-slide.slick-center {
  background: linear-gradient(45deg, #f69259, #f16975);
}*/

.slick-prev,
.slick-next {
  z-index: 10;
  top: 50%;
  transform: translateY(-50%);
  background-color: transparent;
}

.slick-prev {
  left: -40px;
}

.slick-next {
  right: -40px;
}

</style>

</head>
<body>
	<div class="container">
		<div class="slick-slider">
			<div class="product-item">
				<img src="https://loremflickr.com/450/400"> <a href="#"
					class="product-link">Product 1</a>
				<div class="product-specs">
					<div class="specs-row">
						<div class="product-item">Materiaal</div>
						<div class="product-item">EN-932250</div>
					</div>
					<div class="specs-row">
						<div class="product-item">Materiaal</div>
						<div class="product-item">EN-932250</div>
					</div>
				</div>
			</div>
			<div class="product-item">
				<img src="https://loremflickr.com/450/400"> <a href="#"
					class="product-link">Product 1</a>
				<div class="product-specs">
					<div class="specs-row">
						<div class="product-item">Materiaal</div>
						<div class="product-item">EN-932250</div>
					</div>
					<div class="specs-row">
						<div class="product-item">Materiaal</div>
						<div class="product-item">EN-932250</div>
					</div>
				</div>
			</div>
			<div class="product-item">
				<img src="https://loremflickr.com/450/400"> <a href="#"
					class="product-link">Product 1</a>
				<div class="product-specs">
					<div class="specs-row">
						<div class="product-item">Materiaal</div>
						<div class="product-item">EN-932250</div>
					</div>
					<div class="specs-row">
						<div class="product-item">Materiaal</div>
						<div class="product-item">EN-932250</div>
					</div>
				</div>
			</div>
			<div class="product-item">
				<img src="https://loremflickr.com/450/400"> <a href="#"
					class="product-link">Product 1</a>
				<div class="product-specs">
					<div class="specs-row">
						<div class="product-item">Materiaal</div>
						<div class="product-item">EN-932250</div>
					</div>
					<div class="specs-row">
						<div class="product-item">Materiaal</div>
						<div class="product-item">EN-932250</div>
					</div>
				</div>
			</div>
			<div class="product-item">
				<img src="https://loremflickr.com/450/400"> <a href="#"
					class="product-link">Product 1</a>
				<div class="product-specs">
					<div class="specs-row">
						<div class="product-item">Materiaal</div>
						<div class="product-item">EN-932250</div>
					</div>
					<div class="specs-row">
						<div class="product-item">Materiaal</div>
						<div class="product-item">EN-932250</div>
					</div>
				</div>
			</div>
			<div class="product-item">
				<img src="https://loremflickr.com/450/400"> <a href="#"
					class="product-link">Product 1</a>
				<div class="product-specs">
					<div class="specs-row">
						<div class="product-item">Materiaal</div>
						<div class="product-item">EN-932250</div>
					</div>
					<div class="specs-row">
						<div class="product-item">Materiaal</div>
						<div class="product-item">EN-932250</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
$('.slick-slider').slick({
	  // centerMode: true,
	  slidesToShow: 4,
	  dots: false,
	  arrows: true,
	  swipe: true,
	  swipeToSlide: true,

	   responsive: [
	    {
	      breakpoint: 600,
	      settings: {
	        slidesToShow: 1,
	        centerMode: true
	      }
	    },
	    {
	      breakpoint: 800,
	      settings: {
	        slidesToShow: 2,
	        centerMode: true
	      }
	    },
	    {
	      breakpoint: 1000,
	      settings: {
	        slidesToShow: 3,
	      }
	    },
	  ]
	   
	});


	/*$('.slick-slider').on('beforeChange', function(event, slick, currentSlide, nextSlide){
	  changecolor("white", 0);
	});
	$('.slick-slider').on('afterChange', function(event, slick, currentSlide, nextSlide){
	  changecolor("red", 30);
	});
	function changecolor(color, padding) { 
	  $('.slick-slider .slick-current').css("background-color", color);
	  $('.slick-slider .slick-current').css("padding", padding);
	  //$('.slick-slider').slick("setPosition");
	//  $('.slick-slider').slick('resize');
	}
	changecolor("red", 30);*/
</script>
</body>
</html>