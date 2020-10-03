	
	
	function imgClick(book_no) {
		if(book_no != null){
			if(confirm("해당 책 상세페이지로 이동하시겠습니까?")){			
				location.href="${pageContext.request.contextPath}/eBookDetail.do?book_no="+book_no;
			}
		}
	}