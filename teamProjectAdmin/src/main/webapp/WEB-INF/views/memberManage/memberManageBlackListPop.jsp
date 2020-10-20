<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>	
    <%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랙리스트 수정</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script>
  $( function() {
    $( "#datepicker" ).datepicker( {dateFormat: 'yy-mm-dd'});
  } );
  </script>
</head>
<body style="padding-top: 70px;">

  <div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class="card-img-left d-none d-md-flex">
             
          </div>
          <div class="card-body">
            <h5 class="card-title text-center">블랙리스트 관리</h5>
            <form class="form-signin" method="post" name="frm" id="frm"
			action="memberManageBlackListPop.ad" onsubmit="return inputCheck()">
			
                <div class="form-label-group">
             
                <input type="hidden" name="blacklist_no" value="${black.blacklist_no}" readonly="readonly">
              </div> 
              
               <div class="form-label-group">
               <label for="inputmember_no">회원번호</label><br>
                <input type="text" name="member_no" value="${black.member_no}" readonly="readonly">
              </div>
              <div class="form-label-group">
                              <label for="inputblacklist_reason" >사유</label><br>
								<select
									name="blacklist_reason" id="blacklist_reason"
									style="margin-bottom: 10px" class="form-control">
									<option value="">선택</option>
									<option value="f1"
									<c:if test="${black.blacklist_reason=='f1'}">selected="selected"</c:if>
									>비방/욕설</option>
									<option value="f2"
									<c:if test="${black.blacklist_reason=='f2'}">selected="selected"</c:if>
									>음란물 게시</option>
									<option value="f3"
									<c:if test="${black.blacklist_reason=='f3'}">selected="selected"</c:if>
									>무단 광고물 게시</option>
								</select>

              </div>
             
              <div class="form-label-group">
               <label for="inputlimit_date">등록 일자</label><br>
                <input type="text"  id="datepicker" name="limit_date" value="${fn:substring(black.limit_date,0,10)}">
              </div>
  
              <hr>

              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit"> 수정</button>
             
              <hr class="my-4">
              
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>