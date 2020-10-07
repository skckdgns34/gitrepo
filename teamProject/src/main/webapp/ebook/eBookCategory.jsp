<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layout/styles/slider.css">
<script>
$(function(){
	$("#testInput").autocomplete({
						source : function(request, response) {
							$.ajax({
								url : "${pageContext.request.contextPath}/Ajax/eBookSearchAjax.do",
								type : "GET",
								dataType : "json",
								data : {data : $("#testInput").val()},	 // 검색 키워드
								success : function(data) { // 성공
									response($.map(data, function(item) {
											$('#hidden').val(item.result);
											$('#realHidden').val(item.title);
											return {
												label : item.title, //목록에 표시되는 값
												value : item.title, //선택 시 input창에 표시되는 값	
												idx : item.testIdx
											};
									})); //response
								},//success
								error : function() { //실패
									alert("통신에 실패했습니다.");
								}
							});//ajax
						},//source: function
						minLength : 1,
						autoFocus : false,
						select : function(evt, ui) {
							//$('#hidden').html(ui.item.value);
							//var v = ui.item.label;
							//var arr = v.split('/');
							//$('#testInput').val(arr[0]);
							//$('#hidden').val(arr[1]);
							console.log("전체 data: " + JSON.stringify(ui));
							console.log("db Index : " + ui.item.idx);
							console.log("검색 데이터 : " + ui.item.value);
						},
						focus : function(evt, ui) {
						return false;
						},
						close : function(evt) {
						}
	})//autoComplete
	
//	$('input[name=gen]').eq(0).attr("checked", true);
	
	

	gopage(1); //시작하자마자 전체불러오기용
	
	$(".pixel-radio").on("click",function(){
		gopage(1);
	});//end of on & function
	imgClick();
	
});

function gopage(p){
	var gen = $("input[name='gen']:checked").val();
	//location.href="${pageContext.request.contextPath}/eBookCategory.do?gen="+gen;
	 $.ajax({
		url: "${pageContext.request.contextPath}/Ajax/eBookCategoryAjax.do",
		type: "GET",
		data : {gen : gen, page : p},
		success : function(data){ //연결성공
			$("#row").html(data);
		}

	 })
}


function imgClick(book_no) {
	if(book_no != null){
		if(confirm("해당 책 상세페이지로 이동하시겠습니까?")){			
			location.href="${pageContext.request.contextPath}/eBookDetail.do?book_no="+book_no;
		}
	}
}



</script>
</head>
<body>
	<!-- ================ category section start ================= -->		  
  <section class="section-margin--small mb-5">
    <div class="container">
      <div class="row">
        <div class="col-xl-3 col-lg-4 col-md-5">
          <div class="sidebar-categories">
            <div class="head">Categories</div>
            <ul class="main-categories">
              <li class="common-filter">
                <form action="#">
                  <ul>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="r1" name="gen" value="" checked="checked"><label for="r1">전체<span></span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="r2" name="gen" value="d1"><label for="r2">소설<span> (${count[0].count})</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="r3" name="gen" value="d2"><label for="r3">시/에세이<span> (${count[1].count})</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="r4" name="gen" value="d3"><label for="r4">무협/판타지<span> (${count[2].count})</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="r5" name="gen" value="d4"><label for="r5">인문<span> (${count[3].count})</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="r6" name="gen" value="d5"><label for="r6">로맨스<span> (${count[4].count})</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="r7" name="gen" value="d6"><label for="r7">자기계발<span> (${count[5].count})</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="r8" name="gen" value="d7"><label for="r8">경제경영<span> (${count[6].count})</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="r9" name="gen" value="d8"><label for="r9">아동<span> (${count[7].count})</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="r10" name="gen" value="d9"><label for="r10">유아<span> (${count[8].count})</span></label></li>
                  </ul>
                </form>
              </li>
            </ul>
          </div>
          <div class="sidebar-filter">
            <div class="top-filter-head"></div>
		
          </div>
          
          	<section class="related-product-area">
		<div class="container">
			<div class="section-intro pb-60px">
        <p>Best Seller</p>
        <h3>Top <span class="section-intro__style">5</span></h3>
      </div>
			
		</div>
	</section>
          <div class="row mt-30">
        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
          <c:forEach items="${bestBooks}" var="bestBook">
            <div class="single-search-product d-flex">
              <a href="#"></a>
              <div class="desc">
                  <a href="#" class="title">
                  	<c:if test="${not empty bestBook.book_img}">
						<td>
							<img src="filenameDownload.do?filename=${bestBook.book_img}" style="width: 200px" onclick="imgClick(${bestBook.book_no})">
						</td>
					</c:if>
				  </a>
                  <div class="price">${bestBook.title}</div>
              </div>
            </div>
          </c:forEach>
          </div>
        </div>

      </div>
        </div>
        
        

        <div class="col-xl-9 col-lg-8 col-md-7">
          <!-- Start Filter Bar -->
          <div class="filter-bar d-flex flex-wrap align-items-center">
           <%--  <div class="sorting">
              <select>
                <option value="1">Default sorting</option>
                <option value="1">Default sorting</option>
                <option value="1">Default sorting</option>
              </select>
            </div>
            <div class="sorting mr-auto">
              <select>
                <option value="1">Show 12</option>
                <option value="1">Show 12</option>
                <option value="1">Show 12</option>
              </select>--%>
            </div>
            <div>
              <div class="input-group filter-bar-search">
                <input type="text" placeholder="Search" id="testInput">
                
                <form action="${pageContext.request.contextPath}/eBookSearchAfter.do">
                <input type="hidden" id="hidden" name="hidden">
                <input type="hidden" id="realHidden" name="realHidden">
                <div class="input-group-append">
                  <button><i class="ti-search"></i></button>
                </div>
                </form>
              </div>
            </div>
            
            
          <!-- End Filter Bar -->
          <!-- Start Best Seller -->
          <section class="lattest-product-area pb-40 category-list" id="row">


              <%-- --  <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <c:if test="${not empty books.book_img}">
						<td>
					 		<img src="filenameDownload.do?filename=${books.book_img}" style="width:500px">
						</td>
					</c:if>
					<h5>${books.title}</h5>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                  <c:if test="${not empty books.book_img}">
						<td>
					 		<img src="filenameDownload.do?filename=${books.book_img}" style="width:500px">
						</td>
					</c:if>
					<h5>${books.title}</h5>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                   <c:if test="${not empty books.book_img}">
						<td>
					 		<img src="filenameDownload.do?filename=${books.book_img}" style="width:500px">
						</td>
					</c:if>
					<h5>${books.title}</h5>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <c:if test="${not empty books.book_img}">
						<td>
					 		<img src="filenameDownload.do?filename=${books.book_img}" style="width:500px">
						</td>
					</c:if>
					<h5>${books.title}</h5>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                   <c:if test="${not empty books.book_img}">
						<td>
					 		<img src="filenameDownload.do?filename=${books.book_img}" style="width:500px">
						</td>
					</c:if>
					<h5>${books.title}</h5>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <c:if test="${not empty books.book_img}">
						<td>
					 		<img src="filenameDownload.do?filename=${books.book_img}" style="width:500px">
						</td>
					</c:if>
					<h5>${books.title}</h5>
                  </div> 
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                  <c:if test="${not empty books.book_img}">
						<td>
					 		<img src="filenameDownload.do?filename=${books.book_img}" style="width:500px">
						</td>
					</c:if>
					<h5>${books.title}</h5>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <c:if test="${not empty books.book_img}">
						<td>
					 		<img src="filenameDownload.do?filename=${books.book_img}" style="width:500px">
						</td>
					</c:if>
					<h5>${books.title}</h5>
                  </div>
                </div>
              </div> -->    --%>
       

          </section>
                    </div>
          <!-- End Best Seller -->
        </div>
      </div>
  </section>
  
	<!-- ================ category section end ================= -->		  

	<!-- ================베스트 셀러! ================= -->	

</body>
</html>