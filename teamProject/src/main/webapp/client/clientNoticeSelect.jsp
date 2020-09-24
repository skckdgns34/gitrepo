<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<script>
function closeMe() {
    var win=window.open("","_self");
    win.close();
}
</script>
</head>
<body>
	<h3>공지사항</h3>
	<label for="title">제목 ${notice_title}
	<input type="hidden" name="notice_title" value="${notice_title}" /></label>
	<label> | 등록일
	<input type="hidden" name="notice_date" id="notice_date" readonly value="${notice.notice_date }" />
	</label>
	<br>
	<br>
	<textarea
		style="width: 50%; border: 1; overflow: visible; text-overflow: ellipsis; resize: none;"
		rows=30 id="notice_content" name="notice_date" value="${notice.notice_content }">${notice.notice_content }</textarea><br>
		<input type="button" value="닫기 " onclick="window.close();">

</body>
</html>