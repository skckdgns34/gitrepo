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
		<li><a href="<%=application.getContextPath() %>/clientNotice.do">공지사항</a>
		<li><a href="<%=application.getContextPath() %>/clientFAQ.do">FAQ</a>
		<li><a href="<%=application.getContextPath() %>/clientQuestion.do">문의</a>
	</ul><br>
	<br><hr>

<div id="accordion">
  <h3>${title }</h3>
  <div>
    <p>${contents }</p>
  </div>
</div>

</body>
</html>