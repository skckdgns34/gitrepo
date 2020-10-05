<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<audio src="filenameDownload.do?filename=a.mp3"></audio>
<button data-playing="false" role="switch" aria-checked="false">
    <span>Play/Pause</span>
</button>
<input type="range" id="volume" min="0" max="2" value="1" step="0.01">
<input type="range" id="panner" min="-1" max="1" value="0" step="0.01">

</body>
</html>