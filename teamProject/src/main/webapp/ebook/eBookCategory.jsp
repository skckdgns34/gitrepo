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
var searchData;
$(function(){
	$("#testInput").autocomplete({
						source : function(request, response) {
							$.ajax({
								url : "${pageContext.request.contextPath}/Ajax/eBookSearchAjax.do",
								type : "GET",
								dataType : "json",
								data : {data : $("#testInput").val()},	 // 검색 키워드
								success : function(data) { 				// 성공
									searchData =[];
									response($.map(data, function(item) {
											searchData[item.title] = item.result; //searchData[item.title] item.title이 배열안에서 키로 쓰는것
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
							console.log("전체 data: " + JSON.stringify(ui));
							console.log("db Index : " + ui.item.idx);
							console.log("검색 데이터 : " + ui.item.value);
							$('#realHidden').val(ui.item.value);
							$('#hidden').val(searchData[ui.item.value]);
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

<style>

.price{
 
  font-size: 18px;
   font-weight: 500;
   display:inline-block;
  width:100px; 
  white-space: nowrap; 
  overflow: hidden; 
  text-overflow: ellipsis;
  border:1px solid transparent; 
 

}
</style>
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
							<a href="${pageContext.request.contextPath}/main.do">Home</a> <span>전자책</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->




				<!-- ================ category section start ================= -->
				<section class="section mb-5" style="padding-top:50px">
					<div class="container">
						<div class="row">
							<div class="col-lg-3 col-md-5">
								<div class="sidebar-categories">
									<div class="head">Categories</div>
									<ul class="main-categories">
										<li class="common-filter">

											<ul>
												<li class="filter-list"><input class="pixel-radio"
													type="radio" id="r1" name="gen" value="" checked="checked">
													<label for="r1">전체<span>(${allCount})</span></label></li>
												<c:forEach items="${count}" var="count" varStatus="status">
													<li class="filter-list"><input class="pixel-radio"
														type="radio" id="${count.genre}" name="gen"
														value="${count.genre}"><label for="${count.genre}">${genreName[status.index].genreName }<span>
																(${count.count})</span></label></li>
												</c:forEach>
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



        					<div class="col-xl-9 col-lg-8 col-md-7">
								<!-- Start Filter Bar -->
								<div class="filter-bar d-flex flex-wrap align-items-center">

								</div>
								<div>
									<form action="${pageContext.request.contextPath}/eBookSearchAfter.do" method="POST">
										<div class="input-group filter-bar-search" style="padding-bottom: 30px">
											<input type="text" placeholder="Search" id="testInput">
											<div class="input-group-append">
												<button>
													<i class="ti-search"></i>
												</button>
											</div>
											<input type="hidden" id="hidden" name="hidden"> 
											<input type="hidden" id="realHidden" name="realHidden">
										</div>
									</form>
								</div>


								<!-- End Filter Bar -->
								<!-- Start Menu -->
								<section class="lattest-product-area pb-40 category-list"
									id="row"></section>
							</div>
							<!-- End Menu -->
						</div>
					</div>
				</section>
</body>
</html>