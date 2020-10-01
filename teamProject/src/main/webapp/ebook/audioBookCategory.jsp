<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 원본 -->
<%-- <link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/layout/styles/slider.css"> --%>

<!-- 추가 -->
<link rel="stylesheet" href="test/css/bootstrap.css" />
<link rel="stylesheet" href="test/css/flaticon.css" />
<link rel="stylesheet" href="test/css/themify-icons.css" />
<link rel="stylesheet" href="test/vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet" href="test/vendors/nice-select/css/nice-select.css" />
<!-- main css -->
<link rel="stylesheet" href="test/css/style.css" />
<script>
	$(function() {
		$("#testInput")
				.autocomplete(
						{
							source : function(request, response) {
								$
										.ajax({
											url : "${pageContext.request.contextPath}/Ajax/audioBookSearchAjax.do",
											type : "GET",
											dataType : "json",
											data : {
												data : $("#testInput").val()
											}, // 검색 키워드
											success : function(data) { // 성공
												response($.map(data, function(
														item) {
													$('#hidden').val(
															item.result);
													$('#realHidden').val(
															item.title);
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

	});

	function imgClick(book_no) {
		if (book_no != null) {
			if (confirm("해당 책 상세페이지로 이동하시겠습니까?")) {
				location.href = "${pageContext.request.contextPath}/audioBookDetail.do?book_no="
						+ book_no;
			}
		}
	}
</script>


</head>


<body>
	<h3>오디오책</h3>
	<input type="text" id="testInput" placeholder="검색할 내용 입력" name="search" />
	<form
		action="${pageContext.request.contextPath}/audioBookSearchAfter.do"
		method="post">
		<input type="hidden" id="hidden" name="hidden" /> <input
			type="hidden" id="realHidden" name="realHidden" />
		<button>검색</button>
	</form>



	<!-- test  -->
	<div class="popular_courses section_gap_top">
		<div class="container">
			<div class="row">
				<!-- single course -->
				<div class="col-lg-12">
					<div class="owl-carousel active_course">
						
						
						<div class="single_course">
							<div class="course_head"><img class="img-fluid" src="test/img/courses/c1.jpg" alt="" />
							</div>
							<div class="course_content">
								<h4 class="mb-3"><a href="책상세 주소?">제목칸?</a></h4>
								<p>설명</p>
								<div
									class="course_meta d-flex justify-content-lg-between align-items-lg-center flex-lg-row flex-column mt-4">
								</div>
							</div>
						</div>
						<div class="single_course">
							<div class="course_head"><img class="img-fluid" src="test/img/courses/c2.jpg" alt="" />
							</div>
							<div class="course_content">
								<h4 class="mb-3"><a href="책상세 주소">제목</a></h4>
								<p>설명?</p>
								<div
									class="course_meta d-flex justify-content-lg-between align-items-lg-center flex-lg-row flex-column mt-4">
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>





	<!-- 테스트 -->
	<%-- <c:forEach begin="1" end="${genreList.size() }" var="i">
	${i }
	<div>${genreList.get(i-1).code_value}</div>
	<div class="wrapper-slider">
 		<div class="arrow-left"></div>
   		<div class="arrow-right"></div>
    	<div class="items">
			<c:forEach begin="1" end="${books.get(i-1).size() }" var="j">
				<div class="item item1">
					<c:if test="${not empty books[i-1][j-1].book_img}">
						<img onclick="imgClick(${books[i-1][j-1].book_no})" 
		 					src="filenameDownload.do?filename=${books[i-1][j-1].book_img }" 
		 					/><br>
		 				
					</c:if>
				</div>
			</c:forEach>
		</div>
	</div>
</c:forEach>
 --%>
 	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="test/js/jquery-3.2.1.min.js"></script>
	<script src="test/js/bootstrap.min.js"></script>
	<script src="test/vendors/nice-select/js/jquery.nice-select.min.js"></script>
	<script src="test/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="test/js/owl-carousel-thumb.min.js"></script>
	<script src="test/js/jquery.ajaxchimp.min.js"></script>
	<!--gmaps Js-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="test/js/gmaps.min.js"></script>
	<script src="test/js/theme.js"></script>
</body>
</html>