<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	$(function() {
		$("#genre").on("change",function() {
			var genre = $(this).val();
			(genre);
				location.href = "${pageContext.request.contextPath}/createBookMain.do?genre="+ genre
			}) //장르 select 태그 바뀔때마다 페이지 새로 띄우는거.

		$("img").on("click",function() {
			var book_no = $(this).next().val()
			location.href = "${pageContext.request.contextPath}/eBookDetail.do?book_no="+ book_no;
		}).css('cursor', 'pointer');

		$(".blog_details").hover(function() {
			$(this).css("cursor", "pointer");
		});
		
		$(".blog_details").on("click",function() {
			var book_no = $(this).parent().parent().find("input[type=hidden]").val()
			location.href = "${pageContext.request.contextPath}/eBookDetail.do?book_no="+ book_no;
		}).css('cursor', 'pointer');
		
		$("#write").on("click",function() {
			var m_no = "${sessionScope.member_no}";
			console.log(m_no + "a");
			if (m_no == "") {
				alert("로그인이 필요한 기능.")
				location.href = "${pageContext.request.contextPath}/memberLogin.do";
			} else {
				location.href = "${pageContext.request.contextPath}/createBookWrite.do";
			}
			//location.href="${sessionScope.member_no}"
			})

		//
		$(".tr").hover(function() {
			$(this).css("background-color", "lightgray");
			$(this).css("cursor", "pointer");
		}, function() {
			$(this).css("background-color", "");
		});

		//
		$(".tr").on("click",function() {
			var book_no = $(this).find('input[type=hidden]').val();
			location.href = "${pageContext.request.contextPath}/eBookDetail.do?book_no="+ book_no;
		});
	});
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
							<a href="${pageContext.request.contextPath}/main.do">Home</a> <span>나만의 도서</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	
	<!--================Blog Area =================-->
    <section class="blog_area section_gap">
    
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="blog_left_sidebar">
                     <c:if test="${empty userBooks }">없다</c:if>
		                   <select name="genre" id="genre">
								<option>전체</option>
								<c:forEach items="${genreList }" var="genre">
									<option value="${genre.code }">${genre.code_value }(${genre.count })</option>
								</c:forEach>
						    </select>
                        <article class="row blog_item">
                        
                        <c:forEach items="${userBooks }" var="userBook">
                            <div class="col-md-3">
                                <div class="blog_info text-right">
                                
                                    <div class="post_tag">
							             
												
                                        <a href="#">장르</a>
                                        <a class="active" href="#">소설</a>
                                       
                                    </div>
                                    
                                    <ul class="blog_meta list">
                                        <li><a href="#">${userBook.writer }<i class="ti-user"></i></a></li>
                                       
                                        <li>
	                                        <fmt:parseDate value="${userBook.publication_date}" pattern="yyyy-MM-dd HH:mm:ss" var="publication_date"/>
							    			
                                        	<a href="#"><fmt:formatDate value="${publication_date}"  pattern="yyyy/MM/dd"/>
                                        		<i class="ti-calendar"></i>
                                        	</a>
                                        </li>
                                        <li><a href="#">${userBook.views }<i class="ti-eye"></i></a></li>
                                        <li><a href="#">(${userBook.score })<i class="ti-comment"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            
                            <div class="col-md-9">
                                <div class="blog_post">
							<%-- <img src="<%=request.getContextPath()%>/resource/img/blog/main-blog/m-blog-1.jpg" alt=""> --%>
								 <img src="filenameDownload.do?filename=${userBook.book_img}" style="width:368px; height:186px;">
                                   <input type="hidden" name ="h_book_no" value="${userBook.book_no}">
                                    <div class="blog_details">
                                        <a href="">
                                            <h2>${userBook.title }</h2>
                                        </a>
                                        <p><fmt:formatDate value="${publication_date}"  pattern="yyyy/MM/dd"/></p>
                                 		 <p>${userBook.code_value }</p>
                                 		 <p>${userBook.summary }</p>
                                        <a href="${pageContext.request.contextPath}/eBookDetail.do?book_no=${userBook.book_no}" class="blog_btn">View More</a>
                                    </div>

                                </div>
                            </div>
                             </c:forEach>
                             
                        </article>
                        
                        
                      <!-- 페이징(기능 없음... 껍데기만 있음) -->
                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Previous">
                                        <span aria-hidden="true">
                                            <i class="ti-angle-left"></i>
                                        </span>
                                    </a>
                                </li>
                                <li class="page-item active"><a href="#" class="page-link">01</a></li>
                                <li class="page-item"><a href="#" class="page-link">02</a></li>
                                <li class="page-item"><a href="#" class="page-link">03</a></li>
                                <li class="page-item"><a href="#" class="page-link">04</a></li>
                                <li class="page-item"><a href="#" class="page-link">09</a></li>
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Next">
                                        <span aria-hidden="true">
                                            <i class="ti-angle-right"></i>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                
                
                
                <!-- 베스트셀러 들어 갈 부분 -->
              
               <div class="col-lg-4">
                                  
               
                    <div class="blog_right_sidebar">
                    		<button id="write" class="button button-login w-20">글쓰기</button>
                        <aside class="single_sidebar_widget search_widget">
                        	
                        <!-- 검색창(껍데기만 있음) -->
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button"><i class="ti-search"></i></button>
                                </span>
                                	
                            </div><!-- /input-group -->
                            <div class="br"></div>
                            
                        </aside>
                        
                       <!-- 인기책ㅋㅋ -->
                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">Popular Books</h3>
                             <c:forEach items="${userBookRank }" var="list">
                            <div class="media post_item">
                                ${list.no }<img src="filenameDownload.do?filename=${list.book_img}" style="width:100px; padding-left:20px" >
                            	<input type="hidden" value="${list.book_no }">
                                
									
                                <div class="media-body">
                                    <a href="blog-details.html">
                                        <h3>${list.title}</h3>
                                    </a>
                                    <p>${list.views}</p>
                                    <p>${list.writer}</p>
                                </div>
                            </div>
                            </c:forEach>     
                            <div class="br"></div>
                        </aside>
                        
                       <!-- 장르별 카테고리 나타내기 -->
                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">Post Catgories</h4>
                            <ul class="list cat-list">
                               <c:forEach items="${genreList }" var="genre">
								 <li>
                                    <a href="${pageContext.request.contextPath}/createBookMain.do?genre2=${genre.code }" class="d-flex justify-content-between">
                                        <p>${genre.code_value }</p>
                                        <p>(${genre.count })</p>
                                    </a>
                                </li>		
							</c:forEach>
                               
                         
                            </ul>
                            <div class="br"></div>
                        </aside>
                        
                       <!--  디자인 용으로 걍 살려둡...시다! -->
                        <aside class="single_sidebar_widget author_widget">
                            <img class="author_img rounded-circle" src="img/blog/author.png" alt="">
                            <h4>Charlie Barber</h4>
                            <p>Senior blog writer</p>
                            <div class="social_icon">
                                <a href="#"><i class="ti-facebook"></i></a>
                                <a href="#"><i class="ti-twitter"></i></a>
                                <a href="#"><i class="ti-github"></i></a>
                                <a href="#"><i class="ti-linkedin"></i></a>
                            </div>
                            <p>Boot camps have its supporters andit sdetractors. Some people do not understand why you
                                should have to spend money on boot camp when you can get. Boot camps have itssuppor
                                ters andits detractors.</p>
                            <div class="br"></div>
                        </aside>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->
	
	

</body>
</html>