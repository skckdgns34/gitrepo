<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>

	
<!DOCTYPE html>
<html>
<head>
  <head>
<title>Kiraric</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="${pageContext.request.contextPath}/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<decorator:head></decorator:head>
</head>
<body id="top">
<!-- ################################################################################################ -->

<div class="wrapper row1">
  <header id="header" class="hoc clear"> 
   
    <div id="logo" class="fl_left">
      <h1><img class="img-fluid"style="width: 90px;" src="../images/로고.png"/></h1>
    </div>
    <nav id="mainav" class="fl_right">
      <ul class="clear">
        <li class="active"><a href="index.jsp">Home</a></li>
        <li><a class="drop" href="#">전자책</a></li>
        <li><a class="drop" href="#">오디오북</a></li>
        <li><a href="#">내정보</a></li>
        <li><a href="#">공지</a></li>

      </ul>
    </nav>
  </header>
</div>


<div class="wrapper bgded overlay" style="background-color: white;">
  <div id="pageintro" class="hoc clear"> 
   
    <article>
      <h2 class="heading">메인 내용부분</h2>
      <p>메인메인메닝ㄴ메닌</p>
    </article>
    <!-- ################################################################################################ -->
   <decorator:body/>
  </div>
</div>
   


<div class="wrapper row4">
  <footer id="footer" class="hoc clear"> 
  
    <!-- ################################################################################################ -->
    <div class="one_third first">
      <h6 class="heading">Vitae vehicula aliquam</h6>
      <ul class="nospace btmspace-30 linklist contact">
        <li><i class="fa fa-map-marker"></i>
          <address>
          Street Name &amp; Number, Town, Postcode/Zip
          </address>
        </li>
        <li><i class="fa fa-phone"></i> +00 (123) 456 7890</li>
        <li><i class="fa fa-envelope-o"></i> info@domain.com</li>
      </ul>
      <ul class="faico clear">
        <li><a class="faicon-facebook" href="#"><i class="fa fa-facebook"></i></a></li>
        <li><a class="faicon-twitter" href="#"><i class="fa fa-twitter"></i></a></li>
        <li><a class="faicon-dribble" href="#"><i class="fa fa-dribbble"></i></a></li>
        <li><a class="faicon-linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
        <li><a class="faicon-google-plus" href="#"><i class="fa fa-google-plus"></i></a></li>
        <li><a class="faicon-vk" href="#"><i class="fa fa-vk"></i></a></li>
      </ul>
    </div>
    <div class="one_third">
      <h6 class="heading">Eget efficitur sodales</h6>
      <ul class="nospace linklist">
        <li>
          <article>
            <h2 class="nospace font-x1"><a href="#">Ac mauris egestas ipsum</a></h2>
            <time class="font-xs block btmspace-10" datetime="2045-04-06">Friday, 6<sup>th</sup> April 2045</time>
            <p class="nospace">At commodo dolor nulla eu eleifend velit eu posuere neque phasellus ut [&hellip;]</p>
          </article>
        </li>
        <li>
          <article>
            <h2 class="nospace font-x1"><a href="#">Pretium tempus interdum</a></h2>
            <time class="font-xs block btmspace-10" datetime="2045-04-05">Thursday, 5<sup>th</sup> April 2045</time>
            <p class="nospace">Risus luctus dapibus libero in bibendum nulla ut sodales fermentum eros [&hellip;]</p>
          </article>
        </li>
      </ul>
    </div>
    <div class="one_third">
      <h6 class="heading">Pretium eleifend mauris</h6>
      <p class="nospace btmspace-30">Lobortis aliquam eu placerat dui sed fermentum nibh eu nunc semper non.</p>
      <form method="post" action="#">
        <fieldset>
          <legend>Newsletter:</legend>
          <input class="btmspace-15" type="text" value="" placeholder="Name">
          <input class="btmspace-15" type="text" value="" placeholder="Email">
          <button type="submit" value="submit">Submit</button>
        </fieldset>
      </form>
    </div>
  </footer>
</div>

<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>