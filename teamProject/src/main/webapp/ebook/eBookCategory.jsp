<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Menu</h4>
						<div class="breadcrumb__links">
							<a href="./index.html">Home</a> <span>전자책</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- ================ category section start ================= -->
	<section class="section-margin--small mb-5">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-5">
					<div class="sidebar-categories">
						<div class="head">Categories</div>
						<ul class="main-categories">
							<li class="common-filter">

								<ul>
									<li class="filter-list"><input class="pixel-radio" type="radio" id="r1" name="gen" value="" checked="checked"> <label for="r1">전체<span></span></label></li>
									<c:forEach items="${count}" var="count" >
										<li class="filter-list"><input class="pixel-radio" type="radio" id="r2" name="gen" value="${count.genre }"><label for="r2"> asd<span> (${count.count})</span></label></li>
									</c:forEach>
									<!-- <li class="filter-list"><input class="pixel-radio" type="radio" id="r3" name="gen" value="d2"><label for="r3">시/에세이<span> (${count[1].count})</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="r4" name="gen" value="d3"><label for="r4">무협/판타지<span> (${count[2].count})</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="r5" name="gen" value="d4"><label for="r5">인문<span> (${count[3].count})</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="r6" name="gen" value="d5"><label for="r6">로맨스<span> (${count[4].count})</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="r7" name="gen" value="d6"><label for="r7">자기계발<span> (${count[5].count})</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="r8" name="gen" value="d7"><label for="r8">경제경영<span> (${count[6].count})</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="r9" name="gen" value="d8"><label for="r9">아동<span> (${count[7].count})</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="r10" name="gen" value="d9"><label for="r10">유아<span> (${count[8].count})</span></label></li>-->

								</ul>
							</li>
						</ul>
					</div>
					<div class="sidebar-filter">
						<div class="top-filter-head"></div>

					</div>

					<div class="sidebar-categories">
						<div class="head">Best Seller Top 5</div>
						<div class="single-search-product-wrapper">
							<c:forEach items="${bestBooks}" var="bestBook">
								<div class="single-search-product d-flex">
									<a href="#"></a>
									<div class="desc">
										<a href="#" class="title"> <c:if
												test="${not empty bestBook.book_img}">
												<td><img
													src="filenameDownload.do?filename=${bestBook.book_img}"
													style="width: 200px"
													onclick="imgClick(${bestBook.book_no})"></td>
											</c:if>
										</a>
										<div class="price">${bestBook.title}</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>


				</div>



				<div class="col-lg-9 col-md-7">
					<!-- Start Filter Bar -->
					<div class="filter-bar d-flex flex-wrap align-items-center">

					</div>
					<div>
						<form
							action="${pageContext.request.contextPath}/eBookSearchAfter.do">
							<div class="input-group filter-bar-search">
								<input type="text" placeholder="Search" id="testInput">
								<div class="input-group-append">
									<button>
										<i class="ti-search"></i>
									</button>
								</div>
								<input type="hidden" id="hidden" name="hidden"> <input
									type="hidden" id="realHidden" name="realHidden">
							</div>
						</form>
					</div>


					<!-- End Filter Bar -->
					<!-- Start Menu -->
					<section class="lattest-product-area pb-40 category-list" id="row">
					</section>
				</div>
				<!-- End Menu -->
			</div>
		</div>
	</section>



</body>
</html>