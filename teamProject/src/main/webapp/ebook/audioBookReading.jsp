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
</head>
<body>
	<%--  --%>
	<div class="container">

		<div class="row">
			<div class="col">
				<label id="book_no">book_no: ${book[0].book_no}</label><br> 
				<label>title: ${book[0].title}</label><br>
				<label">writer: ${book[0].writer}</label><br>
				<label">book_index: ${book_index}</label><br>
			</div>
		</div>

		<div class="row" align="center">
			<div class="col">
				<img src="filenameDownload.do?filename=${book[0].book_img}" />
			</div>
			<div class="col" style="border-left: 1px solid gray">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>mylib_no</th>
							<th>책 제목</th>
							<th>찜 여부</th>
							<th>last index</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${mylib }" var="list">
							<tr>
								<td><a href="audioBookReading.do?book_no=${list.book_no}">${list.mylibrary_no }</a></td>
								<td>${list.title }</td>
								<td>${list.wish}</td>
								<td>${list.last_read_index}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<hr>

		<div class="row">
			<div class="col">
				<audio controls="controls" id="audio" preload="preload">
					<source
						src="/mediaServer/audio/a.mp3"<%-- ${book.audio_path } --%>
						type="audio/ogg"/>
				</audio>
				<%-- <canvas id="my-canvas" width="300" height="20"></canvas> --%>
				<button id="button1" data-playing="false" role="switch" aria-checked="false">
					<span>재생/정지</span>
				</button>
				<button id="button2">초기화</button>
				볼륨<input type="range" id="volume" min="0" max="2" value="1" step="0.01">
				panner<input type="range" id="panner" min="-1" max="1" value="0" step="0.01">
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
	
	
	resetButton.addEventListener('click',function(){
		audioElement.currentTime=0;
	})
	playButton.addEventListener('click', function() {
		
	    // check if context is in suspended state (autoplay policy)
	    if (audioContext.state === 'suspended') {
	    	 //last_read_index 읽어와서 넣어주면 됨. 
	        audioContext.resume();
	    }

	    // play or pause track depending on state
	    if (this.dataset.playing === 'false') {
	        audioElement.play();
	        this.dataset.playing = 'true';
	    } else if (this.dataset.playing === 'true') {
	        audioElement.pause();
	        this.dataset.playing = 'false';
	        console.log(audioElement.currentTime);
	        var book_no = '${book[0].book_no}';
	        $.post("audioBookIndexUpdate.do", {index: audioElement.currentTime,
              book_no: book_no},function(data){
            	  console.log("성공");
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
	
	const pannerOptions = { pan: 0 };
	const panner = new StereoPannerNode(audioContext, pannerOptions);
	const pannerControl = document.querySelector('#panner');

	pannerControl.addEventListener('input', function() {
	    panner.pan.value = this.value;
	}, false);
	track.connect(gainNode).connect(panner).connect(audioContext.destination);

	
</script>
</body>
</html>