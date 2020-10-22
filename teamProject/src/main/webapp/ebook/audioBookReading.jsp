<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css1/bootstrap.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css1/flaticon.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css1/themify-icons.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/vendors1/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/vendors1/nice-select/css/nice-select.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mainresource/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mainresource/vendors/nice-select/nice-select.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mainresource/css/style.css">

<!-- main css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css1/style.css" />
	
	 <!-- Css Styles -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css" type="text/css">
      <link href="<%=request.getContextPath()%>/resourse/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
	<script	src="<%=request.getContextPath()%>/mainresource/vendors/jquery/jquery-3.2.1.min.js"></script>
<style>

.section_gap{
padding : 40px;
}

.feature-img{
padding-left:25%}

#test{
padding-left:25%;
}
h2{
font-size:15px;
text-align: end;}

h3{
font-size:13px;
text-align: end;}

</style>


</head>
<body>


 <!--================Blog Area =================-->
    <section class="blog_area single-post-area section_gap">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 posts-list">
                    <div class="single-post row">
                    
                    <!-- 도서 이미지  -->
                        <div class="col-lg-12" style="padding: 10px;">
                            <div class="feature-img">
                               <img src="filenameDownload.do?filename=${book[0].book_img}" width="300"/>
                            </div>
                        </div>
                        
                        
                        <div class="col-lg-12 col-md-9 blog_details" id="test" style="width: 600px; max-width: 100%; padding-right: 50px;">
                            <h2>${book[0].title}</h2>
                        	<h3>${book[0].writer}</h3>
                        
                        
                        </div> <!-- end blog-detail -->
  		  </div>	<!-- end single row -->
    
              </div> <!-- posts-list --> 
                
                
                <!-- 오른쪽 메뉴바 -->
                <div class="col-lg 6">
                        <div class="blog_right_sidebar">
                          
                       
                            <aside class="single-sidebar-widget tag_cloud_widget">
                             <h4>My BookMark </h4>
                             <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
								<thead>
									<tr>
										<th hidden="hidden">번호</th>
										<th>위치</th>
										<th>북마크 내용</th>
										<th>삭제</th>
									</tr>
								</thead>
									<tbody id="bookMarkTbody">
										<c:forEach items="${markList }" var="markList">
											<tr class="tr-hover" onclick="bookMarkClick(this)">
												<td hidden="hidden">${markList.rownum }<input type="hidden" value="${markList.bookmark_no}"></td>
												<td class="mark_index">${markList.bookmark_index } 초</td> 
												<td>${markList.bookmark_contents }</td>
												<td><button class="delete"  onclick='delBookMark(this)'>삭제</button></td>
											</tr>
										</c:forEach>
									</tbody>
							</table>    
                            </aside>
                            
                              <aside class="single_sidebar_widget popular_post_widget">
                                <h3 class="widget_title">Media player</h3>
                                <div class="media post_item">
                                   
                                    <div class="media-body" style="padding-left: 25%">
                                        <input id="markContent">
											<button class="button button-login w-20" id="button3">북마크</button><br>
											
											<audio controls="controls" id="audio" preload="preload">
												<source
													src="/mediaServer/audio/a.mp3" type="audio/ogg"/><!-- ${book[0].audio_path} -->
											</audio>
											<br><br>
											
											<div style="padding-top: 30px">
											<button class="button button-login w-20" id="button1" data-playing="false" role="switch" aria-checked="false">
												<span>재생/정지</span>
											</button>
											<button class="button button-login w-20" id="button2">초기화</button><br></div>
                                    </div>
                                </div>
                               
                                <div class="br"></div>
                            </aside>
                        </div>
                    </div>
                  <!--  내가 읽은 책 목록 띄워줄 곳 -->   
		        <div class="col-lg 12" >
		                    <div class="navigation-area" style="margin-top: 20px;">
		                    <div class="comment-form" style="margin-top: 20px;" >
		                        <h4>My Library </h4>
		                       <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>번호</th>
									<th>책 제목</th>
									<th>찜 여부</th>
									<th>저자</th>
									<th>마지막 읽던 위치</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${mylib }" var="list">
									<tr class="tr-hover2">
										<td>${list.mylibrary_no }
											<input type="hidden" value="${list.book_no }">
										</td>
										<td>${list.title }</td>
										<td>${list.wish}</td>
										<td>${list.writer }
										<td id="last_index">${list.last_read_index}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
		                       
		                       
		                    </div>
		                </div>
		        </div>
        
        
        </div>
        </div>
        
        <div style="padding-left:45%"> <button class="button button-login w-20" id="button4">닫기</button></div>
       
    </section>
    <!--================Blog Area =================-->



<!-- jQuery first, then Popper.js, then Bootstrap JS -->

<script>
	const AudioContext = window.AudioContext || window.webkitAudioContext;
	const audioContext = new AudioContext();
	const audioElement = document.querySelector('audio');
	const track = audioContext.createMediaElementSource(audioElement);
	track.connect(audioContext.destination);
	const playButton = document.getElementById('button1');
	const resetButton = document.getElementById('button2');
	audioElement.currentTime = ${book_index}
	
	 var book_no = '${book[0].book_no}';
	 //데이터테이블 쓸꺼
	

	
	
	$("#mark_index").on("click")
	
	
	resetButton.addEventListener('click',function(){
		audioElement.currentTime=0;
	})
	playButton.addEventListener('click', function() {
		
	    // check if context is in suspended state (autoplay policy)
	    if (audioContext.state === 'suspended') {
	        audioContext.resume();
	    }

	    // play or pause track depending on state
	    if (this.dataset.playing === 'false') {
	        audioElement.play();
	        this.dataset.playing = 'true';
	    } else if (this.dataset.playing === 'true') {
	        audioElement.pause();
	        this.dataset.playing = 'false';
	        $.post("audioBookIndexUpdate.do", {index: audioElement.currentTime,
              	book_no: book_no},function(data){
              		$("#last_index").html(audioElement.currentTime.toFixed(0));
           }); 
	    }
	}, false);
	audioElement.addEventListener('ended', function() {
	    playButton.dataset.playing = 'false';
	}, false);
	const gainNode = audioContext.createGain();
	track.connect(gainNode).connect(audioContext.destination);
	
	
	//북마크, mylob 고른거 호버주고
	$(".tr-hover").hover(function(){
		$(this).css("background-color", "lightgray");
		$(this).css("cursor","pointer");
	},function(){
		$(this).css("background-color", "");
	});
	
	//북마크 온클릭
	function bookMarkClick(tr){
		var mark_index = $(tr).find("td.mark_index").text();
		var mark_inde = mark_index.split(" ");
		console.log(mark_inde);
		audioElement.currentTime = mark_inde[0];
	}

	
	
	//mybook 고른거 호버주고
	$(".tr-hover2").hover(function(){
		$(this).css("background-color", "lightgray");
		$(this).css("cursor","pointer");
	},function(){
		$(this).css("background-color", "");
	});
	
	//mybook 온클릭
	$(".tr-hover2").on("click",function(){
		var my_book_no = $(this).find('input[type=hidden]').val();
		console.log(my_book_no);
		location.href="audioBookReading.do?book_no="+my_book_no;
	});
	
	
	//북마크 삭제
	function delBookMark(btn){
		var bookmark_no = $(btn).closest('tr').find('input[type=hidden]').val();
		console.log(bookmark_no);
		$.post("audioBookMarkDelete.do", {bookmark_no : bookmark_no });
		$(btn).closest('tr').remove();
		if(bookmark_no != null){
			alert("삭제 되었");
		}
	}
	
	
	 //북마크 찍는거
	$("#button3").on("click",function(){
		var markcontents = $("#markContent").val();
		$.ajax({
			url : "audioBookMarkInsert.do",
			type: "POST",
			dataType : "json",
			data : {
				markcontents: markcontents,
				markIndex: audioElement.currentTime,
				book_no: book_no
			},
			success: function(data){
				var split_mark_index = data[0].bookmark_index.split(".");
				var addedMark = $("<tr class='tr-hover' onclick='bookMarkClick(this)'>" +
         		        "<td hidden='hidden'>" + data[0].bookmark_no + "<input type='hidden' value='data[0].rownum'></td>" +
         		        "<td>" + split_mark_index[0]+ " 초</td>" + 
         		        "<td>" + data[0].bookmark_contents + "</td>" +
         		        "<td><button class='delete' onclick='delBookMark(this)'>삭제</button></td>" +
         		        "</tr>");
         	$("#bookMarkTbody").append(addedMark);
			}
		});
	});
	
	 $("#button4").on("click",function(){
		 window.close();
	 });
	
</script>

	<script	src="<%=request.getContextPath()%>/resource/js1/bootstrap.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resource/vendors1/nice-select/js/jquery.nice-select.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resource/vendors1/owl-carousel/owl.carousel.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resource/js1/owl-carousel-thumb.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resource/js1/jquery.ajaxchimp.min.js"></script>
	<script src="<%=request.getContextPath()%>/resource/js1/mail-script.js"></script>
	
	<script src="<%=request.getContextPath()%>/mainresource/vendors/skrollr.min.js"></script>	
	<script src="<%=request.getContextPath()%>/mainresource/js/main.js"></script>
	<script src="<%=request.getContextPath()%>/resource/js/jquery.nicescroll.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/jquery.magnific-popup.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/jquery.countdown.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/jquery.slicknav.js"></script>
    <script src="<%=request.getContextPath()%>/resource/js/mixitup.min.js"></script>
    
      <script src="<%=request.getContextPath()%>/resourse/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="<%=request.getContextPath()%>/resourse/vendor/datatables/dataTables.bootstrap4.min.js"></script>
  
  
  
  
</body>
</html>