<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	 <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Accordion - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script>
  $( function() {
    $( "#accordion" ).accordion({
    	collapsible : true,
    	active : true 
    	
    });
  } );
  </script>
<style>
	li {list-style-type: none; float: left; margin-left: 20px;}
</style>
<meta charset="UTF-8">
<title>공지사항 - FAQ</title>
</head>
<body>
	<h1>공지</h1>
	<hr><br>
	<ul>
		<li><a href="<%=application.getContextPath() %>/client/clientNotice.jsp">공지사항</a>
		<li><a href="<%=application.getContextPath() %>/client/clientFAQ.jsp">FAQ</a>
		<li><a href="<%=application.getContextPath() %>/client/clientQuestion.jsp">문의</a>
	</ul><br>
	<br><hr>

<div id="accordion">
  <h3>제목</h3>
  <div>
    <p>내용</p>
  </div>
  <h3>제목</h3>
  	<p>내용</p>
</div>

</body>
</html>