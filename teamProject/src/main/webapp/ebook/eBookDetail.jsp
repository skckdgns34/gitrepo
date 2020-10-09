<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
$(function(){
	btnHideNShow();
	btnScore();
	reviewAllList();
});



//리뷰작성하면 바로 리뷰리스트에 맨위에다가 붙이기
 function reviewInsert(){
	var review = $("#reviewArea").val();
	$.ajax({
		url : "${pageContext.request.contextPath}/Ajax/eBookReview.do",
		type: "POST",
		data: {
			member_no : "${member_no}",
			member_nickname : "${member_nickname}",
			review : review ,
			book_no : "${book[0].book_no}"
		},
		success: function(result){
			reviewAllList(1);
			 $("#reviewArea").val('');
		}
	})
}


 function reviewAllList(page){ //리뷰전체조회
		$.ajax({
			url : "${pageContext.request.contextPath}/Ajax/eBookReviewAllList.do",
			type: "POST",
			data: {
				member_no : "${member_no}",
				book_no : "${book[0].book_no}",
				page : page
			},
			success: function(result){
				$("#reviewField").html(result);
			}
		})
	}
 
 
 function reviewUpdateBefore(){ //수정버튼 누르면 이걸로옴
	 var reviewContents =  $(event.target).closest("#review_no").next().html(); //컨텐츠에 들어가있는 값가져옴
	 $(event.target).closest("#review_no").next().hide();	 
	 $(event.target).closest(".review_item").append($("<input>").attr("id","newreview").val(reviewContents));
	 $(event.target).closest(".review_item").append($("<button>등록</button>").attr("id","btnup").attr("class","btn btn-link").on("click",reviewUpdate));
	 $(event.target).closest(".review_item").append($("<button>취소</button>").attr("id","btncan").attr("class","btn btn-link").on("click",reviewUpdateBeforeCancel));
	 $(event.target).hide();
	 $(event.target).next().hide();
 }
 
 function reviewUpdateBeforeCancel(){ // 수정하기 눌러서 뜨는 버튼들 중에 취소누르면 수정하는거 없애는거
	 $(event.target).parent().find("#reUpBtn").show();
	 $(event.target).parent().find("#reDelBtn").show();
	 $(event.target).prevAll("#newreview").hide();
	 $(event.target).prevAll("#btnup").hide();
	 $(event.target).prevAll("#review_contents").show();
	 $(event.target).hide();
 }
 
 function reviewUpdate(){ //리뷰수정
	 var review_no =$(event.target).prevAll("#review_no").data("review_no");
	 var page = $(".pagination").find(".active").html();
	 var paging = $.trim(page);
	 var contents = $(event.target).prevAll("#newreview").val();
	 $(event.target).parent().find("#reUpBtn").show();
	 $(event.target).parent().find("#reDelBtn").show();
	 $(event.target).prevAll("#newreview").hide();
	 $(event.target).next("#btncan").hide();
	 $(event.target).hide();
		$.ajax({
			url : "${pageContext.request.contextPath}/Ajax/eBookReviewUpdate.do",
			type: "POST",
			data: {
				review_no : review_no,
				contents : contents
			},
			success: function(result){
				reviewAllList(paging)
			}
		})
	}
 
 
 
 function reviewDelete(){ //리뷰삭제
		var  review_no =$(event.target).closest("#review_no").data("review_no");
 		var delpage = $(event.target).closest(".review_item");
 		var page = $(".pagination").find(".active").html();
 		var paging = $.trim(page);
 		
 		console.log(paging + "가져와서자른거");
 		console.log(review_no);
 		
		$.ajax({
			url : "${pageContext.request.contextPath}/Ajax/eBookReviewDelete.do",
			type: "POST",
			data: {
				review_no : review_no,
				member_no : "${member_no}"
			},
			success: function(result){
				reviewAllList(paging);
			}
		})
	}



function btnHideNShow(){
	if("${checkCode}" != ""){ //이용자가 티켓코드가 없을시 결재버튼 보여주기 & 있으면 읽기버튼보여주기
		$("#check").hide(); 
		$("#read").show();
	}else if("${checkCode}" == ""){
		$("#read").hide();
		$("#check").show();
	}
}



function goRead(){ //읽기버튼이 생성되면 읽는페이지로 이동
	location.href="${pageContext.request.contextPath}/eBookReading.do";
}

function reviewLogin(){ //하트 추천기능  로그인안하고 누를려고 하면 로그인 표시 보여주는거
	location.href="${pageContext.request.contextPath}/memberLogin.do";
}

var check = "${check}"

function btnScore(){ // 추천버튼 클릭시(추천 추가 또는 추천 제거)
	$("#rec_update").click(function(){
		$.ajax({
			url: "${pageContext.request.contextPath}/Ajax/eBookRecommendation.do",
            type: "POST",
            dataType: "JSON",
            data: {
                book_no: "${book[0].book_no}",
                member_no: "${member_no}",
                check: check
            },
            success: function (result) {
            	check = result.check;
		        if(check == 0){
		        	$(".fa-heart").css("color", "gray")
		        }else{
		        	$(".fa-heart").css("color", "red")
		        }
            	$(".rec_count").html(result.count); 
            	console.log(check);
            }
		})
	})
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
                            <a href="./index2.jsp">Home</a>
                            <span>전자책</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="owl-carousel owl-theme s_Product_carousel">
						<div class="single-prd-item">
							<c:if test="${not empty book[0].book_img}">
									<img  src="filenameDownload.do?filename=${book[0].book_img}" style="width:500px">
							</c:if>
						</div>
						
					</div>
				</div>
				
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>책 제목  : ${book[0].title}</h3>
						<h2>책 저자 : ${book[0].writer}</h2>
						<ul class="list">
							<li><a class="active"><span>카테고리</span> : ${book[0].genre}</a></li>
							<li>출간일 : 
								<fmt:parseDate value="${book[0].publication_date}" pattern="yyyy-MM-dd HH:mm:ss" var="publication_date"/>
						    	<fmt:formatDate value="${publication_date}"  pattern="yyyy/MM/dd"/>
						    </li> 
							<li><a ><span>조회수</span> ${book[0].views}</a></li>
							<li><a ><span>줄거리</span> ${book[0].summary}</a></li>
							<li><a ><span>베스트셀러</span> ${book[0].best_book}</a></li>
						</ul>
						</div>
						<hr>
						
					<div class="s_product_text">
							<c:if test="${ member_no == null }">
							
								추천 기능은 <button type="button" id="newLogin" >
								<b class="w3-text-blue" onclick="reviewLogin()">로그인</b></button> 후 사용 가능합니다.

								<i class="fa fa-heart" id="heart" style="font-size:16px;color:red"></i>
								<span class="rec_count"></span>			
							</c:if>
							<c:if test="${ member_no != null }">
							
								<c:if test="${check == 1}">
								
									<button class="w3-button w3-black w3-round" id="rec_update">
										<i class="fa fa-heart" style="font-size:16px;color:red"></i>
										&nbsp;<span class="rec_count">${count}</span>
									</button> 
									
								</c:if>
								<c:if test="${ check == 0}">
									<button class="w3-button w3-black w3-round" id="rec_update">
										<i class="fa fa-heart" style="font-size:16px;color:gray"></i>
										&nbsp;<span class="rec_count">${count}</span><!-- 좋아요수 -->
									</button> 
								
								</c:if>
							</c:if>
							<a class="button primary-btn" href="#" id="read" onclick="goRead()">읽기</a>
         					<a class="button primary-btn" href="#" id="check" onclick="licence()">결제</a> 
							</div>	

				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->
	
<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">소개글</a>
				</li>
				<!--  
				<li class="nav-item">
					<a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
					 aria-selected="false">Comments</a>
				</li>-->
				
				<li class="nav-item">
					<a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
					 aria-selected="false">Reviews</a>
				</li>
				
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
					<p>${book[0].introduction }</p>
				</div>
				
				
			<!--  
				<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="comment_list">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<%-- <img src="img/product/review-1.png" alt=""> --%>
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<h5>12th Feb, 2018 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
										commodo</p>
								</div>
								<div class="review_item reply">
									<div class="media">
										<div class="d-flex">
										<%--	<img src="img/product/review-2.png" alt="">--%>
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<h5>12th Feb, 2018 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
										commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
										<%--	<img src="img/product/review-3.png" alt="">--%>
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<h5>12th Feb, 2018 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
										commodo</p>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="review_box">
								<h4>Post a comment</h4>
								<form class="row contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="name" name="name" placeholder="Your Full name">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="email" class="form-control" id="email" name="email" placeholder="Email Address">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="number" name="number" placeholder="Phone Number">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<textarea class="form-control" name="message" id="message" rows="1" placeholder="Message"></textarea>
										</div>
									</div>
									<div class="col-md-12 text-right">
										<button type="submit" value="submit" class="btn primary-btn">Submit Now</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				
				-->
				<div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-12">
							<div class="row total_rate">
							
							</div>
							<div class="review_list" id="reviewField">
							</div>
							<%--여기가 iframe자리임 ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ --%>
						</div>
						<div class="col-lg-6">
							<div class="review_box">
								<%-- <h4>Add a Review</h4>
								<p>Your Rating:</p>
								<ul class="list">
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
								</ul>
								<p>Outstanding</p>--%>
								
								<!-- 리뷰쓰고 액션 -->
               		
               		
                   <div class="form-group">
                    <input class="form-control" name="name" type="text" readonly="readonly" placeholder="${member_nickname}" required>
                  </div>
                  
                  
                  
                  <c:if test ="${member_no == null }">
                  	<div class="form-group">
                    	<textarea class="form-control different-control w-100" name="textarea" readonly="readonly"  cols="30" rows="5" placeholder="리뷰는 로그인 후 사용 가능 합니다." id=""></textarea>
                  	</div>
                  </c:if>
                  <c:if test="${member_no != null}">
                  	<div class="form-group">
	                    <textarea class="form-control different-control w-100" name="textarea"  cols="30" rows="5" placeholder="리뷰 내용 입력" id="reviewArea"></textarea>
    	              </div>
    	              <div class="form-group text-center text-md-right mt-3">
                    <button type="submit" class="button button--active button-review" id="btnreview" onclick="reviewInsert()">Submit Now</button>
                  </div>
                  </c:if>   

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->	
</body>
</html>