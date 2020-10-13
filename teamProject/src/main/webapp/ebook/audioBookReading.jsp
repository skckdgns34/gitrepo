<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>

</head>
<body>
	<div class="container">
		<div class="row" align="center">
			<div class="col">
				<img src="filenameDownload.do?filename=${book[0].book_img}" width="300"/><br>
				<label id="book_no">book_no: ${book[0].book_no}</label><br> 
				<label>title: ${book[0].title}</label><br>
				<label">writer: ${book[0].writer}</label><br>
				<label">book_index: ${book_index}</label><br>
			</div>
			<div class="col" style="border-left: 1px solid gray">
				<table id="bookmark">
					<thead>
						<tr>
							<th>번호</th>
							<th>마크 인덱스</th>
							<th>마크 내용</th>
							<th>삭제</th>
							
						</tr>
					</thead>
					<tbody id="bookMarkTbody">
						<c:forEach items="${markList }" var="markList">
							<tr class="tr-hover">
								<td >${markList.rownum }<input type="hidden" value="${markList.bookmark_no}"></td>
								<td class="mark_index">${markList.bookmark_index } 초</td> 
								<td>${markList.bookmark_contents }</td>
								<td><button class="delete">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<input id="markContent">
				<button class="btn btn-primary" id="button3">북마크</button><br>
				
				<audio controls="controls" id="audio" preload="preload">
					<source
						src="/mediaServer/audio/a.mp3"<%-- ${book.audio_path } --%>
						type="audio/ogg"/>
				</audio>
				<br><br>
				볼륨<input type="range" id="volume" min="0" max="2" value="1" step="0.01"><br>
				
				<button class="btn btn-primary" id="button1" data-playing="false" role="switch" aria-checked="false">
					<span>재생/정지</span>
				</button>
				<button class="btn btn-primary" id="button2">초기화</button><br>
			</div>
		</div>
		<br><br><br>
		<div class="row">
			<div class="col">
				<table id="mylib" >
					<thead>
						<tr>
							<th>mylib_no</th>
							<th>책 제목</th>
							<th>찜 여부</th>
							<th>저자</th>
							<th>last index</th>
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
								<td>${list.last_read_index}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
	
		</div>
	</div>
	
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
	 $('#mylib').DataTable();
	 $('#bookmark').DataTable();

	
	
	//$("#mark_index").on("click")
	
	
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
           }); 
	    }
	}, false);
	audioElement.addEventListener('ended', function() {
	    playButton.dataset.playing = 'false';
	}, false);
	const gainNode = audioContext.createGain();
	track.connect(gainNode).connect(audioContext.destination);
	
	const volumeControl = document.querySelector('#volume');

	volumeControl.addEventListener('input', function() {
	    gainNode.gain.value = this.value;
	}, false);
	
	//북마크, mylob 고른거 호버주고
	$(".tr-hover").hover(function(){
		$(this).css("background-color", "lightgray");
		$(this).css("cursor","pointer");
	},function(){
		$(this).css("background-color", "");
	});
	
	//북마크 온클릭
	$(".tr-hover").on("click",function(){
		var mark_index = $(this).find("td.mark_index").text();
		var mark_inde = mark_index.split(" ");
		audioElement.currentTime = mark_inde[0];
	});
	
	
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
	$(".delete").on("click", function(){
		var bookmark_no = $(this).closest('tr').find('input[type=hidden]').val();
		console.log(bookmark_no);
		$.post("audioBookMarkDelete.do", {bookmark_no : bookmark_no });
		$(this).closest('tr').remove();
		alert("삭제됨.")
	});
	
	
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
				var addedMark = $("<tr class='tr-hover'>" +
         		        "<td>" + data[0].bookmark_no + "<input type='hidden' value='data[0].rownum'></td>" +
         		        "<td>" + data[0].book_no + "</td>" +
         		        "<td>" + split_mark_index[0]+ "</td>" + 
         		        "<td>" + data[0].bookmark_contents + "</td>" +
         		        "<td><button class='delete'>삭제</button></td>" +
         		        "</tr>");
         	$("#bookMarkTbody").append(addedMark);
			}
		});
	});
	
</script>

</body>
</html>