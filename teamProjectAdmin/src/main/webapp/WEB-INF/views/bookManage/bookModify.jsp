<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js"
	referrerpolicy="origin"></script>
<script>
	tinymce.init({
		selector : 'textarea'
	});
</script>
<script type="text/javascript">
	var openWin;

	function openChild() {
		// window.name = "부모창 이름"; 
		window.name = "parentForm";
		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		openWin = window.open(
				"${pageContext.request.contextPath }/bookcompanySelect.ad",
				"childForm",
				"width=570, height=350, resizable = no, scrollbars = no");
	}
</script>

</head>
<body>
	<div class="container col-xs-12">
		<c:if test="${not empty result}">
			<hr>
				<h3 class="page_title">도서 정보 수정</h3>

			<div id="signupbox" style="margin-top: 30px">
				<div class="panel panel-default">

					<div class="panel-body">
						<form method="post" name="frm" id="frm"
							enctype="multipart/form-data"
							action="${pageContext.request.contextPath}/bookModify.ad">
							<div>
								<label for="book_no">책번호</label> <input id="book_no"
									name="book_no" type="hidden" value="${result.book_no }">
							</div>

							<div class="row">
								<div class="col-sm-6 col-md-6 col-xs-6">
									<div>
										<label for="title"
											class="control-label col-md-4  requiredField">제목<span
											class="asteriskField">*</span>
										</label>
										<div class="controls col-md-8 ">
											<input class="input-md emailinput form-control" id="title"
												name="title" placeholder="제목을 입력 해 주세요."
												style="margin-bottom: 10px" type="text"
												value="${result.title }" />
										</div>
									</div>


								</div>
								<div class="col-sm-6 col-md-6 col-xs-6">
									<label for="writer"
										class="control-label col-md-4  requiredField">지은이<span
										class="asteriskField">*</span>
									</label>
									<div class="controls col-md-8 ">
										<input class="input-md emailinput form-control" id="writer"
											name="writer" placeholder="지은이를 입력 해 주세요."
											style="margin-bottom: 10px" type="text"
											value="${result.writer }" />
									</div>
								</div>
							</div>



							<div class="row">
								<div class="col-sm-6 col-md-6 col-xs-6">
									<label for="writer"
										class="control-label col-md-4  requiredField">출판사<span
										class="asteriskField">*</span>
									</label>
									<div class="controls col-md-8 ">
										<input class="input-md emailinput form-control" id="company"
											name="company" value="${result.company_name }"
											style="margin-bottom: 10px" type="text" />
										<button type="button" value="검색" onclick="openChild()" class="btn btn-outline btn-primary pull-left">검색</button>
									</div>
								</div>

								<div class="col-sm-6 col-md-6 col-xs-6">
									<label for="genre"
										class="control-label col-md-4  requiredField">장르<span
										class="asteriskField">*</span>
									</label>
									<div class="controls col-md-8 ">
										<select name="genre" style="margin-bottom: 10px" id="genre"
											size="4" class="form-control">
											<option value="">선택</option>
											<option value="d1"
												<c:if test="${result.genre=='d1'}">selected="selected"</c:if>>소설</option>
											<option value="d2"
												<c:if test="${result.genre=='d2'}">selected="selected"</c:if>>시/에세이</option>
											<option value="d3"
												<c:if test="${result.genre=='d3'}">selected="selected"</c:if>>무협/판타지</option>
											<option value="d4"
												<c:if test="${result.genre=='d4'}">selected="selected"</c:if>>인문</option>
											<option value="d5"
												<c:if test="${result.genre=='d5'}">selected="selected"</c:if>>로맨스</option>
											<option value="d6"
												<c:if test="${result.genre=='d6'}">selected="selected"</c:if>>자기계발</option>
											<option value="d7"
												<c:if test="${result.genre=='d7'}">selected="selected"</c:if>>경제/경영</option>
											<option value="d8"
												<c:if test="${result.genre=='d8'}">selected="selected"</c:if>>아동</option>
											<option value="d9"
												<c:if test="${result.genre=='d9'}">selected="selected"</c:if>>유아</option>
										</select>
									</div>
								</div>
							</div>


							<div class="col-md-12">
								<div id="div_id_downloads" class="form-group required">
									<label for="introduction"
										class="control-label col-md-4  requiredField">소개글<span
										class="asteriskField"></span>
									</label>
									<div class="controls col-md-8 ">
										<input class="input-md emailinput form-control"
											id="introduction" name="introduction"
											style="margin-bottom: 30px" type="text"
											value="${result.introduction}" />
									</div>
								</div>
							</div>

							<div class="col-md-12" style="margin-bottom: 30px;">
								<div id="div_description" class="form-group required">
									<label for="summary"
										class="control-label col-md-2  requiredField">줄거리<span
										class="asteriskField"></span>
									</label>
									<div class="controls col-md-10 ">
										<textarea style="height: 450px;" name="summary">${result.summary}</textarea>
									</div>
								</div>
							</div>




							<div class="row">
								<div class="col-sm-6 col-md-6 col-xs-6">
									<label for="publication_date"
										class="control-label col-md-4  requiredField">발간일<span
										class="asteriskField">*</span>
									</label>
									<div class="controls col-md-8 ">
										<input class="input-md emailinput form-control"
											id="publication_date" name="publication_date"
											style="margin-bottom: 10px" type="date"
											value="${fn:substring(result.publication_date,0,10) }" />
									</div>
								</div>
								<div class="col-sm-6 col-md-6 col-xs-6">
									<label for="best_book"
										class="control-label col-md-4  requiredField">베스트셀러<span
										class="asteriskField">*</span>
									</label>
									<div class="controls col-md-8 " style="margin-bottom: 10px">
										<label class="radio-inline"> <input type="radio"
											name="best_book" id="id_categry_1" value="Y"
											<c:if test="${result.best_book=='y'}">checked="checked"</c:if>
											style="margin-bottom: 10px">Y
										</label> <label class="radio-inline"> <input type="radio"
											name="best_book" id="id_category_2" value="N"
											<c:if test="${result.best_book=='n'}">checked="checked"</c:if>
											style="margin-bottom: 10px">N
										</label> <input type="hidden" name="price" id="price"
											placeholder="Enter Cost of Project ">
									</div>
								</div>
							</div>

							<div class="row">
							<div class="col-sm-6 col-md-6 col-xs-6">
								<label for="book_img"
									class="control-label col-md-4  requiredField">책 사진 첨부<span
									class="asteriskField"></span>
								</label>
								<div class="controls col-md-8 " style="margin-bottom: 10px">

									<input class="input-md emailinput form-control" id="book_img1"
										name="book_img1" placeholder="Enter Project Id"
										style="margin-bottom: 10px" type="file" />${result.book_img }
								</div>
							</div>
							</div>
							
							<div class="row" style="margin-bottom: 10px">
							<div class="col-md-10 text-center">
								<button type='submit'
									class="btn btn-outline btn-primary pull-left">도서 등록</button>
								<button class="btn btn-danger btn-md" type="reset">초기화</button>
							</div>
						</div>
						</form>
						<div class="row">
							<div class="col-md-10 text-center">
						<c:if test="${not empty result}">
							<form action="${pageContext.request.contextPath}/bookDelete.ad">
								<input type="hidden" name="book_no" value="${result.book_no}">
								<button class="btn btn-danger btn-md">삭제</button>
							</form>
						</c:if>
					</div>
				</div>
			</div>
			</div>
			</div>
		</c:if>
	</div>

</body>
</html>