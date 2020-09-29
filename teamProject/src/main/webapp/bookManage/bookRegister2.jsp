<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <!-- 로그인이 안 되면 접근을 못ㅎ하게 만들어 놓음! -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="js/f.js" type="text/javascript"></script>
<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
  <script>tinymce.init({selector:'textarea'});</script>
  
<script>
    function show_price()
    {
        document.getElementById('price').type='text';
    }
    function hide_price()
    {
        document.getElementById('price').type='hidden';   
    }
</script>
</head>
<body>
<div class="container col-md-12">    

		<div id="signupbox" style=" margin-top:50px ">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title text-center"><h3>도서 등록</h3></div>
            </div>  
            
            <div class="panel-body" >
			<form method="post" name="frm" id="frm" 
				  enctype="multipart/form-data"
				  action="${pageContext.request.contextPath }/bookRegister.ad">
				 
                        
                        

                    <div class="col-md-6">
                        <div id="div_p_name" class="form-group required">
                            <label for="title" class="control-label col-md-4  requiredField">제목<span class="asteriskField"></span> </label>
                            <div class="controls col-md-8 ">
                                <input class="input-md emailinput form-control" id="title" name="title" placeholder="제목을 입력 해 주세요." style="margin-bottom: 10px" type="text" />
                            </div>     
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div id="div_p_id" class="form-group required">
                            <label for="writer" class="control-label col-md-4  requiredField">지은이<span class="asteriskField"></span> </label>
                            <div class="controls col-md-8 ">
                                <input class="input-md emailinput form-control" id="writer" name="writer" placeholder="지은이를 입력 해 주세요." style="margin-bottom: 10px" type="text" />
                            </div>     
                        </div>
                    </div>
                    
				<div class="col-md-6">
                        <div id="div_id_downloads" class="form-group required">
                            <label for="company_code" class="control-label col-md-4  requiredField">출판사<span class="asteriskField">*</span> </label>
                            <div class="controls col-md-8 ">
                                <select name="company_code" id="company_code" style="margin-bottom: 10px" class="form-control" >
                                   <option value="">선택</option>
									<option value=1>예담</option>
									<option value=2>한양</option>
									<option value=3>창비</option>
									<option value=4>웅진</option>
									<option value=5>한빛</option>
                                
                                </select>
                            </div>     
                        </div>
                    </div>
				<div class="col-md-6">
                        <div id="div_id_downloads" class="form-group required">
                            <label for="genre" class="control-label col-md-4  requiredField">장르<span class="asteriskField">*</span> </label>
                            <div class="controls col-md-8 ">
                                <select name="genre" style="margin-bottom: 10px" id="genre" class="form-control" >
                                   <option value="">선택</option>
									<option value="d1">소설</option>
									<option value="d2">시/에세이</option>
									<option value="d3">무협/판타지</option>
									<option value="d4">인문</option>
									<option value="d5">로맨스</option>
									<option value="d6">자기계발</option>
									<option value="d7">경제/경영</option>
									<option value="d8">아동</option>
									<option value="d9">유아</option>
			                                
                                </select>
                            </div>     
                        </div>
                    </div>
				
			<div class="col-md-6">
                        <div id="div_id_downloads" class="form-group required">
                            <label for="introduction" class="control-label col-md-4  requiredField">소개글<span class="asteriskField"></span> </label>
                            <div class="controls col-md-8 ">
                                <input class="input-md emailinput form-control" id="introduction" name="introduction" style="margin-bottom: 10px" type="text" />
                            </div>     
                        </div>
                    </div>
                    
				<div class="col-md-12">
                        <div id="div_description" class="form-group required">
                            <label for="summary" class="control-label col-md-2  requiredField">줄거리<span class="asteriskField"></span> </label>
                            <div class="controls col-md-10 ">
                                <textarea style="margin-bottom: 10px" ></textarea>
                            </div>     
                        </div>
                    </div>
                    
				<div class="col-md-6">
                        <div id="div_id_downloads" class="form-group required">
                            <label for="publication_date" class="control-label col-md-4  requiredField">발간일<span class="asteriskField">*</span> </label>
                            <div class="controls col-md-8 ">
                                <input class="input-md emailinput form-control" id="publication_date" name="publication_date" style="margin-bottom: 10px" type="text" />
                            </div>     
                        </div>
                    </div>
				
				
				<div class="col-md-6">
                        <div id="div_id_category" class="form-group required">
                            <label for="best_book"  class="control-label col-md-4  requiredField">베스트셀러<span class="asteriskField">*</span> </label>
                            <div class="controls col-md-8 "  style="margin-bottom: 10px">
                                 <label class="radio-inline"> <input type="radio" name="best_book" id="id_categry_1" value="Y"  style="margin-bottom: 10px">Y</label>
                                 <label class="radio-inline"> <input type="radio" name="best_book" id="id_category_2" value="N"  style="margin-bottom: 10px">N</label>
                                 <input type="hidden" name="price" id="price" placeholder="Enter Cost of Project ">
                            </div>
                        </div>
                    </div>
				<div class="col-md-6">
                        <div id="div_id_image" class="form-group required">
                            <label for="book_img"  class="control-label col-md-4  requiredField">책 사진 첨부<span class="asteriskField"></span> </label>
                            <div class="controls col-md-8 "  style="margin-bottom: 10px">

                                <input class="input-md emailinput form-control" id="book_img" name="book_img" placeholder="Enter Project Id" style="margin-bottom: 10px" type="file" />
                            </div>
                        </div>
                    </div>
				<div class="col-md-6">
                        <div id="div_id_image" class="form-group required">
                            <label for="epub_path"  class="control-label col-md-4  requiredField">젼자책 첨부<span class="asteriskField"></span> </label>
                            <div class="controls col-md-8 "  style="margin-bottom: 10px">

                                <input class="input-md emailinput form-control" id="epub_path" name="epub_path" placeholder="Enter Project Id" style="margin-bottom: 10px" type="file" />
                            </div>
                        </div>
                    </div>
				
				<div>
					<label for="purchase_price">도서 구매 비용</label>
					<input type="text" name="purchase_price">
				</div>
				<div>
					<label for="purchase_date">도서 구매 날짜</label>
					<input type="date" name="purchase_date">
				</div>
				<div>
					<label for="purchase_content">비고</label>
					<textarea name="purchase_content"></textarea>
				</div>
				
				<div>
					<button type="reset">초기화</button>
					<button>등록</button>
				</div>
			<br/>
                   
                </form>
            </div>
        </div>
    </div>
    </div>
    
</body>
</html>